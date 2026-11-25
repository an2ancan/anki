-- Seed: Insert starter deck CSVs into public.catalog_corpora
-- Run supabase_migration_catalog.sql first, then run this script in Supabase SQL Editor.

insert into public.catalog_corpora (level, title, word_count, csv_content, updated_at)
values ('A1-A2', 'A1–A2 Essential', 199, 'de;en;ru;exDe;exEn;exRu;ctx;tags
hallo;hello;привет;Hallo, wie geht es dir?;Hello, how are you?;Привет, как дела?;Interjektion;a1_a2 greeting
danke;thank you;спасибо;Danke für deine Hilfe!;Thank you for your help!;Спасибо за твою помощь!;Interjektion;a1_a2 daily
bitte;please / you are welcome;пожалуйста;Ein Wasser, bitte.;A water, please.;Воды, пожалуйста.;Partikel;a1_a2 daily
ja;yes;да;Ja, das stimmt.;Yes, that is right.;Да, это верно.;Partikel;a1_a2 basic
nein;no;нет;Nein, ich habe keine Zeit.;No, I have no time.;Нет, у меня нет времени.;Partikel;a1_a2 basic
der Mann, die Männer;man / husband;мужчина / муж;Der Mann arbeitet im Büro.;The man works in the office.;Мужчина работает в офисе.;Nomen, m.;a1_a2 people
die Frau, die Frauen;woman / wife;женщина / жена;Die Frau liest ein Buch.;The woman is reading a book.;Женщина читает книгу.;Nomen, f.;a1_a2 people
das Kind, die Kinder;child;ребёнок;Das Kind spielt im Garten.;The child is playing in the garden.;Ребёнок играет в саду.;Nomen, n.;a1_a2 family
der Freund, die Freunde;friend;друг;Mein Freund wohnt in Berlin.;My friend lives in Berlin.;Мой друг живёт в Берлине.;Nomen, m.;a1_a2 people
die Familie, die Familien;family;семья;Meine Familie ist sehr groß.;My family is very big.;Моя семья очень большая.;Nomen, f.;a1_a2 family
das Haus, die Häuser;house;дом;Wir kaufen ein altes Haus.;We are buying an old house.;Мы покупаем старый дом.;Nomen, n.;a1_a2 home
die Wohnung, die Wohnungen;apartment;квартира;Die Wohnung hat drei Zimmer.;The apartment has three rooms.;В квартире три комнаты.;Nomen, f.;a1_a2 home
das Zimmer, die Zimmer;room;комната;Mein Zimmer ist hell und ruhig.;My room is bright and quiet.;Моя комната светлая и тихая.;Nomen, n.;a1_a2 home
die Tür, die Türen;door;дверь;Bitte schließ die Tür!;Please close the door!;Пожалуйста, закрой дверь!;Nomen, f.;a1_a2 home
das Fenster, die Fenster;window;окно;Mach bitte das Fenster auf.;Please open the window.;Открой, пожалуйста, окно.;Nomen, n.;a1_a2 home
der Tisch, die Tische;table;стол;Das Essen steht auf dem Tisch.;The food is on the table.;Еда стоит на столе.;Nomen, m.;a1_a2 home
der Stuhl, die Stühle;chair;стул;Dieser Stuhl ist sehr bequem.;This chair is very comfortable.;Этот стул очень удобный.;Nomen, m.;a1_a2 home
das Bett, die Betten;bed;кровать;Ich gehe um zehn Uhr ins Bett.;I go to bed at ten o’clock.;Я ложусь спать в десять часов.;Nomen, n.;a1_a2 home
die Küche, die Küchen;kitchen;кухня;Wir kochen zusammen in der Küche.;We cook together in the kitchen.;Мы готовим вместе на кухне.;Nomen, f.;a1_a2 home
das Wasser;water;вода;Ich trinke jeden Tag viel Wasser.;I drink a lot of water every day.;Я пью много воды каждый день.;Nomen, n.;a1_a2 food
das Brot, die Brote;bread;хлеб;Zum Frühstück esse ich Brot mit Käse.;For breakfast I eat bread with cheese.;На завтрак я ем хлеб с сыром.;Nomen, n.;a1_a2 food
der Kaffee, die Kaffees;coffee;кофе;Morgens brauche ich einen Kaffee.;In the morning I need a coffee.;Утром мне нужен кофе.;Nomen, m.;a1_a2 food
der Tee, die Tees;tea;чай;Möchtest du eine Tasse Tee?;Would you like a cup of tea?;Хочешь чашку чая?;Nomen, m.;a1_a2 food
die Milch;milk;молоко;Wir haben keine Milch mehr.;We have no milk left.;У нас больше нет молока.;Nomen, f.;a1_a2 food
der Apfel, die Äpfel;apple;яблоко;Der rote Apfel schmeckt süß.;The red apple tastes sweet.;Красное яблоко сладкое на вкус.;Nomen, m.;a1_a2 food
das Essen;food / meal;еда;Das Essen im Restaurant war lecker.;The food in the restaurant was delicious.;Еда в ресторане была вкусной.;Nomen, n.;a1_a2 food
das Frühstück;breakfast;завтрак;Um acht Uhr gibt es Frühstück.;Breakfast is at eight o’clock.;Завтрак в восемь часов.;Nomen, n.;a1_a2 food
das Geld;money;деньги;Ich habe nicht genug Geld dabei.;I do not have enough money with me.;У меня с собой недостаточно денег.;Nomen, n.;a1_a2 shopping
der Preis, die Preise;price;цена;Der Preis ist wirklich fair.;The price is really fair.;Цена действительно справедливая.;Nomen, m.;a1_a2 shopping
das Geschäft, die Geschäfte;shop / store;магазин;Das Geschäft öffnet um neun Uhr.;The shop opens at nine o’clock.;Магазин открывается в девять часов.;Nomen, n.;a1_a2 shopping
der Supermarkt, die Supermärkte;supermarket;супермаркет;Ich kaufe Gemüse im Supermarkt.;I buy vegetables at the supermarket.;Я покупаю овощи в супермаркете.;Nomen, m.;a1_a2 shopping
die Rechnung, die Rechnungen;bill / invoice;счёт;Die Rechnung, bitte!;The bill, please!;Счёт, пожалуйста!;Nomen, f.;a1_a2 shopping
die Stadt, die Städte;city;город;Die Stadt ist alt und schön.;The city is old and beautiful.;Город старый и красивый.;Nomen, f.;a1_a2 places
die Straße, die Straßen;street;улица;Diese Straße führt zum Bahnhof.;This street leads to the train station.;Эта улица ведёт к вокзалу.;Nomen, f.;a1_a2 places
der Bahnhof, die Bahnhöfe;train station;вокзал;Der Zug fährt vom Bahnhof ab.;The train departs from the station.;Поезд отправляется с вокзала.;Nomen, m.;a1_a2 travel
der Flughafen, die Flughäfen;airport;аэропорт;Wir fahren mit dem Taxi zum Flughafen.;We take a taxi to the airport.;Мы едем на такси в аэропорт.;Nomen, m.;a1_a2 travel
das Auto, die Autos;car;машина;Sein neues Auto ist sehr schnell.;His new car is very fast.;Его новая машина очень быстрая.;Nomen, n.;a1_a2 travel
der Bus, die Busse;bus;автобус;Der Bus kommt in fünf Minuten.;The bus arrives in five minutes.;Автобус придёт через пять минут.;Nomen, m.;a1_a2 travel
der Zug, die Züge;train;поезд;Der Zug nach München hat Verspätung.;The train to Munich is delayed.;Поезд в Мюнхен опаздывает.;Nomen, m.;a1_a2 travel
die Fahrkarte, die Fahrkarten;ticket;билет;Hast du schon eine Fahrkarte gekauft?;Have you already bought a ticket?;Ты уже купил билет?;Nomen, f.;a1_a2 travel
das Hotel, die Hotels;hotel;отель;Unser Hotel liegt im Zentrum.;Our hotel is located in the center.;Наш отель находится в центре.;Nomen, n.;a1_a2 travel
der Pass, die Pässe;passport;паспорт;Vergiss deinen Pass nicht!;Do not forget your passport!;Не забудь свой паспорт!;Nomen, m.;a1_a2 travel
die Zeit;time;время;Ich habe heute leider keine Zeit.;Unfortunately, I have no time today.;К сожалению, сегодня у меня нет времени.;Nomen, f.;a1_a2 time
der Tag, die Tage;day;день;Heute ist ein schöner Tag.;Today is a nice day.;Сегодня хороший день.;Nomen, m.;a1_a2 time
die Woche, die Wochen;week;неделя;Nächste Woche habe ich Urlaub.;Next week I am on vacation.;На следующей неделе у меня отпуск.;Nomen, f.;a1_a2 time
der Monat, die Monate;month;месяц;Dieser Monat hat dreißig Tage.;This month has thirty days.;В этом месяце тридцать дней.;Nomen, m.;a1_a2 time
das Jahr, die Jahre;year;год;Nächstes Jahr lerne ich Spanisch.;Next year I will learn Spanish.;В следующем году я буду учить испанский.;Nomen, n.;a1_a2 time
die Stunde, die Stunden;hour;час;Der Film dauert zwei Stunden.;The movie lasts two hours.;Фильм длится два часа.;Nomen, f.;a1_a2 time
die Minute, die Minuten;minute;минута;Warte bitte eine Minute.;Please wait a minute.;Подожди, пожалуйста, минуту.;Nomen, f.;a1_a2 time
heute;today;сегодня;Heute bleibt das Wetter sonnig.;Today the weather stays sunny.;Сегодня погода останется солнечной.;Adverb;a1_a2 time
morgen;tomorrow;завтра;Morgen schreibe ich eine Prüfung.;Tomorrow I am taking an exam.;Завтра я пишу экзамен.;Adverb;a1_a2 time
gestern;yesterday;вчера;Gestern waren wir im Kino.;Yesterday we went to the cinema.;Вчера мы были в кино.;Adverb;a1_a2 time
jetzt;now;сейчас;Ich muss jetzt losgehen.;I have to leave now.;Мне нужно идти сейчас.;Adverb;a1_a2 time
immer;always;всегда;Sie ist immer pünktlich.;She is always on time.;Она всегда пунктуальна.;Adverb;a1_a2 time
oft;often;часто;Wir treffen uns oft am Wochenende.;We often meet on the weekend.;Мы часто встречаемся на выходных.;Adverb;a1_a2 time
manchmal;sometimes;иногда;Manchmal arbeite ich von zu Hause.;Sometimes I work from home.;Иногда я работаю из дома.;Adverb;a1_a2 time
nie;never;никогда;Er trinkt nie Alkohol.;He never drinks alcohol.;Он никогда не пьёт алкоголь.;Adverb;a1_a2 time
die Arbeit;work / job;работа;Meine Arbeit macht mir Spaß.;I enjoy my work.;Моя работа приносит мне удовольствие.;Nomen, f.;a1_a2 work
der Beruf, die Berufe;profession;профессия;Was sind Sie von Beruf?;What is your profession?;Кто вы по профессии?;Nomen, m.;a1_a2 work
das Büro, die Büros;office;офис;Das Büro liegt im dritten Stock.;The office is on the third floor.;Офис находится на третьем этаже.;Nomen, n.;a1_a2 work
der Kollege, die Kollegen;colleague;коллега;Mein Kollege hilft mir oft.;My colleague often helps me.;Мой коллега часто помогает мне.;Nomen, m.;a1_a2 work
die Schule, die Schulen;school;школа;Die Schule beginnt um acht Uhr.;School starts at eight o’clock.;Школа начинается в восемь часов.;Nomen, f.;a1_a2 study
die Sprache, die Sprachen;language;язык;Deutsch ist eine interessante Sprache.;German is an interesting language.;Немецкий — интересный язык.;Nomen, f.;a1_a2 study
das Wort, die Wörter;word;слово;Ich verstehe dieses Wort nicht.;I do not understand this word.;Я не понимаю этого слова.;Nomen, n.;a1_a2 study
das Buch, die Bücher;book;книга;Dieses Buch ist sehr spannend.;This book is very exciting.;Эта книга очень увлекательная.;Nomen, n.;a1_a2 study
der Brief, die Briefe;letter;письмо;Ich schreibe einen Brief an meine Oma.;I am writing a letter to my grandma.;Я пишу письмо своей бабушке.;Nomen, m.;a1_a2 daily
das Handy, die Handys;mobile phone;мобильный телефон;Mein Handy hat keinen Akku mehr.;My phone has no battery left.;На моём телефоне села батарея.;Nomen, n.;a1_a2 tech
der Computer, die Computer;computer;компьютер;Der Computer funktioniert wieder.;The computer is working again.;Компьютер снова работает.;Nomen, m.;a1_a2 tech
das Wetter;weather;погода;Das Wetter ist heute sehr kalt.;The weather is very cold today.;Погода сегодня очень холодная.;Nomen, n.;a1_a2 nature
die Sonne;sun;солнце;Die Sonne scheint den ganzen Tag.;The sun shines all day long.;Солнце светит весь день.;Nomen, f.;a1_a2 nature
der Regen;rain;дождь;Bei Regen nehme ich einen Schirm mit.;In the rain I take an umbrella with me.;В дождь я беру с собой зонт.;Nomen, m.;a1_a2 nature
der Arzt, die Ärzte;doctor;врач;Ich habe einen Termin beim Arzt.;I have an appointment with the doctor.;У меня приём у врача.;Nomen, m.;a1_a2 health
die Gesundheit;health;здоровье;Gesundheit ist das Wichtigste im Leben.;Health is the most important thing in life.;Здоровье — самое важное в жизни.;Nomen, f.;a1_a2 health
krank;sick / ill;больной;Er bleibt heute krank zu Hause.;He is staying home sick today.;Он остаётся сегодня дома, так как болен.;Adjektiv;a1_a2 health
gesund;healthy;здоровый;Obst und Gemüse sind sehr gesund.;Fruit and vegetables are very healthy.;Фрукты и овощи очень полезны.;Adjektiv;a1_a2 health
gut;good;хороший;Das ist eine gute Idee!;That is a good idea!;Это хорошая идея!;Adjektiv;a1_a2 adj
schlecht;bad;плохой;Heute habe ich schlechte Laune.;Today I am in a bad mood.;Сегодня у меня плохое настроение.;Adjektiv;a1_a2 adj
groß;big / tall;большой / высокий;Berlin ist eine sehr große Stadt.;Berlin is a very big city.;Берлин — очень большой город.;Adjektiv;a1_a2 adj
klein;small / little;маленький;Die Katze ist noch ganz klein.;The cat is still very small.;Кошка ещё совсем маленькая.;Adjektiv;a1_a2 adj
neu;new;новый;Ich habe ein neues Fahrrad.;I have a new bicycle.;У меня новый велосипед.;Adjektiv;a1_a2 adj
alt;old;старый;Wie alt bist du?;How old are you?;Сколько тебе лет?;Adjektiv;a1_a2 adj
schön;beautiful / nice;красивый;Was für ein schöner Park!;What a beautiful park!;Какой красивый парк!;Adjektiv;a1_a2 adj
schnell;fast / quick;быстрый;Er läuft sehr schnell.;He runs very fast.;Он бегает очень быстро.;Adjektiv;a1_a2 adj
langsam;slow;медленный;Sprechen Sie bitte etwas langsamer.;Please speak a bit more slowly.;Говорите, пожалуйста, немного медленнее.;Adjektiv;a1_a2 adj
teuer;expensive;дорогой;Dieses Restaurant ist mir zu teuer.;This restaurant is too expensive for me.;Этот ресторан для меня слишком дорогой.;Adjektiv;a1_a2 adj
billig;cheap;дешёвый;Die Jacke war überraschend billig.;The jacket was surprisingly cheap.;Куртка была удивительно дешёвой.;Adjektiv;a1_a2 adj
wichtig;important;важный;Dieser Termin ist mir sehr wichtig.;This appointment is very important to me.;Эта встреча для меня очень важна.;Adjektiv;a1_a2 adj
einfach;easy / simple;простой / лёгкий;Die Aufgabe war ganz einfach.;The task was quite easy.;Задание было совсем простым.;Adjektiv;a1_a2 adj
schwer;difficult / heavy;трудный / тяжёлый;Der Koffer ist sehr schwer.;The suitcase is very heavy.;Чемодан очень тяжёлый.;Adjektiv;a1_a2 adj
richtig;correct / right;правильный;Deine Antwort ist völlig richtig.;Your answer is completely correct.;Твой ответ абсолютно правильный.;Adjektiv;a1_a2 adj
falsch;wrong / false;неправильный;Entschuldigung, das war die falsche Nummer.;Sorry, that was the wrong number.;Извините, это был неправильный номер.;Adjektiv;a1_a2 adj
frei;free / available;свободный;Ist dieser Platz noch frei?;Is this seat still free?;Это место ещё свободно?;Adjektiv;a1_a2 adj
müde;tired;уставший;Nach der Arbeit bin ich müde.;After work I am tired.;После работы я устал.;Adjektiv;a1_a2 adj
glücklich;happy;счастливый;Wir sind hier sehr glücklich.;We are very happy here.;Мы здесь очень счастливы.;Adjektiv;a1_a2 adj
warm;warm;тёплый;Im Sommer ist das Wasser warm.;In summer the water is warm.;Летом вода тёплая.;Adjektiv;a1_a2 adj
kalt;cold;холодный;Im Winter ist es oft sehr kalt.;In winter it is often very cold.;Зимой часто бывает очень холодно.;Adjektiv;a1_a2 adj
sein;to be;быть;Ich bin seit zwei Jahren hier.;I have been here for two years.;Я здесь уже два года.;Verb;a1_a2 verb
haben;to have;иметь;Wir haben zwei Katzen.;We have two cats.;У нас две кошки.;Verb;a1_a2 verb
werden;to become;становиться;Es wird langsam dunkel.;It is slowly getting dark.;Постепенно темнеет.;Verb;a1_a2 verb
machen;to do / to make;делать;Was machst du am Samstag?;What are you doing on Saturday?;Что ты делаешь в субботу?;Verb;a1_a2 verb
gehen;to go / to walk;идти;Ich gehe jetzt nach Hause.;I am going home now.;Я сейчас иду домой.;Verb;a1_a2 verb
kommen;to come;приходить;Wann kommst du zurück?;When are you coming back?;Когда ты вернёшься?;Verb;a1_a2 verb
fahren;to drive / to go by vehicle;ехать;Wir fahren mit dem Zug nach Köln.;We are taking the train to Cologne.;Мы едем на поезде в Кёльн.;Verb;a1_a2 verb
sehen;to see;видеть;Ich kann dich gut sehen.;I can see you clearly.;Я хорошо тебя вижу.;Verb;a1_a2 verb
hören;to hear / to listen;слышать / слушать;Hörst du die Musik?;Do you hear the music?;Ты слышишь музыку?;Verb;a1_a2 verb
sprechen;to speak;говорить;Sprechen Sie Englisch?;Do you speak English?;Вы говорите по-английски?;Verb;a1_a2 verb
sagen;to say;сказать;Was hat er dazu gesagt?;What did he say about it?;Что он об этом сказал?;Verb;a1_a2 verb
fragen;to ask;спрашивать;Darf ich Sie etwas fragen?;May I ask you something?;Можно вас кое о чём спросить?;Verb;a1_a2 verb
antworten;to answer;отвечать;Bitte antworte mir bald.;Please answer me soon.;Пожалуйста, ответь мне скоро.;Verb;a1_a2 verb
verstehen;to understand;понимать;Ich verstehe alles sehr gut.;I understand everything very well.;Я всё очень хорошо понимаю.;Verb;a1_a2 verb
wissen;to know (a fact);знать;Ich weiß die Antwort leider nicht.;Unfortunately I do not know the answer.;К сожалению, я не знаю ответа.;Verb;a1_a2 verb
kennen;to know (someone/something);быть знакомым / знать;Kennst du diese Stadt?;Do you know this city?;Ты знаешь этот город?;Verb;a1_a2 verb
lernen;to learn;учить / изучать;Sie lernt jeden Tag neue Wörter.;She learns new words every day.;Она учит новые слова каждый день.;Verb;a1_a2 verb
lesen;to read;читать;Abends lese ich gern im Bett.;In the evening I like reading in bed.;Вечером я люблю читать в кровати.;Verb;a1_a2 verb
schreiben;to write;писать;Ich schreibe dir eine Nachricht.;I am writing you a message.;Я пишу тебе сообщение.;Verb;a1_a2 verb
arbeiten;to work;работать;Mein Vater arbeitet als Ingenieur.;My father works as an engineer.;Мой отец работает инженером.;Verb;a1_a2 verb
wohnen;to live / to reside;жить / проживать;Wo wohnst du zurzeit?;Where do you live currently?;Где ты сейчас живёшь?;Verb;a1_a2 verb
leben;to live;жить;Wir leben gern in dieser Region.;We like living in this region.;Нам нравится жить в этом регионе.;Verb;a1_a2 verb
essen;to eat;есть;Was möchtest du heute essen?;What would you like to eat today?;Что ты хочешь сегодня поесть?;Verb;a1_a2 verb
trinken;to drink;пить;Ich trinke morgens nur Wasser.;In the morning I only drink water.;Утром я пью только воду.;Verb;a1_a2 verb
kaufen;to buy;покупать;Wir müssen noch Brot kaufen.;We still need to buy bread.;Нам ещё нужно купить хлеб.;Verb;a1_a2 verb
bezahlen;to pay;оплачивать;Kann ich mit Karte bezahlen?;Can I pay by card?;Можно оплатить картой?;Verb;a1_a2 verb
kosten;to cost;стоить;Wie viel kostet diese Tasche?;How much does this bag cost?;Сколько стоит эта сумка?;Verb;a1_a2 verb
geben;to give;давать;Kannst du mir bitte das Salz geben?;Can you please pass me the salt?;Можешь передать мне соль?;Verb;a1_a2 verb
nehmen;to take;брать;Ich nehme den nächsten Bus.;I am taking the next bus.;Я поеду на следующем автобусе.;Verb;a1_a2 verb
finden;to find;находить;Ich kann meinen Schlüssel nicht finden.;I cannot find my key.;Я не могу найти свой ключ.;Verb;a1_a2 verb
suchen;to search / to look for;искать;Ich suche eine neue Wohnung.;I am looking for a new apartment.;Я ищу новую квартиру.;Verb;a1_a2 verb
brauchen;to need;нуждаться;Ich brauche mehr Zeit dafür.;I need more time for this.;Мне нужно больше времени для этого.;Verb;a1_a2 verb
helfen;to help;помогать;Kannst du mir kurz helfen?;Can you help me briefly?;Можешь мне ненадолго помочь?;Verb (+ Dat.);a1_a2 verb
warten auf;to wait for;ждать кого-то/что-то;Ich warte vor dem Eingang auf dich.;I am waiting for you in front of the entrance.;Я жду тебя перед входом.;Verb (+ Akk.);a1_a2 verb
schlafen;to sleep;спать;Am Wochenende schlafe ich lange.;On the weekend I sleep late.;На выходных я долго сплю.;Verb;a1_a2 verb
aufstehen;to get up;вставать;Ich stehe jeden Morgen um sieben auf.;I get up at seven every morning.;Я встаю каждое утро в семь.;Verb (trennb.);a1_a2 verb
anfangen;to start / to begin;начинать;Der Kurs fängt am Montag an.;The course starts on Monday.;Курс начинается в понедельник.;Verb (trennb.);a1_a2 verb
aufhören;to stop;прекращать;Es hat endlich aufgehört zu regnen.;It finally stopped raining.;Дождь наконец перестал идти.;Verb (trennb.);a1_a2 verb
öffnen;to open;открывать;Bitte öffnen Sie Ihr Heft.;Please open your notebook.;Пожалуйста, откройте вашу тетрадь.;Verb;a1_a2 verb
schließen;to close;закрывать;Die Bank schließt um siebzehn Uhr.;The bank closes at five p.m.;Банк закрывается в семнадцать часов.;Verb;a1_a2 verb
bleiben;to stay;оставаться;Wie lange bleibst du in Wien?;How long are you staying in Vienna?;Как долго ты остаёшься в Вене?;Verb;a1_a2 verb
bringen;to bring;приносить;Ich bringe morgen Kuchen mit.;I will bring cake tomorrow.;Завтра я принесу пирог.;Verb;a1_a2 verb
vergessen;to forget;забывать;Ich habe meinen Regenschirm vergessen.;I forgot my umbrella.;Я забыл свой зонт.;Verb;a1_a2 verb
erinnern an;to remind of;напоминать о;Dieses Lied erinnert mich an den Sommer.;This song reminds me of summer.;Эта песня напоминает мне о лете.;Verb (+ Akk.);a1_a2 verb
mögen;to like;нравиться / любить;Ich mag klassische Musik.;I like classical music.;Мне нравится классическая музыка.;Modalverb;a1_a2 verb
lieben;to love;любить;Sie liebt ihren Hund sehr.;She loves her dog very much.;Она очень любит свою собаку.;Verb;a1_a2 verb
glauben;to believe / to think;верить / думать;Ich glaube, er hat recht.;I think he is right.;Я думаю, он прав.;Verb;a1_a2 verb
denken an;to think of;думать о;Ich denke oft an unsere Reise.;I often think about our trip.;Я часто думаю о нашей поездке.;Verb (+ Akk.);a1_a2 verb
zeigen;to show;показывать;Können Sie mir das auf der Karte zeigen?;Can you show me that on the map?;Можете показать мне это на карте?;Verb;a1_a2 verb
erklären;to explain;объяснять;Der Lehrer erklärt die Regel.;The teacher explains the rule.;Учитель объясняет правило.;Verb;a1_a2 verb
spielen;to play;играть;Wir spielen am Abend Schach.;We play chess in the evening.;Вечером мы играем в шахматы.;Verb;a1_a2 verb
reisen;to travel;путешествовать;Ich reise gern in neue Länder.;I like traveling to new countries.;Я люблю путешествовать в новые страны.;Verb;a1_a2 travel
besuchen;to visit;посещать / навещать;Am Sonntag besuchen wir unsere Eltern.;On Sunday we are visiting our parents.;В воскресенье мы навестим родителей.;Verb;a1_a2 daily
treffen;to meet;встречать;Ich treffe meine Freundin im Café.;I am meeting my friend at the café.;Я встречаюсь с подругой в кафе.;Verb;a1_a2 daily
einladen;to invite;приглашать;Ich lade dich zum Geburtstag ein.;I invite you to my birthday.;Я приглашаю тебя на день рождения.;Verb (trennb.);a1_a2 daily
feiern;to celebrate;праздновать;Wir feiern heute unseren Erfolg.;Today we celebrate our success.;Сегодня мы празднуем наш успех.;Verb;a1_a2 daily
kochen;to cook;готовить;Mein Bruder kocht sehr gut.;My brother cooks very well.;Мой брат очень хорошо готовит.;Verb;a1_a2 food
putzen;to clean;убирать / чистить;Samstags putze ich die ganze Wohnung.;On Saturdays I clean the whole apartment.;По субботам я убираю всю квартиру.;Verb;a1_a2 home
waschen;to wash;мыть / стирать;Ich muss noch die Wäsche waschen.;I still have to wash the laundry.;Мне ещё нужно постирать бельё.;Verb;a1_a2 home
anziehen;to put on (clothes);надевать;Zieh dir eine warme Jacke an!;Put on a warm jacket!;Надень тёплую куртку!;Verb (trennb.);a1_a2 daily
ausziehen;to take off / move out;снимать / переезжать;Bitte zieh die Schuhe im Flur aus.;Please take off your shoes in the hallway.;Пожалуйста, сними обувь в коридоре.;Verb (trennb.);a1_a2 daily
mitnehmen;to take along;взять с собой;Nimmst du mich im Auto mit?;Are you taking me along in the car?;Возьмёшь меня с собой на машине?;Verb (trennb.);a1_a2 daily
zurückgeben;to give back / return;возвращать;Ich gebe dir das Buch morgen zurück.;I will give you the book back tomorrow.;Я верну тебе книгу завтра.;Verb (trennb.);a1_a2 daily
bestellen;to order;заказывать;Wir bestellen eine Pizza nach Hause.;We are ordering a pizza home.;Мы заказываем пиццу на дом.;Verb;a1_a2 food
empfehlen;to recommend;рекомендовать;Welches Gericht können Sie empfehlen?;Which dish can you recommend?;Какое блюдо вы можете порекомендовать?;Verb;a1_a2 food
schmecken;to taste;быть вкусным;Die Suppe schmeckt hervorragend.;The soup tastes excellent.;Суп очень вкусный.;Verb;a1_a2 food
riechen;to smell;пахнуть / нюхать;Hier riecht es nach frischem Kaffee.;It smells like fresh coffee here.;Здесь пахнет свежим кофе.;Verb;a1_a2 senses
lachen;to laugh;смеяться;Alle haben über den Witz gelacht.;Everyone laughed at the joke.;Все посмеялись над шуткой.;Verb;a1_a2 emotions
weinen;to cry;плакать;Das Baby weint, weil es Hunger hat.;The baby is crying because it is hungry.;Малыш плачет, потому что голоден.;Verb;a1_a2 emotions
hoffen;to hope;надеяться;Ich hoffe, wir sehen uns bald.;I hope we see each other soon.;Надеюсь, мы скоро увидимся.;Verb;a1_a2 emotions
wünschen;to wish;желать;Ich wünsche dir viel Glück!;I wish you good luck!;Желаю тебе удачи!;Verb;a1_a2 emotions
danken für;to thank for;благодарить за;Ich danke Ihnen für Ihre Geduld.;I thank you for your patience.;Благодарю вас за терпение.;Verb (+ Akk.);a1_a2 communication
entschuldigen;to excuse / apologize;извинять;Entschuldigen Sie bitte die Störung.;Please excuse the interruption.;Извините, пожалуйста, за беспокойство.;Verb;a1_a2 communication
versprechen;to promise;обещать;Ich verspreche dir, pünktlich zu sein.;I promise you to be on time.;Я обещаю тебе прийти вовремя.;Verb;a1_a2 communication
erzählen;to tell (a story);рассказывать;Erzähl mir von deinem Urlaub!;Tell me about your vacation!;Расскажи мне о своём отпуске!;Verb;a1_a2 communication
bedeuten;to mean;означать;Was bedeutet dieses Zeichen?;What does this sign mean?;Что означает этот знак?;Verb;a1_a2 study
buchstabieren;to spell;произносить по буквам;Können Sie Ihren Namen buchstabieren?;Can you spell your name?;Можете продиктовать ваше имя по буквам?;Verb;a1_a2 study
wiederholen;to repeat;повторять;Könnten Sie den Satz bitte wiederholen?;Could you please repeat the sentence?;Не могли бы вы повторить предложение?;Verb;a1_a2 study
prüfen;to check / to test;проверять;Bitte prüfen Sie die Adresse noch einmal.;Please check the address once more.;Пожалуйста, проверьте адрес ещё раз.;Verb;a1_a2 work
unterschreiben;to sign;подписывать;Unterschreiben Sie bitte hier unten.;Please sign down here.;Распишитесь, пожалуйста, здесь внизу.;Verb;a1_a2 work
schicken;to send;отправлять;Ich schicke dir die Fotos per E-Mail.;I am sending you the photos by email.;Я отправлю тебе фотографии по почте.;Verb;a1_a2 tech
bekommen;to receive / to get;получать;Hast du meine E-Mail bekommen?;Did you receive my email?;Ты получил моё письмо?;Verb;a1_a2 daily
verlieren;to lose;терять;Ich habe meine Brille verloren.;I lost my glasses.;Я потерял свои очки.;Verb;a1_a2 daily
gewinnen;to win;выигрывать;Unsere Mannschaft hat das Spiel gewonnen.;Our team won the game.;Наша команда выиграла игру.;Verb;a1_a2 daily
bezahlen für;to pay for;платить за;Wir bezahlen für das Ticket online.;We pay for the ticket online.;Мы оплачиваем билет онлайн.;Verb (+ Akk.);a1_a2 shopping
umziehen;to move (house);переезжать;Nächsten Monat ziehen wir nach Hamburg um.;Next month we are moving to Hamburg.;В следующем месяце мы переезжаем в Гамбург.;Verb (trennb.);a1_a2 home
mieten;to rent;арендовать;Wir möchten ein kleines Auto mieten.;We would like to rent a small car.;Мы хотели бы арендовать небольшую машину.;Verb;a1_a2 travel
reservieren;to reserve / to book;бронировать;Ich habe einen Tisch für zwei reserviert.;I reserved a table for two.;Я забронировал столик на двоих.;Verb;a1_a2 travel
übernachten;to stay overnight;ночевать;Wo wollen wir heute übernachten?;Where should we stay overnight today?;Где мы сегодня переночуем?;Verb;a1_a2 travel
ankommen;to arrive;прибывать;Der Zug kommt pünktlich um zwölf an.;The train arrives on time at twelve.;Поезд прибывает ровно в двенадцать.;Verb (trennb.);a1_a2 travel
abfahren;to depart;отправляться;Wann fährt der Zug nach Wien ab?;When does the train to Vienna depart?;Когда отправляется поезд в Вену?;Verb (trennb.);a1_a2 travel
umsteigen;to transfer / change;пересаживаться;Sie müssen in Frankfurt umsteigen.;You have to change trains in Frankfurt.;Вам нужно пересесть во Франкфурте.;Verb (trennb.);a1_a2 travel
spazieren gehen;to go for a walk;гулять;Nach dem Essen gehen wir spazieren.;After dinner we go for a walk.;После еды мы идём гулять.;Verbphrase;a1_a2 daily
Sport treiben;to do sports;заниматься спортом;Sie treibt dreimal pro Woche Sport.;She does sports three times a week.;Она занимается спортом три раза в неделю.;Verbphrase;a1_a2 health
frühstücken;to have breakfast;завтракать;Sonntags frühstücken wir ganz gemütlich.;On Sundays we have a cozy breakfast.;По воскресеньям мы неспешно завтракаем.;Verb;a1_a2 food
fernsehen;to watch TV;смотреть телевизор;Abends sehe ich selten fern.;In the evening I rarely watch TV.;Вечером я редко смотрю телевизор.;Verb (trennb.);a1_a2 daily
einkaufen;to go shopping;делать покупки;Ich gehe noch schnell im Laden einkaufen.;I am quickly going shopping at the store.;Я быстро схожу в магазин за покупками.;Verb (trennb.);a1_a2 shopping
aufräumen;to tidy up;прибираться;Bitte räum deinen Schreibtisch auf.;Please tidy up your desk.;Пожалуйста, прибери на своём столе.;Verb (trennb.);a1_a2 home
aussehen;to look / appear;выглядеть;Du siehst heute sehr erholt aus.;You look very rested today.;Ты сегодня выглядишь очень отдохнувшим.;Verb (trennb.);a1_a2 adj
passen;to fit / to suit;подходить;Diese Schuhe passen mir perfekt.;These shoes fit me perfectly.;Эти туфли мне идеально подходят.;Verb (+ Dat.);a1_a2 shopping
gehören;to belong to;принадлежать;Wem gehört diese Jacke?;Who does this jacket belong to?;Кому принадлежит эта куртка?;Verb (+ Dat.);a1_a2 basic
gefallen;to please / to like;нравиться;Das Konzert hat mir sehr gefallen.;I really liked the concert.;Концерт мне очень понравился.;Verb (+ Dat.);a1_a2 emotions
fehlen;to be missing / absent;не хватать / отсутствовать;Hier fehlt noch ein Löffel.;A spoon is still missing here.;Здесь ещё не хватает ложки.;Verb;a1_a2 daily', now())
on conflict (level) do update set
  title = excluded.title,
  word_count = excluded.word_count,
  csv_content = excluded.csv_content,
  updated_at = now();

insert into public.catalog_corpora (level, title, word_count, csv_content, updated_at)
values ('B1', 'B1 Intermediate', 200, 'de;en;ru;exDe;exEn;exRu;ctx;tags
die Erfahrung, die Erfahrungen;experience;опыт;Er hat viel Erfahrung in diesem Bereich.;He has a lot of experience in this field.;У него большой опыт в этой области.;Nomen, f.;b1 work
die Entscheidung, die Entscheidungen;decision;решение;Das war eine schwierige Entscheidung.;That was a difficult decision.;Это было трудное решение.;Nomen, f.;b1 daily
die Meinung, die Meinungen;opinion;мнение;Meiner Meinung nach ist das richtig.;In my opinion, that is right.;По моему мнению, это правильно.;Nomen, f.;b1 communication
der Unterschied, die Unterschiede;difference;разница / отличие;Worin liegt der Unterschied?;Wherein lies the difference?;В чём заключается разница?;Nomen, m.;b1 daily
die Möglichkeit, die Möglichkeiten;possibility / opportunity;возможность;Wir haben mehrere Möglichkeiten.;We have several possibilities.;У нас есть несколько возможностей.;Nomen, f.;b1 daily
das Ziel, die Ziele;goal / destination;цель;Mein Ziel ist es, fließend Deutsch zu sprechen.;My goal is to speak German fluently.;Моя цель — свободно говорить по-немецки.;Nomen, n.;b1 study
der Erfolg, die Erfolge;success;успех;Ich wünsche dir viel Erfolg bei der Prüfung.;I wish you much success on the exam.;Желаю тебе успехов на экзамене.;Nomen, m.;b1 work
das Problem, die Probleme;problem;проблема;Wir müssen dieses Problem schnell lösen.;We have to solve this problem quickly.;Нам нужно быстро решить эту проблему.;Nomen, n.;b1 daily
die Lösung, die Lösungen;solution;решение (задачи);Hast du schon eine gute Lösung gefunden?;Have you already found a good solution?;Ты уже нашёл хорошее решение?;Nomen, f.;b1 work
der Grund, die Gründe;reason / ground;причина;Aus diesem Grund bleibe ich hier.;For this reason I am staying here.;По этой причине я остаюсь здесь.;Nomen, m.;b1 communication
das Ergebnis, die Ergebnisse;result;результат;Das Ergebnis der Studie ist eindeutig.;The result of the study is clear.;Результат исследования однозначен.;Nomen, n.;b1 work
die Situation, die Situationen;situation;ситуация;In dieser Situation muss man ruhig bleiben.;In this situation you have to stay calm.;В этой ситуации нужно сохранять спокойствие.;Nomen, f.;b1 daily
die Beziehung, die Beziehungen;relationship;отношения / связь;Sie haben eine sehr enge Beziehung.;They have a very close relationship.;У них очень близкие отношения.;Nomen, f.;b1 people
die Gesellschaft, die Gesellschaften;society / company;общество;Die Gesellschaft verändert sich ständig.;Society is constantly changing.;Общество постоянно меняется.;Nomen, f.;b1 society
die Umwelt;environment;окружающая среда;Wir müssen die Umwelt besser schützen.;We must protect the environment better.;Мы должны лучше защищать окружающую среду.;Nomen, f.;b1 nature
der Vorteil, die Vorteile;advantage;преимущество;Das Homeoffice hat viele Vorteile.;Working from home has many advantages.;Удалённая работа имеет много преимуществ.;Nomen, m.;b1 work
der Nachteil, die Nachteile;disadvantage;недостаток / минус;Jede Methode hat Vor- und Nachteile.;Every method has pros and cons.;У каждого метода есть плюсы и минусы.;Nomen, m.;b1 work
die Gewohnheit, die Gewohnheiten;habit;привычка;Früh aufzustehen ist eine gute Gewohnheit.;Getting up early is a good habit.;Рано вставать — хорошая привычка.;Nomen, f.;b1 daily
die Verantwortung;responsibility;ответственность;Er trägt die Verantwortung für das Projekt.;He bears responsibility for the project.;Он несёт ответственность за проект.;Nomen, f.;b1 work
die Sicherheit;safety / security;безопасность;Sicherheit geht am Arbeitsplatz vor.;Safety comes first at the workplace.;Безопасность на рабочем месте превыше всего.;Nomen, f.;b1 work
die Entwicklung, die Entwicklungen;development;развитие / разработка;Die technische Entwicklung schreitet voran.;Technical development is advancing.;Техническое развитие идёт вперёд.;Nomen, f.;b1 tech
die Zukunft;future;будущее;In der Zukunft möchte ich im Ausland leben.;In the future I would like to live abroad.;В будущем я хотел бы жить за границей.;Nomen, f.;b1 time
die Vergangenheit;past;прошлое;Aus Fehlern der Vergangenheit kann man lernen.;One can learn from mistakes of the past.;На ошибках прошлого можно учиться.;Nomen, f.;b1 time
die Gegenwart;present;настоящее;Wir sollten mehr in der Gegenwart leben.;We should live more in the present.;Нам стоит больше жить в настоящем.;Nomen, f.;b1 time
der Rat;advice;совет;Danke für deinen wertvollen Rat.;Thank you for your valuable advice.;Спасибо за твой ценный совет.;Nomen, m.;b1 communication
der Vorschlag, die Vorschläge;suggestion / proposal;предложение;Dein Vorschlag klingt sehr vernünftig.;Your suggestion sounds very reasonable.;Твоё предложение звучит очень разумно.;Nomen, m.;b1 communication
die Bedingung, die Bedingungen;condition;условие;Unter dieser Bedingung stimme ich zu.;Under this condition I agree.;При этом условии я согласен.;Nomen, f.;b1 formal
die Regel, die Regeln;rule;правило;Alle müssen sich an die Regeln halten.;Everyone must follow the rules.;Все должны соблюдать правила.;Nomen, f.;b1 formal
das Gesetz, die Gesetze;law;закон;Das neue Gesetz tritt morgen in Kraft.;The new law takes effect tomorrow.;Новый закон вступает в силу завтра.;Nomen, n.;b1 society
die Pflicht, die Pflichten;duty / obligation;обязанность / долг;Es ist meine Pflicht, Ihnen zu helfen.;It is my duty to help you.;Это мой долг — помочь вам.;Nomen, f.;b1 formal
das Recht, die Rechte;right / law;право;Jeder Mensch hat das Recht auf Bildung.;Every person has the right to education.;Каждый человек имеет право на образование.;Nomen, n.;b1 society
die Freiheit;freedom;свобода;Reisen gibt mir ein Gefühl von Freiheit.;Traveling gives me a feeling of freedom.;Путешествия дают мне чувство свободы.;Nomen, f.;b1 society
der Stress;stress;стресс;Zu viel Stress schadet der Gesundheit.;Too much stress harms health.;Слишком сильный стресс вредит здоровью.;Nomen, m.;b1 health
die Energie;energy;энергия;Nach dem Urlaub habe ich wieder Energie.;After the vacation I have energy again.;После отпуска у меня снова есть энергия.;Nomen, f.;b1 health
die Bewegung;movement / exercise;движение;Tägliche Bewegung hält den Körper fit.;Daily exercise keeps the body fit.;Ежедневное движение держит тело в форме.;Nomen, f.;b1 health
die Ernährung;nutrition / diet;питание;Eine ausgewogene Ernährung ist wichtig.;A balanced diet is important.;Сбалансированное питание важно.;Nomen, f.;b1 health
die Werbung;advertising;реклама;Diese Werbung läuft ständig im Fernsehen.;This ad runs constantly on TV.;Эта реклама постоянно идёт по телевизору.;Nomen, f.;b1 media
die Nachricht, die Nachrichten;message / news;сообщение / новость;Ich habe gute Nachrichten für dich!;I have good news for you!;У меня для тебя хорошие новости!;Nomen, f.;b1 media
der Artikel, die Artikel;article;статья;Hast du den Artikel über KI gelesen?;Did you read the article about AI?;Ты читал статью про ИИ?;Nomen, m.;b1 media
die Veranstaltung, die Veranstaltungen;event;мероприятие;Die Veranstaltung findet im Rathaus statt.;The event takes place in the town hall.;Мероприятие проходит в ратуше.;Nomen, f.;b1 society
entscheiden;to decide;решать / принимать решение;Wir müssen bis Freitag entscheiden.;We have to decide by Friday.;Мы должны решить до пятницы.;Verb;b1 verb
sich entscheiden für;to decide on;определиться с выбором;Ich habe mich für diesen Kurs entschieden.;I decided on this course.;Я выбрал этот курс.;Refl. Verb (+ Akk.);b1 verb
vergleichen;to compare;сравнивать;Man sollte immer die Preise vergleichen.;One should always compare prices.;Всегда стоит сравнивать цены.;Verb;b1 verb
verbessern;to improve;улучшать;Ich möchte mein Deutsch schnell verbessern.;I want to improve my German quickly.;Я хочу быстро улучшить свой немецкий.;Verb;b1 study
verändern;to change / alter;менять / изменять;Der Umzug hat mein Leben verändert.;The move changed my life.;Переезд изменил мою жизнь.;Verb;b1 verb
entwickeln;to develop;развивать / разрабатывать;Unser Team entwickelt eine neue App.;Our team is developing a new app.;Наша команда разрабатывает новое приложение.;Verb;b1 tech
erreichen;to reach / achieve;достигать;Du kannst dein Ziel bestimmt erreichen.;You can definitely reach your goal.;Ты точно сможешь достичь своей цели.;Verb;b1 verb
schaffen;to manage / create;справляться / создавать;Zusammen schaffen wir das!;Together we can manage it!;Вместе мы справимся!;Verb;b1 verb
gelingen;to succeed;удаваться;Der Kuchen ist mir gut gelungen.;The cake turned out well for me.;Пирог мне удался.;Verb (+ Dat.);b1 verb
versuchen;to try;пытаться / пробовать;Ich versuche, jeden Tag zu lesen.;I try to read every day.;Я стараюсь читать каждый день.;Verb;b1 verb
vorbereiten;to prepare;готовить / подготавливать;Ich bereite mich auf das Gespräch vor.;I am preparing for the interview.;Я готовлюсь к собеседованию.;Verb (trennb.);b1 work
organisieren;to organize;организовывать;Sie organisiert das ganze Treffen.;She is organizing the entire meeting.;Она организует всю встречу.;Verb;b1 work
teilnehmen an;to participate in;участвовать в;Nimmst du am Seminar teil?;Are you participating in the seminar?;Ты участвуешь в семинаре?;Verb (trennb., + Dat.);b1 study
unterstützen;to support;поддерживать;Meine Freunde unterstützen mich immer.;My friends always support me.;Мои друзья всегда меня поддерживают.;Verb;b1 people
vertrauen;to trust;доверять;Man kann ihr voll und ganz vertrauen.;You can trust her completely.;Ей можно полностью доверять.;Verb (+ Dat.);b1 people
respektieren;to respect;уважать;Wir müssen andere Meinungen respektieren.;We must respect other opinions.;Мы должны уважать чужие мнения.;Verb;b1 society
diskutieren über;to discuss;обсуждать / дискутировать;Wir diskutieren über das neue Konzept.;We are discussing the new concept.;Мы обсуждаем новую концепцию.;Verb (+ Akk.);b1 communication
zustimmen;to agree;соглашаться;Ich stimme deinem Vorschlag völlig zu.;I completely agree with your proposal.;Я полностью согласен с твоим предложением.;Verb (trennb., + Dat.);b1 communication
ablehnen;to reject / decline;отклонять / отказываться;Er hat das Angebot höflich abgelehnt.;He politely declined the offer.;Он вежливо отклонил предложение.;Verb (trennb.);b1 communication
vorschlagen;to suggest;предлагать;Was schlägst du für heute Abend vor?;What do you suggest for tonight?;Что ты предлагаешь на сегодняшний вечер?;Verb (trennb.);b1 communication
berichten über;to report on;сообщать / рассказывать о;Die Zeitung berichtet über das Fest.;The newspaper reports on the festival.;Газета сообщает о празднике.;Verb (+ Akk.);b1 media
informieren über;to inform about;информировать о;Bitte informieren Sie mich rechtzeitig.;Please inform me in good time.;Пожалуйста, проинформируйте меня вовремя.;Verb (+ Akk.);b1 communication
warnen vor;to warn against;предупреждать о;Der Wetterdienst warnt vor starkem Wind.;The weather service warns of strong wind.;Метеослужба предупреждает о сильном ветре.;Verb (+ Dat.);b1 nature
schützen vor;to protect from;защищать от;Sonnencreme schützt vor Sonnenbrand.;Sunscreen protects against sunburn.;Солнцезащитный крем защищает от ожогов.;Verb (+ Dat.);b1 health
sparen;to save (money/time);экономить / копить;Wir sparen Geld für eine lange Reise.;We are saving money for a long trip.;Мы копим деньги на долгое путешествие.;Verb;b1 daily
ausgeben für;to spend on;тратить на;Er gibt viel Geld für Bücher aus.;He spends a lot of money on books.;Он тратит много денег на книги.;Verb (trennb., + Akk.);b1 shopping
verdienen;to earn;зарабатывать;Als Ärztin verdient sie gut.;As a doctor she earns well.;Работая врачом, она хорошо зарабатывает.;Verb;b1 work
sich bewerben um;to apply for;подавать заявку на;Ich bewerbe mich um eine neue Stelle.;I am applying for a new position.;Я подаю резюме на новую должность.;Refl. Verb (+ Akk.);b1 work
kündigen;to quit / cancel;увольняться / расторгать;Er hat seinen Vertrag rechtzeitig gekündigt.;He canceled his contract in time.;Он вовремя расторг свой договор.;Verb;b1 work
übernehmen;to take over;брать на себя / перенимать;Wer übernimmt heute diese Aufgabe?;Who is taking over this task today?;Кто возьмёт на себя эту задачу сегодня?;Verb;b1 work
erlauben;to allow;разрешать;Rauchen ist hier nicht erlaubt.;Smoking is not allowed here.;Курение здесь не разрешено.;Verb (+ Dat.);b1 formal
verbieten;to forbid;запрещать;Das Gesetz verbietet schnelles Fahren.;The law forbids fast driving.;Закон запрещает быструю езду.;Verb;b1 formal
verbinden;to connect;соединять / связывать;Diese Brücke verbindet zwei Stadtteile.;This bridge connects two districts.;Этот мост соединяет два района.;Verb;b1 tech
speichern;to save (data);сохранять (данные);Vergiss nicht, die Datei zu speichern.;Do not forget to save the file.;Не забудь сохранить файл.;Verb;b1 tech
löschen;to delete;удалять;Ich habe die alte Nachricht gelöscht.;I deleted the old message.;Я удалил старое сообщение.;Verb;b1 tech
herunterladen;to download;скачивать;Du kannst das Formular hier herunterladen.;You can download the form here.;Ты можешь скачать форму здесь.;Verb (trennb.);b1 tech
sich konzentrieren auf;to concentrate on;сосредотачиваться на;Ich muss mich auf die Arbeit konzentrieren.;I have to concentrate on work.;Мне нужно сосредоточиться на работе.;Refl. Verb (+ Akk.);b1 study
sich interessieren für;to be interested in;интересоваться;Sie interessiert sich sehr für Kunst.;She is very interested in art.;Она очень интересуется искусством.;Refl. Verb (+ Akk.);b1 daily
sich freuen auf;to look forward to;с нетерпением ждать;Ich freue mich auf das Wochenende.;I am looking forward to the weekend.;Я с нетерпением жду выходных.;Refl. Verb (+ Akk.);b1 emotions
sich freuen über;to be happy about;радоваться чему-то;Ich habe mich über das Geschenk gefreut.;I was happy about the gift.;Я обрадовался подарку.;Refl. Verb (+ Akk.);b1 emotions
sich beschweren über;to complain about;жаловаться на;Die Gäste beschweren sich über den Lärm.;The guests are complaining about the noise.;Гости жалуются на шум.;Refl. Verb (+ Akk.);b1 communication
sich entschuldigen bei;to apologize to;извиняться перед;Ich möchte mich bei dir entschuldigen.;I would like to apologize to you.;Я хотел бы извиниться перед тобой.;Refl. Verb (+ Dat.);b1 communication
zufrieden mit;satisfied with;довольный чем-то;Bist du mit dem Ergebnis zufrieden?;Are you satisfied with the result?;Ты доволен результатом?;Adjektiv (+ Dat.);b1 emotions
enttäuscht von;disappointed by;разочарованный в;Er war von dem Film enttäuscht.;He was disappointed by the movie.;Он был разочарован фильмом.;Adjektiv (+ Dat.);b1 emotions
stolz auf;proud of;гордый за;Wir sind sehr stolz auf dich!;We are very proud of you!;Мы очень гордимся тобой!;Adjektiv (+ Akk.);b1 emotions
nervös;nervous;нервный;Vor Prüfungen bin ich immer nervös.;Before exams I am always nervous.;Перед экзаменами я всегда нервничаю.;Adjektiv;b1 emotions
geduldig;patient;терпеливый;Man muss beim Lernen geduldig sein.;One has to be patient while learning.;При обучении нужно быть терпеливым.;Adjektiv;b1 adj
höflich;polite;вежливый;Der Kellner war ausgesprochen höflich.;The waiter was remarkably polite.;Официант был исключительно вежливым.;Adjektiv;b1 adj
ehrlich;honest;честный;Sag mir bitte deine ehrliche Meinung.;Please tell me your honest opinion.;Скажи мне, пожалуйста, твоё честное мнение.;Adjektiv;b1 adj
pünktlich;punctual / on time;пунктуальный / вовремя;Der Flug ist pünktlich gelandet.;The flight landed on time.;Рейс приземлился вовремя.;Adjektiv;b1 adj
selbstständig;independent;самостоятельный;Sie arbeitet schon lange selbstständig.;She has been working independently for a long time.;Она уже давно работает самостоятельно.;Adjektiv;b1 work
regelmäßig;regular;регулярный;Regelmäßiges Training bringt gute Erfolge.;Regular training brings good results.;Регулярные тренировки приносят хорошие результаты.;Adjektiv;b1 adj
plötzlich;suddenly;вдруг / внезапно;Plötzlich fing es an zu schneien.;Suddenly it started to snow.;Вдруг пошёл снег.;Adverb;b1 time
vielleicht;maybe / perhaps;возможно / может быть;Vielleicht fahren wir ans Meer.;Maybe we will go to the sea.;Возможно, мы поедем на море.;Adverb;b1 daily
eigentlich;actually;вообще-то / на самом деле;Eigentlich wollte ich heute früh schlafen.;Actually, I wanted to sleep early today.;Вообще-то я хотел лечь сегодня пораньше.;Adverb;b1 communication
deshalb;therefore;поэтому;Es regnet, deshalb bleiben wir drinnen.;It is raining, therefore we stay inside.;Идёт дождь, поэтому мы остаёмся дома.;Konnektor;b1 grammar
trotzdem;nevertheless / anyway;несмотря на это;Es war spät, trotzdem kam er noch.;It was late, nevertheless he still came.;Было поздно, но он всё равно пришёл.;Konnektor;b1 grammar
obwohl;although;хотя;Obwohl ich müde bin, lerne ich weiter.;Although I am tired, I keep studying.;Хотя я устал, я продолжаю учиться.;Subjunktion;b1 grammar
während;while / during;в то время как / во время;Während er kocht, decke ich den Tisch.;While he cooks, I set the table.;Пока он готовит, я накрываю на стол.;Subjunktion;b1 grammar
sobald;as soon as;как только;Ruf mich an, sobald du ankommst.;Call me as soon as you arrive.;Позвони мне, как только приедешь.;Subjunktion;b1 grammar
seitdem;since then;с тех пор как;Seitdem ich hier wohne, fahre ich viel Rad.;Since I have lived here, I cycle a lot.;С тех пор как я здесь живу, я много катаюсь на велосипеде.;Subjunktion;b1 grammar
bevor;before;прежде чем;Putz dir die Zähne, bevor du schläfst.;Brush your teeth before you sleep.;Почисти зубы, прежде чем ляжешь спать.;Subjunktion;b1 grammar
nachdem;after;после того как;Nachdem wir gegessen hatten, gingen wir raus.;After we had eaten, we went outside.;После того как мы поели, мы вышли на улицу.;Subjunktion;b1 grammar
falls;in case / if;в случае если;Nimm Geld mit, falls die Karte nicht geht.;Take cash in case the card does not work.;Возьми наличные на случай, если карта не сработает.;Subjunktion;b1 grammar
außerdem;besides / furthermore;кроме того;Die Wohnung ist hell und außerdem ruhig.;The apartment is bright and besides quiet.;Квартира светлая и, кроме того, тихая.;Adverb;b1 grammar
ungefähr;approximately;примерно;Die Fahrt dauert ungefähr eine Stunde.;The ride takes approximately one hour.;Поездка длится примерно один час.;Adverb;b1 daily
mindestens;at least;как минимум;Man sollte mindestens sieben Stunden schlafen.;One should sleep at least seven hours.;Нужно спать как минимум семь часов.;Adverb;b1 daily
höchstens;at most;максимум;Das dauert höchstens zehn Minuten.;That takes at most ten minutes.;Это займёт максимум десять минут.;Adverb;b1 daily
insgesamt;altogether / in total;в общей сложности;Insgesamt haben zwanzig Personen zugesagt.;In total, twenty people confirmed.;В общей сложности подтвердили двадцать человек.;Adverb;b1 work
ziemlich;quite / fairly;довольно;Das Wetter ist heute ziemlich windig.;The weather is quite windy today.;Погода сегодня довольно ветреная.;Adverb;b1 daily
besonders;especially;особенно;Dieses Kapitel ist besonders wichtig.;This chapter is especially important.;Эта глава особенно важна.;Adverb;b1 study
natürlich;natural / of course;естественно / конечно;Natürlich helfe ich dir gern!;Of course I am happy to help you!;Конечно, я с радостью тебе помогу!;Adjektiv / Adverb;b1 daily
deutlich;clear / distinct;отчётливый / явный;Man sieht einen deutlichen Fortschritt.;One can see clear progress.;Виден явный прогресс.;Adjektiv;b1 adj
möglich;possible;возможный;Ist ein Termin nächste Woche möglich?;Is an appointment possible next week?;Возможна ли встреча на следующей неделе?;Adjektiv;b1 adj
nötig;necessary;необходимый;Ist diese Unterschrift wirklich nötig?;Is this signature really necessary?;Эта подпись действительно необходима?;Adjektiv;b1 adj
bekannt;well-known / familiar;известный / знакомый;Dieses Museum ist weltweit bekannt.;This museum is known worldwide.;Этот музей известен во всём мире.;Adjektiv;b1 adj
beliebt;popular;популярный;Das Café ist bei Studenten sehr beliebt.;The café is very popular among students.;Это кафе очень популярно среди студентов.;Adjektiv;b1 adj
gefährlich;dangerous;опасный;Bei Glatteis ist Autofahren gefährlich.;Driving on black ice is dangerous.;В гололёд водить машину опасно.;Adjektiv;b1 adj
praktisch;practical;практичный;Ein Rucksack ist auf Reisen sehr praktisch.;A backpack is very practical when traveling.;Рюкзак очень практичен в путешествиях.;Adjektiv;b1 adj
modern;modern;современный;Das Gebäude hat eine moderne Architektur.;The building has modern architecture.;У здания современная архитектура.;Adjektiv;b1 adj
die Abteilung, die Abteilungen;department;отдел;Er leitet die neue Abteilung.;He leads the new department.;Он руководит новым отделом.;Nomen, f.;b1 work
die Ausbildung, die Ausbildungen;vocational training / education;профессиональное обучение;Sie macht eine Ausbildung zur Köchin.;She is doing an apprenticeship as a chef.;Она учится на повара.;Nomen, f.;b1 study
das Gehalt, die Gehälter;salary;зарплата;Das Gehalt wird am Monatsende gezahlt.;The salary is paid at the end of the month.;Зарплата выплачивается в конце месяца.;Nomen, n.;b1 work
der Vertrag, die Verträge;contract;договор / контракт;Bitte lesen Sie den Vertrag sorgfältig.;Please read the contract carefully.;Пожалуйста, внимательно прочитайте договор.;Nomen, m.;b1 work
die Bewerbung, die Bewerbungen;application;заявка / резюме;Ich habe meine Bewerbung gestern abgeschickt.;I sent my application yesterday.;Я отправил своё резюме вчера.;Nomen, f.;b1 work
das Vorstellungsgespräch, die Vorstellungsgespräche;job interview;собеседование;Morgen habe ich ein wichtiges Vorstellungsgespräch.;Tomorrow I have an important job interview.;Завтра у меня важное собеседование.;Nomen, n.;b1 work
die Pause, die Pausen;break / pause;перерыв;Um zwölf Uhr machen wir eine kurze Pause.;At twelve we take a short break.;В двенадцать мы делаем короткий перерыв.;Nomen, f.;b1 work
der Urlaub, die Urlaube;vacation;отпуск;Im August fahren wir zwei Wochen in den Urlaub.;In August we go on vacation for two weeks.;В августе мы уезжаем в отпуск на две недели.;Nomen, m.;b1 travel
die Reise, die Reisen;trip / journey;поездка / путешествие;Die Reise nach Italien war unvergesslich.;The trip to Italy was unforgettable.;Поездка в Италию была незабываемой.;Nomen, f.;b1 travel
das Gepäck;luggage;багаж;Mein Gepäck ist leider nicht angekommen.;Unfortunately, my luggage did not arrive.;К сожалению, мой багаж не прибыл.;Nomen, n.;b1 travel
der Ausweis, die Ausweise;ID card;удостоверение личности;Zeigen Sie bitte Ihren Ausweis vor.;Please show your ID card.;Пожалуйста, предъявите ваше удостоверение.;Nomen, m.;b1 travel
die Verspätung, die Verspätungen;delay;опоздание / задержка;Wegen des Sturms gibt es Verspätungen.;Due to the storm there are delays.;Из-за шторма есть задержки.;Nomen, f.;b1 travel
der Stau, die Staus;traffic jam;пробка на дороге;Auf der Autobahn standen wir im Stau.;On the highway we were stuck in a traffic jam.;На автобане мы стояли в пробке.;Nomen, m.;b1 travel
die Kreuzung, die Kreuzungen;intersection / crossroads;перекрёсток;An der nächsten Kreuzung biegen Sie links ab.;At the next intersection turn left.;На следующем перекрёстке поверните налево.;Nomen, f.;b1 travel
die Nachbarschaft;neighborhood;соседство / район;Wir wohnen in einer ruhigen Nachbarschaft.;We live in a quiet neighborhood.;Мы живём в спокойном районе.;Nomen, f.;b1 home
die Miete, die Mieten;rent;арендная плата;Die Miete steigt ab dem nächsten Jahr.;The rent increases starting next year.;Арендная плата вырастет со следующего года.;Nomen, f.;b1 home
der Vermieter, die Vermieter;landlord;арендодатель;Unser Vermieter kümmert sich schnell um Reparaturen.;Our landlord takes care of repairs quickly.;Наш арендодатель быстро решает вопросы с ремонтом.;Nomen, m.;b1 home
die Heizung, die Heizungen;heating;отопление;Im Winter läuft die Heizung den ganzen Tag.;In winter the heating runs all day.;Зимой отопление работает весь день.;Nomen, f.;b1 home
der Müll;trash / garbage;мусор;Wir trennen hier Papier und Plastik vom Müll.;Here we separate paper and plastic from trash.;Здесь мы отделяем бумагу и пластик от мусора.;Nomen, m.;b1 home
die Apotheke, die Apotheken;pharmacy;аптека;Das Medikament bekommen Sie in der Apotheke.;You can get the medicine at the pharmacy.;Лекарство вы получите в аптеке.;Nomen, f.;b1 health
das Medikament, die Medikamente;medicine / drug;лекарство;Nehmen Sie dieses Medikament dreimal täglich.;Take this medicine three times a day.;Принимайте это лекарство три раза в день.;Nomen, n.;b1 health
der Schmerz, die Schmerzen;pain;боль;Ich habe starke Schmerzen im Rücken.;I have severe pain in my back.;У меня сильная боль в спине.;Nomen, m.;b1 health
die Erkältung, die Erkältungen;cold (illness);простуда;Bei einer Erkältung hilft viel heißer Tee.;With a cold, lots of hot tea helps.;При простуде помогает много горячего чая.;Nomen, f.;b1 health
das Fieber;fever;температура / жар;Das Kind hat hohes Fieber.;The child has a high fever.;У ребёнка высокая температура.;Nomen, n.;b1 health
die Untersuchung, die Untersuchungen;examination / checkup;обследование;Die ärztliche Untersuchung dauerte zwanzig Minuten.;The medical examination lasted twenty minutes.;Медицинское обследование длилось двадцать минут.;Nomen, f.;b1 health
die Versicherung, die Versicherungen;insurance;страховка;Eine gute Versicherung ist im Ausland wichtig.;Good insurance is important abroad.;Хорошая страховка важна за границей.;Nomen, f.;b1 formal
das Konto, die Konten;bank account;банковский счёт;Ich möchte ein neues Konto eröffnen.;I would like to open a new account.;Я хотел бы открыть новый счёт.;Nomen, n.;b1 daily
die Überweisung, die Überweisungen;bank transfer;банковский перевод;Die Überweisung dauert einen Werktag.;The bank transfer takes one business day.;Банковский перевод занимает один рабочий день.;Nomen, f.;b1 daily
das Bargeld;cash;наличные;Haben Sie genug Bargeld dabei?;Do you have enough cash with you?;У вас с собой достаточно наличных?;Nomen, n.;b1 shopping
der Rabatt, die Rabatte;discount;скидка;Auf Winterjacken gibt es dreißig Prozent Rabatt.;There is a thirty percent discount on winter jackets.;На зимние куртки скидка тридцать процентов.;Nomen, m.;b1 shopping
die Quittung, die Quittungen;receipt;чек / квитанция;Bewahren Sie die Quittung für den Umtausch auf.;Keep the receipt for an exchange.;Сохраните чек на случай обмена.;Nomen, f.;b1 shopping
die Qualität;quality;качество;Die Qualität dieser Schuhe überzeugt mich.;The quality of these shoes convinces me.;Качество этой обуви меня убеждает.;Nomen, f.;b1 shopping
der Geschmack;taste;вкус;Über Geschmack lässt sich bekanntlich streiten.;There is no accounting for taste.;О вкусах, как известно, спорят.;Nomen, m.;b1 daily
die Kultur, die Kulturen;culture;культура;Ich interessiere mich für fremde Kulturen.;I am interested in foreign cultures.;Я интересуюсь чужими культурами.;Nomen, f.;b1 society
die Tradition, die Traditionen;tradition;традиция;Diese Tradition wird seit Jahrhunderten gepflegt.;This tradition has been kept for centuries.;Эта традиция поддерживается веками.;Nomen, f.;b1 society
die Natur;nature;природа;Am Wochenende gehe ich gern in die Natur.;On the weekend I like going into nature.;На выходных я люблю выезжать на природу.;Nomen, f.;b1 nature
die Landschaft, die Landschaften;landscape;пейзаж / ландшафт;Die Landschaft in den Alpen ist beeindruckend.;The landscape in the Alps is impressive.;Пейзаж в Альпах впечатляет.;Nomen, f.;b1 nature
der Wald, die Wälder;forest;лес;Im Herbst spazieren wir oft durch den Wald.;In autumn we often walk through the forest.;Осенью мы часто гуляем по лесу.;Nomen, m.;b1 nature
der Fluss, die Flüsse;river;река;Der Fluss fließt mitten durch die Stadt.;The river flows right through the city.;Река течёт прямо через центр города.;Nomen, m.;b1 nature
der Berg, die Berge;mountain;гора;Wir steigen morgen auf diesen Berg.;Tomorrow we are climbing this mountain.;Завтра мы поднимаемся на эту гору.;Nomen, m.;b1 nature
die Luft;air;воздух;Nach dem Regen ist die Luft besonders frisch.;After the rain the air is especially fresh.;После дождя воздух особенно свежий.;Nomen, f.;b1 nature
der Abfall, die Abfälle;waste / rubbish;отходы / мусор;Wir sollten weniger Abfall produzieren.;We should produce less waste.;Нам следует производить меньше отходов.;Nomen, m.;b1 nature
das Klima;climate;климат;Das globale Klima verändert sich spürbar.;The global climate is changing noticeably.;Глобальный климат заметно меняется.;Nomen, n.;b1 nature
die Politik;politics;политика;Viele junge Menschen interessieren sich für Politik.;Many young people are interested in politics.;Многие молодые люди интересуются политикой.;Nomen, f.;b1 society
die Wirtschaft;economy;экономика;Die Wirtschaft wächst in diesem Jahr langsam.;The economy is growing slowly this year.;Экономика растёт в этом году медленно.;Nomen, f.;b1 society
die Bevölkerung;population;население;Die Bevölkerung der Stadt nimmt stetig zu.;The city’s population is growing steadily.;Население города постоянно растёт.;Nomen, f.;b1 society
der Bürger, die Bürger;citizen;гражданин;Alle Bürger haben das Recht zu wählen.;All citizens have the right to vote.;Все граждане имеют право голосовать.;Nomen, m.;b1 society
die Wahl, die Wahlen;election / choice;выборы / выбор;Am Sonntag findet die Wahl statt.;The election takes place on Sunday.;В воскресенье состоятся выборы.;Nomen, f.;b1 society
die Diskussion, die Diskussionen;discussion;дискуссия / обсуждение;Die Diskussion war sachlich und hilfreich.;The discussion was objective and helpful.;Дискуссия была деловой и полезной.;Nomen, f.;b1 communication
das Argument, die Argumente;argument;аргумент / довод;Das ist ein sehr starkes Argument.;That is a very strong argument.;Это очень сильный аргумент.;Nomen, n.;b1 communication
der Eindruck, die Eindrücke;impression;впечатление;Mein erster Eindruck war durchweg positiv.;My first impression was thoroughly positive.;Моё первое впечатление было полностью положительным.;Nomen, m.;b1 communication
das Verständnis;understanding / sympathy;понимание / сочувствие;Vielen Dank für Ihr Verständnis.;Thank you very much for your understanding.;Большое спасибо за ваше понимание.;Nomen, n.;b1 communication
die Geduld;patience;терпение;Beim Üben braucht man etwas Geduld.;When practicing you need some patience.;При практике нужно немного терпения.;Nomen, f.;b1 emotions
die Angst, die Ängste;fear / anxiety;страх;Er hat keine Angst vor Fehlern.;He is not afraid of making mistakes.;Он не боится делать ошибки.;Nomen, f.;b1 emotions
die Freude;joy;радость;Die Überraschung war eine große Freude.;The surprise was a great joy.;Сюрприз стал большой радостью.;Nomen, f.;b1 emotions
die Hoffnung, die Hoffnungen;hope;надежда;Gib die Hoffnung niemals auf.;Never give up hope.;Никогда не теряй надежду.;Nomen, f.;b1 emotions
beobachten;to observe / watch;наблюдать;Ich beobachte die Vögel im Park.;I am watching the birds in the park.;Я наблюдаю за птицами в парке.;Verb;b1 verb
bemerken;to notice;замечать;Hast du bemerkt, wie leise es ist?;Did you notice how quiet it is?;Ты заметил, как здесь тихо?;Verb;b1 verb
entdecken;to discover;открывать / обнаруживать;Wir haben ein tolles Café entdeckt.;We discovered a great café.;Мы открыли для себя отличное кафе.;Verb;b1 verb
erfinden;to invent;изобретать;Wer hat das Telefon erfunden?;Who invented the telephone?;Кто изобрёл телефон?;Verb;b1 tech
reparieren;to repair / fix;чинить / ремонтировать;Kannst du mein Fahrrad reparieren?;Can you fix my bicycle?;Можешь починить мой велосипед?;Verb;b1 daily
beschreiben;to describe;описывать;Beschreiben Sie bitte das Bild genau.;Please describe the picture in detail.;Опишите, пожалуйста, картинку подробно.;Verb;b1 communication
übersetzen;to translate;переводить;Kannst du diesen Satz ins Deutsche übersetzen?;Can you translate this sentence into German?;Можешь перевести это предложение на немецкий?;Verb;b1 study
ausdrücken;to express;выражать;Ich kann das auf Deutsch gut ausdrücken.;I can express that well in German.;Я могу хорошо выразить это по-немецки.;Verb (trennb.);b1 communication
begründen;to justify / give reasons for;обосновывать;Bitte begründen Sie Ihre Meinung kurz.;Please briefly justify your opinion.;Пожалуйста, кратко обоснуйте своё мнение.;Verb;b1 communication
vermuten;to suppose / suspect;предполагать;Ich vermute, dass der Zug später kommt.;I suppose the train will arrive later.;Я предполагаю, что поезд придёт позже.;Verb;b1 communication
hoffen auf;to hope for;надеяться на;Wir hoffen auf besseres Wetter am Sonntag.;We hope for better weather on Sunday.;Мы надеемся на лучшую погоду в воскресенье.;Verb (+ Akk.);b1 emotions
zweifeln;to doubt;сомневаться;Daran zweifle ich kein bisschen.;I do not doubt that one bit.;В этом я нисколько не сомневаюсь.;Verb;b1 emotions
sich erinnern an;to remember;вспоминать / помнить о;Erinnerst du dich an unseren Ausflug?;Do you remember our excursion?;Ты помнишь нашу поездку?;Refl. Verb (+ Akk.);b1 daily
sich gewöhnen an;to get used to;привыкать к;Man gewöhnt sich schnell an die neue Stadt.;One quickly gets used to the new city.;Быстро привыкаешь к новому городу.;Refl. Verb (+ Akk.);b1 daily
sich kümmern um;to take care of;заботиться о;Wer kümmert sich um die Blumen?;Who takes care of the flowers?;Кто ухаживает за цветами?;Refl. Verb (+ Akk.);b1 daily
sich verabreden mit;to make an appointment / date with;договориться о встрече с;Ich habe mich mit Julia verabredet.;I made plans to meet Julia.;Я договорился встретиться с Юлией.;Refl. Verb (+ Dat.);b1 daily
sich streiten mit;to argue with;ссориться с;Er streitet sich selten mit Nachbarn.;He rarely argues with neighbors.;Он редко ссорится с соседями.;Refl. Verb (+ Dat.);b1 people
sich vertragen mit;to get along with;ладить с / мириться;Die Kinder vertragen sich sehr gut.;The children get along very well.;Дети очень хорошо ладят друг с другом.;Refl. Verb (+ Dat.);b1 people
aufpassen auf;to watch out for / look after;присматривать за / быть внимательным;Pass gut auf deine Tasche auf!;Watch your bag carefully!;Внимательно следи за своей сумкой!;Verb (trennb., + Akk.);b1 daily
nachdenken über;to think about / reflect on;размышлять о;Ich muss über dein Angebot nachdenken.;I have to think about your offer.;Мне нужно обдумать твоё предложение.;Verb (trennb., + Akk.);b1 communication
umgehen mit;to deal with / handle;обращаться с / справляться;Er kann gut mit Kritik umgehen.;He can handle criticism well.;Он умеет хорошо воспринимать критику.;Verb (trennb., + Dat.);b1 work
auskommen mit;to get by with / get along with;обходиться / ладить с;Mit diesem Budget kommen wir gut aus.;We get by well with this budget.;С этим бюджетом мы вполне справляемся.;Verb (trennb., + Dat.);b1 daily
stattfinden;to take place;состояться / проходить;Das Konzert findet im Stadtpark statt.;The concert takes place in the city park.;Концерт состоится в городском парке.;Verb (trennb.);b1 daily
vorhaben;to plan / intend;планировать / намереваться;Was habt ihr am Wochenende vor?;What do you plan to do on the weekend?;Что вы планируете на выходные?;Verb (trennb.);b1 daily', now())
on conflict (level) do update set
  title = excluded.title,
  word_count = excluded.word_count,
  csv_content = excluded.csv_content,
  updated_at = now();

insert into public.catalog_corpora (level, title, word_count, csv_content, updated_at)
values ('B2', 'B2 Upper-Intermediate', 180, 'de;en;ru;exDe;exEn;exRu;ctx;tags
die Herausforderung, die Herausforderungen;challenge;вызов / сложная задача;Die Digitalisierung stellt eine große Herausforderung dar.;Digitalization represents a major challenge.;Цифровизация представляет собой большой вызов.;Nomen, f.;b2 work
die Voraussetzung, die Voraussetzungen;prerequisite / requirement;предпосылка / требование;Gute Sprachkenntnisse sind eine Voraussetzung.;Good language skills are a prerequisite.;Хорошее знание языка — обязательное требование.;Nomen, f.;b2 work
die Auswirkung, die Auswirkungen;impact / consequence;последствие / влияние;Die Auswirkungen sind noch nicht absehbar.;The consequences are not yet foreseeable.;Последствия пока невозможно предвидеть.;Nomen, f.;b2 society
die Maßnahme, die Maßnahmen;measure / action;мера / мероприятие;Die Regierung hat neue Maßnahmen ergriffen.;The government has taken new measures.;Правительство приняло новые меры.;Nomen, f.;b2 formal
der Begriff, die Begriffe;term / concept;понятие / термин;In diesem Text wird der Begriff genau definiert.;In this text the term is precisely defined.;В этом тексте термин точно определяется.;Nomen, m.;b2 academic
die Anforderung, die Anforderungen;requirement / demand;требование;Die Anforderungen an Bewerber steigen stetig.;Requirements for applicants are steadily rising.;Требования к соискателям постоянно растут.;Nomen, f.;b2 work
die Angelegenheit, die Angelegenheiten;matter / affair;дело / вопрос;Ich kümmere mich sofort um diese Angelegenheit.;I will take care of this matter immediately.;Я немедленно займусь этим делом.;Nomen, f.;b2 formal
die Genehmigung, die Genehmigungen;approval / permit;разрешение / согласование;Ohne Genehmigung darf hier nicht gebaut werden.;Without a permit, building is not allowed here.;Без разрешения здесь нельзя строить.;Nomen, f.;b2 formal
der Ablauf, die Abläufe;workflow / procedure;ход / рабочий процесс;Ein klarer Ablauf spart im Projekt viel Zeit.;A clear workflow saves a lot of time in a project.;Чёткий рабочий процесс экономит много времени в проекте.;Nomen, m.;b2 work
das Verfahren, die Verfahren;procedure / method;метод / процедура;Dieses Verfahren wird weltweit angewendet.;This procedure is applied worldwide.;Этот метод применяется по всему миру.;Nomen, n.;b2 tech
der Zusammenhang, die Zusammenhänge;context / connection;взаимосвязь / контекст;Man muss das im größeren Zusammenhang sehen.;One must see this in a larger context.;Это нужно рассматривать в более широком контексте.;Nomen, m.;b2 academic
der Überblick;overview;обзор;Die Tabelle gibt einen schnellen Überblick.;The table provides a quick overview.;Таблица даёт быстрый обзор.;Nomen, m.;b2 work
der Fortschritt, die Fortschritte;progress;прогресс;Die Medizin macht enorme Fortschritte.;Medicine is making enormous progress.;Медицина делает колоссальные успехи.;Nomen, m.;b2 society
der Rückgang, die Rückgänge;decline / decrease;спад / снижение;Es gibt einen leichten Rückgang der Kosten.;There is a slight decline in costs.;Наблюдается небольшое снижение затрат.;Nomen, m.;b2 economy
der Anstieg, die Anstiege;increase / rise;рост / подъём;Der Anstieg der Preise belastet viele Haushalte.;The rise in prices burdens many households.;Рост цен обременяет многие семьи.;Nomen, m.;b2 economy
die Ursache, die Ursachen;cause;причина (источник);Die genaue Ursache des Fehlers ist noch unklar.;The exact cause of the error is still unclear.;Точная причина ошибки пока неясна.;Nomen, f.;b2 tech
die Folge, die Folgen;consequence / result;последствие;Das hatte unerwartete Folgen für das Team.;That had unexpected consequences for the team.;Это имело неожиданные последствия для команды.;Nomen, f.;b2 formal
der Schwerpunkt, die Schwerpunkte;main focus / priority;основной акцент;Unser Schwerpunkt liegt auf der Qualität.;Our main focus is on quality.;Наш главный акцент сделан на качестве.;Nomen, m.;b2 work
der Standpunkt, die Standpunkte;point of view;точка зрения;Ich verstehe Ihren Standpunkt vollkommen.;I completely understand your point of view.;Я полностью понимаю вашу точку зрения.;Nomen, m.;b2 communication
die Kritik;criticism;критика;Konstruktive Kritik hilft uns weiter.;Constructive criticism helps us move forward.;Конструктивная критика помогает нам двигаться дальше.;Nomen, f.;b2 communication
die Verhandlung, die Verhandlungen;negotiation;переговоры;Die Verhandlungen dauerten drei Stunden.;The negotiations lasted three hours.;Переговоры длились три часа.;Nomen, f.;b2 business
die Vereinbarung, die Vereinbarungen;agreement;соглашение / договорённость;Wir haben eine schriftliche Vereinbarung getroffen.;We reached a written agreement.;Мы заключили письменное соглашение.;Nomen, f.;b2 business
der Wettbewerb, die Wettbewerbe;competition;конкуренция / соревнование;Der Wettbewerb auf dem Markt ist stark.;Competition on the market is strong.;Конкуренция на рынке сильная.;Nomen, m.;b2 business
die Nachfrage;demand;спрос;Die Nachfrage nach Fachkräften ist hoch.;The demand for skilled workers is high.;Спрос на специалистов высок.;Nomen, f.;b2 economy
das Angebot, die Angebote;offer / supply;предложение;Dieses Angebot gilt nur bis Ende des Monats.;This offer is valid only until the end of the month.;Это предложение действует только до конца месяца.;Nomen, n.;b2 business
der Nutzen;benefit / utility;польза / выгода;Der praktische Nutzen liegt auf der Hand.;The practical benefit is obvious.;Практическая польза очевидна.;Nomen, m.;b2 formal
das Risiko, die Risiken;risk;риск;Dieses Risiko sollten wir nicht eingehen.;We should not take this risk.;Нам не стоит идти на этот риск.;Nomen, n.;b2 business
die Chance, die Chancen;chance / opportunity;шанс / возможность;Das ist eine einmalige Chance für uns.;This is a unique opportunity for us.;Это уникальный шанс для нас.;Nomen, f.;b2 daily
die Ausnahme, die Ausnahmen;exception;исключение;Heute machen wir eine kleine Ausnahme.;Today we are making a small exception.;Сегодня мы сделаем небольшое исключение.;Nomen, f.;b2 formal
die Mehrheit, die Mehrheiten;majority;большинство;Die Mehrheit hat für den Plan gestimmt.;The majority voted for the plan.;Большинство проголосовало за план.;Nomen, f.;b2 society
die Minderheit, die Minderheiten;minority;меньшинство;Nur eine kleine Minderheit war dagegen.;Only a small minority was against it.;Лишь небольшое меньшинство было против.;Nomen, f.;b2 society
nachhaltig;sustainable;устойчивый / долговременный;Wir suchen nach einer nachhaltigen Lösung.;We are looking for a sustainable solution.;Мы ищем устойчивое решение.;Adjektiv;b2 society
angemessen;appropriate / reasonable;соразмерный / адекватный;Das Gehalt ist für diese Stelle angemessen.;The salary is appropriate for this position.;Зарплата соразмерна этой должности.;Adjektiv;b2 work
anspruchsvoll;demanding / sophisticated;требовательный / сложный;Die Aufgabe war äußerst anspruchsvoll.;The task was extremely demanding.;Задача была чрезвычайно сложной.;Adjektiv;b2 work
ausschlaggebend;decisive / crucial;решающий / определяющий;Seine Erfahrung war ausschlaggebend.;His experience was decisive.;Его опыт оказался решающим.;Adjektiv;b2 work
effizient;efficient;эффективный;Wir müssen unsere Zeit effizienter nutzen.;We need to use our time more efficiently.;Нам нужно эффективнее использовать время.;Adjektiv;b2 work
zuverlässig;reliable;надёжный;Sie ist eine absolut zuverlässige Partnerin.;She is an absolutely reliable partner.;Она абсолютно надёжный партнёр.;Adjektiv;b2 adj
wesentlich;essential / significant;существенный;Die neue Version ist wesentlich stabiler.;The new version is significantly more stable.;Новая версия существенно стабильнее.;Adjektiv;b2 adj
erheblich;considerable;значительный;Das verursacht erhebliche Kosten.;That causes considerable costs.;Это влечёт за собой значительные расходы.;Adjektiv;b2 formal
offensichtlich;obvious / apparent;очевидный;Der Vorteil ist völlig offensichtlich.;The advantage is completely obvious.;Преимущество совершенно очевидно.;Adjektiv;b2 adj
umfassend;comprehensive;всеобъемлющий;Wir bieten eine umfassende Beratung an.;We offer comprehensive consulting.;Мы предлагаем всестороннюю консультацию.;Adjektiv;b2 formal
verbindlich;binding / mandatory;обязательный;Die Vereinbarung ist für alle verbindlich.;The agreement is binding for everyone.;Соглашение обязательно для всех.;Adjektiv;b2 formal
flexibel;flexible;гибкий;Unsere Arbeitszeiten sind sehr flexibel.;Our working hours are very flexible.;Наш рабочий график очень гибкий.;Adjektiv;b2 work
komplex;complex;сложный / комплексный;Dieses System ist ziemlich komplex.;This system is quite complex.;Эта система довольно сложная.;Adjektiv;b2 tech
abhängen von;to depend on;зависеть от;Alles hängt von deiner Entscheidung ab.;Everything depends on your decision.;Всё зависит от твоего решения.;Verb (+ Dat.);b2 verb
verzichten auf;to do without / waive;отказываться от;Viele verzichten auf das eigene Auto.;Many do without their own car.;Многие отказываются от личного автомобиля.;Verb (+ Akk.);b2 verb
sich auseinandersetzen mit;to deal with / examine closely;детально разбираться с;Wir setzen uns mit dem Thema auseinander.;We are examining the topic closely.;Мы детально разбираемся с этой темой.;Refl. Verb (+ Dat.);b2 academic
überzeugen von;to convince of;убеждать в;Seine Argumente haben mich überzeugt.;His arguments convinced me.;Его аргументы убедили меня.;Verb (+ Dat.);b2 communication
scheitern an;to fail due to;потерпеть неудачу из-за;Das Projekt scheiterte am fehlenden Budget.;The project failed due to a lack of budget.;Проект провалился из-за нехватки бюджета.;Verb (+ Dat.);b2 formal
beibehalten;to maintain / keep;сохранять / не менять;Wir wollen diese Strategie beibehalten.;We want to maintain this strategy.;Мы хотим сохранить эту стратегию.;Verb (trennb.);b2 work
vermeiden;to avoid;избегать;Solche Fehler lassen sich leicht vermeiden.;Such mistakes can easily be avoided.;Таких ошибок можно легко избежать.;Verb;b2 verb
beantragen;to apply for / request;подавать заявление на;Ich muss ein neues Visum beantragen.;I have to apply for a new visa.;Мне нужно подать заявление на новую визу.;Verb;b2 formal
bestehen aus;to consist of;состоять из;Das Team besteht aus fünf Experten.;The team consists of five experts.;Команда состоит из пяти экспертов.;Verb (+ Dat.);b2 verb
bestehen auf;to insist on;настаивать на;Der Kunde besteht auf einer Bestätigung.;The customer insists on a confirmation.;Клиент настаивает на подтверждении.;Verb (+ Dat.);b2 verb
sich beziehen auf;to refer to;ссылаться на;Ich beziehe mich auf Ihr letztes Schreiben.;I refer to your last letter.;Я ссылаюсь на ваше последнее письмо.;Refl. Verb (+ Akk.);b2 formal
hinweisen auf;to point out;указывать на;Ich möchte auf ein wichtiges Detail hinweisen.;I would like to point out an important detail.;Я хотел бы указать на важную деталь.;Verb (trennb., + Akk.);b2 formal
rechnen mit;to expect / count on;рассчитывать на;Wir rechnen mit einer schnellen Antwort.;We expect a quick response.;Мы рассчитываем на быстрый ответ.;Verb (+ Dat.);b2 verb
zweifeln an;to doubt;сомневаться в;Niemand zweifelt an seiner Kompetenz.;Nobody doubts his competence.;Никто не сомневается в его компетентности.;Verb (+ Dat.);b2 verb
beitragen zu;to contribute to;способствовать / вносить вклад;Das trägt wesentlich zum Erfolg bei.;That contributes significantly to success.;Это существенно способствует успеху.;Verb (trennb., + Dat.);b2 formal
berücksichtigen;to take into account;учитывать;Alle Faktoren wurden berücksichtigt.;All factors were taken into account.;Все факторы были учтены.;Verb;b2 formal
überprüfen;to verify / check;проверять / контролировать;Wir müssen die Zahlen noch überprüfen.;We still need to verify the numbers.;Нам ещё нужно перепроверить цифры.;Verb;b2 work
beurteilen;to judge / evaluate;оценивать / судить;Das lässt sich schwer beurteilen.;That is difficult to evaluate.;Это трудно оценить.;Verb;b2 academic
umsetzen;to implement;реализовывать / внедрять;Wir setzen den Plan Schritt für Schritt um.;We are implementing the plan step by step.;Мы реализуем план шаг за шагом.;Verb (trennb.);b2 work
ermöglichen;to enable / make possible;делать возможным;Diese Technik ermöglicht schnelles Arbeiten.;This technology enables fast work.;Эта технология делает возможной быструю работу.;Verb;b2 formal
verursachen;to cause;вызывать / быть причиной;Der Sturm hat große Schäden verursacht.;The storm caused major damage.;Шторм причинил большой ущерб.;Verb;b2 formal
beseitigen;to eliminate / remove;устранять;Das Problem wurde vollständig beseitigt.;The problem was completely eliminated.;Проблема была полностью устранена.;Verb;b2 tech
zur Verfügung stehen;to be available;быть в распоряжении;Alle Daten stehen online zur Verfügung.;All data is available online.;Все данные доступны онлайн.;NVV;b2 nvv
in Betracht ziehen;to consider / take into account;принимать во внимание;Wir sollten auch diese Option in Betracht ziehen.;We should also consider this option.;Нам также стоит рассмотреть этот вариант.;NVV;b2 nvv
zur Folge haben;to result in;влечь за собой;Die Verspätung hatte hohe Kosten zur Folge.;The delay resulted in high costs.;Задержка повлекла за собой высокие расходы.;NVV;b2 nvv
Einfluss nehmen auf;to influence;оказывать влияние на;Medien nehmen Einfluss auf die Meinung.;Media influence public opinion.;СМИ оказывают влияние на мнение.;NVV (+ Akk.);b2 nvv
in Kauf nehmen;to accept / put up with;мириться с;Man muss gewisse Risiken in Kauf nehmen.;One has to accept certain risks.;Приходится мириться с определёнными рисками.;NVV;b2 nvv
zur Sprache bringen;to bring up (a topic);поднимать вопрос;Er brachte das Problem im Meeting zur Sprache.;He brought up the problem in the meeting.;Он поднял эту проблему на собрании.;NVV;b2 nvv
infrage kommen;to be eligible / come into question;подходить / рассматриваться;Diese Lösung kommt für uns nicht infrage.;This solution is out of the question for us.;Это решение нам не подходит.;NVV;b2 nvv
einen Entschluss fassen;to make a firm decision;принять твёрдое решение;Sie fasste endlich einen mutigen Entschluss.;She finally made a bold decision.;Она наконец приняла смелое решение.;NVV;b2 nvv
allerdings;however / though;однако / правда;Die Idee ist gut, allerdings sehr teuer.;The idea is good, though very expensive.;Идея хорошая, однако очень дорогая.;Adverb / Konnektor;b2 connector
mittlerweile;meanwhile / by now;тем временем / уже;Mittlerweile hat sich die Lage beruhigt.;Meanwhile, the situation has calmed down.;Тем временем ситуация успокоилась.;Adverb;b2 time
hingegen;on the other hand / in contrast;напротив / в то время как;Im Norden regnet es, im Süden hingegen scheint die Sonne.;In the north it rains, in the south by contrast the sun shines.;На севере идёт дождь, на юге же светит солнце.;Konnektor;b2 connector
infolgedessen;consequently / as a result;вследствие этого;Der Strom fiel aus, infolgedessen stoppte die Arbeit.;The power went out, consequently work stopped.;Отключилось электричество, вследствие этого работа остановилась.;Konnektor;b2 connector
dennoch;nevertheless / yet;тем не менее;Die Aufgabe war schwer, dennoch gelang sie.;The task was hard, yet it succeeded.;Задача была трудной, тем не менее она удалась.;Konnektor;b2 connector
indem;by (doing something);путём того что;Man spart Energie, indem man das Licht ausmacht.;One saves energy by turning off the light.;Экономят энергию, выключая свет.;Subjunktion;b2 grammar
sodass;so that / with the result that;так что;Es war laut, sodass ich nichts verstand.;It was loud, so that I understood nothing.;Было громко, так что я ничего не понял.;Subjunktion;b2 grammar
je ... desto;the ... the ...;чем ..., тем ...;Je mehr man übt, desto besser wird man.;The more you practice, the better you get.;Чем больше практикуешься, тем лучше становишься.;Doppelkonnektor;b2 grammar
zwar ..., aber;admittedly ..., but;правда ..., но;Es ist zwar teuer, aber sehr langlebig.;It is admittedly expensive, but very durable.;Это, правда, дорого, но очень долговечно.;Doppelkonnektor;b2 grammar
weder ... noch;neither ... nor;ни ..., ни;Er hatte weder Zeit noch Lust dazu.;He had neither time nor desire for it.;У него не было ни времени, ни желания для этого.;Doppelkonnektor;b2 grammar
nicht nur ..., sondern auch;not only ..., but also;не только ..., но и;Das Buch ist nicht nur klug, sondern auch witzig.;The book is not only smart, but also funny.;Книга не только умная, но и смешная.;Doppelkonnektor;b2 grammar
aufgrund;due to / because of;из-за / по причине;Aufgrund des Nebels fiel der Flug aus.;Due to the fog, the flight was canceled.;Из-за тумана рейс был отменён.;Präposition (+ Gen.);b2 grammar
trotz;despite;несмотря на;Trotz des Regens gingen wir wandern.;Despite the rain, we went hiking.;Несмотря на дождь, мы пошли в поход.;Präposition (+ Gen.);b2 grammar
anhand;by means of / based on;на основе / с помощью;Anhand der Daten erkennt man den Trend.;Based on the data, one sees the trend.;На основе данных виден тренд.;Präposition (+ Gen.);b2 academic
hinsichtlich;regarding / with respect to;относительно / в отношении;Hinsichtlich der Kosten gibt es Klarheit.;Regarding the costs, there is clarity.;В отношении расходов есть ясность.;Präposition (+ Gen.);b2 formal
stattdessen;instead;вместо этого;Wir gingen nicht aus, sondern blieben stattdessen daheim.;We did not go out, but stayed home instead.;Мы не пошли гулять, а вместо этого остались дома.;Adverb;b2 connector
die Akzeptanz;acceptance;принятие / признание;Die Akzeptanz dieser Methode wächst stetig.;The acceptance of this method is growing steadily.;Признание этого метода постоянно растёт.;Nomen, f.;b2 society
die Alternative, die Alternativen;alternative;альтернатива;Gibt es eine günstige Alternative dazu?;Is there an affordable alternative to this?;Есть ли этому доступная альтернатива?;Nomen, f.;b2 work
die Analyse, die Analysen;analysis;анализ;Die Analyse zeigt klare Schwachstellen.;The analysis shows clear weak points.;Анализ показывает явные слабые места.;Nomen, f.;b2 academic
die Anwendung, die Anwendungen;application / use;применение / приложение;Diese Software findet breite Anwendung.;This software finds wide application.;Это ПО находит широкое применение.;Nomen, f.;b2 tech
der Aufwand;effort / expense;затраты / усилия;Der zeitliche Aufwand war geringer als gedacht.;The time effort was lower than expected.;Затраты времени оказались меньше ожидаемых.;Nomen, m.;b2 work
die Aufklärung;clarification / education;разъяснение / просвещение;Eine offene Aufklärung schafft Vertrauen.;Open clarification creates trust.;Открытое разъяснение создаёт доверие.;Nomen, f.;b2 society
die Auswertung, die Auswertungen;evaluation / analysis;обработка / оценка (данных);Die Auswertung der Umfrage dauert zwei Tage.;The evaluation of the survey takes two days.;Обработка результатов опроса займёт два дня.;Nomen, f.;b2 academic
der Bedarf;need / demand;потребность;Bei Bedarf passen wir den Zeitplan an.;If needed, we will adjust the schedule.;При необходимости мы скорректируем график.;Nomen, m.;b2 business
die Beeinträchtigung, die Beeinträchtigungen;impairment / restriction;нарушение / ограничение;Es gibt keine Beeinträchtigung des Betriebs.;There is no impairment to operations.;Ограничений в работе нет.;Nomen, f.;b2 formal
der Beleg, die Belege;proof / receipt / document;подтверждение / документ;Bitte reichen Sie alle Belege digital ein.;Please submit all receipts digitally.;Пожалуйста, подайте все документы в цифровом виде.;Nomen, m.;b2 formal
die Belastung, die Belastungen;burden / stress;нагрузка / бремя;Die finanzielle Belastung war zu hoch.;The financial burden was too high.;Финансовая нагрузка была слишком высокой.;Nomen, f.;b2 economy
die Beratung, die Beratungen;consultation / advice;консультация;Nach der Beratung fiel die Entscheidung leicht.;After the consultation, the decision was easy.;После консультации решение далось легко.;Nomen, f.;b2 work
der Bereich, die Bereiche;area / field / sector;область / сфера;In diesem Bereich gibt es viel Potenzial.;There is a lot of potential in this area.;В этой сфере большой потенциал.;Nomen, m.;b2 work
die Berichterstattung;reporting / coverage;освещение в СМИ / отчётность;Die Berichterstattung war sehr ausgewogen.;The media coverage was very balanced.;Освещение в СМИ было очень сбалансированным.;Nomen, f.;b2 media
die Beschwerde, die Beschwerden;complaint / ailment;жалоба / недуг;Wir bearbeiten jede Beschwerde innerhalb von 24 Stunden.;We process every complaint within 24 hours.;Мы рассматриваем каждую жалобу в течение 24 часов.;Nomen, f.;b2 formal
die Beteiligung, die Beteiligungen;participation / share;участие / доля;Die hohe Beteiligung hat uns gefreut.;The high participation pleased us.;Высокое участие нас порадовало.;Nomen, f.;b2 society
die Bewältigung;coping / mastering;преодоление / решение;Die Bewältigung der Krise erfordert Mut.;Coping with the crisis requires courage.;Преодоление кризиса требует мужества.;Nomen, f.;b2 formal
der Bezug, die Bezüge;reference / relation;связь / ссылка;In Bezug auf Ihre Frage melde ich mich morgen.;Regarding your question, I will get back tomorrow.;По поводу вашего вопроса я свяжусь завтра.;Nomen, m.;b2 formal
die Bilanz, die Bilanzen;balance sheet / outcome;баланс / итог;Unterm Strich ziehen wir eine positive Bilanz.;All in all, we draw a positive balance.;В целом мы подводим положительный итог.;Nomen, f.;b2 business
die Branche, die Branchen;industry / sector;отрасль;In unserer Branche ändert sich alles rasant.;In our industry, everything changes rapidly.;В нашей отрасли всё меняется стремительно.;Nomen, f.;b2 business
die Darstellung, die Darstellungen;presentation / depiction;изложение / представление;Die grafische Darstellung ist sehr verständlich.;The graphical presentation is very understandable.;Графическое представление очень понятно.;Nomen, f.;b2 academic
die Debatte, die Debatten;debate;дебаты / прения;Die Debatte dauerte bis spät in die Nacht.;The debate lasted late into the night.;Дебаты длились до поздней ночи.;Nomen, f.;b2 society
die Diagnose, die Diagnosen;diagnosis;диагноз;Eine frühe Diagnose verbessert die Heilungschancen.;An early diagnosis improves recovery chances.;Ранняя диагностика повышает шансы на выздоровление.;Nomen, f.;b2 health
die Differenz, die Differenzen;difference / discrepancy;разница / разногласие;Die kleine Differenz lässt sich leicht erklären.;The small difference can be easily explained.;Небольшую разницу можно легко объяснить.;Nomen, f.;b2 business
die Durchführung;implementation / execution;проведение / выполнение;Für die Durchführung ist das Team verantwortlich.;The team is responsible for the execution.;Команда отвечает за проведение мероприятия.;Nomen, f.;b2 formal
die Ebene, die Ebenen;level / plane;уровень;Auf politischer Ebene wird noch verhandelt.;At the political level, negotiations are still ongoing.;На политическом уровне ещё идут переговоры.;Nomen, f.;b2 formal
die Eigenschaft, die Eigenschaften;property / quality / trait;свойство / качество;Dieses Material hat besondere Eigenschaften.;This material has special properties.;Этот материал обладает особыми свойствами.;Nomen, f.;b2 tech
der Einsatz;use / deployment / commitment;применение / самоотдача;Ohne Ihren Einsatz wäre das nicht gelungen.;Without your commitment, this would not have succeeded.;Без вашей самоотдачи это бы не удалось.;Nomen, m.;b2 work
die Einstellung, die Einstellungen;attitude / hiring / setting;отношение / наём / настройка;Seine positive Einstellung motiviert das Team.;His positive attitude motivates the team.;Его позитивный настрой мотивирует команду.;Nomen, f.;b2 work
die Empfehlung, die Empfehlungen;recommendation;рекомендация;Auf Empfehlung eines Kollegen kam ich hierher.;On a colleague’s recommendation I came here.;Я пришёл сюда по рекомендации коллеги.;Nomen, f.;b2 work
der Entwurf, die Entwürfe;draft / design;черновик / проект;Bitte prüfen Sie den ersten Entwurf bis Montag.;Please review the first draft by Monday.;Пожалуйста, проверьте первый черновик до понедельника.;Nomen, m.;b2 work
die Erfassung;recording / capture;учёт / фиксация;Die digitale Erfassung spart viel Papier.;Digital recording saves a lot of paper.;Цифровой учёт экономит много бумаги.;Nomen, f.;b2 tech
die Erhöhung, die Erhöhungen;increase / raise;повышение;Eine Erhöhung des Budgets wurde genehmigt.;An increase in the budget was approved.;Увеличение бюджета было одобрено.;Nomen, f.;b2 economy
die Erkenntnis, die Erkenntnisse;finding / insight;вывод / знание;Neue Erkenntnisse sprechen für diese Methode.;New findings speak in favor of this method.;Новые выводы говорят в пользу этого метода.;Nomen, f.;b2 academic
die Erleichterung;relief / simplification;облегчение;Die neue Regelung bringt spürbare Erleichterung.;The new regulation brings noticeable relief.;Новое правило приносит ощутимое облегчение.;Nomen, f.;b2 formal
die Erwartung, die Erwartungen;expectation;ожидание;Das Ergebnis übertraf alle unsere Erwartungen.;The result exceeded all our expectations.;Результат превзошёл все наши ожидания.;Nomen, f.;b2 daily
die Fachkraft, die Fachkräfte;skilled worker / specialist;квалифицированный специалист;Viele Betriebe suchen dringend Fachkräfte.;Many companies urgently look for specialists.;Многие предприятия срочно ищут специалистов.;Nomen, f.;b2 work
die Fähigkeit, die Fähigkeiten;ability / skill;способность / навык;Soziale Fähigkeiten sind heute sehr gefragt.;Social skills are in high demand today.;Социальные навыки сегодня очень востребованы.;Nomen, f.;b2 work
der Faktor, die Faktoren;factor;фактор;Mehrere Faktoren spielen hierbei zusammen.;Several factors interact here.;Здесь взаимодействуют несколько факторов.;Nomen, m.;b2 academic
die Feststellung, die Feststellungen;finding / statement;утверждение / констатация;Diese Feststellung deckt sich mit den Daten.;This finding aligns with the data.;Это утверждение совпадает с данными.;Nomen, f.;b2 formal
die Förderung;support / promotion / funding;поддержка / субсидирование;Das Projekt erhält staatliche Förderung.;The project receives state funding.;Проект получает государственную поддержку.;Nomen, f.;b2 economy
die Forschung;research;исследование / наука;Die Forschung sucht nach neuen Batterien.;Research is looking for new batteries.;Наука ищет новые типы аккумуляторов.;Nomen, f.;b2 academic
die Fragestellung, die Fragestellungen;research question / issue;постановка вопроса;Die zentrale Fragestellung ist klar formuliert.;The central question is clearly formulated.;Главный вопрос чётко сформулирован.;Nomen, f.;b2 academic
die Funktion, die Funktionen;function / role;функция;Diese Funktion lässt sich leicht aktivieren.;This function can be easily activated.;Эту функцию можно легко активировать.;Nomen, f.;b2 tech
die Garantie, die Garantien;warranty / guarantee;гарантия;Auf das Gerät gibt es zwei Jahre Garantie.;There is a two-year warranty on the device.;На прибор действует двухлетняя гарантия.;Nomen, f.;b2 shopping
die Gefahr, die Gefahren;danger / risk;опасность;Man darf diese Gefahr nicht unterschätzen.;One must not underestimate this danger.;Эту опасность нельзя недооценивать.;Nomen, f.;b2 society
der Gegensatz, die Gegensätze;contrast / opposite;противоположность;Im Gegensatz zu gestern ist es heute mild.;In contrast to yesterday, today is mild.;В отличие от вчерашнего дня сегодня тепло.;Nomen, m.;b2 communication
die Gewährleistung;guarantee / warranty;гарантия / обеспечение;Die Gewährleistung gilt für alle Bauteile.;The warranty applies to all components.;Гарантия распространяется на все детали.;Nomen, f.;b2 formal
die Grundlage, die Grundlagen;basis / foundation;основа / фундамент;Vertrauen ist die Grundlage jeder Partnerschaft.;Trust is the foundation of every partnership.;Доверие — основа любого партнёрства.;Nomen, f.;b2 formal
die Haltung, die Haltungen;attitude / posture;позиция / отношение;Seine ruhige Haltung beeindruckte alle.;His calm attitude impressed everyone.;Его спокойная позиция впечатлила всех.;Nomen, f.;b2 communication
die Integration;integration;интеграция;Die Integration neuer Mitarbeiter lief reibungslos.;The integration of new staff went smoothly.;Адаптация новых сотрудников прошла гладко.;Nomen, f.;b2 work
die Investition, die Investitionen;investment;инвестиция;Das ist eine lohnende Investition in die Zukunft.;That is a worthwhile investment in the future.;Это выгодная инвестиция в будущее.;Nomen, f.;b2 economy
die Kapazität, die Kapazitäten;capacity;мощность / вместимость;Unsere Server arbeiten an der Kapazitätsgrenze.;Our servers are working at capacity limit.;Наши серверы работают на пределе мощности.;Nomen, f.;b2 tech
die Konsequenz, die Konsequenzen;consequence;последствие / вывод;Jede Entscheidung hat bestimmte Konsequenzen.;Every decision has certain consequences.;У каждого решения есть определённые последствия.;Nomen, f.;b2 formal
das Kriterium, die Kriterien;criterion;критерий;Welches Kriterium ist für Sie entscheidend?;Which criterion is decisive for you?;Какой критерий является для вас решающим?;Nomen, n.;b2 academic
die Leistung, die Leistungen;performance / achievement;достижение / услуга / мощность;Für diese Leistung verdient er Anerkennung.;For this achievement he deserves recognition.;За это достижение он заслуживает признания.;Nomen, f.;b2 work
der Mangel, die Mängel;lack / defect;недостаток / дефект;Aus Mangel an Zeit verschieben wir das.;For lack of time we postpone this.;Из-за нехватки времени мы перенесём это.;Nomen, m.;b2 formal
die Methode, die Methoden;method;метод;Diese Methode hat sich in der Praxis bewährt.;This method has proven itself in practice.;Этот метод хорошо зарекомендовал себя на практике.;Nomen, f.;b2 academic
das Niveau, die Niveaus;level / standard;уровень;Das sprachliche Niveau des Artikels ist hoch.;The linguistic level of the article is high.;Языковой уровень статьи высокий.;Nomen, n.;b2 study
die Orientierung;orientation / guidance;ориентация;Die Karte hilft bei der ersten Orientierung.;The map helps with initial orientation.;Карта помогает сориентироваться вначале.;Nomen, f.;b2 daily
beachten;to observe / pay attention to;соблюдать / учитывать;Bitte beachten Sie die Hinweise auf dem Schild.;Please observe the instructions on the sign.;Пожалуйста, обратите внимание на указания на знаке.;Verb;b2 formal
beeindrucken;to impress;впечатлять;Seine Präsentation hat alle beeindruckt.;His presentation impressed everyone.;Его презентация впечатлила всех.;Verb;b2 communication
befürchten;to fear;опасаться;Experten befürchten weitere Verzögerungen.;Experts fear further delays.;Эксперты опасаются дальнейших задержек.;Verb;b2 formal
begrenzen;to limit / restrict;ограничивать;Wir müssen die Ausgaben deutlich begrenzen.;We must clearly limit expenses.;Мы должны заметно ограничить расходы.;Verb;b2 economy
behaupten;to claim / assert;утверждать;Er behauptet, alles allein gelöst zu haben.;He claims to have solved everything alone.;Он утверждает, что решил всё сам.;Verb;b2 communication
belegen;to prove / occupy / take (a course);подтверждать / доказывать;Diese Zahlen belegen den positiven Trend.;These figures prove the positive trend.;Эти цифры подтверждают позитивный тренд.;Verb;b2 academic
benötigen;to require / need;требоваться / нуждаться;Für den Antrag benötigen Sie zwei Fotos.;For the application you need two photos.;Для заявления вам понадобятся две фотографии.;Verb;b2 formal
berechnen;to calculate / charge;вычислять / рассчитывать;Das System berechnet die Route automatisch.;The system calculates the route automatically.;Система рассчитывает маршрут автоматически.;Verb;b2 tech
beschleunigen;to accelerate;ускорять;Ein neues Tool kann den Prozess beschleunigen.;A new tool can accelerate the process.;Новый инструмент может ускорить процесс.;Verb;b2 tech
beschränken auf;to restrict to;ограничивать чем-то;Wir beschränken die Liste auf zehn Punkte.;We restrict the list to ten points.;Мы ограничиваем список десятью пунктами.;Verb (+ Akk.);b2 formal
bestätigen;to confirm;подтверждать;Bitte bestätigen Sie den Termin per E-Mail.;Please confirm the appointment by email.;Пожалуйста, подтвердите встречу по электронной почте.;Verb;b2 work
betonen;to emphasize / stress;подчёркивать / акцентировать;Sie betonte die Bedeutung der Teamarbeit.;She emphasized the importance of teamwork.;Она подчеркнула важность командной работы.;Verb;b2 communication
bewerten;to evaluate / rate;оценивать;Wie bewerten Sie die aktuelle Lage?;How do you evaluate the current situation?;Как вы оцениваете текущую ситуацию?;Verb;b2 work
darstellen;to represent / depict;представлять собой / изображать;Das stellt kein großes Problem dar.;That does not represent a big problem.;Это не представляет большой проблемы.;Verb (trennb.);b2 formal
definieren;to define;определять;Zuerst sollten wir die Ziele klar definieren.;First we should clearly define the goals.;Сначала нам следует чётко определить цели.;Verb;b2 academic
durchführen;to carry out / conduct;проводить / осуществлять;Nächste Woche führen wir einen Test durch.;Next week we will conduct a test.;На следующей неделе мы проведём тест.;Verb (trennb.);b2 work
einschätzen;to assess / estimate;оценивать (прикидывать);Es ist schwer, die Dauer genau einzuschätzen.;It is hard to estimate the duration accurately.;Трудно точно оценить продолжительность.;Verb (trennb.);b2 work
entlasten;to relieve / unburden;разгружать / облегчать;Die neue Software entlastet den Support.;The new software relieves support staff.;Новое ПО разгружает службу поддержки.;Verb;b2 work
entstehen;to arise / emerge;возникать / появляться;Durch Missverständnisse entstehen oft Konflikte.;Conflicts often arise from misunderstandings.;Из-за недопонимания часто возникают конфликты.;Verb;b2 formal
erfordern;to require / demand;требовать;Dieses Projekt erfordert viel Konzentration.;This project requires a lot of concentration.;Этот проект требует большой концентрации.;Verb;b2 formal
ergänzen;to supplement / add;дополнять;Ich möchte noch einen Punkt ergänzen.;I would like to add one more point.;Я хотел бы дополнить ещё одним пунктом.;Verb;b2 communication
erkennen;to recognize / realize;распознавать / осознавать;Man erkennt sofort die Handschrift der Autorin.;One immediately recognizes the author’s style.;Сразу узнаётся почерк автора.;Verb;b2 academic
erläutern;to explain / elucidate;разъяснять / пояснять;Könnten Sie diesen Punkt näher erläutern?;Could you explain this point in more detail?;Не могли бы вы подробнее пояснить этот пункт?;Verb;b2 formal
ermitteln;to determine / investigate;выяснять / определять;Die genaue Ursache wird noch ermittelt.;The exact cause is still being investigated.;Точная причина ещё выясняется.;Verb;b2 formal
ersetzen;to replace;заменять;Technik kann den Menschen nicht ganz ersetzen.;Technology cannot completely replace humans.;Техника не может полностью заменить человека.;Verb;b2 tech
erweitern;to expand / extend;расширять;Wir wollen unser Angebot im Herbst erweitern.;We want to expand our offer in autumn.;Осенью мы хотим расширить наше предложение.;Verb;b2 business
festlegen;to determine / set / fix;устанавливать / фиксировать;Wir müssen zuerst die Fristen festlegen.;We must first set the deadlines.;Сначала нам нужно установить сроки.;Verb (trennb.);b2 work
fördern;to promote / support;способствовать / поддерживать;Lesen fördert das Sprachgefühl enorm.;Reading promotes language intuition enormously.;Чтение колоссально развивает чувство языка.;Verb;b2 study
gewinnen an;to gain (importance/etc.);приобретать / набирать;Das Thema gewinnt zunehmend an Bedeutung.;The topic is increasingly gaining importance.;Эта тема приобретает всё большее значение.;Verb (+ Dat.);b2 formal
integrieren;to integrate;интегрировать;Wir integrieren das neue Modul bis Freitag.;We will integrate the new module by Friday.;Мы интегрируем новый модуль до пятницы.;Verb;b2 tech', now())
on conflict (level) do update set
  title = excluded.title,
  word_count = excluded.word_count,
  csv_content = excluded.csv_content,
  updated_at = now();

insert into public.catalog_corpora (level, title, word_count, csv_content, updated_at)
values ('C1', 'C1 Advanced', 140, 'de;en;ru;exDe;exEn;exRu;ctx;tags
die Erkenntnis, die Erkenntnisse;insight / realization;познание / осознание;Diese Erkenntnis veränderte unsere gesamte Strategie.;This insight changed our entire strategy.;Это осознание изменило всю нашу стратегию.;Nomen, f.;c1 academic
die Kontroverse, die Kontroversen;controversy;полемика / спор;Das Thema löste eine heftige Kontroverse aus.;The topic triggered a heated controversy.;Эта тема вызвала острую полемику.;Nomen, f.;c1 society
die Transparenz;transparency;прозрачность;Mehr Transparenz stärkt das Vertrauen der Bürger.;More transparency strengthens citizens’ trust.;Большая прозрачность укрепляет доверие граждан.;Nomen, f.;c1 formal
die Nachhaltigkeit;sustainability;устойчивое развитие;Nachhaltigkeit steht im Mittelpunkt der Planung.;Sustainability is at the center of planning.;Устойчивое развитие находится в центре планирования.;Nomen, f.;c1 society
die Skepsis;skepticism;скептицизм;Der Plan wurde mit großer Skepsis aufgenommen.;The plan was received with great skepticism.;План был встречен с большим скепсисом.;Nomen, f.;c1 communication
die Befürwortung;endorsement / advocacy;одобрение / поддержка;Sein Vorschlag fand breite Befürwortung.;His proposal found broad endorsement.;Его предложение получило широкое одобрение.;Nomen, f.;c1 formal
die Gegebenheit, die Gegebenheiten;circumstance / given fact;данность / обстоятельство;Man muss sich den örtlichen Gegebenheiten anpassen.;One must adapt to local circumstances.;Нужно приспосабливаться к местным условиям.;Nomen, f.;c1 formal
die Tragweite;scope / far-reaching impact;значимость / масштаб последствий;Die volle Tragweite der Entscheidung ist enorm.;The full scope of the decision is enormous.;Весь масштаб последствий этого решения огромен.;Nomen, f.;c1 formal
die Diskrepanz, die Diskrepanzen;discrepancy;расхождение / несоответствие;Zwischen Theorie und Praxis besteht eine Diskrepanz.;There is a discrepancy between theory and practice.;Между теорией и практикой есть расхождение.;Nomen, f.;c1 academic
die Plausibilität;plausibility;правдоподобность;Die Plausibilität dieser These ist umstritten.;The plausibility of this thesis is disputed.;Правдоподобность этого тезиса спорна.;Nomen, f.;c1 academic
das Ausmaß;extent / scale;масштаб / степень;Das Ausmaß des Schadens überraschte alle.;The extent of the damage surprised everyone.;Масштаб ущерба удивил всех.;Nomen, n.;c1 formal
der Konsens;consensus;консенсус / согласие;Nach langen Gesprächen wurde ein Konsens erzielt.;After long talks, a consensus was reached.;После долгих переговоров был достигнут консенсус.;Nomen, m.;c1 society
der Widerspruch, die Widersprüche;contradiction / objection;противоречие / возражение;Das steht im Widerspruch zu früheren Aussagen.;That contradicts earlier statements.;Это противоречит прежним заявлениям.;Nomen, m.;c1 academic
die Priorisierung;prioritization;приоритизация;Eine klare Priorisierung verhindert Überlastung.;Clear prioritization prevents overload.;Чёткая приоритизация предотвращает перегрузку.;Nomen, f.;c1 work
die Effizienzsteigerung;efficiency increase;повышение эффективности;Automatisierung führt oft zur Effizienzsteigerung.;Automation often leads to an increase in efficiency.;Автоматизация часто ведёт к росту эффективности.;Nomen, f.;c1 business
die Zumutung, die Zumutungen;imposition / unreasonable demand;непомерное требование / наглость;Diese Arbeitsbedingungen sind eine Zumutung.;These working conditions are an imposition.;Такие условия труда — просто издевательство.;Nomen, f.;c1 communication
das Phänomen, die Phänomene;phenomenon;феномен / явление;Dieses gesellschaftliche Phänomen wird intensiv erforscht.;This social phenomenon is being intensively researched.;Это общественное явление интенсивно изучается.;Nomen, n.;c1 academic
die Hypothese, die Hypothesen;hypothesis;гипотеза;Die Daten bestätigen unsere ursprüngliche Hypothese.;The data confirm our original hypothesis.;Данные подтверждают нашу исходную гипотезу.;Nomen, f.;c1 academic
die Relevanz;relevance;актуальность / значимость;Dieses Thema hat heute hohe gesellschaftliche Relevanz.;This topic has high social relevance today.;Эта тема сегодня имеет высокую общественную значимость.;Nomen, f.;c1 academic
die Resilienz;resilience;устойчивость / стрессоустойчивость;Resilienz hilft, Krisen besser zu bewältigen.;Resilience helps to cope better with crises.;Стрессоустойчивость помогает лучше справляться с кризисами.;Nomen, f.;c1 psychology
abwägen;to weigh up (pros/cons);взвешивать;Man muss alle Risiken sorgfältig abwägen.;One must carefully weigh all risks.;Нужно тщательно взвесить все риски.;Verb;c1 verb
beeinflussen;to influence;влиять на;Solche Faktoren können das Ergebnis stark beeinflussen.;Such factors can strongly influence the result.;Такие факторы могут сильно повлиять на результат.;Verb;c1 verb
gewährleisten;to guarantee / ensure;гарантировать / обеспечивать;Datenschutz muss jederzeit gewährleistet sein.;Data protection must be guaranteed at all times.;Защита данных должна быть гарантирована всегда.;Verb;c1 formal
hervorheben;to emphasize / highlight;подчёркивать / выделять;Der Bericht hebt die Erfolge des Teams hervor.;The report highlights the team’s successes.;Отчёт подчёркивает успехи команды.;Verb (trennb.);c1 academic
implizieren;to imply;подразумевать;Diese Aussage impliziert weitere Verpflichtungen.;This statement implies further obligations.;Это заявление подразумевает дальнейшие обязательства.;Verb;c1 academic
widerlegen;to refute / disprove;опровергать;Neue Beweise konnten die Theorie widerlegen.;New evidence was able to refute the theory.;Новые доказательства смогли опровергнуть теорию.;Verb;c1 academic
untermauern;to substantiate / back up;подкреплять (аргументами);Er konnte seine These mit Fakten untermauern.;He was able to back up his thesis with facts.;Он смог подкрепить свой тезис фактами.;Verb;c1 academic
relativieren;to put into perspective / relativize;смягчать / ставить под сомнение;Diese Zahl relativiert den ersten Eindruck.;This figure puts the first impression into perspective.;Эта цифра смягчает первое впечатление.;Verb;c1 academic
veranschaulichen;to illustrate / visualize;наглядно показывать;Die Grafik veranschaulicht die Entwicklung.;The chart illustrates the development.;График наглядно показывает развитие.;Verb;c1 academic
bewältigen;to cope with / overcome;преодолевать / справляться;Gemeinsam werden wir auch diese Krise bewältigen.;Together we will overcome this crisis too.;Вместе мы преодолеем и этот кризис.;Verb;c1 verb
vorantreiben;to drive forward;продвигать вперёд;Wir müssen die Innovationen konsequent vorantreiben.;We must consistently drive innovations forward.;Мы должны последовательно продвигать инновации.;Verb (trennb.);c1 work
vernachlässigen;to neglect;пренебрегать;Man darf die Wartung nicht vernachlässigen.;One must not neglect maintenance.;Нельзя пренебрегать техническим обслуживанием.;Verb;c1 verb
einschränken;to restrict / limit;ограничивать;Die neuen Regeln schränken die Freiheit kaum ein.;The new rules barely restrict freedom.;Новые правила почти не ограничивают свободу.;Verb (trennb.);c1 formal
voraussetzen;to presuppose / require;предполагать / требовать;Dieses Amt setzt ein hohes Maß an Diskretion voraus.;This office requires a high degree of discretion.;Эта должность предполагает высокую степень конфиденциальности.;Verb (trennb.);c1 formal
sich herausstellen;to turn out;выясняться / оказываться;Später stellte sich heraus, dass er recht hatte.;Later it turned out that he was right.;Позже выяснилось, что он был прав.;Refl. Verb (trennb.);c1 verb
sich auswirken auf;to have an effect on;сказываться на;Schlafmangel wirkt sich negativ auf die Leistung aus.;Lack of sleep negatively affects performance.;Недосып негативно сказывается на производительности.;Refl. Verb (+ Akk.);c1 verb
zurückführen auf;to attribute to / trace back to;объяснять чем-то / сводить к;Der Erfolg lässt sich auf gute Planung zurückführen.;The success can be attributed to good planning.;Успех можно объяснить хорошим планированием.;Verb (trennb., + Akk.);c1 academic
in Frage stellen;to question / cast doubt on;ставить под сомнение;Niemand stellt deine Loyalität in Frage.;Nobody is questioning your loyalty.;Никто не ставит под сомнение твою лояльность.;NVV;c1 nvv
Rechnung tragen;to take into account / accommodate;учитывать / принимать в расчёт;Das Gesetz trägt den neuen Realitäten Rechnung.;The law takes the new realities into account.;Закон учитывает новые реалии.;NVV (+ Dat.);c1 nvv
auf der Hand liegen;to be obvious;быть очевидным (лежать на поверхности);Die Lösung dieses Rätsels liegt auf der Hand.;The solution to this puzzle is obvious.;Решение этой загадки лежит на поверхности.;Redewendung;c1 idiom
unabdingbar;indispensable / essential;неотъемлемый / обязательный;Teamfähigkeit ist für diesen Job unabdingbar.;Teamwork skills are indispensable for this job.;Умение работать в команде незаменимо для этой работы.;Adjektiv;c1 adj
ambivalent;ambivalent;двойственный / неоднозначный;Meine Haltung zu diesem Thema ist ambivalent.;My attitude toward this topic is ambivalent.;Моё отношение к этой теме неоднозначно.;Adjektiv;c1 adj
plausibel;plausible;правдоподобный;Das klingt nach einer plausiblen Erklärung.;That sounds like a plausible explanation.;Это звучит как правдоподобное объяснение.;Adjektiv;c1 academic
kohärent;coherent;связный / последовательный;Der Aufsatz ist logisch und kohärent aufgebaut.;The essay is structured logically and coherently.;Эссе построено логично и связно.;Adjektiv;c1 academic
kontraproduktiv;counterproductive;контрпродуктивный;Hektik ist in Krisenzeiten meist kontraproduktiv.;Hectic rush is usually counterproductive in crises.;Суета в кризисные времена обычно контрпродуктивна.;Adjektiv;c1 work
tiefgreifend;profound / far-reaching;глубокий / коренной;Die Branche erlebt einen tiefgreifenden Wandel.;The industry is undergoing a profound transformation.;Отрасль переживает глубокую трансформацию.;Adjektiv;c1 society
unverzichtbar;essential / irreplaceable;незаменимый;Sauberes Trinkwasser ist für alle unverzichtbar.;Clean drinking water is essential for everyone.;Чистая питьевая вода незаменима для всех.;Adjektiv;c1 adj
umstritten;controversial / disputed;спорный;Das Projekt bleibt unter Experten umstritten.;The project remains controversial among experts.;Проект остаётся спорным среди экспертов.;Adjektiv;c1 society
stichhaltig;valid / sound (argument);веский / обоснованный;Sie brachte ein stichhaltiges Argument vor.;She put forward a sound argument.;Она привела веский аргумент.;Adjektiv;c1 academic
pragmatisch;pragmatic;прагматичный;Wir brauchen jetzt eine pragmatische Lösung.;We need a pragmatic solution now.;Нам сейчас нужно прагматичное решение.;Adjektiv;c1 adj
differenziert;nuanced / differentiated;взвешенный / дифференцированный;Das Thema erfordert eine differenzierte Betrachtung.;The topic requires a nuanced consideration.;Тема требует взвешенного рассмотрения.;Adjektiv;c1 academic
konsequent;consistent / resolute;последовательный;Nur konsequentes Handeln führt zum Ziel.;Only consistent action leads to the goal.;Только последовательные действия ведут к цели.;Adjektiv;c1 adj
subtil;subtle;тонкий / едва заметный;Es gibt einen subtilen Unterschied zwischen beiden.;There is a subtle difference between the two.;Между ними есть тонкое различие.;Adjektiv;c1 adj
etabliert;established;устоявшийся / признанный;Das ist ein seit Jahren etabliertes Verfahren.;This is a procedure established for years.;Это устоявшаяся за годы процедура.;Adjektiv;c1 work
ausschließlich;exclusively;исключительно;Dieser Bereich ist ausschließlich für Personal.;This area is exclusively for staff.;Эта зона предназначена исключительно для персонала.;Adverb;c1 formal
weitgehend;largely / to a large extent;в значительной степени;Die Probleme wurden weitgehend gelöst.;The problems were largely solved.;Проблемы были в значительной степени решены.;Adverb;c1 formal
allenfalls;at best / at most;в лучшем случае;Das bringt allenfalls eine kleine Ersparnis.;That brings at best a small saving.;Это принесёт в лучшем случае небольшую экономию.;Adverb;c1 connector
vielmehr;rather / on the contrary;скорее / напротив;Es ist kein Fehler, sondern vielmehr eine Chance.;It is not a mistake, but rather an opportunity.;Это не ошибка, а скорее возможность.;Konnektor;c1 connector
zumal;especially since;тем более что;Wir bleiben hier, zumal es bald regnet.;We are staying here, especially since it will rain soon.;Мы остаёмся здесь, тем более что скоро пойдёт дождь.;Subjunktion;c1 grammar
insofern;insofar as / in this respect;постольку поскольку / в этом отношении;Die Studie ist insofern wichtig, als sie Daten liefert.;The study is important insofar as it provides data.;Исследование важно в том отношении, что оно даёт данные.;Konnektor;c1 academic
ungeachtet;regardless of;несмотря на / безотносительно к;Ungeachtet der Kritik setzte er das Projekt fort.;Regardless of the criticism, he continued the project.;Несмотря на критику, он продолжил проект.;Präposition (+ Gen.);c1 formal
angesichts;in view of / given;ввиду / принимая во внимание;Angesichts der Lage müssen wir schnell handeln.;In view of the situation, we must act quickly.;Ввиду сложившейся ситуации мы должны действовать быстро.;Präposition (+ Gen.);c1 formal
mangels;for lack of;за неимением / из-за отсутствия;Mangels Beweisen wurde das Verfahren eingestellt.;For lack of evidence, the proceedings were discontinued.;За неимением доказательств дело было прекращено.;Präposition (+ Gen.);c1 formal
zwecks;for the purpose of;с целью / для;Zwecks besserer Planung treffen wir uns morgen.;For the purpose of better planning, we meet tomorrow.;С целью лучшего планирования мы встретимся завтра.;Präposition (+ Gen.);c1 formal
wenngleich;even though / albeit;хотя (и);Der Fortschritt ist sichtbar, wenngleich langsam.;The progress is visible, albeit slow.;Прогресс заметен, хотя и медленный.;Subjunktion;c1 grammar
die Ambiguität;ambiguity;двусмысленность / неоднозначность;Ambiguität auszuhalten ist eine wichtige Kompetenz.;Tolerating ambiguity is an important competence.;Способность выдерживать неопределённость — важный навык.;Nomen, f.;c1 psychology
die Analogie, die Analogien;analogy;аналогия;Diese Analogie macht das Prinzip sofort klar.;This analogy makes the principle immediately clear.;Эта аналогия сразу проясняет принцип.;Nomen, f.;c1 academic
die Argumentation, die Argumentationen;argumentation / reasoning;аргументация;Ihre Argumentation war lückenlos und überzeugend.;Her argumentation was watertight and convincing.;Её аргументация была безупречной и убедительной.;Nomen, f.;c1 academic
die Authentizität;authenticity;подлинность / аутентичность;Authentizität wird in der Kommunikation geschätzt.;Authenticity is valued in communication.;Искренность и подлинность ценятся в общении.;Nomen, f.;c1 society
die Autonomie;autonomy;автономия / самостоятельность;Mitarbeiter schätzen ein hohes Maß an Autonomie.;Employees value a high degree of autonomy.;Сотрудники ценят высокую степень самостоятельности.;Nomen, f.;c1 work
die Befugnis, die Befugnisse;authority / power;полномочие;Dafür fehlen mir leider die nötigen Befugnisse.;Unfortunately I lack the necessary authority for that.;К сожалению, у меня нет для этого нужных полномочий.;Nomen, f.;c1 formal
die Begebenheit, die Begebenheiten;incident / episode;случай / происшествие;Diese Begebenheit blieb allen im Gedächtnis.;This incident stayed in everyone’s memory.;Этот случай остался в памяти у всех.;Nomen, f.;c1 daily
die Begründung, die Begründungen;justification / rationale;обоснование;Die Begründung des Urteils umfasst zwanzig Seiten.;The rationale of the verdict spans twenty pages.;Обоснование решения занимает двадцать страниц.;Nomen, f.;c1 formal
die Betrachtung, die Betrachtungen;consideration / observation;рассмотрение / анализ;Bei genauerer Betrachtung zeigen sich Mängel.;On closer inspection, shortcomings appear.;При ближайшем рассмотрении выявляются недостатки.;Nomen, f.;c1 academic
die Bewährung;probation / proving oneself;испытание / проверка делом;Die echte Bewährung kommt erst in der Krise.;The real test comes only in a crisis.;Настоящая проверка приходит только в кризис.;Nomen, f.;c1 formal
die Brisanz;explosiveness / urgency;острота / злободневность;Das Thema hat nichts von seiner Brisanz verloren.;The topic has lost none of its urgency.;Тема не утратила своей остроты.;Nomen, f.;c1 society
die Daseinsberechtigung;right to exist / justification;право на существование;Dieses Konzept hat durchaus seine Daseinsberechtigung.;This concept certainly has its right to exist.;Эта концепция вполне имеет право на существование.;Nomen, f.;c1 academic
die Deduktion, die Deduktionen;deduction;дедукция;Durch logische Deduktion gelangt man zum Schluss.;Through logical deduction one reaches the conclusion.;Путём логической дедукции приходят к выводу.;Nomen, f.;c1 academic
die Dimension, die Dimensionen;dimension;измерение / аспект;Das Problem hat auch eine soziale Dimension.;The problem also has a social dimension.;У этой проблемы есть и социальный аспект.;Nomen, f.;c1 academic
die Divergenz, die Divergenzen;divergence;расхождение;Die Divergenz der Meinungen war unübersehbar.;The divergence of opinions was unmistakable.;Расхождение мнений было очевидным.;Nomen, f.;c1 academic
die Dynamik;dynamics;динамика;Die Dynamik des Marktes erfordert Anpassung.;Market dynamics require adaptation.;Динамика рынка требует адаптации.;Nomen, f.;c1 economy
die Eindeutigkeit;clarity / unambiguity;однозначность;Die Formulierung lässt an Eindeutigkeit nichts zu wünschen übrig.;The wording leaves nothing to be desired in clarity.;Формулировка отличается предельной однозначностью.;Nomen, f.;c1 formal
die Einsicht, die Einsichten;insight / understanding;осознание / понимание;Diese späte Einsicht kam leider zu spät.;This late insight unfortunately came too late.;Это осознание пришло, к сожалению, слишком поздно.;Nomen, f.;c1 psychology
die Empirie;empiricism;эмпирика / опыт;Empirie und Theorie müssen Hand in Hand gehen.;Empiricism and theory must go hand in hand.;Эмпирика и теория должны идти рука об руку.;Nomen, f.;c1 academic
die Entfaltung;unfolding / development;раскрытие / развитие;Die freie Entfaltung der Persönlichkeit ist wichtig.;Free development of personality is important.;Свободное развитие личности очень важно.;Nomen, f.;c1 society
die Ernüchterung;disillusionment / sobering up;отрезвление / разочарование;Nach der Euphorie folgte rasch die Ernüchterung.;After the euphoria, sobering reality quickly followed.;После эйфории быстро наступило отрезвление.;Nomen, f.;c1 emotions
die Erschließung;development / opening up;освоение / разработка;Die Erschließung neuer Märkte kostet Kapital.;Opening up new markets requires capital.;Освоение новых рынков требует капитала.;Nomen, f.;c1 economy
die Erwägung, die Erwägungen;consideration;соображение / рассмотрение;Aus wirtschaftlichen Erwägungen wurde das vertagt.;For economic considerations this was postponed.;По экономическим соображениям это отложили.;Nomen, f.;c1 formal
die Evidenz;evidence;очевидность / доказательность;Wissenschaftliche Evidenz spricht für diese Therapie.;Scientific evidence supports this therapy.;Научные данные говорят в пользу этой терапии.;Nomen, f.;c1 academic
die Exemplifizierung;exemplification;иллюстрация примером;Zur Exemplifizierung dient ein konkreter Fall.;A concrete case serves as exemplification.;Для иллюстрации служит конкретный случай.;Nomen, f.;c1 academic
die Facette, die Facetten;facet / aspect;грань / аспект;Das Werk beleuchtet alle Facetten des Themas.;The work illuminates all facets of the topic.;Работа освещает все грани этой темы.;Nomen, f.;c1 academic
die Fehleinschätzung, die Fehleinschätzungen;misjudgment;ошибочная оценка;Diese Fehleinschätzung hatte teure Folgen.;This misjudgment had costly consequences.;Эта ошибочная оценка имела дорогие последствия.;Nomen, f.;c1 work
die Fluktuation;fluctuation / turnover;текучесть / колебание;Eine hohe Fluktuation schadet der Teamkultur.;High staff turnover harms team culture.;Высокая текучесть кадров вредит культуре команды.;Nomen, f.;c1 work
die Folgerung, die Folgerungen;inference / conclusion;умозаключение / вывод;Welche Folgerungen ziehen wir aus dem Bericht?;What conclusions do we draw from the report?;Какие выводы мы делаем из отчёта?;Nomen, f.;c1 academic
die Fundierung;foundation / grounding;обоснование / база;Dem Projekt fehlt eine theoretische Fundierung.;The project lacks a theoretical foundation.;Проекту не хватает теоретической базы.;Nomen, f.;c1 academic
die Geltung;validity / standing;сила / значимость;Dieses Gesetz hat bundesweite Geltung.;This law has nationwide validity.;Этот закон действует по всей стране.;Nomen, f.;c1 formal
die Gesamtheit;totality / entirety;совокупность;Die Gesamtheit der Daten ergibt ein klares Bild.;The totality of data yields a clear picture.;Совокупность данных даёт ясную картину.;Nomen, f.;c1 academic
die Gleichgültigkeit;indifference;равнодушие;Gleichgültigkeit ist gefährlicher als Kritik.;Indifference is more dangerous than criticism.;Равнодушие опаснее критики.;Nomen, f.;c1 society
die Gratwanderung, die Gratwanderungen;tightrope walk / balancing act;балансирование на грани;Diese Reform ist eine politische Gratwanderung.;This reform is a political balancing act.;Эта реформа — политическое балансирование на грани.;Nomen, f.;c1 society
die Handhabung;handling / usage;обращение / использование;Die Handhabung des Systems ist intuitiv.;The handling of the system is intuitive.;Использование системы интуитивно понятно.;Nomen, f.;c1 tech
abstrahieren;to abstract;абстрагировать;Man muss vom Einzelfall abstrahieren können.;One must be able to abstract from the individual case.;Нужно уметь абстрагироваться от частного случая.;Verb;c1 academic
akquirieren;to acquire (clients/funds);привлекать (клиентов/средства);Wir konnten drei neue Partner akquirieren.;We were able to acquire three new partners.;Нам удалось привлечь трёх новых партнёров.;Verb;c1 business
anberaumen;to schedule / set (a date);назначать (заседание/встречу);Der Vorsitzende beraumte eine Sondersitzung an.;The chair scheduled a special session.;Председатель назначил внеочередное заседание.;Verb (trennb.);c1 formal
anfechten;to contest / challenge;оспаривать;Das Ergebnis lässt sich juristisch anfechten.;The result can be legally challenged.;Результат можно оспорить в судебном порядке.;Verb;c1 formal
anknüpfen an;to build on / tie in with;опираться на / продолжать;Ich möchte an Ihren Gedanken anknüpfen.;I would like to build on your thought.;Я хотел бы развить вашу мысль.;Verb (trennb., + Akk.);c1 communication
annähern;to approximate / bring closer;сближать;Die Positionen haben sich deutlich angenähert.;The positions have moved noticeably closer.;Позиции заметно сблизились.;Verb (trennb.);c1 communication
anregen;to stimulate / suggest;побуждать / предлагать;Dieser Vortrag regt zum Nachdenken an.;This lecture stimulates reflection.;Этот доклад побуждает к размышлению.;Verb (trennb.);c1 academic
antizipieren;to anticipate;предвосхищать;Gute Führungskräfte antizipieren Veränderungen.;Good leaders anticipate changes.;Хорошие руководители предвосхищают изменения.;Verb;c1 work
appellieren an;to appeal to;взывать к / призывать;Der Minister appelliert an die Vernunft.;The minister appeals to reason.;Министр призывает к благоразумию.;Verb (+ Akk.);c1 society
artikulieren;to articulate;чётко формулировать;Sie artikuliert ihre Bedürfnisse sehr klar.;She articulates her needs very clearly.;Она очень чётко формулирует свои потребности.;Verb;c1 communication
attestieren;to certify / attest;подтверждать / констатировать;Der Bericht attestiert der Firma hohe Stabilität.;The report attests high stability to the firm.;Отчёт подтверждает высокую стабильность компании.;Verb (+ Dat.);c1 business
aufdecken;to uncover / expose;раскрывать / выявлять;Die Prüfung deckte mehrere Fehlerquellen auf.;The audit uncovered several error sources.;Проверка выявила несколько источников ошибок.;Verb (trennb.);c1 formal
aufgreifen;to pick up / take up;подхватывать (идею/тему);Wir greifen diesen Vorschlag im nächsten Sprint auf.;We will pick up this suggestion in the next sprint.;Мы подхватим это предложение в следующем спринте.;Verb (trennb.);c1 work
ausklammern;to exclude / leave out;оставлять за скобками;Diesen Aspekt sollten wir heute ausklammern.;We should leave this aspect aside today.;Этот аспект нам стоит сегодня вынести за скобки.;Verb (trennb.);c1 academic
ausloten;to sound out / explore;прощупывать / выяснять;Wir loten derzeit alle Möglichkeiten aus.;We are currently exploring all possibilities.;Сейчас мы прощупываем все возможности.;Verb (trennb.);c1 business
authentifizieren;to authenticate;аутентифицировать;Nutzer müssen sich zweifach authentifizieren.;Users must authenticate twice.;Пользователи должны проходить двойную аутентификацию.;Verb;c1 tech
bündeln;to bundle / pool;объединять / консолидировать;Wir bündeln unsere Ressourcen für dieses Ziel.;We pool our resources for this goal.;Мы объединяем наши ресурсы ради этой цели.;Verb;c1 work
delegieren;to delegate;делегировать;Man muss lernen, Aufgaben zu delegieren.;One must learn to delegate tasks.;Нужно научиться делегировать задачи.;Verb;c1 work
demonstrieren;to demonstrate;демонстрировать;Das Experiment demonstriert den Effekt deutlich.;The experiment clearly demonstrates the effect.;Эксперимент наглядно демонстрирует этот эффект.;Verb;c1 academic
differenzieren;to differentiate;дифференцировать / различать;Hier muss man genau zwischen beiden Fällen differenzieren.;Here one must differentiate precisely between both cases.;Здесь нужно точно различать оба случая.;Verb;c1 academic
diskreditieren;to discredit;дискредитировать;Gerüchte sollen das Projekt diskreditieren.;Rumors are meant to discredit the project.;Слухи призваны дискредитировать проект.;Verb;c1 society
divergieren;to diverge;расходиться;Unsere Einschätzungen divergieren hier stark.;Our assessments diverge strongly here.;Наши оценки здесь сильно расходятся.;Verb;c1 academic
dominieren;to dominate;доминировать;Ein Thema dominierte die gesamte Konferenz.;One topic dominated the entire conference.;Одна тема доминировала на всей конференции.;Verb;c1 society
durchsetzen;to enforce / push through;добиваться / проводить в жизнь;Sie konnte ihre Idee im Vorstand durchsetzen.;She was able to push her idea through the board.;Ей удалось провести свою идею через правление.;Verb (trennb.);c1 work
einräumen;to admit / concede;признавать / уступать;Er räumte ein, einen Fehler gemacht zu haben.;He admitted having made a mistake.;Он признал, что совершил ошибку.;Verb (trennb.);c1 communication
akribisch;meticulous;скрупулёзный;Sie arbeitet stets akribisch und präzise.;She always works meticulously and precisely.;Она всегда работает скрупулёзно и точно.;Adjektiv;c1 adj
banal;banal / trivial;банальный;Die Ursache war überraschend banal.;The cause was surprisingly banal.;Причина оказалась удивительно банальной.;Adjektiv;c1 adj
eklatant;blatant / striking;вопиющий / поразительный;Das ist ein eklatanter Verstoß gegen die Regel.;That is a blatant violation of the rule.;Это вопиющее нарушение правила.;Adjektiv;c1 formal
elitär;elitist;элитарный;Der Club wirkt auf viele etwas elitär.;The club seems somewhat elitist to many.;Клуб кажется многим несколько элитарным.;Adjektiv;c1 society
empathisch;empathetic;эмпатичный;Eine empathische Führung stärkt das Team.;Empathetic leadership strengthens the team.;Эмпатичное руководство укрепляет команду.;Adjektiv;c1 psychology
essentiell;essential;существенный / ключевой;Vertrauen ist für die Zusammenarbeit essentiell.;Trust is essential for cooperation.;Доверие критически важно для сотрудничества.;Adjektiv;c1 adj
explizit;explicit;явный / эксплицитный;Das wurde im Vertrag explizit festgehalten.;That was explicitly stated in the contract.;Это было явно зафиксировано в договоре.;Adjektiv;c1 formal
facettenreich;multifaceted;многогранный;Es war ein facettenreiches Gespräch.;It was a multifaceted conversation.;Это был многогранный разговор.;Adjektiv;c1 adj
fragwürdig;questionable;сомнительный;Diese Methode erscheint mir höchst fragwürdig.;This method seems highly questionable to me.;Этот метод кажется мне весьма сомнительным.;Adjektiv;c1 adj
fundiert;well-founded / solid;обоснованный / фундаментальный;Er lieferte eine fachlich fundierte Analyse.;He delivered a technically sound analysis.;Он представил профессионально обоснованный анализ.;Adjektiv;c1 academic
heikel;delicate / tricky;щекотливый / деликатный;Das ist ein äußerst heikles Thema.;That is an extremely delicate topic.;Это чрезвычайно щекотливая тема.;Adjektiv;c1 communication
implizit;implicit;неявный / подразумеваемый;Die Kritik war in seinem Lob implizit enthalten.;The criticism was implicitly contained in his praise.;Критика неявно содержалась в его похвале.;Adjektiv;c1 academic
irreversibel;irreversible;необратимый;Manche Umweltveränderungen sind irreversibel.;Some environmental changes are irreversible.;Некоторые изменения среды необратимы.;Adjektiv;c1 nature
kausal;causal;причинно-следственный;Zwischen beiden Phänomenen besteht ein kausaler Zusammenhang.;There is a causal link between both phenomena.;Между обоими явлениями есть причинно-следственная связь.;Adjektiv;c1 academic
marginal;marginal;незначительный / маргинальный;Der Unterschied ist statistisch gesehen marginal.;Statistically speaking, the difference is marginal.;Статистически разница незначительна.;Adjektiv;c1 academic', now())
on conflict (level) do update set
  title = excluded.title,
  word_count = excluded.word_count,
  csv_content = excluded.csv_content,
  updated_at = now();
