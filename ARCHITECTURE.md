# Архитектура и разбор кода — Deutsch B1–B2 Anki Mobile

Этот документ описывает структуру приложения, алгоритмы интервального повторения (SRS), схему синхронизации с Supabase и устройство ключевых модулей.

---

## 1. Общая архитектура

Приложение построено по принципу **Local-First SPA** (React 19 + TypeScript + Vite + Tailwind CSS v4):
- Все действия пользователя (переворот, оценка карточки, добавление слова) мгновенно сохраняются в `localStorage` — интерфейс работает без задержек и доступен офлайн.
- При входе в аккаунт **Supabase** включается асинхронная двусторонняя синхронизация прогресса и пользовательских карточек с защитой **Row Level Security (RLS)**.

```mermaid
flowchart TD
  subgraph UI["UI-слой (React Components)"]
    Header["Header.tsx<br/>(режим, +, профиль, настройки, тема)"]
    Ribbon["StatusRibbon.tsx<br/>(дневная цель, счётчики, прогресс-бар)"]
    Card["FlashCard.tsx<br/>(карточка, озвучка, 4 оценки)"]
    Modals["Модальные окна<br/>SettingsModal / AddCardModal / AuthModal / ProgressModal"]
  end

  App["App.tsx<br/>(единый центр состояния и событий)"]

  subgraph Logic["Бизнес-логика (src/lib)"]
    SRS["srs.ts<br/>(SRS, лимит неизвестных, очередь)"]
    Storage["storage.ts<br/>(localStorage + миграция)"]
    Speech["speech.ts<br/>(Web Speech API + ранжирование)"]
    SupaLib["supabase.ts<br/>(Auth + merge-синхронизация)"]
  end

  Data["data/defaultCorpus.ts<br/>(70 встроенных карточек B1–B2)"]
  LS[("Browser localStorage")]
  SupaDB[("Supabase Cloud<br/>Auth + Postgres RLS")]

  UI <--> App
  App --> SRS
  App --> Storage
  App --> Speech
  App --> SupaLib
  SRS --> Data
  Storage <--> LS
  SupaLib <--> SupaDB
```

---

## 2. Структура файлов проекта

```text
anki/
├── index.html                      # Минимальная HTML-точка входа для Vite
├── package.json                    # Зависимости (React, Supabase, Vite, Tailwind)
├── tsconfig.json                   # Строгие настройки TypeScript (strict: true)
├── vite.config.ts                  # Конфигурация сборки Vite + Tailwind CSS v4
├── supabase_schema.sql             # SQL-схема таблиц и политик RLS в Supabase
├── .github/workflows/deploy.yml    # Автоматический билд и деплой на GitHub Pages
└── src/
    ├── main.tsx                    # Монтирование React в #root
    ├── index.css                   # Подключение Tailwind v4 и мобильные safe-area стили
    ├── types.ts                    # Все TypeScript-интерфейсы и типы
    ├── App.tsx                     # Главный контейнер состояния, эффектов и горячих клавиш
    ├── data/
    │   └── defaultCorpus.ts        # 70 встроенных карточек (50 слов + 20 грамматики)
    ├── lib/
    │   ├── srs.ts                  # Алгоритм повторений, лимит неизвестных слов, очередь
    │   ├── storage.ts              # Сохранение/загрузка localStorage с разделением по userId
    │   ├── speech.ts               # Озвучка немецких слов и очистка грамматических меток
    │   └── supabase.ts             # Клиент Supabase и логика fullSync / upsert / delete
    └── components/
        ├── Header.tsx              # Шапка: режим, +, статус входа, настройки, тема
        ├── StatusRibbon.tsx        # Кликабельная строка статистики и прогресс-бар сессии
        ├── FlashCard.tsx           # Карточка с переворотом и динамическими кнопками оценки
        ├── SettingsModal.tsx       # Голос, лимиты, «Мои карточки», CSV импорт/экспорт
        ├── AddCardModal.tsx        # Форма создания пользовательской карточки
        ├── AuthModal.tsx           # Вход / регистрация / ручная синхронизация / выход
        └── ProgressModal.tsx       # Детальный прогресс, фильтры, поиск, сброс карточки
```

---

## 3. Модель данных и база Supabase

### Структура карточки (`src/types.ts`)

Каждая карточка (как встроенная, так и добавленная пользователем) приводится к единому формату `Card`:

| Поле | Тип | Назначение |
| :--- | :--- | :--- |
| `cardKey` | `string` | Уникальный ключ: `default_1`…`default_70` для встроенных, `custom_<uuid>` для пользовательских |
| `german`, `russian` | `string` | Основное слово/конструкция и перевод |
| `example_de`, `example_ru` | `string` | Контекстный пример и его перевод |
| `context`, `tags` | `string` | Грамматическая пометка (`Verb (+ Dat.)`) и теги |
| `isCustom` | `boolean` | Отличает пользовательскую карточку от базовой (влияет на возможность удаления и фильтр «Мои») |
| `reps` | `number` | Количество успешных повторений: `0` — Новая, `1–2` — Учим, `≥ 3` — Выучена |
| `interval` | `number` | Текущий интервал повторения в днях |
| `nextReview` | `number` | Unix-timestamp (мс), когда карточку нужно показать снова |
| `updatedAt` | `number` | Unix-timestamp (мс) последнего изменения — используется при слиянии конфликтов с облаком |

### Схема таблиц в PostgreSQL (`supabase_schema.sql`)

```mermaid
erDiagram
  AUTH_USERS ||--o| USER_PROFILES : "has 1"
  AUTH_USERS ||--o{ USER_CARDS : "owns many"

  AUTH_USERS {
    uuid id PK
    text email
  }

  USER_PROFILES {
    uuid user_id PK,FK
    integer daily_limit
    text today_date
    integer today_count
    timestamptz updated_at
  }

  USER_CARDS {
    uuid id PK
    uuid user_id FK
    text card_key "UNIQUE (user_id, card_key)"
    text german
    text russian
    text example_de
    text example_ru
    text context
    text tags
    boolean is_custom
    integer reps
    double interval
    bigint next_review
    timestamptz updated_at
  }
```

> **Почему в `user_cards` не загружаются сразу все 70 базовых карточек?**
> Базовый словарь вшит в `defaultCorpus.ts`. В БД записываются только те карточки, по которым есть прогресс (`reps > 0` / `updatedAt > 0`) или которые создал сам пользователь (`is_custom = true`). Это экономит запросы и трафик, а при синхронизации на новом устройстве базовые карточки автоматически объединяются с записями из БД.

---

## 4. Алгоритм интервального повторения (SRS) и лимит неизвестных слов

Вся математика вынесена в чистые функции в `src/lib/srs.ts` (их легко тестировать отдельно от UI).

### Что такое «неизвестное слово» (`isUnknownCard`)
Слово считается **неизвестным**, если выполняется хотя бы одно условие:
1. `card.reps === 0` — вы его ещё не учили (новая карточка или нажали «Снова»).
2. `card.nextReview <= endOfToday` — карточка всё ещё запланирована к повторению **сегодня** (не «ушла» на завтра и далее).

### Логика 4 кнопок оценки (`applyCardRating`)

```mermaid
flowchart TD
  Start["Пользователь оценил карточку"] --> Check{"Какая оценка?"}

  Check -->|"1. Снова (again)"| Again["reps = 0<br/>interval = 0<br/>nextReview = сейчас + 1 мин<br/>Вернуть в очередь (+3 слота)"]

  Check -->|"2. Трудно (hard)"| IsUnk{"Неизвестное слово?<br/>(reps == 0 или на сегодня)"}
  IsUnk -->|"Да"| HardUnk["interval = 0<br/>nextReview = сейчас + 15 мин<br/>Вернуть в очередь (+6 слотов)"]
  IsUnk -->|"Нет (уже знакомое)"| HardKnown["reps += 1<br/>interval = max(1, interval × 1.2) дн.<br/>nextReview = сейчас + interval дн."]

  Check -->|"3. Хорошо (good)"| Good["reps += 1<br/>interval = max(2, interval × 2.0) дн.<br/>nextReview = сейчас + interval дн."]

  Check -->|"4. Легко (easy)"| Easy["reps += 2<br/>interval = max(4, interval × 2.8) дн.<br/>nextReview = сейчас + interval дн."]
```

Подписи времени на самих кнопках (`1 мин`, `15 мин` / `2 дн.`, `4 дн.`) рассчитываются динамически функцией `getRatingPreviewLabels(card)` для каждой конкретной карточки.

### Формирование очереди и лимит неизвестных (`buildSessionQueue`)

Чтобы при дневном лимите в 60–160 показов не вываливалось сразу 60 новых слов:
1. Карточки делятся на три группы:
   - `dueToday` — уже начатые карточки, которые нужно повторить сегодня (`reps > 0 && nextReview <= endOfToday`).
   - `newCards` — новые карточки (`reps === 0`).
   - `futureCards` — карточки, запланированные на завтра и позже.
2. Применяется настраиваемый лимит `maxActiveUnknown` (по умолчанию `10`):
   - Сначала берутся `dueToday` (до `maxActiveUnknown`).
   - Оставшиеся слоты (`maxActiveUnknown - activeDue.length`) заполняются из `newCards`.
   - Итоговый пул ограничивается оставшимся дневным лимитом показов (`dailyLimit - dailyReviewedCount`).

---

## 5. Поток авторизации и синхронизации с Supabase

Реализовано в `src/lib/supabase.ts` и вызывается из `src/App.tsx`:

```mermaid
sequenceDiagram
  actor User as Пользователь
  participant App as App.tsx + storage.ts
  participant Supa as Supabase Auth & Postgres

  User->>App: Вход (Email + Password)
  App->>Supa: auth.signInWithPassword()
  Supa-->>App: Session (user.id + JWT)
  App->>App: loadLocalDeck(user.id)

  App->>Supa: SELECT user_profiles & user_cards (RLS: auth.uid() = user_id)
  Supa-->>App: Облачные данные пользователя

  App->>App: Слияние (Merge):<br/>defaultCorpus + local + remote<br/>(побеждает более новый updatedAt)
  App->>App: saveLocalDeck(user.id, mergedDeck)
  App->>Supa: UPSERT только изменённых локально карточек и профиля
  Supa-->>App: OK → статус "Синхронизировано"

  Note over User,Supa: Во время обучения (оценка / добавление / удаление)
  User->>App: Оценивает карточку
  App->>App: Мгновенно обновляет state и localStorage
  App--)Supa: Асинхронный UPSERT 1 карточки и профиля
```

### Изоляция локальных данных (`src/lib/storage.ts`)
- В гостевом режиме используется префикс `anki_guest_*` (с автоматическим подхватом старых ключей `anki_de_corpus_v3`).
- После входа используется префикс `anki_u_<userId>_*`. При выходе из аккаунта локальные данные разных пользователей не смешиваются.

---

## 6. Разбор остальных модулей

### Движок озвучки (`src/lib/speech.ts`)
- **`rankVoice`**: присваивает веса голосам браузера (`natural/neural` → 100, `Google Deutsch` → 80, `Anna/Katja/Petra/Markus` → 70, `enhanced/premium` → 60, любой `de-DE` → 50) и автоматически выбирает лучший доступный.
- **`cleanGermanSpeechText`**: перед озвучкой вырезает служебные грамматические пометки в скобках (`(Verb am Ende)`, `+ Dat.`, `Grammatik:`), чтобы диктор читал только естественную немецкую фразу.

### Главный контейнер (`src/App.tsx`)
- Хранит состояние колоды (`deck`), текущей очереди (`queue`, `currentIndex`, `isFlipped`), дневной статистики (`stats`), настроек озвучки (`speechSettings`) и открытых модальных окон.
- Обрабатывает глобальные горячие клавиши (`Space` — показать ответ, `1`–`4` — оценки, `Esc` — закрыть любое окно), автоматически отключая их, когда открыто модальное окно или фокус находится в поле ввода.

### Сборка и автодеплой
- `vite.config.ts` задаёт `base: './'`, благодаря чему собранные бандлы корректно открываются по любому пути (включая `https://<user>.github.io/anki/`).
- `.github/workflows/deploy.yml` при каждом `git push` в ветку `main` автоматически запускает `npm ci && npm run build` (`tsc -b && vite build`) и публикует папку `dist/` на GitHub Pages.
