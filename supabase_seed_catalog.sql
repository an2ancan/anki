-- Seed: Insert starter deck CSVs into public.catalog_corpora
-- Run supabase_migration_catalog.sql first, then run this script in Supabase SQL Editor.

insert into public.catalog_corpora (level, title, word_count, csv_content, updated_at)
values ('A1-A2', 'A1–A2 Essential', 270, 'de;en;ru;exDe;exEn;exRu;ctx;tags
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
fehlen;to be missing / absent;не хватать / отсутствовать;Hier fehlt noch ein Löffel.;A spoon is still missing here.;Здесь ещё не хватает ложки.;Verb;a1_a2 daily
der Bruder, die Brüder;brother;брат;Mein Bruder studiert in München.;My brother studies in Munich.;Мой брат учится в Мюнхене.;Nomen, m.;a1_a2 family
die Schwester, die Schwestern;sister;сестра;Meine Schwester wohnt in Köln.;My sister lives in Cologne.;Моя сестра живёт в Кёльне.;Nomen, f.;a1_a2 family
die Mutter, die Mütter;mother;мать;Meine Mutter kocht sehr gut.;My mother cooks very well.;Моя мама очень хорошо готовит.;Nomen, f.;a1_a2 family
der Vater, die Väter;father;отец;Mein Vater liest jeden Morgen Zeitung.;My father reads the newspaper every morning.;Мой отец читает газету каждое утро.;Nomen, m.;a1_a2 family
die Eltern (Pl.);parents;родители;Meine Eltern besuchen uns am Sonntag.;My parents are visiting us on Sunday.;Мои родители навестят нас в воскресенье.;Nomen, Pl.;a1_a2 family
der Hund, die Hunde;dog;собака;Der Hund läuft fröhlich im Park.;The dog runs happily in the park.;Собака радостно бегает в парке.;Nomen, m.;a1_a2 animals
die Katze, die Katzen;cat;кошка;Unsere Katze schläft auf dem Sofa.;Our cat sleeps on the sofa.;Наша кошка спит на диване.;Nomen, f.;a1_a2 animals
der Vogel, die Vögel;bird;птица;Ein kleiner Vogel singt vor dem Fenster.;A little bird is singing outside the window.;Маленькая птица поёт за окном.;Nomen, m.;a1_a2 animals
der Baum, die Bäume;tree;дерево;Vor dem Haus steht ein alter Baum.;In front of the house stands an old tree.;Перед домом стоит старое дерево.;Nomen, m.;a1_a2 nature
die Blume, die Blumen;flower;цветок;Ich kaufe bunte Blumen für dich.;I am buying colorful flowers for you.;Я покупаю для тебя яркие цветы.;Nomen, f.;a1_a2 nature
der See, die Seen;lake;озеро;Im Sommer schwimmen wir im See.;In summer we swim in the lake.;Летом мы плаваем в озере.;Nomen, m.;a1_a2 nature
das Meer, die Meere;sea;море;Das Meer ist heute ganz ruhig.;The sea is completely calm today.;Море сегодня совсем спокойное.;Nomen, n.;a1_a2 nature
der Schnee;snow;снег;Im Januar liegt hier viel Schnee.;In January there is a lot of snow here.;В январе здесь много снега.;Nomen, m.;a1_a2 nature
der Wind, die Winde;wind;ветер;Heute weht ein starker Wind.;Today a strong wind is blowing.;Сегодня дует сильный ветер.;Nomen, m.;a1_a2 nature
der Himmel;sky / heaven;небо;Der Himmel ist heute völlig blau.;The sky is completely blue today.;Небо сегодня совершенно голубое.;Nomen, m.;a1_a2 nature
der Morgen, die Morgen;morning;утро;Guten Morgen, hast du gut geschlafen?;Good morning, did you sleep well?;Доброе утро, ты хорошо спал?;Nomen, m.;a1_a2 time
der Abend, die Abende;evening;вечер;Am Abend treffen wir unsere Freunde.;In the evening we meet our friends.;Вечером мы встречаемся с друзьями.;Nomen, m.;a1_a2 time
die Nacht, die Nächte;night;ночь;Gute Nacht und schlaf gut!;Good night and sleep well!;Спокойной ночи и сладких снов!;Nomen, f.;a1_a2 time
das Wochenende, die Wochenenden;weekend;выходные;Am Wochenende fahren wir aufs Land.;On the weekend we drive to the countryside.;На выходных мы едем за город.;Nomen, n.;a1_a2 time
der Montag, die Montage;Monday;понедельник;Am Montag beginnt die Arbeitswoche.;On Monday the workweek begins.;В понедельник начинается рабочая неделя.;Nomen, m.;a1_a2 time
der Freitag, die Freitage;Friday;пятница;Am Freitag gehen wir zusammen essen.;On Friday we go out to eat together.;В пятницу мы идём вместе поужинать.;Nomen, m.;a1_a2 time
der Sommer, die Sommer;summer;лето;Im Sommer ist es oft sehr warm.;In summer it is often very warm.;Летом часто бывает очень тепло.;Nomen, m.;a1_a2 time
der Winter, die Winter;winter;зима;Im Winter trage ich einen dicken Mantel.;In winter I wear a thick coat.;Зимой я ношу тёплое пальто.;Nomen, m.;a1_a2 time
das Hemd, die Hemden;shirt;рубашка;Er trägt heute ein weißes Hemd.;He is wearing a white shirt today.;На нём сегодня белая рубашка.;Nomen, n.;a1_a2 clothes
die Hose, die Hosen;trousers / pants;брюки / штаны;Diese blaue Hose gefällt mir sehr.;I really like these blue pants.;Эти синие брюки мне очень нравятся.;Nomen, f.;a1_a2 clothes
der Schuh, die Schuhe;shoe;туфля / ботинок;Meine neuen Schuhe sind bequem.;My new shoes are comfortable.;Мои новые туфли удобные.;Nomen, m.;a1_a2 clothes
die Jacke, die Jacken;jacket;куртка;Nimm eine Jacke mit, es wird kühl.;Take a jacket with you, it is getting cool.;Возьми куртку с собой, становится прохладно.;Nomen, f.;a1_a2 clothes
die Brille, die Brillen;glasses;очки;Ohne Brille kann ich schlecht lesen.;Without glasses I can barely read.;Без очков я плохо вижу при чтении.;Nomen, f.;a1_a2 daily
die Tasche, die Taschen;bag;сумка;Mein Buch ist in der Tasche.;My book is in the bag.;Моя книга в сумке.;Nomen, f.;a1_a2 daily
der Schlüssel, die Schlüssel;key;ключ;Wo liegt mein Hausschlüssel?;Where is my house key?;Где лежит мой ключ от дома?;Nomen, m.;a1_a2 home
die Uhr, die Uhren;watch / clock;часы;Wie spät ist es auf deiner Uhr?;What time is it on your watch?;Сколько времени на твоих часах?;Nomen, f.;a1_a2 time
das Bild, die Bilder;picture / painting;картина / фото;An der Wand hängt ein schönes Bild.;A beautiful picture hangs on the wall.;На стене висит красивая картина.;Nomen, n.;a1_a2 home
die Musik;music;музыка;Ich höre gern ruhige Musik beim Lernen.;I like listening to calm music while studying.;Я люблю слушать спокойную музыку во время учёбы.;Nomen, f.;a1_a2 daily
der Film, die Filme;movie / film;фильм;Welchen Film hast du zuletzt gesehen?;Which movie did you watch last?;Какой фильм ты смотрел последним?;Nomen, m.;a1_a2 daily
das Spiel, die Spiele;game;игра;Das Spiel war bis zum Schluss spannend.;The game was exciting until the end.;Игра была захватывающей до самого конца.;Nomen, n.;a1_a2 daily
der Sport;sport;спорт;Welchen Sport machst du gern?;Which sport do you like doing?;Каким видом спорта ты любишь заниматься?;Nomen, m.;a1_a2 health
der Kopf, die Köpfe;head;голова;Mir tut heute der Kopf weh.;My head hurts today.;У меня сегодня болит голова.;Nomen, m.;a1_a2 health
die Hand, die Hände;hand;рука (кисть);Wasch dir bitte die Hände vor dem Essen.;Please wash your hands before eating.;Пожалуйста, помой руки перед едой.;Nomen, f.;a1_a2 health
das Auge, die Augen;eye;глаз;Sie hat wunderschöne grüne Augen.;She has beautiful green eyes.;У неё прекрасные зелёные глаза.;Nomen, n.;a1_a2 health
der Zahn, die Zähne;tooth;зуб;Ich muss morgen zum Zahnarzt gehen.;I have to go to the dentist tomorrow.;Мне нужно завтра идти к зубному врачу.;Nomen, m.;a1_a2 health
das Fleisch;meat;мясо;Ich esse zweimal pro Woche Fleisch.;I eat meat twice a week.;Я ем мясо два раза в неделю.;Nomen, n.;a1_a2 food
der Fisch, die Fische;fish;рыба;Frischer Fisch ist sehr gesund.;Fresh fish is very healthy.;Свежая рыба очень полезна.;Nomen, m.;a1_a2 food
der Käse;cheese;сыр;Möchtest du noch etwas Käse?;Would you like some more cheese?;Хочешь ещё немного сыра?;Nomen, m.;a1_a2 food
das Ei, die Eier;egg;яйцо;Wir brauchen sechs Eier für den Kuchen.;We need six eggs for the cake.;Нам нужно шесть яиц для пирога.;Nomen, n.;a1_a2 food
der Zucker;sugar;сахар;Ich trinke meinen Tee ohne Zucker.;I drink my tea without sugar.;Я пью чай без сахара.;Nomen, m.;a1_a2 food
das Salz;salt;соль;Die Suppe braucht noch etwas Salz.;The soup still needs a little salt.;Супу не хватает немного соли.;Nomen, n.;a1_a2 food
die Kartoffel, die Kartoffeln;potato;картофель;Zu dem Fisch gibt es gekochte Kartoffeln.;With the fish there are boiled potatoes.;К рыбе подаётся варёный картофель.;Nomen, f.;a1_a2 food
die Tomate, die Tomaten;tomato;помидор;Die Tomaten sind heute besonders reif.;The tomatoes are especially ripe today.;Помидоры сегодня особенно спелые.;Nomen, f.;a1_a2 food
der Kuchen, die Kuchen;cake;пирог / торт;Zum Kaffee gibt es frischen Apfelkuchen.;With coffee there is fresh apple cake.;К кофе будет свежий яблочный пирог.;Nomen, m.;a1_a2 food
das Glas, die Gläser;glass;стакан / стекло;Bring mir bitte ein Glas Wasser.;Please bring me a glass of water.;Принеси мне, пожалуйста, стакан воды.;Nomen, n.;a1_a2 home
die Tasse, die Tassen;cup;чашка;Auf dem Tisch steht eine blaue Tasse.;A blue cup is standing on the table.;На столе стоит синяя чашка.;Nomen, f.;a1_a2 home
der Teller, die Teller;plate;тарелка;Die Teller stehen im oberen Schrank.;The plates are in the upper cupboard.;Тарелки стоят в верхнем шкафу.;Nomen, m.;a1_a2 home
das Messer, die Messer;knife;нож;Vorsicht, dieses Messer ist sehr scharf!;Careful, this knife is very sharp!;Осторожно, этот нож очень острый!;Nomen, n.;a1_a2 home
die Gabel, die Gabeln;fork;вилка;Hast du für jeden eine Gabel hingelegt?;Did you put down a fork for everyone?;Ты положил вилку для каждого?;Nomen, f.;a1_a2 home
der Löffel, die Löffel;spoon;ложка;Ich brauche einen kleinen Löffel für den Tee.;I need a small spoon for the tea.;Мне нужна маленькая ложка для чая.;Nomen, m.;a1_a2 home
hell;bright / light;светлый;Unser Wohnzimmer ist sehr hell.;Our living room is very bright.;Наша гостиная очень светлая.;Adjektiv;a1_a2 adj
dunkel;dark;тёмный;Im Winter wird es schon um fünf dunkel.;In winter it already gets dark at five.;Зимой темнеет уже в пять часов.;Adjektiv;a1_a2 adj
laut;loud;громкий;Die Musik beim Nachbarn ist zu laut.;The neighbor’s music is too loud.;Музыка у соседа слишком громкая.;Adjektiv;a1_a2 adj
leise;quiet / soft;тихий;Sei bitte leise, das Baby schläft.;Please be quiet, the baby is sleeping.;Будь, пожалуйста, тише, малыш спит.;Adjektiv;a1_a2 adj
sauber;clean;чистый;Die Küche ist jetzt wieder sauber.;The kitchen is clean again now.;Кухня теперь снова чистая.;Adjektiv;a1_a2 adj
schmutzig;dirty;грязный;Deine Schuhe sind nach dem Regen schmutzig.;Your shoes are dirty after the rain.;Твои туфли грязные после дождя.;Adjektiv;a1_a2 adj
voll;full;полный;Der Zug war heute Morgen völlig voll.;The train was completely full this morning.;Поезд сегодня утром был битком набит.;Adjektiv;a1_a2 adj
leer;empty;пустой;Die Flasche ist schon leer.;The bottle is already empty.;Бутылка уже пустая.;Adjektiv;a1_a2 adj
kurz;short;короткий;Ich habe nur eine kurze Frage.;I only have a short question.;У меня только короткий вопрос.;Adjektiv;a1_a2 adj
lang;long;длинный;Der Weg zum Bahnhof ist ziemlich lang.;The way to the station is quite long.;Дорога к вокзалу довольно длинная.;Adjektiv;a1_a2 adj
hoch;high / tall;высокий;Dieser Berg ist über zweitausend Meter hoch.;This mountain is over two thousand meters high.;Эта гора высотой более двух тысяч метров.;Adjektiv;a1_a2 adj
tief;deep;глубокий;Der See ist an dieser Stelle sehr tief.;The lake is very deep at this spot.;Озеро в этом месте очень глубокое.;Adjektiv;a1_a2 adj
früh;early;ранний / рано;Morgen muss ich sehr früh aufstehen.;Tomorrow I have to get up very early.;Завтра мне нужно встать очень рано.;Adjektiv / Adverb;a1_a2 time
spät;late;поздний / поздно;Es ist schon spät, wir sollten gehen.;It is already late, we should go.;Уже поздно, нам пора идти.;Adjektiv / Adverb;a1_a2 time
stark;strong;сильный;Ich trinke morgens einen starken Kaffee.;In the morning I drink a strong coffee.;Утром я пью крепкий кофе.;Adjektiv;a1_a2 adj
schwach;weak;слабый;Nach der Grippe fühle ich mich noch schwach.;After the flu I still feel weak.;После гриппа я всё ещё чувствую себя слабым.;Adjektiv;a1_a2 adj', now())
on conflict (level) do update set
  title = excluded.title,
  word_count = excluded.word_count,
  csv_content = excluded.csv_content,
  updated_at = now();

insert into public.catalog_corpora (level, title, word_count, csv_content, updated_at)
values ('B1', 'B1 Intermediate', 700, 'de;en;ru;exDe;exEn;exRu;ctx;tags
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
vorhaben;to plan / intend;планировать / намереваться;Was habt ihr am Wochenende vor?;What do you plan to do on the weekend?;Что вы планируете на выходные?;Verb (trennb.);b1 daily
der Alltag;everyday life;повседневная жизнь;Im Alltag bleibt wenig Zeit zum Lesen.;In everyday life little time remains for reading.;В повседневной жизни остаётся мало времени на чтение.;Nomen, m.;b1 daily
die Freizeit;free time / leisure;свободное время;In meiner Freizeit fahre ich gern Ski.;In my free time I like skiing.;В свободное время я люблю кататься на лыжах.;Nomen, f.;b1 daily
das Hobby, die Hobbys;hobby;хобби;Fotografieren ist mein liebstes Hobby.;Photography is my favorite hobby.;Фотография — моё любимое хобби.;Nomen, n.;b1 daily
der Sportverein, die Sportvereine;sports club;спортивный клуб;Unser Sohn trainiert im Sportverein.;Our son trains at the sports club.;Наш сын тренируется в спортивном клубе.;Nomen, m.;b1 health
der Erfolg, die Erfolge;achievement / success;успех / достижение;Fleiß ist der Schlüssel zum Erfolg.;Diligence is the key to success.;Трудолюбие — ключ к успеху.;Nomen, m.;b1 work
der Misserfolg, die Misserfolge;failure;неудача / провал;Aus einem Misserfolg kann man viel lernen.;One can learn a lot from a failure.;На неудаче можно многому научиться.;Nomen, m.;b1 work
die Prüfung, die Prüfungen;exam;экзамен;Sie hat die B1-Prüfung mit Bravour bestanden.;She passed the B1 exam with flying colors.;Она блестяще сдала экзамен B1.;Nomen, f.;b1 study
das Zeugnis, die Zeugnisse;certificate / report card;аттестат / характеристика;Das Zeugnis liegt der Bewerbung bei.;The certificate is enclosed with the application.;Аттестат приложен к заявке.;Nomen, n.;b1 study
der Kurs, die Kurse;course;курс;Der Deutschkurs findet zweimal wöchentlich statt.;The German course takes place twice a week.;Курс немецкого проходит дважды в неделю.;Nomen, m.;b1 study
die Vorlesung, die Vorlesungen;lecture;лекция;Die Vorlesung beginnt pünktlich um zehn.;The lecture starts promptly at ten.;Лекция начинается ровно в десять.;Nomen, f.;b1 study
das Studium;university studies;учёба в вузе;Nach dem Studium sucht er eine Stelle.;After his studies he looks for a job.;После окончания вуза он ищет работу.;Nomen, n.;b1 study
der Student, die Studenten;university student;студент;Viele Studenten arbeiten nebenbei im Café.;Many students work part-time at a café.;Многие студенты подрабатывают в кафе.;Nomen, m.;b1 study
die Bibliothek, die Bibliotheken;library;библиотека;In der Bibliothek kann man ruhig lernen.;In the library one can study quietly.;В библиотеке можно спокойно заниматься.;Nomen, f.;b1 study
das Wörterbuch, die Wörterbücher;dictionary;словарь;Schlag das Wort im Wörterbuch nach.;Look up the word in the dictionary.;Посмотри слово в словаре.;Nomen, n.;b1 study
die Grammatik;grammar;грамматика;Deutsche Grammatik folgt klaren Regeln.;German grammar follows clear rules.;Немецкая грамматика следует чётким правилам.;Nomen, f.;b1 study
die Aussprache;pronunciation;произношение;Mit viel Übung wird die Aussprache besser.;With lots of practice pronunciation gets better.;С большой практикой произношение становится лучше.;Nomen, f.;b1 study
das Thema, die Themen;topic / theme;тема;Welches Thema behandeln wir heute?;Which topic are we covering today?;Какую тему мы разбираем сегодня?;Nomen, n.;b1 communication
die Aufgabe, die Aufgaben;task / exercise;задание / задача;Diese Aufgabe erledige ich bis Mittag.;I will finish this task by noon.;Я выполню это задание до обеда.;Nomen, f.;b1 work
der Termin, die Termine;appointment;встреча / запись;Können wir den Termin auf Donnerstag legen?;Can we move the appointment to Thursday?;Можем перенести встречу на четверг?;Nomen, m.;b1 work
die Einladung, die Einladungen;invitation;приглашение;Vielen Dank für die nette Einladung!;Thank you very much for the kind invitation!;Большое спасибо за милое приглашение!;Nomen, f.;b1 daily
das Geschenk, die Geschenke;gift / present;подарок;Das Geschenk hat ihr sehr gut gefallen.;She really liked the gift.;Подарок ей очень понравился.;Nomen, n.;b1 daily
die Überraschung, die Überraschungen;surprise;сюрприз;Die Party war eine gelungene Überraschung.;The party was a successful surprise.;Вечеринка стала удачным сюрпризом.;Nomen, f.;b1 daily
der Gast, die Gäste;guest;гость;Am Samstag erwarten wir zehn Gäste.;On Saturday we expect ten guests.;В субботу мы ждём десять гостей.;Nomen, m.;b1 daily
die Gastfreundschaft;hospitality;гостеприимство;Ihre Gastfreundschaft hat uns berührt.;Their hospitality touched us.;Их гостеприимство тронуло нас.;Nomen, f.;b1 society
die Erinnerung, die Erinnerungen;memory;воспоминание;Das bleibt eine schöne Erinnerung für immer.;That remains a fond memory forever.;Это останется прекрасным воспоминанием навсегда.;Nomen, f.;b1 emotions
das Gefühl, die Gefühle;feeling;чувство;Ich habe ein gutes Gefühl bei dieser Sache.;I have a good feeling about this matter.;У меня хорошее предчувствие насчёт этого дела.;Nomen, n.;b1 emotions
die Stimmung, die Stimmungen;mood / atmosphere;настроение / атмосфера;Auf dem Fest herrschte tolle Stimmung.;There was a great atmosphere at the party.;На празднике царила отличная атмосфера.;Nomen, f.;b1 emotions
der Streit, die Streite;argument / quarrel;ссора / спор;Nach dem Streit haben sie sich versöhnt.;After the argument they made up.;После ссоры они помирились.;Nomen, m.;b1 people
der Kompromiss, die Kompromisse;compromise;компромисс;Beide Seiten fanden einen guten Kompromiss.;Both sides found a good compromise.;Обе стороны нашли хороший компромисс.;Nomen, m.;b1 communication
die Hilfe;help / assistance;помощь;Ohne deine Hilfe wäre ich verloren gewesen.;Without your help I would have been lost.;Без твоей помощи я бы пропал.;Nomen, f.;b1 daily
der Schutz;protection;защита;Der Helm bietet Schutz bei Unfällen.;The helmet offers protection in accidents.;Шлем обеспечивает защиту при авариях.;Nomen, m.;b1 safety
die Ordnung;order / tidiness;порядок;Ordnung am Arbeitsplatz spart Zeit.;Order at the workplace saves time.;Порядок на рабочем месте экономит время.;Nomen, f.;b1 daily
die Ruhe;calm / peace / quiet;спокойствие / тишина;Am Sonntag genieße ich die Ruhe im Garten.;On Sunday I enjoy the peace in the garden.;В воскресенье я наслаждаюсь тишиной в саду.;Nomen, f.;b1 daily
der Lärm;noise;шум;Der Straßenlärm stört mich beim Schlafen.;The street noise bothers me while sleeping.;Уличный шум мешает мне спать.;Nomen, m.;b1 daily
das Licht, die Lichter;light;свет;Mach bitte das Licht im Flur an.;Please turn on the light in the hallway.;Включи, пожалуйста, свет в коридоре.;Nomen, n.;b1 home
der Strom;electricity / current;электричество / ток;Ohne Strom funktioniert das Internet nicht.;Without electricity the internet does not work.;Без электричества интернет не работает.;Nomen, m.;b1 tech
das Gerät, die Geräte;device / appliance;прибор / устройство;Dieses Gerät verbraucht wenig Energie.;This device consumes little energy.;Этот прибор потребляет мало энергии.;Nomen, n.;b1 tech
die Verbindung, die Verbindungen;connection;соединение / связь;Die Internetverbindung ist heute stabil.;The internet connection is stable today.;Интернет-соединение сегодня стабильное.;Nomen, f.;b1 tech
die Webseite, die Webseiten;website;веб-сайт;Alle Infos stehen auf unserer Webseite.;All info is on our website.;Вся информация есть на нашем сайте.;Nomen, f.;b1 tech
das Passwort, die Passwörter;password;пароль;Wählen Sie ein sicheres Passwort.;Choose a secure password.;Выберите надёжный пароль.;Nomen, n.;b1 tech
anrufen;to call (by phone);звонить;Ich rufe dich heute Abend kurz an.;I will give you a quick call tonight.;Я позвоню тебе ненадолго сегодня вечером.;Verb (trennb.);b1 communication
zurückrufen;to call back;перезвонить;Können Sie mich in zehn Minuten zurückrufen?;Can you call me back in ten minutes?;Можете перезвонить мне через десять минут?;Verb (trennb.);b1 communication
mitteilen;to inform / communicate;сообщать;Bitte teilen Sie uns Ihre neue Adresse mit.;Please let us know your new address.;Пожалуйста, сообщите нам ваш новый адрес.;Verb (trennb.);b1 formal
erleben;to experience;переживать / испытывать;Auf der Reise haben wir viel erlebt.;On the trip we experienced a lot.;В поездке мы многое пережили.;Verb;b1 travel
genießen;to enjoy;наслаждаться;Wir genießen die warmen Abende am Meer.;We enjoy the warm evenings by the sea.;Мы наслаждаемся тёплыми вечерами у моря.;Verb;b1 daily
pflegen;to care for / maintain;ухаживать / поддерживать;Man muss Freundschaften regelmäßig pflegen.;One must nurture friendships regularly.;Дружбу нужно регулярно поддерживать.;Verb;b1 people
heilen;to heal;лечить / заживать;Die Wunde heilt zum Glück sehr schnell.;Thankfully the wound is healing very fast.;Рана, к счастью, заживает очень быстро.;Verb;b1 health
atmen;to breathe;дышать;Atme tief ein und bleib ganz ruhig.;Breathe in deeply and stay completely calm.;Сделай глубокий вдох и сохраняй спокойствие.;Verb;b1 health
sich bewegen;to move / exercise;двигаться;Wer viel sitzt, sollte sich oft bewegen.;Anyone who sits a lot should move often.;Кто много сидит, должен чаще двигаться.;Refl. Verb;b1 health
sich ausruhen;to rest;отдыхать;Nach dem Sport ruhe ich mich kurz aus.;After sports I rest briefly.;После спорта я немного отдыхаю.;Refl. Verb (trennb.);b1 health
sich beeilen;to hurry;торопиться;Beeil dich, sonst verpassen wir den Bus!;Hurry up, otherwise we will miss the bus!;Поторопись, иначе мы опоздаем на автобус!;Refl. Verb;b1 daily
sich verspäten;to be late;опаздывать;Entschuldigung, dass ich mich verspätet habe.;Sorry that I am late.;Извините, что я опоздал.;Refl. Verb;b1 daily
sich verlaufen;to get lost (on foot);заблудиться;In der Altstadt haben wir uns kurz verlaufen.;In the old town we got lost briefly.;В старом городе мы ненадолго заблудились.;Refl. Verb;b1 travel
sich irren;to be mistaken;ошибаться;Jeder Mensch kann sich einmal irren.;Every person can be mistaken once.;Каждый человек может ошибиться.;Refl. Verb;b1 communication
sich einigen auf;to agree on;договориться о;Wir haben uns auf einen Termin geeinigt.;We agreed on a date.;Мы договорились о дате.;Refl. Verb (+ Akk.);b1 communication
sich verlassen auf;to rely on;полагаться на;Du kannst dich immer auf mich verlassen.;You can always rely on me.;Ты всегда можешь положиться на меня.;Refl. Verb (+ Akk.);b1 people
sich vorbereiten auf;to prepare for;готовиться к;Wir bereiten uns intensiv auf den Test vor.;We are preparing intensively for the test.;Мы интенсивно готовимся к тесту.;Refl. Verb (trennb., + Akk.);b1 study
aufgeben;to give up;сдаваться;Gib nicht auf, du bist fast am Ziel!;Do not give up, you are almost at the goal!;Не сдавайся, ты почти у цели!;Verb (trennb.);b1 emotions
ausprobieren;to try out;пробовать / тестировать;Ich möchte dieses neue Rezept ausprobieren.;I want to try out this new recipe.;Я хочу попробовать этот новый рецепт.;Verb (trennb.);b1 daily
mitbringen;to bring along;приносить с собой;Soll ich etwas zu trinken mitbringen?;Should I bring something to drink?;Мне принести что-нибудь попить?;Verb (trennb.);b1 daily
nachsehen;to check / look up;посмотреть / проверить;Ich sehe gleich im Kalender nach.;I will check the calendar right away.;Я сейчас посмотрю в календаре.;Verb (trennb.);b1 daily
umtauschen;to exchange (a product);обменять (товар);Kann ich den Pullover umtauschen?;Can I exchange the sweater?;Могу я обменять этот свитер?;Verb (trennb.);b1 shopping
zurückkommen;to come back;возвращаться;Wann kommst du aus Berlin zurück?;When are you coming back from Berlin?;Когда ты возвращаешься из Берлина?;Verb (trennb.);b1 travel
angenehm;pleasant;приятный;Das Gespräch war äußerst angenehm.;The conversation was extremely pleasant.;Разговор был исключительно приятным.;Adjektiv;b1 adj
gemütlich;cozy / comfortable;уютный;Dieses kleine Café ist richtig gemütlich.;This small café is really cozy.;Это маленькое кафе по-настоящему уютное.;Adjektiv;b1 adj
hilfsbereit;helpful;отзывчивый;Unsere Nachbarn sind sehr hilfsbereit.;Our neighbors are very helpful.;Наши соседи очень отзывчивые.;Adjektiv;b1 adj
kreativ;creative;креативный / творческий;Sie findet immer kreative Lösungen.;She always finds creative solutions.;Она всегда находит креативные решения.;Adjektiv;b1 adj
nützlich;useful;полезный;Diese App ist im Alltag sehr nützlich.;This app is very useful in daily life.;Это приложение очень полезно в быту.;Adjektiv;b1 adj
sicher;safe / sure;безопасный / уверенный;Bist du dir ganz sicher?;Are you completely sure?;Ты совершенно уверен?;Adjektiv;b1 adj
wertvoll;valuable;ценный;Deine Tipps waren für mich sehr wertvoll.;Your tips were very valuable to me.;Твои советы были для меня очень ценными.;Adjektiv;b1 adj
der Abschnitt, die Abschnitte;section / paragraph;раздел / абзац;Lesen Sie bitte den zweiten Abschnitt.;Please read the second section.;Прочитайте, пожалуйста, второй раздел.;Nomen, m.;b1 study
die Absicht, die Absichten;intention;намерение;Er hatte keine böse Absicht.;He had no bad intention.;У него не было злого умысла.;Nomen, f.;b1 daily
die Achtung;respect / attention;уважение / внимание;Achtung, der Boden ist nass!;Attention, the floor is wet!;Внимание, пол мокрый!;Nomen, f.;b1 daily
das Alter;age;возраст;In diesem Alter lernt man schnell.;At this age one learns quickly.;В этом возрасте учатся быстро.;Nomen, n.;b1 people
die Ampel, die Ampeln;traffic light;светофор;Bei Rot muss man an der Ampel halten.;On red you must stop at the traffic light.;На красный нужно остановиться у светофора.;Nomen, f.;b1 travel
die Angststörung, die Angststörungen;anxiety disorder;тревожное расстройство;Bei einer Angststörung hilft oft Therapie.;Therapy often helps with an anxiety disorder.;При тревожном расстройстве часто помогает терапия.;Nomen, f.;b1 health
der Anruf, die Anrufe;phone call;звонок;Ich warte auf einen wichtigen Anruf.;I am waiting for an important phone call.;Я жду важного телефонного звонка.;Nomen, m.;b1 communication
die Ansage, die Ansagen;announcement;объявление;Hören Sie auf die Ansage am Bahnsteig.;Listen to the announcement on the platform.;Слушайте объявление на платформе.;Nomen, f.;b1 travel
der Anspruch, die Ansprüche;claim / demand;требование / претензия;Sie hat hohe Ansprüche an die Qualität.;She has high demands for quality.;У неё высокие требования к качеству.;Nomen, m.;b1 work
der Antrag, die Anträge;application / request;заявление / заявка;Ich muss einen Antrag auf Urlaub stellen.;I have to submit a request for vacation.;Мне нужно подать заявление на отпуск.;Nomen, m.;b1 work
die Antwort, die Antworten;answer;ответ;Ich habe noch keine Antwort erhalten.;I have not received an answer yet.;Я ещё не получил ответа.;Nomen, f.;b1 communication
der Anzug, die Anzüge;suit;костюм;Für das Gespräch trägt er einen Anzug.;For the interview he wears a suit.;На собеседование он надевает костюм.;Nomen, m.;b1 clothes
der Appetit;appetite;аппетит;Guten Appetit und viel Genuss!;Enjoy your meal!;Приятного аппетита!;Nomen, m.;b1 food
der Arbeitgeber, die Arbeitgeber;employer;работодатель;Mein Arbeitgeber bietet flexible Zeiten.;My employer offers flexible hours.;Мой работодатель предлагает гибкий график.;Nomen, m.;b1 work
der Arbeitnehmer, die Arbeitnehmer;employee;работник;Die Arbeitnehmer fordern mehr Lohn.;The employees are demanding higher wages.;Работники требуют более высокой зарплаты.;Nomen, m.;b1 work
die Arbeitslosigkeit;unemployment;безработица;Die Arbeitslosigkeit ist leicht gesunken.;Unemployment has fallen slightly.;Безработица немного снизилась.;Nomen, f.;b1 work
der Arbeitsplatz, die Arbeitsplätze;workplace;рабочее место;Mein Arbeitsplatz liegt nah am Fenster.;My workplace is close to the window.;Моё рабочее место находится у окна.;Nomen, m.;b1 work
der Ärger;trouble / anger;неприятность / злость;Das bringt nur unnötigen Ärger.;That only brings unnecessary trouble.;Это приносит только лишние неприятности.;Nomen, m.;b1 feelings
der Arm, die Arme;arm;рука;Er hat sich beim Sport den Arm verletzt.;He injured his arm while doing sports.;Он повредил руку во время спорта.;Nomen, m.;b1 health
die Art, die Arten;kind / type / manner;вид / способ;Auf diese Art sparen wir viel Zeit.;In this way we save a lot of time.;Таким способом мы экономим много времени.;Nomen, f.;b1 daily
der Aufenthalt, die Aufenthalte;stay;пребывание;Wir wünschen Ihnen einen schönen Aufenthalt.;We wish you a pleasant stay.;Желаем вам приятного пребывания.;Nomen, m.;b1 travel
die Aufmerksamkeit;attention;внимание;Vielen Dank für Ihre Aufmerksamkeit.;Thank you very much for your attention.;Большое спасибо за ваше внимание.;Nomen, f.;b1 communication
der Aufzug, die Aufzüge;elevator;лифт;Der Aufzug ist leider außer Betrieb.;The elevator is unfortunately out of order.;Лифт, к сожалению, не работает.;Nomen, m.;b1 home
der Ausdruck, die Ausdrücke;expression;выражение;Diesen Ausdruck kenne ich noch nicht.;I do not know this expression yet.;Я ещё не знаю этого выражения.;Nomen, m.;b1 study
die Auskunft, die Auskünfte;information;справка / информация;An der Auskunft hilft man Ihnen weiter.;At the information desk they will help you.;В справочной вам помогут.;Nomen, f.;b1 travel
das Ausland;abroad;заграница;Er hat zwei Jahre im Ausland gelebt.;He lived abroad for two years.;Он два года жил за границей.;Nomen, n.;b1 travel
die Aussicht, die Aussichten;view / prospect;вид / перспектива;Vom Balkon hat man eine tolle Aussicht.;From the balcony you have a great view.;С балкона открывается отличный вид.;Nomen, f.;b1 nature
der Ausflug, die Ausflüge;excursion / trip;экскурсия / поездка;Am Sonntag machen wir einen Ausflug.;On Sunday we are going on a trip.;В воскресенье мы поедем на экскурсию.;Nomen, m.;b1 travel
der Ausgang, die Ausgänge;exit;выход;Der Ausgang befindet sich links.;The exit is on the left.;Выход находится слева.;Nomen, m.;b1 travel
die Ausrüstung, die Ausrüstungen;equipment;снаряжение / оборудование;Für die Wanderung brauchen wir gute Ausrüstung.;For the hike we need good equipment.;Для похода нам нужно хорошее снаряжение.;Nomen, f.;b1 travel
die Ausstellung, die Ausstellungen;exhibition;выставка;Die neue Ausstellung im Museum ist spannend.;The new exhibition at the museum is exciting.;Новая выставка в музее очень интересная.;Nomen, f.;b1 culture
die Auswahl;selection / choice;выбор / ассортимент;Das Geschäft hat eine große Auswahl.;The shop has a large selection.;В магазине большой выбор.;Nomen, f.;b1 shopping
der Auszubildende, die Auszubildenden;trainee / apprentice;стажёр / ученик;Der Auszubildende lernt den Beruf von Grund auf.;The apprentice learns the trade from scratch.;Стажёр изучает профессию с нуля.;Nomen, m.;b1 work
das Bad, die Bäder;bathroom / bath;ванная / купание;Das Bad wurde frisch renoviert.;The bathroom was freshly renovated.;Ванная была недавно отремонтирована.;Nomen, n.;b1 home
die Bäckerei, die Bäckereien;bakery;пекарня;Morgens kaufe ich frische Brötchen in der Bäckerei.;In the morning I buy fresh rolls at the bakery.;Утром я покупаю свежие булочки в пекарне.;Nomen, f.;b1 food
der Balkon, die Balkone;balcony;балкон;Im Sommer sitzen wir abends auf dem Balkon.;In summer we sit on the balcony in the evening.;Летом по вечерам мы сидим на балконе.;Nomen, m.;b1 home
die Bank, die Banken;bank;банк;Ich muss heute noch zur Bank gehen.;I still have to go to the bank today.;Мне ещё нужно сегодня сходить в банк.;Nomen, f.;b1 finance
die Bank, die Bänke;bench;скамейка;Im Park steht eine freie Bank.;There is an empty bench in the park.;В парке стоит свободная скамейка.;Nomen, f.;b1 city
der Bauer, die Bauern;farmer;фермер / крестьянин;Der Bauer verkauft frisches Gemüse auf dem Markt.;The farmer sells fresh vegetables at the market.;Фермер продаёт свежие овощи на рынке.;Nomen, m.;b1 work
die Baustelle, die Baustellen;construction site;стройка;Wegen der Baustelle gibt es einen Stau.;Because of the construction site there is a traffic jam.;Из-за стройки образовалась пробка.;Nomen, f.;b1 city
der Beamte, die Beamten;civil servant;чиновник;Der Beamte prüft alle Unterlagen.;The civil servant checks all the documents.;Чиновник проверяет все документы.;Nomen, m.;b1 work
die Bedeutung, die Bedeutungen;meaning / importance;значение;Dieses Wort hat mehrere Bedeutungen.;This word has several meanings.;У этого слова несколько значений.;Nomen, f.;b1 study
die Bedienung;service / waiter;обслуживание / официант;Die Bedienung im Restaurant war sehr freundlich.;The service in the restaurant was very friendly.;Обслуживание в ресторане было очень дружелюбным.;Nomen, f.;b1 food
der Befehl, die Befehle;command / order;приказ;Der Kapitän gab einen klaren Befehl.;The captain gave a clear order.;Капитан отдал чёткий приказ.;Nomen, m.;b1 daily
die Begeisterung;enthusiasm;восторг / энтузиазм;Die Kinder zeigten große Begeisterung.;The children showed great enthusiasm.;Дети проявили большой энтузиазм.;Nomen, f.;b1 feelings
der Beginn;beginning;начало;Vor Beginn des Films schalten wir die Handys aus.;Before the start of the film we switch off our phones.;Перед началом фильма мы выключаем телефоны.;Nomen, m.;b1 time
die Begleitung;company / accompaniment;сопровождение;Vielen Dank für Ihre nette Begleitung.;Thank you very much for your nice company.;Большое спасибо за вашу приятную компанию.;Nomen, f.;b1 people
das Verhalten;behavior;поведение;Sein ruhiges Verhalten hat mich beeindruckt.;His calm behavior impressed me.;Его спокойное поведение впечатлило меня.;Nomen, n.;b1 people
die Behörde, die Behörden;authority / government agency;ведомство / учреждение;Man muss das Formular bei der Behörde abgeben.;You have to hand in the form at the authority.;Формуляр нужно подать в ведомство.;Nomen, f.;b1 society
das Beispiel, die Beispiele;example;пример;Kannst du mir ein Beispiel nennen?;Can you give me an example?;Можешь привести мне пример?;Nomen, n.;b1 study
der Beitrag, die Beiträge;contribution / post / fee;взнос / вклад / публикация;Jeder leistet einen wichtigen Beitrag.;Everyone makes an important contribution.;Каждый вносит важный вклад.;Nomen, m.;b1 society
die Belohnung, die Belohnungen;reward;награда;Als Belohnung bekam er ein Eis.;As a reward he got an ice cream.;В награду он получил мороженое.;Nomen, f.;b1 daily
der Bericht, die Berichte;report;отчёт / доклад;Ich schreibe bis Freitag den Bericht.;I will write the report by Friday.;Я напишу отчёт до пятницы.;Nomen, m.;b1 work
die Beschreibung, die Beschreibungen;description;описание;Die Beschreibung des Weges war sehr klar.;The description of the way was very clear.;Описание дороги было очень понятным.;Nomen, f.;b1 communication
der Besitz;possession / property;владение / имущество;Das Haus ist schon lange in unserem Besitz.;The house has been in our possession for a long time.;Дом уже давно находится в нашем владении.;Nomen, m.;b1 finance
die Besserung;improvement / recovery;улучшение / выздоровление;Ich wünsche dir gute Besserung!;I wish you a speedy recovery!;Желаю тебе скорейшего выздоровления!;Nomen, f.;b1 health
die Bestellung, die Bestellungen;order;заказ;Meine Bestellung ist heute angekommen.;My order arrived today.;Мой заказ пришёл сегодня.;Nomen, f.;b1 shopping
der Besuch, die Besuche;visit;визит / посещение;Wir freuen uns auf euren Besuch.;We are looking forward to your visit.;Мы рады вашему визиту.;Nomen, m.;b1 people
der Betrieb, die Betriebe;company / operation;предприятие / работа;Im Betrieb arbeiten fünfzig Personen.;Fifty people work in the company.;На предприятии работают пятьдесят человек.;Nomen, m.;b1 work
der Beweis, die Beweise;proof / evidence;доказательство;Ohne Beweis können wir nichts tun.;Without proof we cannot do anything.;Без доказательств мы ничего не можем сделать.;Nomen, m.;b1 society
das Bewusstsein;consciousness / awareness;сознание;Das Umweltbewusstsein wächst stetig.;Environmental awareness is growing steadily.;Экологическое сознание постоянно растёт.;Nomen, n.;b1 society
die Bildung;education;образование;Bildung ist der Schlüssel zur Zukunft.;Education is the key to the future.;Образование — это ключ к будущему.;Nomen, f.;b1 study
der Bildschirm, die Bildschirme;screen / monitor;экран / монитор;Schau nicht zu lange auf den Bildschirm.;Do not look at the screen for too long.;Не смотри слишком долго на экран.;Nomen, m.;b1 tech
die Bitte, die Bitten;request;просьба;Ich habe eine kleine Bitte an dich.;I have a small request for you.;У меня к тебе небольшая просьба.;Nomen, f.;b1 communication
der Blick, die Blicke;glance / view;взгляд / вид;Auf den ersten Blick sieht alles gut aus.;At first glance everything looks good.;На первый взгляд всё выглядит хорошо.;Nomen, m.;b1 daily
der Boden, die Böden;floor / ground / soil;пол / земля / почва;Der Boden im Wohnzimmer ist aus Holz.;The floor in the living room is made of wood.;Пол в гостиной сделан из дерева.;Nomen, m.;b1 home
die Botschaft, die Botschaften;message / embassy;сообщение / посольство;Ich muss meinen Pass bei der Botschaft abholen.;I have to pick up my passport at the embassy.;Мне нужно забрать паспорт в посольстве.;Nomen, f.;b1 travel
der Brand, die Brände;fire;пожар;Die Feuerwehr löschte den Brand schnell.;The fire brigade extinguished the fire quickly.;Пожарные быстро потушили пожар.;Nomen, m.;b1 safety
die Brücke, die Brücken;bridge;мост;Wir gehen über die alte Brücke.;We are walking across the old bridge.;Мы идём по старому мосту.;Nomen, f.;b1 city
die Brust, die Brüste;chest / breast;грудь;Er hat leichte Schmerzen in der Brust.;He has slight pain in his chest.;У него лёгкая боль в груди.;Nomen, f.;b1 health
die Bühne, die Bühnen;stage;сцена;Die Schauspieler betreten die Bühne.;The actors enter the stage.;Актёры выходят на сцену.;Nomen, f.;b1 culture
das Bündel, die Bündel;bundle;связка / пучок;Sie trug ein Bündel Zeitungen.;She carried a bundle of newspapers.;Она несла связку газет.;Nomen, n.;b1 daily
die Burg, die Burgen;castle / fortress;крепость / замок;Auf dem Hügel steht eine mittelalterliche Burg.;On the hill stands a medieval castle.;На холме стоит средневековый замок.;Nomen, f.;b1 travel
das Dach, die Dächer;roof;крыша;Das Dach des Hauses ist rot.;The roof of the house is red.;Крыша дома красная.;Nomen, n.;b1 home
der Dank;gratitude / thanks;благодарность;Herzlichen Dank für deine Unterstützung!;Many thanks for your support!;Сердечное спасибо за твою поддержку!;Nomen, m.;b1 communication
die Datei, die Dateien;file;файл;Bitte senden Sie mir die Datei per E-Mail.;Please send me the file by email.;Пожалуйста, отправьте мне файл по электронной почте.;Nomen, f.;b1 tech
die Daten;data;данные;Deine persönlichen Daten sind geschützt.;Your personal data is protected.;Твои личные данные защищены.;Nomen, Pl.;b1 tech
das Datum, die Daten;date;дата;Welches Datum haben wir heute?;What is the date today?;Какое сегодня число?;Nomen, n.;b1 time
die Dauer;duration;продолжительность;Die Dauer des Kurses beträgt drei Monate.;The duration of the course is three months.;Продолжительность курса составляет три месяца.;Nomen, f.;b1 time
die Decke, die Decken;ceiling / blanket;потолок / одеяло;Nimm dir eine warme Decke fürs Sofa.;Take a warm blanket for the sofa.;Возьми себе тёплое одеяло на диван.;Nomen, f.;b1 home
der Deckel, die Deckel;lid / cover;крышка;Mach bitte den Deckel auf den Topf.;Please put the lid on the pot.;Пожалуйста, накрой кастрюлю крышкой.;Nomen, m.;b1 home
das Detail, die Details;detail;деталь;Wir besprechen alle Details morgen.;We will discuss all details tomorrow.;Мы обсудим все детали завтра.;Nomen, n.;b1 work
der Dieb, die Diebe;thief;вор;Die Polizei hat den Dieb gefasst.;The police caught the thief.;Полиция поймала вора.;Nomen, m.;b1 society
der Dienst, die Dienste;service / duty;служба / дежурство;Am Wochenende habe ich Dienst.;On the weekend I am on duty.;На выходных у меня дежурство.;Nomen, m.;b1 work
das Ding, die Dinge;thing;вещь;Es gibt wichtigere Dinge im Leben.;There are more important things in life.;В жизни есть более важные вещи.;Nomen, n.;b1 daily
der Donner;thunder;гром;Nach dem Blitz hörten wir lauten Donner.;After the lightning we heard loud thunder.;После молнии мы услышали громкий гром.;Nomen, m.;b1 nature
das Dorf, die Dörfer;village;деревня;Meine Großeltern wohnen in einem ruhigen Dorf.;My grandparents live in a quiet village.;Мои бабушка и дедушка живут в тихой деревне.;Nomen, n.;b1 city
der Druck;pressure / print;давление / печать;Bei der Arbeit steht er oft unter Druck.;At work he is often under pressure.;На работе он часто находится под давлением.;Nomen, m.;b1 work
der Durchschnitt;average;среднее значение;Der Durchschnitt liegt bei siebzig Prozent.;The average is seventy percent.;Средний показатель составляет семьдесят процентов.;Nomen, m.;b1 study
die Dusche, die Duschen;shower;душ;Nach dem Sport gehe ich unter die Dusche.;After sports I take a shower.;После спорта я иду в душ.;Nomen, f.;b1 home
die Ecke, die Ecken;corner;угол;Der Kiosk ist gleich um die Ecke.;The kiosk is right around the corner.;Киоск сразу за углом.;Nomen, f.;b1 city
die Ehe, die Ehen;marriage;брак;Sie führen seit zehn Jahren eine glückliche Ehe.;They have had a happy marriage for ten years.;Они уже десять лет в счастливом браке.;Nomen, f.;b1 family
die Ehre;honor;честь;Es ist mir eine große Ehre, hier zu sein.;It is a great honor for me to be here.;Для меня большая честь быть здесь.;Nomen, f.;b1 people
das Eigentum;property / ownership;собственность;Fremdes Eigentum muss man respektieren.;One must respect other people’s property.;Чужую собственность нужно уважать.;Nomen, n.;b1 society
die Eile;hurry / rush;спешка;Ich bin heute leider in großer Eile.;Today I am unfortunately in a big hurry.;Сегодня я, к сожалению, очень спешу.;Nomen, f.;b1 time
der Einfluss, die Einflüsse;influence;влияние;Das Wetter hat großen Einfluss auf meine Laune.;The weather has a big influence on my mood.;Погода сильно влияет на моё настроение.;Nomen, m.;b1 daily
der Eingang, die Eingänge;entrance;вход;Wir treffen uns vor dem Haupteingang.;We will meet in front of the main entrance.;Мы встретимся перед главным входом.;Nomen, m.;b1 city
die Einheit, die Einheiten;unit;единица;Jede Lektion hat drei Übungseinheiten.;Each lesson has three practice units.;В каждом уроке три учебных блока.;Nomen, f.;b1 study
das Einkommen, die Einkommen;income;доход;Mit diesem Einkommen kann man gut leben.;With this income one can live well.;С таким доходом можно хорошо жить.;Nomen, n.;b1 finance
die Einnahme, die Einnahmen;revenue / intake;доход / приём;Die Einnahmen sind in diesem Jahr gestiegen.;Revenues increased this year.;Доходы в этом году выросли.;Nomen, f.;b1 finance
die Einrichtung, die Einrichtungen;furnishing / facility;обстановка / учреждение;Die Einrichtung der Wohnung ist modern.;The furnishing of the apartment is modern.;Обстановка квартиры современная.;Nomen, f.;b1 home
der Eintritt;admission / entry;вход / вступление;Der Eintritt ins Museum kostet acht Euro.;Admission to the museum costs eight euros.;Вход в музей стоит восемь евро.;Nomen, m.;b1 culture
der Einwohner, die Einwohner;inhabitant / resident;житель;Die Stadt hat rund eine Million Einwohner.;The city has around one million inhabitants.;В городе около миллиона жителей.;Nomen, m.;b1 city
die Einzelheit, die Einzelheiten;detail / particular;подробность;Alle Einzelheiten stehen im Vertrag.;All details are in the contract.;Все подробности указаны в договоре.;Nomen, f.;b1 work
das Eis;ice / ice cream;лёд / мороженое;Im Sommer essen wir gern Schokoladeneis.;In summer we like to eat chocolate ice cream.;Летом мы любим есть шоколадное мороженое.;Nomen, n.;b1 food
die Eisenbahn, die Eisenbahnen;railway;железная дорога;Die Reise mit der Eisenbahn war bequem.;The journey by railway was comfortable.;Путешествие по железной дороге было удобным.;Nomen, f.;b1 travel
die Eltern;parents;родители;Meine Eltern besuchen mich am Wochenende.;My parents are visiting me on the weekend.;Мои родители навестят меня на выходных.;Nomen, Pl.;b1 family
der Empfang, die Empfänge;reception;приём / стойка регистрации;Bitte melden Sie sich am Empfang.;Please report at the reception desk.;Пожалуйста, отметьтесь на стойке регистрации.;Nomen, m.;b1 travel
das Ende, die Enden;end;конец;Am Ende des Films weinten viele Zuschauer.;At the end of the film many viewers cried.;В конце фильма многие зрители плакали.;Nomen, n.;b1 time
die Entschuldigung, die Entschuldigungen;apology / excuse;извинение;Ich nehme deine Entschuldigung gern an.;I gladly accept your apology.;Я с радостью принимаю твои извинения.;Nomen, f.;b1 communication
das Ereignis, die Ereignisse;event;событие;Dieses Konzert war ein unvergessliches Ereignis.;This concert was an unforgettable event.;Этот концерт стал незабываемым событием.;Nomen, n.;b1 culture
die Erholung;relaxation / recovery;отдых / восстановление;Nach der Arbeit brauche ich Erholung.;After work I need relaxation.;После работы мне нужен отдых.;Nomen, f.;b1 health
die Erklärung, die Erklärungen;explanation;объяснение;Die Erklärung der Lehrerin war verständlich.;The teacher’s explanation was understandable.;Объяснение учительницы было понятным.;Nomen, f.;b1 study
das Erlebnis, die Erlebnisse;experience / adventure;переживание / впечатление;Die Reise war ein tolles Erlebnis.;The trip was a great experience.;Поездка оставила отличные впечатления.;Nomen, n.;b1 travel
die Erlaubnis;permission;разрешение;Ohne Erlaubnis darf man hier nicht parken.;Without permission you may not park here.;Без разрешения здесь нельзя парковаться.;Nomen, f.;b1 society
die Ermäßigung, die Ermäßigungen;discount / reduction;скидка / льгота;Studenten bekommen eine Ermäßigung.;Students get a discount.;Студенты получают скидку.;Nomen, f.;b1 shopping
der Ernst;seriousness;серьёзность;Im Ernst, hast du das wirklich geschafft?;Seriously, did you really manage that?;Серьёзно, ты правда это сделал?;Nomen, m.;b1 communication
die Ernte, die Ernten;harvest;урожай;In diesem Herbst war die Ernte besonders gut.;This autumn the harvest was particularly good.;Этой осенью урожай был особенно хорошим.;Nomen, f.;b1 nature
der Ersatz;replacement;замена;Wir suchen noch einen Ersatz für das kaputte Teil.;We are still looking for a replacement for the broken part.;Мы всё ещё ищем замену сломанной детали.;Nomen, m.;b1 daily
die Erziehung;upbringing / education;воспитание;Eine gute Erziehung ist sehr wichtig.;A good upbringing is very important.;Хорошее воспитание очень важно.;Nomen, f.;b1 family
die Fabrik, die Fabriken;factory;фабрика / завод;In dieser Fabrik werden Autos gebaut.;Cars are built in this factory.;На этом заводе собирают автомобили.;Nomen, f.;b1 work
das Fach, die Fächer;subject / compartment;предмет / полка;Mathematik ist mein Lieblingsfach.;Mathematics is my favorite subject.;Математика — мой любимый предмет.;Nomen, n.;b1 study
die Fahrt, die Fahrten;ride / journey;поездка;Die Fahrt dauert ungefähr zwei Stunden.;The ride takes about two hours.;Поездка длится около двух часов.;Nomen, f.;b1 travel
das Fahrzeug, die Fahrzeuge;vehicle;транспортное средство;Alle Fahrzeuge müssen hier langsam fahren.;All vehicles must drive slowly here.;Все транспортные средства должны ехать здесь медленно.;Nomen, n.;b1 travel
der Fall, die Fälle;case / fall;случай / падение;Auf jeden Fall komme ich mit.;In any case I am coming along.;В любом случае я пойду с вами.;Nomen, m.;b1 daily
die Farbe, die Farben;color;цвет;Welche Farbe gefällt dir am besten?;Which color do you like best?;Какой цвет тебе нравится больше всего?;Nomen, f.;b1 daily
der Fehler, die Fehler;mistake / error;ошибка;Aus Fehlern kann man viel lernen.;One can learn a lot from mistakes.;На ошибках можно многому научиться.;Nomen, m.;b1 study
die Feier, die Feiern;celebration / party;праздник / вечеринка;Wir laden dich herzlich zu unserer Feier ein.;We cordially invite you to our celebration.;Мы сердечно приглашаем тебя на наш праздник.;Nomen, f.;b1 people
der Feiertag, die Feiertage;public holiday;праздничный день;Am Feiertag bleiben alle Geschäfte geschlossen.;On a public holiday all shops remain closed.;В праздничный день все магазины закрыты.;Nomen, m.;b1 time
das Feld, die Felder;field;поле;Hinter dem Haus liegt ein großes Feld.;Behind the house lies a large field.;За домом находится большое поле.;Nomen, n.;b1 nature
die Ferien;school holidays / vacation;каникулы;In den Sommerferien fahren wir ans Meer.;During the summer holidays we go to the sea.;На летних каникулах мы едем на море.;Nomen, Pl.;b1 travel
das Fernsehen;television;телевидение;Abends schaue ich selten Fernsehen.;In the evening I rarely watch television.;Вечером я редко смотрю телевизор.;Nomen, n.;b1 media
das Fest, die Feste;festival / feast;праздник;In der Stadt findet ein großes Stadtfest statt.;A big city festival is taking place in town.;В городе проходит большой городской праздник.;Nomen, n.;b1 culture
das Feuer;fire;огонь;Wir machen am Abend ein kleines Feuer.;In the evening we will make a small fire.;Вечером мы разведём небольшой костёр.;Nomen, n.;b1 nature
die Feuerwehr, die Feuerwehren;fire brigade;пожарная служба;Die Feuerwehr war nach fünf Minuten da.;The fire brigade was there after five minutes.;Пожарная служба прибыла через пять минут.;Nomen, f.;b1 safety
die Firma, die Firmen;company / firm;фирма / компания;Sie arbeitet bei einer internationalen Firma.;She works at an international company.;Она работает в международной компании.;Nomen, f.;b1 work
die Fläche, die Flächen;area / surface;площадь / поверхность;Die Wohnung hat eine Fläche von achtzig Quadratmetern.;The apartment has an area of eighty square meters.;Площадь квартиры составляет восемьдесят квадратных метров.;Nomen, f.;b1 home
die Flasche, die Flaschen;bottle;бутылка;Bring bitte noch eine Flasche Wasser mit.;Please bring another bottle of water.;Принеси, пожалуйста, ещё одну бутылку воды.;Nomen, f.;b1 food
der Fleiß;diligence;усердие / прилежание;Mit Fleiß und Geduld erreicht man viel.;With diligence and patience one achieves much.;С усердием и терпением можно достичь многого.;Nomen, m.;b1 work
der Flug, die Flüge;flight;полёт / рейс;Der Flug nach Wien dauert eine Stunde.;The flight to Vienna takes one hour.;Перелёт в Вену длится один час.;Nomen, m.;b1 travel
die Forderung, die Forderungen;demand / claim;требование;Die Gewerkschaft stellte klare Forderungen.;The union made clear demands.;Профсоюз выдвинул чёткие требования.;Nomen, f.;b1 society
die Form, die Formen;form / shape;форма;Füllen Sie bitte das Formular in richtiger Form aus.;Please fill out the form in the proper format.;Заполните, пожалуйста, бланк по форме.;Nomen, f.;b1 daily
das Formular, die Formulare;form;бланк / анкета;Unterschreiben Sie bitte unten auf dem Formular.;Please sign at the bottom of the form.;Распишитесь, пожалуйста, внизу бланка.;Nomen, n.;b1 daily
die Frage, die Fragen;question;вопрос;Darf ich Ihnen eine kurze Frage stellen?;May I ask you a brief question?;Можно задать вам короткий вопрос?;Nomen, f.;b1 communication
die Freundschaft, die Freundschaften;friendship;дружба;Unsere Freundschaft hält schon seit der Schulzeit.;Our friendship has lasted since school days.;Наша дружба длится ещё со школьных времён.;Nomen, f.;b1 people
der Frieden;peace;мир;Alle Menschen wünschen sich Frieden.;All people wish for peace.;Все люди желают мира.;Nomen, m.;b1 society
die Frist, die Fristen;deadline;срок;Die Frist für die Bewerbung endet morgen.;The deadline for the application ends tomorrow.;Срок подачи заявки заканчивается завтра.;Nomen, f.;b1 work
die Frucht, die Früchte;fruit;плод / фрукт;Frische Früchte sind reich an Vitaminen.;Fresh fruits are rich in vitamins.;Свежие фрукты богаты витаминами.;Nomen, f.;b1 food
der Führerschein, die Führerscheine;driver’s license;водительские права;Sie hat endlich ihren Führerschein bestanden.;She finally passed her driver’s license test.;Она наконец сдала на водительские права.;Nomen, m.;b1 travel
die Führung, die Führungen;guided tour / leadership;экскурсия / руководство;Um elf Uhr beginnt die Führung durch das Schloss.;At eleven o’clock the guided tour of the castle begins.;В одиннадцать часов начинается экскурсия по замку.;Nomen, f.;b1 travel
der Fuß, die Füße;foot;нога / ступня;Wir gehen heute zu Fuß ins Zentrum.;Today we are walking to the center on foot.;Сегодня мы идём в центр пешком.;Nomen, m.;b1 body
der Gang, die Gänge;hallway / course / gear;коридор / ход / передача;Der Gang ist ziemlich lang und schmal.;The hallway is quite long and narrow.;Коридор довольно длинный и узкий.;Nomen, m.;b1 home
der Garten, die Gärten;garden;сад;Im Garten blühen viele bunte Blumen.;Many colorful flowers bloom in the garden.;В саду цветёт много ярких цветов.;Nomen, m.;b1 home
das Gebäude, die Gebäude;building;здание;Dieses Gebäude wurde vor hundert Jahren gebaut.;This building was built a hundred years ago.;Это здание было построено сто лет назад.;Nomen, n.;b1 city
das Gebiet, die Gebiete;area / region / field;область / район;In diesem Gebiet darf man nicht bauen.;Building is not allowed in this area.;В этом районе запрещено строить.;Nomen, n.;b1 geography
das Gebirge, die Gebirge;mountain range;горы / горный массив;Wir machen Urlaub im Gebirge.;We are spending our vacation in the mountains.;Мы проводим отпуск в горах.;Nomen, n.;b1 nature
der Gebrauch;use / usage;использование;Vor Gebrauch die Flasche gut schütteln.;Shake the bottle well before use.;Перед употреблением хорошо взболтать бутылку.;Nomen, m.;b1 daily
die Geburt, die Geburten;birth;рождение;Nach der Geburt ihres Kindes blieb sie zu Hause.;After the birth of her child she stayed at home.;После рождения ребёнка она осталась дома.;Nomen, f.;b1 family
der Geburtstag, die Geburtstage;birthday;день рождения;Herzlichen Glückwunsch zum Geburtstag!;Happy birthday!;С днём рождения!;Nomen, m.;b1 people
der Gedanke, die Gedanken;thought;мысль;Das ist ein sehr interessanter Gedanke.;That is a very interesting thought.;Это очень интересная мысль.;Nomen, m.;b1 daily
das Gefängnis, die Gefängnisse;prison;тюрьма;Der Verbrecher musste ins Gefängnis.;The criminal had to go to prison.;Преступнику пришлось отправиться в тюрьму.;Nomen, n.;b1 society
das Gegenteil;opposite;противоположность;Er tat genau das Gegenteil.;He did the exact opposite.;Он сделал ровно противоположное.;Nomen, n.;b1 daily
die Gegend, die Gegenden;area / neighborhood;окрестность / местность;Die Gegend hier ist sehr ruhig und grün.;The area here is very quiet and green.;Местность здесь очень тихая и зелёная.;Nomen, f.;b1 city
das Geheimnis, die Geheimnisse;secret;секрет / тайна;Kannst du ein Geheimnis für dich behalten?;Can you keep a secret?;Ты умеешь хранить секреты?;Nomen, n.;b1 people
das Gehirn, die Gehirne;brain;мозг;Schlaf ist wichtig für das Gehirn.;Sleep is important for the brain.;Сон важен для мозга.;Nomen, n.;b1 health
die Gebühr, die Gebühren;fee;сбор / пошлина;Für die Überweisung fällt keine Gebühr an.;There is no fee for the bank transfer.;За перевод комиссия не взимается.;Nomen, f.;b1 finance
das Gemüse;vegetables;овощи;Ich kaufe frisches Gemüse auf dem Wochenmarkt.;I buy fresh vegetables at the weekly market.;Я покупаю свежие овощи на еженедельном рынке.;Nomen, n.;b1 food
das Gericht, die Gerichte;court / dish;суд / блюдо;Welches Gericht möchtest du bestellen?;Which dish would you like to order?;Какое блюдо ты хочешь заказать?;Nomen, n.;b1 food
der Geruch, die Gerüche;smell / odor;запах;Aus der Küche kommt ein herrlicher Geruch.;A wonderful smell is coming from the kitchen.;Из кухни доносится чудесный запах.;Nomen, m.;b1 daily
das Gerücht, die Gerüchte;rumor;слух;Glaub nicht jedem Gerücht.;Do not believe every rumor.;Не верь каждому слуху.;Nomen, n.;b1 communication
die Geschichte, die Geschichten;story / history;история / рассказ;Mein Opa erzählt immer spannende Geschichten.;My grandpa always tells exciting stories.;Мой дедушка всегда рассказывает увлекательные истории.;Nomen, f.;b1 culture
das Geschirr;dishes;посуда;Nach dem Essen spülen wir das Geschirr.;After the meal we wash the dishes.;После еды мы моем посуду.;Nomen, n.;b1 home
die Geschwindigkeit, die Geschwindigkeiten;speed;скорость;Hier beträgt die maximale Geschwindigkeit fünfzig.;Here the maximum speed is fifty.;Здесь максимальная скорость пятьдесят.;Nomen, f.;b1 travel
das Gesicht, die Gesichter;face;лицо;Sie hat ein sehr freundliches Gesicht.;She has a very friendly face.;У неё очень дружелюбное лицо.;Nomen, n.;b1 body
das Gespräch, die Gespräche;conversation;разговор / беседа;Wir hatten ein angenehmes Gespräch.;We had a pleasant conversation.;У нас состоялся приятный разговор.;Nomen, n.;b1 communication
die Gestalt, die Gestalten;figure / shape;фигура / образ;Im Nebel sah man eine dunkle Gestalt.;In the fog one saw a dark figure.;В тумане виднелась тёмная фигура.;Nomen, f.;b1 daily
die Gewalt;violence / force;насилие / сила;Gewalt ist niemals eine Lösung.;Violence is never a solution.;Насилие никогда не бывает решением.;Nomen, f.;b1 society
das Gewicht, die Gewichte;weight;вес;Das Paket hat ein Gewicht von fünf Kilo.;The package has a weight of five kilos.;Вес посылки составляет пять килограммов.;Nomen, n.;b1 daily
der Gewinn, die Gewinne;profit / prize;прибыль / выигрыш;Das Unternehmen machte dieses Jahr guten Gewinn.;The company made a good profit this year.;Компания получила хорошую прибыль в этом году.;Nomen, m.;b1 finance
das Gewissen;conscience;совесть;Ich habe ein ruhiges Gewissen.;I have a clear conscience.;Моя совесть чиста.;Nomen, n.;b1 feelings
das Gewitter, die Gewitter;thunderstorm;гроза;Im Sommer gibt es oft plötzliche Gewitter.;In summer there are often sudden thunderstorms.;Летом часто бывают внезапные грозы.;Nomen, n.;b1 nature
das Gift, die Gifte;poison;яд;Manche Pilze enthalten gefährliches Gift.;Some mushrooms contain dangerous poison.;Некоторые грибы содержат опасный яд.;Nomen, n.;b1 nature
der Glaube;faith / belief;вера;Der Glaube gibt vielen Menschen Kraft.;Faith gives many people strength.;Вера даёт многим людям силы.;Nomen, m.;b1 culture
das Glück;luck / happiness;счастье / удача;Viel Glück bei deinem neuen Job!;Good luck with your new job!;Удачи на новой работе!;Nomen, n.;b1 feelings
die Grenze, die Grenzen;border / limit;граница / предел;An der Grenze gibt es manchmal Kontrollen.;At the border there are sometimes checks.;На границе иногда бывают проверки.;Nomen, f.;b1 travel
die Größe, die Größen;size / height;размер / рост;Haben Sie diese Jacke auch in Größe M?;Do you also have this jacket in size M?;У вас есть эта куртка в размере M?;Nomen, f.;b1 shopping
die Gruppe, die Gruppen;group;группа;Wir arbeiten heute in kleinen Gruppen.;Today we are working in small groups.;Сегодня мы работаем в маленьких группах.;Nomen, f.;b1 study
der Gruß, die Grüße;greeting;привет / приветствие;Viele Grüße aus München!;Warm greetings from Munich!;Большой привет из Мюнхена!;Nomen, m.;b1 communication
der Hafen, die Häfen;harbor / port;порт / гавань;Im Hafen liegen viele große Schiffe.;Many large ships lie in the harbor.;В порту стоит много больших кораблей.;Nomen, m.;b1 travel
die Hälfte, die Hälften;half;половина;Die Hälfte der Arbeit ist schon erledigt.;Half of the work is already done.;Половина работы уже сделана.;Nomen, f.;b1 daily
der Hals, die Hälse;neck / throat;шея / горло;Mein Hals tut beim Schlucken weh.;My throat hurts when swallowing.;У меня болит горло при глотании.;Nomen, m.;b1 health
die Haltung;posture / attitude;осанка / позиция;Eine aufrechte Haltung schont den Rücken.;An upright posture protects the back.;Прямая осанка бережёт спину.;Nomen, f.;b1 health
der Hammer, die Hämmer;hammer;молоток;Gib mir bitte kurz den Hammer.;Please hand me the hammer briefly.;Дай мне, пожалуйста, ненадолго молоток.;Nomen, m.;b1 home
der Handel;trade / commerce;торговля;Der Online-Handel wächst jedes Jahr.;Online trade grows every year.;Онлайн-торговля растёт каждый год.;Nomen, m.;b1 finance
die Handlung, die Handlungen;plot / action;действие / сюжет;Die Handlung des Romans ist sehr spannend.;The plot of the novel is very exciting.;Сюжет романа очень увлекательный.;Nomen, f.;b1 culture
die Haut;skin;кожа;Im Sommer muss man die Haut vor Sonne schützen.;In summer you must protect your skin from the sun.;Летом нужно защищать кожу от солнца.;Nomen, f.;b1 health
die Heimat;homeland;родина;Ich vermisse manchmal meine Heimat.;I sometimes miss my homeland.;Я иногда скучаю по своей родине.;Nomen, f.;b1 people
die Heirat;marriage / wedding;брак / женитьба;Nach der Heirat zogen sie nach Köln.;After the marriage they moved to Cologne.;После свадьбы они переехали в Кёльн.;Nomen, f.;b1 family
der Herbst;autumn / fall;осень;Im Herbst fallen die bunten Blätter.;In autumn the colorful leaves fall.;Осенью опадают разноцветные листья.;Nomen, m.;b1 nature
die Herkunft;origin;происхождение;Die Herkunft des Wortes ist lateinisch.;The origin of the word is Latin.;Происхождение этого слова — латинское.;Nomen, f.;b1 study
der Herr, die Herren;gentleman / sir;господин;Guten Tag, meine Damen und Herren!;Good day, ladies and gentlemen!;Добрый день, дамы и господа!;Nomen, m.;b1 people
das Herz, die Herzen;heart;сердце;Sie hat ein sehr großes Herz.;She has a very big heart.;У неё очень доброе сердце.;Nomen, n.;b1 body
das Hindernis, die Hindernisse;obstacle;препятствие;Wir haben alle Hindernisse überwunden.;We overcame all obstacles.;Мы преодолели все препятствия.;Nomen, n.;b1 daily
der Hinweis, die Hinweise;hint / note / tip;указание / подсказка;Vielen Dank für den nützlichen Hinweis.;Thank you very much for the useful tip.;Большое спасибо за полезную подсказку.;Nomen, m.;b1 communication
die Hitze;heat;жара;Bei dieser Hitze bleibe ich lieber im Schatten.;In this heat I prefer to stay in the shade.;В такую жару я лучше останусь в тени.;Nomen, f.;b1 nature
die Höhe, die Höhen;height / altitude;высота;Das Flugzeug fliegt in zehn Kilometern Höhe.;The airplane flies at an altitude of ten kilometers.;Самолёт летит на высоте десяти километров.;Nomen, f.;b1 travel
das Holz, die Hölzer;wood;дерево / древесина;Der Tisch ist aus echtem Holz.;The table is made of real wood.;Стол сделан из настоящего дерева.;Nomen, n.;b1 home
der Hügel, die Hügel;hill;холм;Hinter dem Dorf liegt ein kleiner Hügel.;Behind the village lies a small hill.;За деревней находится небольшой холм.;Nomen, m.;b1 nature
der Humor;humor;юмор;Er hat einen tollen Sinn für Humor.;He has a great sense of humor.;У него отличное чувство юмора.;Nomen, m.;b1 people
der Hunger;hunger;голод;Nach dem langen Spaziergang habe ich großen Hunger.;After the long walk I am very hungry.;После долгой прогулки я очень голоден.;Nomen, m.;b1 food
die Idee, die Ideen;idea;идея;Das ist wirklich eine hervorragende Idee!;That is really an excellent idea!;Это действительно отличная идея!;Nomen, f.;b1 daily
der Inhalt, die Inhalte;content;содержание;Der Inhalt des Buches ist leicht verständlich.;The content of the book is easy to understand.;Содержание книги легко понять.;Nomen, m.;b1 study
die Insel, die Inseln;island;остров;Wir verbringen unseren Urlaub auf einer Insel.;We spend our vacation on an island.;Мы проводим отпуск на острове.;Nomen, f.;b1 geography
das Interesse, die Interessen;interest;интерес;Ich habe großes Interesse an Kunst.;I have great interest in art.;У меня большой интерес к искусству.;Nomen, n.;b1 daily
der Irrtum, die Irrtümer;error / mistake;ошибка / заблуждение;Da liegt leider ein Irrtum vor.;There is unfortunately an error here.;Здесь, к сожалению, произошла ошибка.;Nomen, m.;b1 daily
die Jugend;youth;молодёжь / юность;In meiner Jugend habe ich viel Fußball gespielt.;In my youth I played a lot of football.;В юности я много играл в футбол.;Nomen, f.;b1 people
der Junge, die Jungen;boy;мальчик;Der Junge lernt gerade Fahrrad fahren.;The boy is currently learning to ride a bike.;Мальчик сейчас учится кататься на велосипеде.;Nomen, m.;b1 people
die Kälte;cold;холод;Gegen die Kälte helfen ein Schal und Handschuhe.;A scarf and gloves help against the cold.;От холода помогают шарф и перчатки.;Nomen, f.;b1 nature
die Kamera, die Kameras;camera;камера / фотоаппарат;Die Kamera macht sehr scharfe Fotos.;The camera takes very sharp photos.;Камера делает очень чёткие снимки.;Nomen, f.;b1 tech
der Kampf, die Kämpfe;fight / struggle;борьба / бой;Der Kampf gegen Plastikmüll geht weiter.;The fight against plastic waste continues.;Борьба с пластиковым мусором продолжается.;Nomen, m.;b1 society
der Kanal, die Kanäle;channel / canal;канал;Auf welchem Kanal läuft das Spiel?;On which channel is the game airing?;По какому каналу идёт игра?;Nomen, m.;b1 media
die Kasse, die Kassen;cash register / checkout;касса;An der Kasse steht eine lange Schlange.;There is a long line at the checkout.;У кассы стоит длинная очередь.;Nomen, f.;b1 shopping
die Katastrophe, die Katastrophen;catastrophe / disaster;катастрофа;Das Erdbeben war eine schreckliche Katastrophe.;The earthquake was a terrible catastrophe.;Землетрясение стало ужасной катастрофой.;Nomen, f.;b1 society
der Kauf, die Käufe;purchase;покупка;Herzlichen Glückwunsch zum Kauf des neuen Autos!;Congratulations on buying the new car!;Поздравляю с покупкой новой машины!;Nomen, m.;b1 shopping
der Keller, die Keller;basement / cellar;подвал;Die Fahrräder stehen unten im Keller.;The bicycles are downstairs in the basement.;Велосипеды стоят внизу в подвале.;Nomen, m.;b1 home
der Kellner, die Kellner;waiter;официант;Der Kellner bringt uns die Speisekarte.;The waiter brings us the menu.;Официант приносит нам меню.;Nomen, m.;b1 food
die Kenntnis, die Kenntnisse;knowledge;знание;Gute Deutschkenntnisse sind für den Job wichtig.;Good German skills are important for the job.;Хорошее знание немецкого важно для этой работы.;Nomen, f.;b1 work
die Kette, die Ketten;chain / necklace;цепь / ожерелье;Sie trägt eine silberne Kette.;She is wearing a silver necklace.;На ней серебряная цепочка.;Nomen, f.;b1 clothes
das Kino, die Kinos;cinema;кинотеатр;Gehen wir heute Abend ins Kino?;Shall we go to the cinema tonight?;Пойдём сегодня вечером в кино?;Nomen, n.;b1 culture
die Kirche, die Kirchen;church;церковь;Die alte Kirche steht mitten auf dem Platz.;The old church stands in the middle of the square.;Старая церковь стоит посреди площади.;Nomen, f.;b1 city
die Klage, die Klagen;complaint / lawsuit;жалоба / иск;Seine ständigen Klagen nerven mich.;His constant complaints annoy me.;Его постоянные жалобы меня раздражают.;Nomen, f.;b1 communication
der Klang, die Klänge;sound / tone;звук / звучание;Die Gitarre hat einen warmen Klang.;The guitar has a warm sound.;У гитары тёплое звучание.;Nomen, m.;b1 culture
die Klasse, die Klassen;class / grade;класс;In meiner Klasse sind zwanzig Schüler.;There are twenty students in my class.;В моём классе двадцать учеников.;Nomen, f.;b1 study
das Kleid, die Kleider;dress;платье;Sie kauft sich ein neues Kleid für die Party.;She is buying a new dress for the party.;Она покупает себе новое платье для вечеринки.;Nomen, n.;b1 clothes
die Kleidung;clothing;одежда;Im Winter braucht man warme Kleidung.;In winter you need warm clothing.;Зимой нужна тёплая одежда.;Nomen, f.;b1 clothes
das Knie, die Knie;knee;колено;Beim Laufen schmerzt mein rechtes Knie.;When running my right knee hurts.;При беге у меня болит правое колено.;Nomen, n.;b1 health
der Knochen, die Knochen;bone;кость;Zum Glück ist kein Knochen gebrochen.;Luckily no bone is broken.;К счастью, ни одна кость не сломана.;Nomen, m.;b1 health
der Knopf, die Knöpfe;button;пуговица / кнопка;Drück bitte auf den grünen Knopf.;Please press the green button.;Нажми, пожалуйста, на зелёную кнопку.;Nomen, m.;b1 daily
der Koch, die Köche;cook / chef;повар;Der Koch bereitet eine frische Suppe zu.;The chef is preparing a fresh soup.;Повар готовит свежий суп.;Nomen, m.;b1 food
der Koffer, die Koffer;suitcase;чемодан;Ich muss heute Abend noch meinen Koffer packen.;I still have to pack my suitcase tonight.;Мне ещё нужно сегодня вечером собрать чемодан.;Nomen, m.;b1 travel
die Konkurrenz;competition;конкуренция;Die Konkurrenz auf dem Markt ist groß.;Competition on the market is strong.;Конкуренция на рынке велика.;Nomen, f.;b1 business
der Kontakt, die Kontakte;contact;контакт;Wir bleiben auf jeden Fall in Kontakt.;We will definitely stay in touch.;Мы обязательно останемся на связи.;Nomen, m.;b1 communication
die Kontrolle, die Kontrollen;check / control;контроль / проверка;Die Fahrkartenkontrolle dauert nur kurz.;The ticket inspection takes only a moment.;Проверка билетов длится совсем недолго.;Nomen, f.;b1 travel
das Konzert, die Konzerte;concert;концерт;Das Konzert beginnt pünktlich um zwanzig Uhr.;The concert starts promptly at eight p.m.;Концерт начинается ровно в восемь вечера.;Nomen, n.;b1 culture
der Körper, die Körper;body;тело;Sport hält den Körper fit.;Sports keep the body fit.;Спорт поддерживает тело в форме.;Nomen, m.;b1 health
die Kosten;costs / expenses;расходы / стоимость;Die Firma übernimmt alle Reisekosten.;The company covers all travel costs.;Компания берёт на себя все командировочные расходы.;Nomen, Pl.;b1 finance
die Kraft, die Kräfte;strength / power;сила;Nach dem Urlaub habe ich wieder neue Kraft.;After the vacation I have new strength again.;После отпуска у меня снова появились силы.;Nomen, f.;b1 health
das Krankenhaus, die Krankenhäuser;hospital;больница;Er liegt seit gestern im Krankenhaus.;He has been in the hospital since yesterday.;Он со вчерашнего дня лежит в больнице.;Nomen, n.;b1 health
die Krankheit, die Krankheiten;illness / disease;болезнь;Diese Krankheit lässt sich gut behandeln.;This disease can be treated well.;Эта болезнь хорошо поддаётся лечению.;Nomen, f.;b1 health
der Kredit, die Kredite;loan / credit;кредит;Für den Hauskauf brauchen wir einen Kredit.;To buy the house we need a loan.;Для покупки дома нам нужен кредит.;Nomen, m.;b1 finance
der Kreis, die Kreise;circle / district;круг / округ;Die Kinder sitzen im Kreis auf dem Teppich.;The children sit in a circle on the carpet.;Дети сидят в кругу на ковре.;Nomen, m.;b1 daily
der Krieg, die Kriege;war;война;Viele Menschen fliehen vor dem Krieg.;Many people are fleeing from the war.;Многие люди бегут от войны.;Nomen, m.;b1 society
die Krise, die Krisen;crisis;кризис;Gemeinsam überstehen wir diese Krise.;Together we will get through this crisis.;Вместе мы переживём этот кризис.;Nomen, f.;b1 society
der Kühlschrank, die Kühlschränke;refrigerator;холодильник;Die Milch steht oben im Kühlschrank.;The milk is at the top of the refrigerator.;Молоко стоит наверху в холодильнике.;Nomen, m.;b1 home
der Kunde, die Kunden;customer / client;клиент / покупатель;Der Kunde steht bei uns immer im Mittelpunkt.;The customer is always our focus.;Клиент у нас всегда в центре внимания.;Nomen, m.;b1 business
die Kunst, die Künste;art;искусство;Moderne Kunst gefällt nicht jedem.;Modern art does not appeal to everyone.;Современное искусство нравится не всем.;Nomen, f.;b1 culture
der Künstler, die Künstler;artist;художник / артист;Der Künstler stellt seine Werke in Berlin aus.;The artist exhibits his works in Berlin.;Художник выставляет свои работы в Берлине.;Nomen, m.;b1 culture
die Küste, die Küsten;coast;побережье;An der Küste weht oft ein starker Wind.;On the coast a strong wind often blows.;На побережье часто дует сильный ветер.;Nomen, f.;b1 geography
das Lächeln;smile;улыбка;Ein freundliches Lächeln kostet nichts.;A friendly smile costs nothing.;Дружелюбная улыбка ничего не стоит.;Nomen, n.;b1 people
das Lager, die Lager;camp / warehouse;лагерь / склад;Die Ware liegt bereits im Lager.;The goods are already in the warehouse.;Товар уже лежит на складе.;Nomen, n.;b1 business
die Lampe, die Lampen;lamp;лампа;Mach bitte die Lampe auf dem Schreibtisch an.;Please turn on the lamp on the desk.;Включи, пожалуйста, лампу на письменном столе.;Nomen, f.;b1 home
das Land, die Länder;country / countryside;страна / сельская местность;Welches Land möchtest du gern besuchen?;Which country would you like to visit?;Какую страну ты хотел бы посетить?;Nomen, n.;b1 geography
die Langeweile;boredom;скука;Im Zug hatte ich ein bisschen Langeweile.;On the train I felt a bit bored.;В поезде мне было немного скучно.;Nomen, f.;b1 feelings
die Last, die Lasten;burden / load;груз / бремя;Diese Verantwortung ist eine schwere Last.;This responsibility is a heavy burden.;Эта ответственность — тяжёлое бремя.;Nomen, f.;b1 daily
der Lauf;course / run;ход / бег;Im Lauf der Zeit wird vieles klarer.;In the course of time many things become clearer.;Со временем многое становится яснее.;Nomen, m.;b1 time
die Laune, die Launen;mood;настроение;Heute hat er besonders gute Laune.;Today he is in a particularly good mood.;Сегодня у него особенно хорошее настроение.;Nomen, f.;b1 feelings
das Leben;life;жизнь;Das Leben in einer Großstadt ist aufregend.;Life in a big city is exciting.;Жизнь в большом городе увлекательна.;Nomen, n.;b1 daily
die Lebensqualität;quality of life;качество жизни;Saubere Luft verbessert die Lebensqualität.;Clean air improves the quality of life.;Чистый воздух улучшает качество жизни.;Nomen, f.;b1 society
das Leder;leather;кожа (материал);Die Schuhe sind aus weichem Leder.;The shoes are made of soft leather.;Туфли сделаны из мягкой кожи.;Nomen, n.;b1 clothes
der Lehrer, die Lehrer;teacher;учитель;Unser Lehrer erklärt die Grammatik sehr gut.;Our teacher explains grammar very well.;Наш учитель очень хорошо объясняет грамматику.;Nomen, m.;b1 study
die Leitung, die Leitungen;management / line / pipe;руководство / линия / труба;Die neue Leitung führt das Team sehr gut.;The new management leads the team very well.;Новое руководство очень хорошо управляет командой.;Nomen, f.;b1 work
die Liebe;love;любовь;Liebe und Vertrauen gehören zusammen.;Love and trust belong together.;Любовь и доверие неразделимы.;Nomen, f.;b1 feelings
das Lied, die Lieder;song;песня;Dieses Lied höre ich jeden Tag.;I listen to this song every day.;Я слушаю эту песню каждый день.;Nomen, n.;b1 culture
die Lieferung, die Lieferungen;delivery;доставка;Die Lieferung erfolgt innerhalb von drei Tagen.;Delivery takes place within three days.;Доставка осуществляется в течение трёх дней.;Nomen, f.;b1 shopping
die Liste, die Listen;list;список;Schreib alles auf die Einkaufsliste.;Write everything on the shopping list.;Запиши всё в список покупок.;Nomen, f.;b1 daily
das Loch, die Löcher;hole;дыра / отверстие;In meiner Socke ist ein kleines Loch.;There is a small hole in my sock.;В моём носке маленькая дырка.;Nomen, n.;b1 daily
der Lohn, die Löhne;wage / salary;зарплата;Der Lohn wird am Ende des Monats überwiesen.;The wage is transferred at the end of the month.;Зарплата переводится в конце месяца.;Nomen, m.;b1 work
die Lüge, die Lügen;lie;ложь;Eine Lüge kommt meistens schnell heraus.;A lie usually comes out quickly.;Ложь обычно быстро раскрывается.;Nomen, f.;b1 people
die Lust;desire / mood;желание / охота;Hast du Lust auf einen Spaziergang?;Do you feel like going for a walk?;Хочешь пойти прогуляться?;Nomen, f.;b1 feelings
die Macht, die Mächte;power / might;власть / сила;Wissen ist Macht.;Knowledge is power.;Знание — сила.;Nomen, f.;b1 society
das Mädchen, die Mädchen;girl;девочка / девушка;Das Mädchen spielt Klavier.;The girl plays the piano.;Девочка играет на пианино.;Nomen, n.;b1 people
der Magen, die Mägen;stomach;желудок;Nach dem schweren Essen schmerzt mein Magen.;After the heavy meal my stomach hurts.;После тяжёлой еды у меня болит желудок.;Nomen, m.;b1 health
die Mahlzeit, die Mahlzeiten;meal;приём пищи;Wir essen drei warme Mahlzeiten pro Woche zusammen.;We eat three warm meals together per week.;Мы едим три горячих блюда вместе в неделю.;Nomen, f.;b1 food
der Mantel, die Mäntel;coat;пальто;Im Schrank hängt mein blauer Wintermantel.;My blue winter coat hangs in the closet.;В шкафу висит моё синее зимнее пальто.;Nomen, m.;b1 clothes
die Marke, die Marken;brand / stamp;марка / бренд;Welche Automarke fährst du?;Which car brand do you drive?;На какой марке машины ты ездишь?;Nomen, f.;b1 shopping
der Markt, die Märkte;market;рынок;Samstags gehen wir gern auf den Markt.;On Saturdays we like to go to the market.;По субботам мы любим ходить на рынок.;Nomen, m.;b1 shopping
die Maschine, die Maschinen;machine / plane;машина / самолёт;Die Maschine nach Paris startet pünktlich.;The plane to Paris takes off on time.;Самолёт в Париж вылетает вовремя.;Nomen, f.;b1 tech
das Maß, die Maße;measure / dimension;мера / размер;Alles sollte im richtigen Maß bleiben.;Everything should remain in the right measure.;Во всём должна быть мера.;Nomen, n.;b1 daily
die Masse, die Massen;mass / crowd;масса / толпа;Die Masse der Besucher war begeistert.;The crowd of visitors was thrilled.;Толпа посетителей была в восторге.;Nomen, f.;b1 society
die Mauer, die Mauern;wall;стена (каменная);Um den Garten steht eine alte Steinmauer.;Around the garden stands an old stone wall.;Вокруг сада стоит старая каменная стена.;Nomen, f.;b1 city
die Mehrheit;majority;большинство;Die Mehrheit hat für den Vorschlag gestimmt.;The majority voted for the proposal.;Большинство проголосовало за предложение.;Nomen, f.;b1 society
die Menge, die Mengen;amount / crowd;количество / толпа;Wir haben noch eine Menge Arbeit vor uns.;We still have a lot of work ahead of us.;У нас впереди ещё куча работы.;Nomen, f.;b1 daily
der Mensch, die Menschen;human / person;человек;Jeder Mensch braucht Respekt.;Every person needs respect.;Каждый человек нуждается в уважении.;Nomen, m.;b1 people
die Mitte;middle / center;середина;Wir treffen uns in der Mitte der Straße.;We will meet in the middle of the street.;Мы встретимся посередине улицы.;Nomen, f.;b1 daily
das Mittel, die Mittel;means / remedy;средство;Dieses Mittel hilft schnell gegen Kopfschmerzen.;This remedy helps quickly against headaches.;Это средство быстро помогает от головной боли.;Nomen, n.;b1 health
das Mitglied, die Mitglieder;member;член (организации);Er ist Mitglied in einem Sportverein.;He is a member of a sports club.;Он состоит в спортивном клубе.;Nomen, n.;b1 society
die Mode, die Moden;fashion;мода;Mode ändert sich fast jede Saison.;Fashion changes almost every season.;Мода меняется почти каждый сезон.;Nomen, f.;b1 clothes
der Moment, die Momente;moment;момент;Warte bitte einen kurzen Moment.;Please wait a brief moment.;Подожди, пожалуйста, минутку.;Nomen, m.;b1 time
der Mond, die Monde;moon;луна;Heute Nacht scheint der Mond sehr hell.;Tonight the moon is shining very brightly.;Сегодня ночью луна светит очень ярко.;Nomen, m.;b1 nature
der Motor, die Motoren;engine / motor;мотор / двигатель;Der Motor des Wagens läuft sehr leise.;The engine of the car runs very quietly.;Двигатель машины работает очень тихо.;Nomen, m.;b1 tech
die Mühe, die Mühen;effort / trouble;усилие / труд;Vielen Dank für Ihre große Mühe!;Thank you very much for your great effort!;Большое спасибо за ваши старания!;Nomen, f.;b1 work
der Mund, die Münder;mouth;рот;Beim Zahnarzt muss man den Mund weit öffnen.;At the dentist you have to open your mouth wide.;У стоматолога нужно широко открыть рот.;Nomen, m.;b1 body
die Münze, die Münzen;coin;монета;Hast du eine Münze für den Einkaufswagen?;Do you have a coin for the shopping cart?;У тебя есть монета для тележки?;Nomen, f.;b1 finance
das Museum, die Museen;museum;музей;Am Sonntag ist der Eintritt ins Museum frei.;On Sunday admission to the museum is free.;В воскресенье вход в музей бесплатный.;Nomen, n.;b1 culture
der Mut;courage;смелость / мужество;Für diesen Schritt braucht man viel Mut.;For this step one needs a lot of courage.;Для этого шага нужно много смелости.;Nomen, m.;b1 feelings
die Nachbarin, die Nachbarinnen;neighbor (female);соседка;Unsere Nachbarin gießt im Urlaub die Blumen.;Our neighbor waters the flowers while we are on vacation.;Наша соседка поливает цветы, пока мы в отпуске.;Nomen, f.;b1 people
der Nachmittag, die Nachmittage;afternoon;вторая половина дня;Am Nachmittag trinke ich gern einen Kaffee.;In the afternoon I like to drink a coffee.;Во второй половине дня я люблю выпить кофе.;Nomen, m.;b1 time
die Nähe;proximity / vicinity;близость;Der Bahnhof liegt ganz in der Nähe.;The train station is very close by.;Вокзал находится совсем рядом.;Nomen, f.;b1 city
der Name, die Namen;name;имя / фамилия;Wie ist Ihr vollständiger Name?;What is your full name?;Как ваше полное имя?;Nomen, m.;b1 people
die Nase, die Nasen;nose;нос;Bei Erkältung ist die Nase oft verstopft.;With a cold the nose is often blocked.;При простуде нос часто заложен.;Nomen, f.;b1 health
der Nebel;fog;туман;Wegen des dichten Nebels sieht man kaum etwas.;Because of the dense fog one can hardly see anything.;Из-за густого тумана почти ничего не видно.;Nomen, m.;b1 nature
das Netz, die Netze;net / network;сеть;Ich habe hier leider kein mobiles Netz.;Unfortunately I have no mobile network here.;У меня здесь, к сожалению, нет мобильной сети.;Nomen, n.;b1 tech
die Neugier;curiosity;любопытство;Aus reiner Neugier habe ich nachgefragt.;Out of pure curiosity I asked.;Из чистого любопытства я спросил.;Nomen, f.;b1 feelings
die Norm, die Normen;standard / norm;норма / стандарт;Diese Qualität entspricht der europäischen Norm.;This quality meets the European standard.;Это качество соответствует европейскому стандарту.;Nomen, f.;b1 work
die Not;need / distress;нужда / беда;In der Not helfen echte Freunde immer.;In times of need true friends always help.;В беде настоящие друзья всегда помогают.;Nomen, f.;b1 people
der Notfall, die Notfälle;emergency;экстренный случай;Im Notfall rufen Sie sofort die 112 an.;In an emergency call 112 immediately.;В экстренном случае немедленно звоните 112.;Nomen, m.;b1 safety
die Notiz, die Notizen;note;заметка;Ich mache mir während des Vortrags kurze Notizen.;I take brief notes during the lecture.;Во время лекции я делаю короткие заметки.;Nomen, f.;b1 study
die Oberfläche, die Oberflächen;surface;поверхность;Die Oberfläche des Tisches ist ganz glatt.;The surface of the table is completely smooth.;Поверхность стола совершенно гладкая.;Nomen, f.;b1 daily
das Obst;fruit;фрукты;Täglich frisches Obst zu essen ist gesund.;Eating fresh fruit daily is healthy.;Есть свежие фрукты каждый день полезно.;Nomen, n.;b1 food
die Öffentlichkeit;public;общественность;Die Öffentlichkeit wurde sofort informiert.;The public was informed immediately.;Общественность была немедленно проинформирована.;Nomen, f.;b1 society
das Ohr, die Ohren;ear;ухо;Mein linkes Ohr tut weh.;My left ear hurts.;У меня болит левое ухо.;Nomen, n.;b1 health
das Öl, die Öle;oil;масло / нефть;Zum Braten nehme ich Olivenöl.;For frying I use olive oil.;Для жарки я использую оливковое масло.;Nomen, n.;b1 food
das Opfer, die Opfer;victim / sacrifice;жертва;Die Hilfsorganisation unterstützt die Opfer.;The aid organization supports the victims.;Благотворительная организация помогает пострадавшим.;Nomen, n.;b1 society
der Ort, die Orte;place / town;место / населённый пункт;Dieser ruhige Ort gefällt mir sehr.;I like this quiet place very much.;Мне очень нравится это тихое место.;Nomen, m.;b1 geography
das Paket, die Pakete;package / parcel;посылка;Der Postbote hat ein großes Paket gebracht.;The postman brought a large package.;Почтальон принёс большую посылку.;Nomen, n.;b1 daily
das Papier, die Papiere;paper;бумага / документы;Bitte drucken Sie das Dokument auf Papier aus.;Please print the document on paper.;Распечатайте, пожалуйста, документ на бумаге.;Nomen, n.;b1 office
der Parkplatz, die Parkplätze;parking space;парковочное место;In der Innenstadt findet man schwer einen Parkplatz.;In the city center it is hard to find a parking space.;В центре города трудно найти парковочное место.;Nomen, m.;b1 city
die Partei, die Parteien;political party;партия;Welche Partei hat die Wahl gewonnen?;Which party won the election?;Какая партия победила на выборах?;Nomen, f.;b1 society
der Patient, die Patienten;patient;пациент;Der Arzt spricht mit dem Patienten.;The doctor is speaking with the patient.;Врач разговаривает с пациентом.;Nomen, m.;b1 health
das Pech;bad luck;невезение;So ein Pech, der Zug ist gerade weggefahren!;What bad luck, the train just left!;Какое невезение, поезд только что ушёл!;Nomen, n.;b1 daily
die Person, die Personen;person;человек / персона;Der Tisch ist für vier Personen reserviert.;The table is reserved for four people.;Столик забронирован на четверых.;Nomen, f.;b1 people
das Personal;staff / personnel;персонал;Das Personal im Hotel ist sehr hilfsbereit.;The staff at the hotel is very helpful.;Персонал в отеле очень отзывчивый.;Nomen, n.;b1 work
die Pflanze, die Pflanzen;plant;растение;Diese Pflanze braucht viel Licht und Wasser.;This plant needs a lot of light and water.;Этому растению нужно много света и воды.;Nomen, f.;b1 nature
die Pflege;care / nursing;уход / забота;Alte Menschen brauchen manchmal besondere Pflege.;Elderly people sometimes need special care.;Пожилым людям иногда нужен особый уход.;Nomen, f.;b1 health
der Plan, die Pläne;plan / schedule;план / расписание;Wir brauchen einen guten Plan für das Projekt.;We need a good plan for the project.;Нам нужен хороший план для проекта.;Nomen, m.;b1 work
der Platz, die Plätze;square / seat / space;площадь / место;Ist dieser Platz hier noch frei?;Is this seat here still free?;Это место здесь ещё свободно?;Nomen, m.;b1 daily
die Polizei;police;полиция;Die Polizei regelt heute den Verkehr.;The police are directing traffic today.;Полиция сегодня регулирует движение.;Nomen, f.;b1 society
die Post;post office / mail;почта;Ich bringe den Brief noch schnell zur Post.;I will quickly take the letter to the post office.;Я ещё быстро отнесу письмо на почту.;Nomen, f.;b1 daily
die Praxis, die Praxen;practice / doctor’s office;практика / кабинет врача;Die Praxis hat ab acht Uhr geöffnet.;The doctor’s office is open from eight o’clock.;Кабинет врача открыт с восьми часов.;Nomen, f.;b1 health
die Probe, die Proben;sample / rehearsal;проба / репетиция;Vor dem Konzert gibt es eine letzte Probe.;Before the concert there is one last rehearsal.;Перед концертом будет последняя репетиция.;Nomen, f.;b1 culture
das Produkt, die Produkte;product;продукт / товар;Wir kaufen am liebsten regionale Produkte.;We prefer to buy regional products.;Мы предпочитаем покупать местные продукты.;Nomen, n.;b1 shopping
das Programm, die Programme;program;программа;Das neue Computerprogramm läuft sehr stabil.;The new computer program runs very stably.;Новая компьютерная программа работает очень стабильно.;Nomen, n.;b1 tech
das Prozent, die Prozente;percent;процент;Die Preise sind um fünf Prozent gestiegen.;Prices have risen by five percent.;Цены выросли на пять процентов.;Nomen, n.;b1 finance
das Publikum;audience;публика / зрители;Das Publikum applaudierte begeistert.;The audience applauded enthusiastically.;Публика восторженно аплодировала.;Nomen, n.;b1 culture
der Punkt, die Punkte;point / dot;пункт / точка / балл;In diesem Punkt stimme ich dir voll zu.;On this point I fully agree with you.;В этом пункте я с тобой полностью согласен.;Nomen, m.;b1 communication
das Rad, die Räder;wheel / bicycle;колесо / велосипед;Ich fahre jeden Tag mit dem Rad zur Arbeit.;I ride my bicycle to work every day.;Я каждый день езжу на работу на велосипеде.;Nomen, n.;b1 travel
der Rand, die Ränder;edge / margin;край / обочина;Stell die Tasse nicht an den Rand des Tisches.;Do not put the cup on the edge of the table.;Не ставь чашку на край стола.;Nomen, m.;b1 daily
der Raum, die Räume;room / space;помещение / пространство;Der Raum bietet Platz für dreißig Personen.;The room offers space for thirty people.;Помещение вмещает тридцать человек.;Nomen, m.;b1 home
die Rede, die Reden;speech / talk;речь / выступление;Der Chef hielt eine kurze Rede.;The boss gave a short speech.;Начальник произнёс короткую речь.;Nomen, f.;b1 communication
die Regierung, die Regierungen;government;правительство;Die Regierung plant ein neues Gesetz.;The government is planning a new law.;Правительство планирует новый закон.;Nomen, f.;b1 society
der Reifen, die Reifen;tire;шина / покрышка;Vor dem Winter wechseln wir die Reifen.;Before winter we change the tires.;Перед зимой мы меняем шины.;Nomen, m.;b1 travel
die Reihe, die Reihen;row / series / turn;ряд / очередь / серия;Jetzt bist du an der Reihe!;Now it is your turn!;Теперь твоя очередь!;Nomen, f.;b1 daily
die Reinigung;cleaning;уборка / химчистка;Die Reinigung der Wohnung dauert zwei Stunden.;Cleaning the apartment takes two hours.;Уборка квартиры занимает два часа.;Nomen, f.;b1 home
das Reisebüro, die Reisebüros;travel agency;туристическое агентство;Wir haben die Reise im Reisebüro gebucht.;We booked the trip at the travel agency.;Мы забронировали поездку в турагентстве.;Nomen, n.;b1 travel
die Rekordzahl, die Rekordzahlen;record number;рекордное число;Die Messe zog eine Rekordzahl an Besuchern an.;The trade fair attracted a record number of visitors.;Выставка привлекла рекордное число посетителей.;Nomen, f.;b1 media
das Rezept, die Rezepte;recipe / prescription;рецепт;Für dieses Medikament braucht man ein Rezept.;For this medication you need a prescription.;Для этого лекарства нужен рецепт.;Nomen, n.;b1 health
die Richtung, die Richtungen;direction;направление;Wir gehen in die falsche Richtung.;We are going in the wrong direction.;Мы идём в неправильном направлении.;Nomen, f.;b1 travel
der Ring, die Ringe;ring;кольцо;Sie trägt einen goldenen Ring am Finger.;She wears a gold ring on her finger.;Она носит золотое кольцо на пальце.;Nomen, m.;b1 daily
die Rolle, die Rollen;role;роль;Er spielt in dem Film die Hauptrolle.;He plays the leading role in the film.;Он играет главную роль в этом фильме.;Nomen, f.;b1 culture
der Rücken, die Rücken;back;спина;Vom langen Sitzen tut mein Rücken weh.;From sitting so long my back hurts.;От долгого сидения у меня болит спина.;Nomen, m.;b1 health
die Rücksicht;consideration;внимание / учтивость;Bitte nehmen Sie Rücksicht auf die Nachbarn.;Please be considerate of the neighbors.;Пожалуйста, учитывайте интересы соседей.;Nomen, f.;b1 people
der Rundfunk;broadcasting / radio;радиовещание;Im Rundfunk lief heute eine gute Sendung.;A good program aired on the radio today.;По радио сегодня шла хорошая передача.;Nomen, m.;b1 media
die Sache, die Sachen;thing / matter;дело / вещь;Das ist eine ganz andere Sache.;That is a completely different matter.;Это совсем другое дело.;Nomen, f.;b1 daily
der Sack, die Säcke;sack / bag;мешок;Im Keller steht ein schwerer Sack Kartoffeln.;In the basement there is a heavy sack of potatoes.;В подвале стоит тяжёлый мешок картошки.;Nomen, m.;b1 home
der Saft, die Säfte;juice;сок;Zum Frühstück trinke ich gern Orangensaft.;For breakfast I like to drink orange juice.;На завтрак я люблю пить апельсиновый сок.;Nomen, m.;b1 food
der Saal, die Säle;hall;зал;Der große Saal war komplett ausverkauft.;The large hall was completely sold out.;Большой зал был полностью распродан.;Nomen, m.;b1 culture
der Sand;sand;песок;Die Kinder bauen eine Burg aus Sand.;The children are building a castle out of sand.;Дети строят замок из песка.;Nomen, m.;b1 nature
der Satz, die Sätze;sentence / rate / set;предложение / фраза;Bitte wiederholen Sie den letzten Satz.;Please repeat the last sentence.;Повторите, пожалуйста, последнее предложение.;Nomen, m.;b1 study
die Schachtel, die Schachteln;box / carton;коробка;Die Pralinen sind in einer schönen Schachtel.;The chocolates are in a nice box.;Конфеты лежат в красивой коробке.;Nomen, f.;b1 daily
der Schatten, die Schatten;shadow / shade;тень;Im Sommer suchen wir einen Platz im Schatten.;In summer we look for a spot in the shade.;Летом мы ищем место в тени.;Nomen, m.;b1 nature
der Schalter, die Schalter;counter / switch;окошко кассы / выключатель;Am Schalter bekommen Sie Ihre Fahrkarte.;At the counter you will get your ticket.;В кассе вы получите свой билет.;Nomen, m.;b1 travel
der Schein, die Scheine;banknote / certificate / glow;купюра / справка;Kann ich mit einem Fünfzig-Euro-Schein zahlen?;Can I pay with a fifty-euro bill?;Могу я заплатить купюрой в пятьдесят евро?;Nomen, m.;b1 finance
die Scheibe, die Scheiben;slice / pane / disc;ломтик / стекло;Ich nehme zwei Scheiben Käse aufs Brot.;I put two slices of cheese on the bread.;Я кладу два ломтика сыра на хлеб.;Nomen, f.;b1 food
das Schiff, die Schiffe;ship;корабль;Das Schiff legt um zehn Uhr ab.;The ship departs at ten o’clock.;Корабль отплывает в десять часов.;Nomen, n.;b1 travel
das Schild, die Schilder;sign;вывеска / знак;Hast du das Schild am Eingang gesehen?;Did you see the sign at the entrance?;Ты видел вывеску у входа?;Nomen, n.;b1 city
der Schlaf;sleep;сон;Ausreichender Schlaf ist sehr gesund.;Sufficient sleep is very healthy.;Достаточный сон очень полезен.;Nomen, m.;b1 health
der Schlag, die Schläge;blow / stroke;удар;Mit einem Schlag war alles anders.;All at once everything was different.;В один миг всё изменилось.;Nomen, m.;b1 daily
die Schlange, die Schlangen;line / queue / snake;очередь / змея;Vor dem Kino stand eine lange Schlange.;In front of the cinema there was a long queue.;Перед кинотеатром стояла длинная очередь.;Nomen, f.;b1 city
das Schloss, die Schlösser;castle / lock;замок (дворец / дверной);Das Schloss auf dem Berg ist sehr berühmt.;The castle on the mountain is very famous.;Замок на горе очень знаменит.;Nomen, n.;b1 travel
der Schluss;end / conclusion;конец / вывод;Zum Schluss bedankte sich der Moderator.;At the end the host thanked everyone.;В конце ведущий поблагодарил всех.;Nomen, m.;b1 time
der Schritt, die Schritte;step;шаг;Jeder kleine Schritt bringt uns ans Ziel.;Every small step brings us to the goal.;Каждый маленький шаг приближает нас к цели.;Nomen, m.;b1 daily
die Schuld;guilt / blame / debt;вина / долг;Daran trägst du keine Schuld.;You bear no blame for that.;В этом нет твоей вины.;Nomen, f.;b1 society
die Schulter, die Schultern;shoulder;плечо;Er legte mir die Hand auf die Schulter.;He put his hand on my shoulder.;Он положил мне руку на плечо.;Nomen, f.;b1 body
die See;sea / ocean;море;Auf hoher See weht ein kräftiger Wind.;On the open sea a strong wind blows.;В открытом море дует сильный ветер.;Nomen, f.;b1 nature
die Seife, die Seifen;soap;мыло;Wasch dir die Hände mit Wasser und Seife.;Wash your hands with water and soap.;Вымой руки водой с мылом.;Nomen, f.;b1 home
die Seite, die Seiten;side / page;сторона / страница;Schlagen Sie bitte Seite zwanzig auf.;Please open to page twenty.;Откройте, пожалуйста, двадцатую страницу.;Nomen, f.;b1 study
die Sendung, die Sendungen;broadcast / shipment;передача / посылка;Die Sendung läuft jeden Abend um acht.;The show airs every evening at eight.;Передача идёт каждый вечер в восемь.;Nomen, f.;b1 media
der Sieg, die Siege;victory;победа;Die Mannschaft feierte einen verdienten Sieg.;The team celebrated a deserved victory.;Команда отпраздновала заслуженную победу.;Nomen, m.;b1 sport
der Sinn, die Sinne;sense / meaning;смысл / чувство;Das ergibt für mich keinen Sinn.;That makes no sense to me.;В этом для меня нет смысла.;Nomen, m.;b1 daily
der Sitz, die Sitze;seat;сиденье / место;Dieser Sitz im Zug ist noch frei.;This seat on the train is still free.;Это место в поезде ещё свободно.;Nomen, m.;b1 travel
die Sorge, die Sorgen;worry / concern;забота / тревога;Mach dir keine Sorgen, alles wird gut.;Do not worry, everything will be fine.;Не переживай, всё будет хорошо.;Nomen, f.;b1 feelings
der Spaß;fun;веселье / удовольствие;Ich wünsche euch viel Spaß auf der Party!;I wish you lots of fun at the party!;Желаю вам хорошо повеселиться на вечеринке!;Nomen, m.;b1 daily
der Spiegel, die Spiegel;mirror;зеркало;Im Flur hängt ein großer Spiegel.;In the hallway hangs a large mirror.;В прихожей висит большое зеркало.;Nomen, m.;b1 home
die Spitze, die Spitzen;top / tip / peak;вершина / кончик;Wir wandern bis zur Spitze des Berges.;We are hiking to the peak of the mountain.;Мы идём пешком до вершины горы.;Nomen, f.;b1 nature
der Staat, die Staaten;state / country;государство;Der Staat fördert erneuerbare Energien.;The state promotes renewable energies.;Государство поддерживает возобновляемую энергию.;Nomen, m.;b1 society
der Stadtteil, die Stadtteile;district / neighborhood;район города;Dieser Stadtteil ist bei Familien sehr beliebt.;This district is very popular with families.;Этот район города очень популярен среди семей.;Nomen, m.;b1 city
der Stand;stand / state / level;состояние / стенд / уровень;Auf dem aktuellen Stand sind wir gut vorbereitet.;At the current state we are well prepared.;На данный момент мы хорошо подготовлены.;Nomen, m.;b1 work
der Star, die Stars;star / celebrity;звезда (знаменитость);Nach dem Konzert gab der Star Autogramme.;After the concert the star gave autographs.;После концерта звезда раздавала автографы.;Nomen, m.;b1 culture
der Start;start / takeoff;старт / взлёт;Vor dem Start bitte anschnallen!;Please fasten your seatbelt before takeoff!;Перед взлётом, пожалуйста, пристегните ремни!;Nomen, m.;b1 travel
die Station, die Stationen;station / ward;станция / отделение;Wir müssen an der nächsten Station aussteigen.;We have to get off at the next station.;Нам нужно выйти на следующей станции.;Nomen, f.;b1 travel
der Staub;dust;пыль;Auf dem Regal liegt schon viel Staub.;There is already a lot of dust on the shelf.;На полке уже много пыли.;Nomen, m.;b1 home
der Stein, die Steine;stone / rock;камень;Der Weg ist voller kleiner Steine.;The path is full of small stones.;Дорожка полна мелких камней.;Nomen, m.;b1 nature
die Stelle, die Stellen;spot / job / position;место / должность;Sie hat sich auf eine neue Stelle beworben.;She applied for a new position.;Она подала заявку на новую должность.;Nomen, f.;b1 work
der Stern, die Sterne;star;звезда;Bei klarem Himmel sieht man viele Sterne.;In a clear sky you can see many stars.;При ясном небе видно много звёзд.;Nomen, m.;b1 nature
die Steuer, die Steuern;tax;налог;Jeder Bürger zahlt Steuern.;Every citizen pays taxes.;Каждый гражданин платит налоги.;Nomen, f.;b1 finance
der Stil, die Stile;style;стиль;Sein Schreibstil ist klar und direkt.;His writing style is clear and direct.;Его стиль письма ясный и прямой.;Nomen, m.;b1 culture
die Stimme, die Stimmen;voice / vote;голос;Sie hat eine wunderschöne Singstimme.;She has a wonderful singing voice.;У неё прекрасный певческий голос.;Nomen, f.;b1 people
der Stock, die Stöcke;floor / stick;этаж / палка;Unsere Wohnung liegt im dritten Stock.;Our apartment is on the third floor.;Наша квартира находится на третьем этаже.;Nomen, m.;b1 home
der Stoff, die Stoffe;fabric / material / subject;ткань / вещество / материал;Dieser Stoff fühlt sich sehr weich an.;This fabric feels very soft.;Эта ткань очень мягкая на ощупь.;Nomen, m.;b1 clothes
der Stolz;pride;гордость;Mit großem Stolz zeigte er sein Zeugnis.;With great pride he showed his report card.;С большой гордостью он показал свой аттестат.;Nomen, m.;b1 feelings
die Störung, die Störungen;disturbance / malfunction;сбой / помеха;Wegen einer technischen Störung fällt der Zug aus.;Due to a technical malfunction the train is canceled.;Из-за технического сбоя поезд отменён.;Nomen, f.;b1 travel
die Strafe, die Strafen;punishment / fine;наказание / штраф;Für Falschparken bekommt man eine Strafe.;For illegal parking you get a fine.;За неправильную парковку получают штраф.;Nomen, f.;b1 society
der Strand, die Strände;beach;пляж;Am Strand liegen viele Menschen in der Sonne.;On the beach many people lie in the sun.;На пляже многие люди лежат на солнце.;Nomen, m.;b1 travel
die Strecke, die Strecken;route / distance;маршрут / участок пути;Die Strecke bis Berlin beträgt dreihundert Kilometer.;The distance to Berlin is three hundred kilometers.;Расстояние до Берлина составляет триста километров.;Nomen, f.;b1 travel
der Streik, die Streiks;strike;забастовка;Wegen des Streiks fahren heute keine Busse.;Because of the strike no buses are running today.;Из-за забастовки сегодня не ходят автобусы.;Nomen, m.;b1 society
das Stück, die Stücke;piece / play;кусок / пьеса;Möchtest du noch ein Stück Kuchen?;Would you like another piece of cake?;Хочешь ещё кусочек торта?;Nomen, n.;b1 food
der Sturm, die Stürme;storm;шторм / буря;Der Sturm hat mehrere Bäume umgeworfen.;The storm knocked down several trees.;Буря повалила несколько деревьев.;Nomen, m.;b1 nature
die Suche;search;поиск;Die Suche nach einer Wohnung dauert oft lange.;The search for an apartment often takes a long time.;Поиск квартиры часто занимает много времени.;Nomen, f.;b1 home
die Summe, die Summen;sum / amount;сумма;Die gesamte Summe beträgt zweihundert Euro.;The total sum is two hundred euros.;Общая сумма составляет двести евро.;Nomen, f.;b1 finance
das Symbol, die Symbole;symbol;символ;Die Taube ist ein Symbol für den Frieden.;The dove is a symbol of peace.;Голубь — символ мира.;Nomen, n.;b1 culture
das System, die Systeme;system;система;Das neue System erleichtert unsere Arbeit.;The new system makes our work easier.;Новая система облегчает нашу работу.;Nomen, n.;b1 tech
die Tabelle, die Tabellen;table / chart;таблица;Alle Zahlen stehen in dieser Tabelle.;All numbers are in this table.;Все числа указаны в этой таблице.;Nomen, f.;b1 work
die Tafel, die Tafeln;blackboard / bar;доска / плитка;Der Lehrer schreibt das Wort an die Tafel.;The teacher writes the word on the blackboard.;Учитель пишет слово на доске.;Nomen, f.;b1 study
das Tal, die Täler;valley;долина;Im Tal liegt ein kleines, ruhiges Dorf.;In the valley lies a small, quiet village.;В долине лежит маленькая тихая деревня.;Nomen, n.;b1 geography
die Tat, die Taten;deed / act;поступок / дело;Worte sind gut, aber Taten zählen mehr.;Words are good, but deeds count more.;Слова хороши, но дела важнее.;Nomen, f.;b1 people
die Tatsache, die Tatsachen;fact;факт;Das ist eine bekannte Tatsache.;That is a well-known fact.;Это общеизвестный факт.;Nomen, f.;b1 communication
der Tausch;exchange / swap;обмен;Ein Tausch der Schichten ist heute möglich.;A swap of shifts is possible today.;Обмен сменами сегодня возможен.;Nomen, m.;b1 work
die Technik;technology / technique;техника / технология;Moderne Technik spart im Haushalt viel Zeit.;Modern technology saves a lot of time in the household.;Современная техника экономит дома много времени.;Nomen, f.;b1 tech
der Teil, die Teile;part / share;часть;Der erste Teil des Buches war besonders gut.;The first part of the book was particularly good.;Первая часть книги была особенно хорошей.;Nomen, m.;b1 daily
der Teilnehmer, die Teilnehmer;participant;участник;Alle Teilnehmer erhalten ein Zertifikat.;All participants receive a certificate.;Все участники получают сертификат.;Nomen, m.;b1 study', now())
on conflict (level) do update set
  title = excluded.title,
  word_count = excluded.word_count,
  csv_content = excluded.csv_content,
  updated_at = now();

insert into public.catalog_corpora (level, title, word_count, csv_content, updated_at)
values ('B2', 'B2 Upper-Intermediate', 700, 'de;en;ru;exDe;exEn;exRu;ctx;tags
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
integrieren;to integrate;интегрировать;Wir integrieren das neue Modul bis Freitag.;We will integrate the new module by Friday.;Мы интегрируем новый модуль до пятницы.;Verb;b2 tech
die Perspektive, die Perspektiven;perspective / prospect;перспектива;Diese Stelle bietet gute berufliche Perspektiven.;This position offers good career prospects.;Эта должность открывает хорошие карьерные перспективы.;Nomen, f.;b2 work
das Potenzial, die Potenziale;potential;потенциал;In diesem Team steckt großes Potenzial.;There is great potential in this team.;В этой команде скрыт большой потенциал.;Nomen, n.;b2 work
die Priorität, die Prioritäten;priority;приоритет;Qualität hat bei uns oberste Priorität.;Quality has top priority with us.;Качество для нас — высший приоритет.;Nomen, f.;b2 work
das Projekt, die Projekte;project;проект;Das Projekt liegt genau im Zeitplan.;The project is right on schedule.;Проект идёт точно по графику.;Nomen, n.;b2 work
die Reaktion, die Reaktionen;reaction;реакция;Die Reaktion der Kunden war überwiegend positiv.;Customers’ reaction was mostly positive.;Реакция клиентов была в основном положительной.;Nomen, f.;b2 communication
die Ressource, die Ressourcen;resource;ресурс;Wir müssen natürliche Ressourcen schonen.;We must conserve natural resources.;Мы должны беречь природные ресурсы.;Nomen, f.;b2 nature
die Richtlinie, die Richtlinien;guideline / policy;директива / регламент;Bitte halten Sie sich an die neuen Richtlinien.;Please follow the new guidelines.;Пожалуйста, соблюдайте новые правила.;Nomen, f.;b2 formal
der Schaden, die Schäden;damage;ущерб / повреждение;Der Schaden wurde von der Versicherung bezahlt.;The damage was paid by the insurance.;Ущерб был оплачен страховкой.;Nomen, m.;b2 formal
die Schnittstelle, die Schnittstellen;interface;интерфейс / стык;Die neue Schnittstelle verbindet beide Systeme.;The new interface connects both systems.;Новый интерфейс соединяет обе системы.;Nomen, f.;b2 tech
die Schwäche, die Schwächen;weakness;слабость / недостаток;Jeder hat seine Stärken und Schwächen.;Everyone has their strengths and weaknesses.;У каждого есть свои сильные и слабые стороны.;Nomen, f.;b2 work
die Stärke, die Stärken;strength;сильная сторона / сила;Analytisches Denken ist ihre größte Stärke.;Analytical thinking is her greatest strength.;Аналитическое мышление — её главная сильная сторона.;Nomen, f.;b2 work
die Strategie, die Strategien;strategy;стратегия;Diese Strategie zahlt sich langfristig aus.;This strategy pays off in the long run.;Эта стратегия окупается в долгосрочной перспективе.;Nomen, f.;b2 business
die Struktur, die Strukturen;structure;структура;Der Text hat eine sehr klare Struktur.;The text has a very clear structure.;У текста очень чёткая структура.;Nomen, f.;b2 academic
die Tendenz, die Tendenzen;tendency / trend;тенденция;Es zeigt sich eine steigende Tendenz.;An upward tendency is emerging.;Наблюдается тенденция к росту.;Nomen, f.;b2 economy
die Teilnahme;participation;участие;Vielen Dank für Ihre aktive Teilnahme.;Thank you for your active participation.;Большое спасибо за ваше активное участие.;Nomen, f.;b2 formal
die Überzeugung, die Überzeugungen;conviction / belief;убеждение;Er handelt stets aus fester Überzeugung.;He always acts out of firm conviction.;Он всегда действует по твёрдому убеждению.;Nomen, f.;b2 communication
der Umfang;scope / volume;объём / масштаб;Der Umfang der Aufgabe war unterschätzt worden.;The scope of the task had been underestimated.;Объём задачи был недооценён.;Nomen, m.;b2 work
die Umsetzung;implementation;реализация / внедрение;Die Umsetzung dauerte nur drei Wochen.;The implementation took only three weeks.;Внедрение заняло всего три недели.;Nomen, f.;b2 work
die Unterstützung;support;поддержка;Mit Ihrer Unterstützung schaffen wir das.;With your support we will make it.;С вашей поддержкой мы справимся.;Nomen, f.;b2 work
die Veränderung, die Veränderungen;change;изменение;Veränderungen brauchen manchmal etwas Zeit.;Changes sometimes need a little time.;Изменениям иногда нужно немного времени.;Nomen, f.;b2 society
die Verbesserung, die Verbesserungen;improvement;улучшение;Das Update bringt zahlreiche Verbesserungen.;The update brings numerous improvements.;Обновление приносит многочисленные улучшения.;Nomen, f.;b2 tech
der Vergleich, die Vergleiche;comparison;сравнение;Im Vergleich zum Vorjahr stieg der Umsatz.;Compared to the previous year, revenue rose.;По сравнению с прошлым годом выручка выросла.;Nomen, m.;b2 business
das Verhältnis, die Verhältnisse;ratio / relationship;соотношение / отношение;Das Preis-Leistungs-Verhältnis ist hervorragend.;The price-performance ratio is excellent.;Соотношение цены и качества превосходное.;Nomen, n.;b2 business
der Verlauf;course / progress;ход / течение;Im Verlauf des Gesprächs wurde alles klar.;In the course of the talk everything became clear.;В ходе разговора всё стало ясно.;Nomen, m.;b2 formal
die Verpflichtung, die Verpflichtungen;obligation / commitment;обязательство;Wir erfüllen alle vertraglichen Verpflichtungen.;We fulfill all contractual obligations.;Мы выполняем все договорные обязательства.;Nomen, f.;b2 formal
das Vertrauen;trust / confidence;доверие;Vertrauen muss man sich erst verdienen.;Trust has to be earned first.;Доверие сначала нужно заслужить.;Nomen, n.;b2 people
die Verzögerung, die Verzögerungen;delay;задержка;Wir bitten um Entschuldigung für die Verzögerung.;We apologize for the delay.;Приносим извинения за задержку.;Nomen, f.;b2 formal
die Vielfalt;diversity / variety;разнообразие;Die kulturelle Vielfalt bereichert die Stadt.;Cultural diversity enriches the city.;Культурное разнообразие обогащает город.;Nomen, f.;b2 society
der Wandel;change / transformation;перемена / трансформация;Der digitale Wandel betrifft alle Berufe.;Digital transformation affects all professions.;Цифровая трансформация затрагивает все профессии.;Nomen, m.;b2 society
die Wirkung, die Wirkungen;effect / impact;действие / эффект;Die Maßnahme zeigt bereits erste Wirkung.;The measure is already showing initial effect.;Мера уже даёт первый эффект.;Nomen, f.;b2 formal
das Wissen;knowledge;знание / знания;Aktuelles Wissen ist im Beruf entscheidend.;Up-to-date knowledge is crucial at work.;Актуальные знания в профессии решают многое.;Nomen, n.;b2 study
der Zugang, die Zugänge;access;доступ;Alle Nutzer erhalten direkten Zugang zum Portal.;All users receive direct access to the portal.;Все пользователи получают прямой доступ к порталу.;Nomen, m.;b2 tech
die Zunahme;increase / growth;увеличение / прирост;Die Zunahme des Verkehrs erfordert neue Wege.;The increase in traffic requires new routes.;Рост трафика требует новых решений.;Nomen, f.;b2 society
die Zusammenarbeit;cooperation / collaboration;сотрудничество;Eine enge Zusammenarbeit führt zu besseren Ergebnissen.;Close cooperation leads to better results.;Тесное сотрудничество ведёт к лучшим результатам.;Nomen, f.;b2 work
die Zustimmung;approval / consent;согласие / одобрение;Ohne Ihre Zustimmung ändern wir nichts.;Without your consent we change nothing.;Без вашего согласия мы ничего не меняем.;Nomen, f.;b2 formal
der Zweck, die Zwecke;purpose;цель / назначение;Zu welchem Zweck werden die Daten erhoben?;For what purpose is the data collected?;С какой целью собираются эти данные?;Nomen, m.;b2 formal
ableiten;to derive / deduce;выводить / делать вывод;Daraus lässt sich eine klare Regel ableiten.;From this a clear rule can be derived.;Из этого можно вывести чёткое правило.;Verb (trennb.);b2 academic
abschätzen;to estimate / gauge;оценивать (риски/масштаб);Die Folgen lassen sich schwer abschätzen.;The consequences are hard to gauge.;Последствия трудно оценить заранее.;Verb (trennb.);b2 work
anpassen;to adapt / adjust;адаптировать / подстраивать;Wir müssen das Design an mobile Geräte anpassen.;We need to adapt the design to mobile devices.;Нам нужно адаптировать дизайн под мобильные устройства.;Verb (trennb.);b2 tech
anwenden;to apply / use;применять;Hier kann man die neue Methode anwenden.;Here one can apply the new method.;Здесь можно применить новый метод.;Verb (trennb.);b2 academic
aufbauen;to build up / establish;выстраивать / создавать;Wir wollen langfristige Beziehungen aufbauen.;We want to build long-term relationships.;Мы хотим выстроить долгосрочные отношения.;Verb (trennb.);b2 business
aufnehmen;to take in / record / accept;принимать / записывать;Der Vorschlag wurde sehr positiv aufgenommen.;The proposal was received very positively.;Предложение было принято очень позитивно.;Verb (trennb.);b2 communication
ausführen;to execute / carry out;выполнять / исполнять;Der Befehl wird automatisch ausgeführt.;The command is executed automatically.;Команда выполняется автоматически.;Verb (trennb.);b2 tech
auslösen;to trigger / cause;вызывать / запускать;Diese Nachricht löste viele Diskussionen aus.;This news triggered many discussions.;Эта новость вызвала много дискуссий.;Verb (trennb.);b2 communication
auswerten;to evaluate / analyze;анализировать / обрабатывать;Wir werten die Testergebnisse morgen aus.;We will analyze the test results tomorrow.;Мы проанализируем результаты теста завтра.;Verb (trennb.);b2 academic
beeinflussen;to influence;влиять на;Wetter kann unsere Laune beeinflussen.;Weather can influence our mood.;Погода может влиять на наше настроение.;Verb;b2 psychology
beheben;to fix / resolve (an issue);устранять (неполадку);Der Fehler wurde im letzten Update behoben.;The bug was fixed in the latest update.;Ошибка была исправлена в последнем обновлении.;Verb;b2 tech
betreiben;to operate / run;вести / эксплуатировать;Das Unternehmen betreibt drei Werke.;The company operates three plants.;Компания управляет тремя заводами.;Verb;b2 business
einhalten;to comply with / keep (a deadline);соблюдать;Wir konnten alle Termine einhalten.;We were able to meet all deadlines.;Мы смогли соблюсти все сроки.;Verb (trennb.);b2 work
einsetzen;to deploy / use;применять / задействовать;Für das Projekt setzen wir neue Tools ein.;For the project we deploy new tools.;Для проекта мы задействуем новые инструменты.;Verb (trennb.);b2 work
entdecken;to discover / detect;обнаруживать;Bei der Prüfung wurde ein Fehler entdeckt.;During the check an error was detected.;При проверке была обнаружена ошибка.;Verb;b2 tech
erleichtern;to facilitate / make easier;облегчать;Klare Checklisten erleichtern die Arbeit.;Clear checklists make work easier.;Чёткие чек-листы облегчают работу.;Verb;b2 work
erscheinen;to appear / be published;появляться / выходить в свет;Der Bericht erscheint nächste Woche.;The report will be published next week.;Отчёт выйдет на следующей неделе.;Verb;b2 media
feststellen;to determine / notice;устанавливать / констатировать;Wir haben festgestellt, dass Daten fehlen.;We noticed that data is missing.;Мы обнаружили, что не хватает данных.;Verb (trennb.);b2 formal
garantieren;to guarantee;гарантировать;Wir garantieren eine schnelle Lieferung.;We guarantee fast delivery.;Мы гарантируем быструю доставку.;Verb;b2 business
nachweisen;to prove / verify;доказывать / подтверждать;Der Effekt konnte eindeutig nachgewiesen werden.;The effect could be clearly proven.;Эффект удалось однозначно доказать.;Verb (trennb.);b2 academic
optimieren;to optimize;оптимизировать;Wir optimieren die Ladezeit der App.;We are optimizing the app’s load time.;Мы оптимизируем время загрузки приложения.;Verb;b2 tech
präsentieren;to present;презентовать;Morgen präsentiere ich die Quartalszahlen.;Tomorrow I am presenting the quarterly figures.;Завтра я презентую квартальные показатели.;Verb;b2 business
reduzieren;to reduce;сокращать / снижать;Wir konnten die Kosten um zehn Prozent reduzieren.;We were able to reduce costs by ten percent.;Нам удалось снизить расходы на десять процентов.;Verb;b2 economy
sicherstellen;to ensure / make sure;обеспечивать / гарантировать;Bitte stellen Sie sicher, dass alles gespeichert ist.;Please make sure that everything is saved.;Пожалуйста, убедитесь, что всё сохранено.;Verb (trennb.);b2 work
steigern;to increase / boost;повышать / увеличивать;Gute Schlafqualität steigert die Konzentration.;Good sleep quality boosts concentration.;Хорошее качество сна повышает концентрацию.;Verb;b2 health
übertragen;to transfer / transmit;передавать / переносить;Die Daten werden verschlüsselt übertragen.;The data is transmitted encrypted.;Данные передаются в зашифрованном виде.;Verb;b2 tech
überwinden;to overcome;преодолевать;Gemeinsam überwinden wir diese Hürde.;Together we overcome this hurdle.;Вместе мы преодолеем этот барьер.;Verb;b2 emotions
unterscheiden;to distinguish;различать;Man muss zwischen Fakten und Meinungen unterscheiden.;One must distinguish between facts and opinions.;Нужно различать факты и мнения.;Verb;b2 academic
vereinbaren;to agree upon / arrange;согласовывать / договариваться;Wir haben ein Treffen für Montag vereinbart.;We arranged a meeting for Monday.;Мы договорились о встрече на понедельник.;Verb;b2 work
verfügen über;to have at one’s disposal;располагать чем-то;Sie verfügt über langjährige Führungserfahrung.;She has many years of leadership experience.;Она располагает многолетним опытом руководства.;Verb (+ Akk.);b2 formal
verringern;to decrease / reduce;уменьшать / снижать;Dadurch verringert sich das Risiko erheblich.;This reduces the risk considerably.;Благодаря этому риск значительно снижается.;Verb;b2 formal
verwalten;to manage / administer;управлять / администрировать;Er verwaltet alle Benutzerkonten im System.;He manages all user accounts in the system.;Он управляет всеми учётными записями в системе.;Verb;b2 tech
vorstellen;to introduce / present / imagine;представлять;Darf ich Ihnen unsere neue Kollegin vorstellen?;May I introduce our new colleague to you?;Позвольте представить вам нашу новую коллегу?;Verb (trennb.);b2 communication
wahrnehmen;to perceive / notice / take (an opportunity);воспринимать / замечать;Jeder nimmt diese Situation anders wahr.;Everyone perceives this situation differently.;Каждый воспринимает эту ситуацию по-разному.;Verb (trennb.);b2 psychology
die Abdeckung, die Abdeckungen;coverage / cover;покрытие / крышка;Die Abdeckung des Mobilfunknetzes wird stetig verbessert.;Mobile network coverage is constantly being improved.;Покрытие мобильной сети постоянно улучшается.;Nomen, f.;b2 tech
die Abgabe, die Abgaben;submission / levy / tax;сдача / сбор / налог;Die Abgabe der Steuererklärung erfolgt bis Ende Juli.;The tax return must be submitted by the end of July.;Подача налоговой декларации осуществляется до конца июля.;Nomen, f.;b2 finance
die Abhängigkeit, die Abhängigkeiten;dependence / addiction;зависимость;Digitale Abhängigkeit wird immer häufiger diskutiert.;Digital addiction is being discussed more and more frequently.;Цифровую зависимость обсуждают всё чаще.;Nomen, f.;b2 society
die Ablehnung;rejection / refusal;отказ / неприятие;Sein Vorschlag stieß auf breite Ablehnung.;His proposal met with broad rejection.;Его предложение встретило широкое неприятие.;Nomen, f.;b2 communication
die Ablenkung, die Ablenkungen;distraction;отвлечение;Ohne Ablenkung arbeitet man deutlich konzentrierter.;Without distractions one works much more focused.;Без отвлечений работаешь значительно сосредоточеннее.;Nomen, f.;b2 work
die Abnahme, die Abnahmen;acceptance / decrease;приёмка / снижение;Bei der Abnahme der Wohnung gab es keine Mängel.;During the apartment handover there were no defects.;При приёмке квартиры недостатков не было.;Nomen, f.;b2 work
die Abrechnung, die Abrechnungen;billing / settlement;расчёт / выписка;Die monatliche Abrechnung erhalten Sie per Post.;You will receive the monthly statement by mail.;Ежемесячный расчёт вы получите по почте.;Nomen, f.;b2 finance
der Absatz, die Absätze;paragraph / sales / heel;абзац / сбыт / каблук;Im dritten Absatz wird das Hauptargument erklärt.;In the third paragraph the main argument is explained.;В третьем абзаце объясняется главный аргумент.;Nomen, m.;b2 business
der Abschluss, die Abschlüsse;degree / conclusion / closing;окончание / диплом / заключение;Nach dem Abschluss möchte sie im Ausland arbeiten.;After graduation she wants to work abroad.;После окончания учёбы она хочет работать за границей.;Nomen, m.;b2 study
die Absicherung;safeguard / hedging;страховка / обеспечение безопасности;Eine gute finanzielle Absicherung gibt Ruhe.;Good financial security provides peace of mind.;Хорошая финансовая подушка даёт спокойствие.;Nomen, f.;b2 finance
der Abstand, die Abstände;distance / gap;расстояние / интервал;Halten Sie bitte ausreichend Abstand zum Vordermann.;Please keep sufficient distance from the car ahead.;Пожалуйста, держите достаточную дистанцию до впереди идущего.;Nomen, m.;b2 safety
die Abstimmung, die Abstimmungen;vote / coordination;голосование / согласование;Die Abstimmung im Parlament fiel sehr knapp aus.;The vote in parliament was very close.;Голосование в парламенте прошло с минимальным перевесом.;Nomen, f.;b2 politics
die Abwanderung;emigration / outflow;отток / миграция;Viele Regionen kämpfen gegen die Abwanderung junger Leute.;Many regions are fighting against the outflow of young people.;Многие регионы борются с оттоком молодёжи.;Nomen, f.;b2 society
die Abwechslung;variety / change;разнообразие;Etwas Abwechslung tut dem Arbeitsalltag gut.;A bit of variety does the daily work routine good.;Немного разнообразия идёт на пользу рабочим будням.;Nomen, f.;b2 daily
die Abweichung, die Abweichungen;deviation;отклонение;Geringe Abweichungen sind bei der Messung normal.;Small deviations are normal during measurement.;Небольшие отклонения при измерении нормальны.;Nomen, f.;b2 science
die Abwesenheit;absence;отсутствие;Während meiner Abwesenheit vertritt mich Herr Klein.;During my absence Mr. Klein will represent me.;Во время моего отсутствия меня замещает господин Кляйн.;Nomen, f.;b2 work
die Acht;care / attention;внимание / осторожность;Gib acht auf die neuen Vorschriften.;Pay attention to the new regulations.;Обрати внимание на новые предписания.;Nomen, f.;b2 daily
der Ackerbau;agriculture / farming;земледелие;In dieser fruchtbaren Region dominiert der Ackerbau.;Agriculture dominates in this fertile region.;В этом плодородном регионе преобладает земледелие.;Nomen, m.;b2 economy
die Adoption, die Adoptionen;adoption;усыновление;Das Verfahren zur Adoption dauert oft mehrere Jahre.;The adoption process often takes several years.;Процедура усыновления часто длится несколько лет.;Nomen, f.;b2 society
die Adresse, die Adressen;address;адрес;Bitte aktualisieren Sie Ihre Rechnungsadresse.;Please update your billing address.;Пожалуйста, обновите ваш платёжный адрес.;Nomen, f.;b2 daily
der Affe, die Affen;monkey / ape;обезьяна;Im Zoo beobachteten wir die neugierigen Affen.;At the zoo we watched the curious monkeys.;В зоопарке мы наблюдали за любопытными обезьянами.;Nomen, m.;b2 animals
die Agentur, die Agenturen;agency;агентство;Eine kreative Agentur gestaltet unsere neue Kampagne.;A creative agency is designing our new campaign.;Креативное агентство разрабатывает нашу новую кампанию.;Nomen, f.;b2 business
die Aggression, die Aggressionen;aggression;агрессия;Sport hilft manchen Menschen, Aggression abzubauen.;Sports help some people reduce aggression.;Спорт помогает некоторым людям снять агрессию.;Nomen, f.;b2 psychology
die Ahnung, die Ahnungen;idea / hunch;понятие / предчувствие;Ich hatte keine Ahnung von dieser Änderung.;I had no idea about this change.;Я понятия не имел об этом изменении.;Nomen, f.;b2 daily
die Akte, die Akten;file / dossier;дело / папка с документами;Alle wichtigen Verträge liegen in dieser Akte.;All important contracts are in this file.;Все важные договоры лежат в этой папке.;Nomen, f.;b2 office
die Aktie, die Aktien;share / stock;акция;Der Kurs der Aktie ist gestern stark gestiegen.;The share price rose sharply yesterday.;Курс акции вчера резко вырос.;Nomen, f.;b2 finance
die Aktion, die Aktionen;campaign / action;акция / кампания;Die Umweltaktion fand großen Zuspruch.;The environmental campaign met with great support.;Экологическая акция нашла большой отклик.;Nomen, f.;b2 society
die Aktivität, die Aktivitäten;activity;активность / деятельность;Körperliche Aktivität beugt vielen Krankheiten vor.;Physical activity prevents many illnesses.;Физическая активность предотвращает многие болезни.;Nomen, f.;b2 health
die Aktualität;topicality / relevance;актуальность;Dieses Thema hat nichts an Aktualität verloren.;This topic has lost none of its relevance.;Эта тема нисколько не утратила своей актуальности.;Nomen, f.;b2 media
der Akzent, die Akzente;accent;акцент;Sie spricht fließend Deutsch mit leichtem Akzent.;She speaks fluent German with a slight accent.;Она свободно говорит по-немецки с лёгким акцентом.;Nomen, m.;b2 study
der Alarm, die Alarme;alarm;тревога / сигнализация;Bei Rauch löst der Melder sofort Alarm aus.;In case of smoke the detector triggers an alarm immediately.;При появлении дыма датчик немедленно подаёт сигнал тревоги.;Nomen, m.;b2 safety
das Album, die Alben;album;альбом;Ihr neues Musikalbum erscheint im Herbst.;Her new music album is coming out in autumn.;Её новый музыкальный альбом выйдет осенью.;Nomen, n.;b2 culture
der Alkohol;alcohol;алкоголь;Während der Arbeitszeit ist Alkohol streng verboten.;During working hours alcohol is strictly forbidden.;В рабочее время алкоголь строго запрещён.;Nomen, m.;b2 health
die Allergie, die Allergien;allergy;аллергия;Im Frühling leiden viele unter einer Pollenallergie.;In spring many suffer from a pollen allergy.;Весной многие страдают от аллергии на пыльцу.;Nomen, f.;b2 health
die Allianz, die Allianzen;alliance;альянс / союз;Mehrere Unternehmen bildeten eine strategische Allianz.;Several companies formed a strategic alliance.;Несколько компаний образовали стратегический альянс.;Nomen, f.;b2 business
das Altersheim, die Altersheime;retirement home;дом престарелых;Meine Großmutter fühlt sich im Altersheim wohl.;My grandmother feels comfortable in the retirement home.;Моя бабушка хорошо чувствует себя в доме престарелых.;Nomen, n.;b2 society
die Altstadt, die Altstädte;old town;старый город;In der Altstadt stehen viele historische Fachwerkhäuser.;In the old town there are many historic half-timbered houses.;В старом городе стоит много исторических фахверковых домов.;Nomen, f.;b2 city
die Ambulanz, die Ambulanzen;outpatient clinic / ambulance;амбулатория / скорая;In der Notfallambulanz musste er eine Stunde warten.;In the emergency clinic he had to wait an hour.;В отделении неотложной помощи ему пришлось ждать час.;Nomen, f.;b2 health
der Anbieter, die Anbieter;provider / supplier;поставщик / провайдер;Wir vergleichen derzeit verschiedene Stromanbieter.;We are currently comparing different electricity providers.;Мы сейчас сравниваем разных поставщиков электроэнергии.;Nomen, m.;b2 business
die Anbindung, die Anbindungen;connection (transport/network);транспортное сообщение / подключение;Der Vorort hat eine schnelle Anbindung ans Zentrum.;The suburb has a fast connection to the center.;У пригорода быстрое сообщение с центром.;Nomen, f.;b2 city
das Andenken, die Andenken;souvenir / memory;сувенир / память;Aus Rom brachte sie ein kleines Andenken mit.;From Rome she brought back a small souvenir.;Из Рима она привезла небольшой сувенир.;Nomen, n.;b2 travel
die Änderung, die Änderungen;change / modification;изменение;Alle Änderungen werden im Protokoll festgehalten.;All changes are recorded in the minutes.;Все изменения фиксируются в протоколе.;Nomen, f.;b2 work
die Anerkennung;recognition / appreciation;признание;Für seine Forschung erhielt er internationale Anerkennung.;For his research he received international recognition.;За своё исследование он получил международное признание.;Nomen, f.;b2 science
der Anfang, die Anfänge;beginning;начало;Aller Anfang ist bekanntlich schwer.;Every beginning is famously hard.;Всякое начало, как известно, трудно.;Nomen, m.;b2 time
die Anfrage, die Anfragen;inquiry / request;запрос;Wir bearbeiten Ihre Anfrage innerhalb von 24 Stunden.;We process your inquiry within 24 hours.;Мы обработаем ваш запрос в течение 24 часов.;Nomen, f.;b2 business
die Angabe, die Angaben;statement / information;сведения / указание;Alle Angaben erfolgen ohne Gewähr.;All information is provided without guarantee.;Все сведения предоставляются без гарантии.;Nomen, f.;b2 work
der Angehörige, die Angehörigen;relative / member;родственник / член;Im Notfall werden zuerst die Angehörigen informiert.;In an emergency relatives are informed first.;В экстренном случае сначала информируют родственников.;Nomen, m.;b2 family
der Angriff, die Angriffe;attack;атака / нападение;Die Abwehr wehrte den schnellen Angriff ab.;The defense fended off the fast attack.;Защита отразила быструю атаку.;Nomen, m.;b2 sport
die Anhörung, die Anhörungen;hearing;слушание;Vor der Entscheidung findet eine öffentliche Anhörung statt.;Before the decision a public hearing takes place.;Перед принятием решения проводятся публичные слушания.;Nomen, f.;b2 politics
die Anlage, die Anlagen;facility / attachment / investment;установка / вложение / инвестиция;Die Unterlagen finden Sie in der Anlage dieser E-Mail.;You will find the documents in the attachment of this email.;Документы вы найдёте во вложении к этому письму.;Nomen, f.;b2 office
der Anlass, die Anlässe;occasion / reason;повод;Zu diesem besonderen Anlass stoßen wir gemeinsam an.;On this special occasion we toast together.;По этому особому случаю мы поднимаем бокалы вместе.;Nomen, m.;b2 people
die Anleitung, die Anleitungen;instruction / manual;инструкция / руководство;Folgen Sie bitte Schritt für Schritt der Anleitung.;Please follow the manual step by step.;Пожалуйста, следуйте инструкции шаг за шагом.;Nomen, f.;b2 tech
die Anmeldung, die Anmeldungen;registration;регистрация;Nach der Anmeldung erhalten Sie eine Bestätigung.;After registration you will receive a confirmation.;После регистрации вы получите подтверждение.;Nomen, f.;b2 daily
die Annahme, die Annahmen;assumption / acceptance;предположение / приём;Diese Annahme basiert auf früheren Studien.;This assumption is based on earlier studies.;Это предположение основано на более ранних исследованиях.;Nomen, f.;b2 science
die Anpassung, die Anpassungen;adaptation / adjustment;адаптация / корректировка;Die Anpassung an das neue System gelang schnell.;Adapting to the new system succeeded quickly.;Адаптация к новой системе прошла быстро.;Nomen, f.;b2 work
die Anregung, die Anregungen;suggestion / stimulus;предложение / импульс;Vielen Dank für Ihre wertvolle Anregung.;Thank you very much for your valuable suggestion.;Большое спасибо за ваше ценное предложение.;Nomen, f.;b2 communication
der Ansager, die Ansager;announcer;диктор / ведущий;Der Ansager stellte die nächste Künstlerin vor.;The announcer introduced the next artist.;Ведущий представил следующую артистку.;Nomen, m.;b2 media
der Anschein;appearance / impression;видимость;Allem Anschein nach verzögert sich das Projekt.;To all appearances the project is being delayed.;По всей видимости, проект задерживается.;Nomen, m.;b2 communication
der Anschlag, die Anschläge;attack / notice;теракт / объявление;Die Sicherheitsbehörden verhinderten einen Anschlag.;The security authorities prevented an attack.;Органы безопасности предотвратили теракт.;Nomen, m.;b2 politics
der Anschluss, die Anschlüsse;connection;пересадка / подключение;Wegen der Verspätung haben wir den Anschluss verpasst.;Because of the delay we missed our connection.;Из-за опоздания мы опоздали на пересадку.;Nomen, m.;b2 travel
das Ansehen;reputation / prestige;репутация / авторитет;Die Universität genießt weltweit hohes Ansehen.;The university enjoys a high reputation worldwide.;Университет пользуется высоким авторитетом во всём мире.;Nomen, n.;b2 study
die Ansicht, die Ansichten;view / opinion;взгляд / мнение;In dieser Frage vertrete ich eine andere Ansicht.;On this issue I hold a different view.;По этому вопросу я придерживаюсь иного мнения.;Nomen, f.;b2 communication
die Ansprache, die Ansprachen;speech / address;речь / обращение;Die Direktorin hielt eine bewegende Ansprache.;The director gave a moving speech.;Директор произнесла трогательную речь.;Nomen, f.;b2 communication
die Anstrengung, die Anstrengungen;effort / exertion;усилие / напряжение;Trotz großer Anstrengung reichte es nicht für Gold.;Despite great effort it was not enough for gold.;Несмотря на большие усилия, этого не хватило на золото.;Nomen, f.;b2 sport
der Anteil, die Anteile;share / portion;доля / участие;Sie hält einen großen Anteil an dem Unternehmen.;She holds a large share in the company.;Ей принадлежит большая доля в компании.;Nomen, m.;b2 business
die Anweisung, die Anweisungen;instruction / order;указание / распоряжение;Die Mitarbeiter befolgten genau die Anweisungen.;The employees followed the instructions precisely.;Сотрудники точно выполнили указания.;Nomen, f.;b2 work
die Anzahl;number / quantity;количество / число;Die Anzahl der Bewerbungen hat sich verdoppelt.;The number of applications has doubled.;Количество заявок удвоилось.;Nomen, f.;b2 work
die Anzeige, die Anzeigen;advertisement / report (police);объявление / заявление в полицию;Auf die Stellenanzeige meldeten sich zwanzig Kandidaten.;Twenty candidates responded to the job advertisement.;На объявление о вакансии откликнулись двадцать кандидатов.;Nomen, f.;b2 media
der Apparat, die Apparate;apparatus / device;аппарат / прибор;Im Labor steht ein moderner Messapparat.;In the laboratory stands a modern measuring device.;В лаборатории стоит современный измерительный прибор.;Nomen, m.;b2 science
der Appell, die Appelle;appeal / call;призыв / обращение;Der Appell richtet sich an alle Verkehrsteilnehmer.;The appeal is directed at all road users.;Призыв обращён ко всем участникам дорожного движения.;Nomen, m.;b2 society
der Applaus;applause;аплодисменты;Nach dem Konzert gab es minutenlangen Applaus.;After the concert there was minutes of applause.;После концерта звучали многоминутные аплодисменты.;Nomen, m.;b2 culture
das Arbeitsamt, die Arbeitsämter;employment office;биржа труда;Beim Arbeitsamt erhielt er wertvolle Tipps.;At the employment office he received valuable tips.;На бирже труда он получил ценные советы.;Nomen, n.;b2 work
die Arbeitsbedingung, die Arbeitsbedingungen;working condition;условие труда;Gute Arbeitsbedingungen steigern die Motivation.;Good working conditions increase motivation.;Хорошие условия труда повышают мотивацию.;Nomen, f.;b2 work
die Arbeitskraft, die Arbeitskräfte;workforce / worker;рабочая сила / работник;In der Pflege fehlen qualifizierte Arbeitskräfte.;In nursing there is a shortage of qualified workers.;В сфере ухода не хватает квалифицированных работников.;Nomen, f.;b2 economy
die Armut;poverty;бедность;Bildung ist das beste Mittel gegen Armut.;Education is the best means against poverty.;Образование — лучшее средство против бедности.;Nomen, f.;b2 society
die Arznei, die Arzneien;medicine / remedy;лекарство;Nehmen Sie diese Arznei nach dem Essen ein.;Take this medicine after eating.;Принимайте это лекарство после еды.;Nomen, f.;b2 health
der Aspekt, die Aspekte;aspect;аспект;Wir müssen alle Aspekte des Problems beleuchten.;We must examine all aspects of the problem.;Нам нужно рассмотреть все аспекты проблемы.;Nomen, m.;b2 communication
die Atmosphäre, die Atmosphären;atmosphere;атмосфера;Im Team herrscht eine offene Atmosphäre.;In the team there is an open atmosphere.;В команде царит открытая атмосфера.;Nomen, f.;b2 work
das Attest, die Atteste;medical certificate;медицинская справка;Für die Prüfung brauchen Sie bei Krankheit ein Attest.;For the exam you need a medical certificate if ill.;Для экзамена в случае болезни нужна медицинская справка.;Nomen, n.;b2 health
der Aufbau;structure / construction;структура / построение;Der Aufbau des Berichts ist sehr logisch.;The structure of the report is very logical.;Структура отчёта очень логична.;Nomen, m.;b2 study
die Auffassung, die Auffassungen;view / conception;взгляд / понимание;Nach meiner Auffassung sollte man sofort handeln.;In my view one should act immediately.;По моему мнению, следует действовать немедленно.;Nomen, f.;b2 communication
die Aufforderung, die Aufforderungen;request / demand;требование / призыв;Er reagierte sofort auf die schriftliche Aufforderung.;He reacted immediately to the written request.;Он сразу отреагировал на письменное требование.;Nomen, f.;b2 work
die Auflage, die Auflagen;edition / condition;тираж / условие / предписание;Das Buch erscheint bereits in der fünften Auflage.;The book is already appearing in its fifth edition.;Книга выходит уже пятым изданием.;Nomen, f.;b2 media
die Aufnahme, die Aufnahmen;recording / admission;запись / приём;Die Tonaufnahme ist von ausgezeichneter Qualität.;The audio recording is of excellent quality.;Аудиозапись отличного качества.;Nomen, f.;b2 media
die Aufregung;excitement / nervousness;волнение;Vor dem Auftritt spürte sie große Aufregung.;Before the performance she felt great excitement.;Перед выступлением она чувствовала сильное волнение.;Nomen, f.;b2 feelings
der Aufschwung;upswing / boom;подъём / рост;Die Wirtschaft erlebt derzeit einen leichten Aufschwung.;The economy is currently experiencing a slight upswing.;Экономика сейчас переживает лёгкий подъём.;Nomen, m.;b2 economy
der Auftrag, die Aufträge;order / commission;заказ / поручение;Unsere Firma hat einen großen Auftrag gewonnen.;Our company won a large order.;Наша компания выиграла крупный заказ.;Nomen, m.;b2 business
die Aufzeichnung, die Aufzeichnungen;recording / note;запись;Die Aufzeichnung des Vortrags steht online bereit.;The recording of the lecture is available online.;Запись лекции доступна онлайн.;Nomen, f.;b2 media
der Augenblick, die Augenblicke;moment / instant;мгновение / момент;Im ersten Augenblick war ich völlig sprachlos.;At the first moment I was completely speechless.;В первое мгновение я совершенно потерял дар речи.;Nomen, m.;b2 time
der Ausbruch, die Ausbrüche;outbreak / eruption;вспышка / извержение;Der Ausbruch des Vulkans überraschte die Bewohner.;The eruption of the volcano surprised the residents.;Извержение вулкана застало жителей врасплох.;Nomen, m.;b2 nature
die Ausdauer;endurance / perseverance;выносливость / упорство;Für einen Marathon braucht man viel Ausdauer.;For a marathon one needs a lot of endurance.;Для марафона нужна большая выносливость.;Nomen, f.;b2 sport
die Ausdehnung;expansion / extent;расширение / протяжённость;Die Ausdehnung der Stadt schreitet voran.;The expansion of the city is progressing.;Расширение города продолжается.;Nomen, f.;b2 city
die Ausfuhr, die Ausfuhren;export;экспорт / вывоз;Die Ausfuhr von Maschinen ist gestiegen.;The export of machinery has risen.;Экспорт станков вырос.;Nomen, f.;b2 economy
die Ausgabe, die Ausgaben;expense / edition;расход / издание;Wir müssen unsere monatlichen Ausgaben senken.;We must reduce our monthly expenses.;Нам нужно снизить наши ежемесячные расходы.;Nomen, f.;b2 finance
der Ausgleich;balance / compensation;баланс / компенсация;Sport bietet einen guten Ausgleich zum Büroalltag.;Sports offer a good balance to everyday office life.;Спорт даёт хороший баланс офисным будням.;Nomen, m.;b2 health
die Ausgrenzung;exclusion / marginalization;исключение / маргинализация;Soziale Ausgrenzung schadet dem Zusammenhalt.;Social exclusion harms social cohesion.;Социальная изоляция вредит сплочённости.;Nomen, f.;b2 society
die Auslage, die Auslagen;display / expenses;витрина / издержки;Die Firma erstattet alle beruflichen Auslagen.;The company reimburses all business expenses.;Компания возмещает все рабочие издержки.;Nomen, f.;b2 finance
die Auslastung;capacity utilization;загруженность;Die Auslastung der Züge ist morgens am höchsten.;Train capacity utilization is highest in the morning.;Загруженность поездов выше всего утром.;Nomen, f.;b2 travel
die Auslegung, die Auslegungen;interpretation;толкование / трактовка;Es gibt verschiedene Auslegungen dieses Gesetzes.;There are different interpretations of this law.;Существуют разные толкования этого закона.;Nomen, f.;b2 law
die Ausreise;departure (from a country);выезд (из страны);Vor der Ausreise prüfen Sie bitte Ihren Pass.;Before departure please check your passport.;Перед выездом из страны проверьте свой паспорт.;Nomen, f.;b2 travel
die Aussage, die Aussagen;statement / testimony;высказывание / показание;Seine Aussage widerspricht den Tatsachen.;His statement contradicts the facts.;Его заявление противоречит фактам.;Nomen, f.;b2 communication
die Ausschreibung, die Ausschreibungen;tender / call for bids;тендер / конкурс;Die Stadt hat eine neue Ausschreibung veröffentlicht.;The city published a new tender.;Город опубликовал новый тендер.;Nomen, f.;b2 business
die Ausstattung;equipment / furnishings;оснащение / оборудование;Die technische Ausstattung des Labors ist top.;The technical equipment of the lab is top-notch.;Техническое оснащение лаборатории на высшем уровне.;Nomen, f.;b2 tech
die Ausstrahlung;charisma / broadcast;харизма / трансляция;Sie hat eine sehr sympathische Ausstrahlung.;She has a very likable charisma.;У неё очень приятная харизма.;Nomen, f.;b2 people
der Austausch;exchange;обмен;Der fachliche Austausch mit Kollegen ist wichtig.;Professional exchange with colleagues is important.;Профессиональный обмен с коллегами важен.;Nomen, m.;b2 work
die Auszeichnung, die Auszeichnungen;award / distinction;награда / отличие;Für den Film erhielt er eine hohe Auszeichnung.;For the film he received a high award.;За этот фильм он получил высокую награду.;Nomen, f.;b2 culture
der Automat, die Automaten;vending machine / automaton;автомат;Am Bahnhof steht ein neuer Fahrkartenautomat.;At the station there is a new ticket machine.;На вокзале стоит новый билетный автомат.;Nomen, m.;b2 travel
der Autor, die Autoren;author;автор;Der Autor signiert heute sein neues Buch.;The author is signing his new book today.;Автор сегодня подписывает свою новую книгу.;Nomen, m.;b2 culture
die Bahn, die Bahnen;railway / lane / track;железная дорога / дорожка;Auf der linken Bahn fahren schnelle Autos.;In the left lane fast cars are driving.;По левой полосе едут быстрые машины.;Nomen, f.;b2 travel
der Band, die Bände;volume (book);том;Das Lexikon umfasst zwölf dicke Bände.;The encyclopedia comprises twelve thick volumes.;Энциклопедия включает двенадцать толстых томов.;Nomen, m.;b2 culture
das Band, die Bänder;ribbon / tape / band;лента / группа;Sie band ein blaues Band um das Geschenk.;She tied a blue ribbon around the gift.;Она повязала голубую ленту вокруг подарка.;Nomen, n.;b2 daily
die Basis, die Basen;basis / foundation;база / основа;Auf dieser Basis können wir weiter planen.;On this basis we can plan further.;На этой основе мы можем планировать дальше.;Nomen, f.;b2 work
der Bau;construction / building;строительство;Der Bau der neuen Brücke dauert zwei Jahre.;The construction of the new bridge takes two years.;Строительство нового моста займёт два года.;Nomen, m.;b2 city
die Bauart, die Bauarten;design / construction type;конструкция / тип постройки;Diese Bauart gilt als besonders energiesparend.;This design is considered especially energy-saving.;Такая конструкция считается особенно энергосберегающей.;Nomen, f.;b2 tech
die Beanstandung, die Beanstandungen;complaint / objection;рекламация / претензия;Die Lieferung kam ohne jede Beanstandung an.;The delivery arrived without any complaint.;Доставка пришла без каких-либо претензий.;Nomen, f.;b2 business
die Bearbeitung;processing / editing;обработка;Die Bearbeitung des Antrags dauert vier Wochen.;Processing the application takes four weeks.;Обработка заявления длится четыре недели.;Nomen, f.;b2 office
der Bedarf, die Bedarfe;demand / requirement;потребность / спрос;Bei Bedarf passen wir den Zeitplan flexibel an.;If needed we adjust the schedule flexibly.;При необходимости мы гибко скорректируем график.;Nomen, m.;b2 business
das Bedenken, die Bedenken;concern / doubt;сомнение / опасение;Ich habe erhebliche Bedenken gegen diesen Plan.;I have considerable concerns about this plan.;У меня есть серьёзные сомнения насчёт этого плана.;Nomen, n.;b2 communication
die Bedrohung, die Bedrohungen;threat;угроза;Cyberangriffe stellen eine wachsende Bedrohung dar.;Cyberattacks pose a growing threat.;Кибератаки представляют растущую угрозу.;Nomen, f.;b2 tech
das Bedürfnis, die Bedürfnisse;need / desire;потребность;Sicherheit ist ein menschliches Grundbedürfnis.;Safety is a basic human need.;Безопасность — базовая потребность человека.;Nomen, n.;b2 psychology
die Beförderung, die Beförderungen;promotion / transport;повышение / перевозка;Nach drei Jahren erhielt sie eine verdiente Beförderung.;After three years she received a deserved promotion.;Через три года она получила заслуженное повышение.;Nomen, f.;b2 work
die Befragung, die Befragungen;survey / questioning;опрос / допрос;An der Befragung nahmen tausend Personen teil.;A thousand people participated in the survey.;В опросе приняли участие тысяча человек.;Nomen, f.;b2 science
die Befreiung;liberation / exemption;освобождение;Studierende können eine Befreiung von der Gebühr beantragen.;Students can apply for an exemption from the fee.;Студенты могут подать заявление об освобождении от сбора.;Nomen, f.;b2 study
die Befürchtung, die Befürchtungen;fear / apprehension;опасение;Zum Glück haben sich meine Befürchtungen nicht bestätigt.;Luckily my fears were not confirmed.;К счастью, мои опасения не подтвердились.;Nomen, f.;b2 feelings
die Begabung, die Begabungen;talent / gift;талант / одарённость;Er besitzt eine außergewöhnliche musikalische Begabung.;He possesses an extraordinary musical talent.;Он обладает необыкновенным музыкальным талантом.;Nomen, f.;b2 culture
die Begegnung, die Begegnungen;encounter / meeting;встреча;Diese zufällige Begegnung werde ich nie vergessen.;I will never forget this chance encounter.;Эту случайную встречу я никогда не забуду.;Nomen, f.;b2 people
der Begleiter, die Begleiter;companion;спутник / сопровождающий;Ein Hund ist oft ein treuer Begleiter im Alltag.;A dog is often a loyal companion in daily life.;Собака часто является верным спутником в повседневной жизни.;Nomen, m.;b2 people
die Begrenzung, die Begrenzungen;limitation / boundary;ограничение;Auf der Autobahn gilt eine Geschwindigkeitsbegrenzung.;On the highway a speed limit applies.;На автобане действует ограничение скорости.;Nomen, f.;b2 travel
die Behandlung, die Behandlungen;treatment;лечение / обращение;Die medizinische Behandlung zeigte schnell Erfolg.;The medical treatment quickly showed success.;Медицинское лечение быстро дало результат.;Nomen, f.;b2 health
die Behauptung, die Behauptungen;claim / assertion;утверждение;Für diese Behauptung fehlen klare Beweise.;Clear evidence is missing for this claim.;Для этого утверждения не хватает чётких доказательств.;Nomen, f.;b2 communication
die Behinderung, die Behinderungen;disability / obstruction;инвалидность / препятствие;Barrierefreiheit hilft Menschen mit Behinderung im Alltag.;Accessibility helps people with disabilities in daily life.;Безбарьерная среда помогает людям с инвалидностью в быту.;Nomen, f.;b2 society
der Beifall;applause;аплодисменты;Das Publikum spendete langanhaltenden Beifall.;The audience gave prolonged applause.;Публика долго аплодировала.;Nomen, m.;b2 culture
das Bein, die Beine;leg;нога;Nach dem langen Lauf schmerzen meine Beine.;After the long run my legs ache.;После долгого бега у меня болят ноги.;Nomen, n.;b2 body
die Bekanntschaft, die Bekanntschaften;acquaintance;знакомство;Im Urlaub machten wir nette Bekanntschaften.;On vacation we made nice acquaintances.;В отпуске мы завели приятные знакомства.;Nomen, f.;b2 people
die Beleuchtung;lighting;освещение;Eine gute Beleuchtung schont die Augen beim Lesen.;Good lighting protects the eyes when reading.;Хорошее освещение бережёт глаза при чтении.;Nomen, f.;b2 home
die Bemerkung, die Bemerkungen;remark / comment;замечание;Seine ironische Bemerkung passte nicht zur Lage.;His ironic remark did not fit the situation.;Его ироничное замечание не подходило к ситуации.;Nomen, f.;b2 communication
die Bemühung, die Bemühungen;effort / endeavor;усилие / старание;Trotz aller Bemühungen scheiterte das Treffen.;Despite all efforts the meeting failed.;Несмотря на все усилия, встреча не состоялась.;Nomen, f.;b2 work
die Benachteiligung, die Benachteiligungen;disadvantage / discrimination;ущемление / дискриминация;Das Gesetz verbietet jede Benachteiligung am Arbeitsplatz.;The law prohibits any discrimination at the workplace.;Закон запрещает любую дискриминацию на рабочем месте.;Nomen, f.;b2 society
das Benzin;gasoline / petrol;бензин;Die Preise für Benzin schwanken täglich.;Gasoline prices fluctuate daily.;Цены на бензин колеблются ежедневно.;Nomen, n.;b2 travel
die Beobachtung, die Beobachtungen;observation;наблюдение;Diese Beobachtung deckt sich mit unseren Daten.;This observation matches our data.;Это наблюдение совпадает с нашими данными.;Nomen, f.;b2 science
die Bereitschaft;readiness / willingness;готовность;Vielen Dank für Ihre Bereitschaft zur Mitarbeit.;Thank you very much for your willingness to cooperate.;Большое спасибо за вашу готовность к сотрудничеству.;Nomen, f.;b2 work
der Bergbau;mining;горное дело;Früher prägte der Bergbau diese ganze Region.;Formerly mining shaped this entire region.;Раньше горное дело определяло облик всего этого региона.;Nomen, m.;b2 economy
die Berichtigung, die Berichtigungen;correction;исправление;Wir bitten um eine schnelle Berichtigung des Fehlers.;We ask for a quick correction of the error.;Мы просим о скорейшем исправлении ошибки.;Nomen, f.;b2 office
die Berufserfahrung;work experience;опыт работы;Für die Stelle werden drei Jahre Berufserfahrung erwartet.;Three years of work experience are expected for the position.;Для этой должности требуется три года опыта работы.;Nomen, f.;b2 work
die Berufung, die Berufungen;vocation / appeal;призвание / апелляция;Lehrer zu sein ist für ihn eine echte Berufung.;Being a teacher is a true vocation for him.;Быть учителем для него — настоящее призвание.;Nomen, f.;b2 work
die Beschädigung, die Beschädigungen;damage;повреждение;Überprüfen Sie das Paket auf äußere Beschädigungen.;Check the package for external damage.;Проверьте посылку на внешние повреждения.;Nomen, f.;b2 shopping
die Beschäftigung;employment / occupation;занятость / занятие;Die Beschäftigung im Dienstleistungssektor nimmt zu.;Employment in the service sector is increasing.;Занятость в сфере услуг растёт.;Nomen, f.;b2 economy
der Bescheid, die Bescheide;notice / decision;уведомление / решение;Geben Sie mir bitte bis morgen früh Bescheid.;Please let me know by tomorrow morning.;Пожалуйста, дайте мне знать до завтрашнего утра.;Nomen, m.;b2 communication
die Bescheinigung, die Bescheinigungen;certificate / attestation;справка / удостоверение;Die Universität stellt eine Immatrikulationsbescheinigung aus.;The university issues an enrollment certificate.;Университет выдаёт справку о зачислении.;Nomen, f.;b2 study
die Beschränkung, die Beschränkungen;restriction / limitation;ограничение;Während der Bauzeit gelten zeitliche Beschränkungen.;During construction time restrictions apply.;На время строительства действуют временные ограничения.;Nomen, f.;b2 society
der Bestandteil, die Bestandteile;component / ingredient;составная часть / компонент;Vertrauen ist ein wichtiger Bestandteil der Partnerschaft.;Trust is an important component of partnership.;Доверие — важная составная часть партнёрства.;Nomen, m.;b2 daily
die Bestätigung, die Bestätigungen;confirmation;подтверждение;Haben Sie schon eine schriftliche Bestätigung erhalten?;Have you already received a written confirmation?;Вы уже получили письменное подтверждение?;Nomen, f.;b2 work
die Bestechung;bribery;взяточничество / подкуп;Bestechung ist eine schwere Straftat.;Bribery is a serious criminal offense.;Взяточничество — тяжкое преступление.;Nomen, f.;b2 law
die Bestimmung, die Bestimmungen;provision / regulation / destiny;предписание / определение;Die gesetzlichen Bestimmungen müssen eingehalten werden.;The legal regulations must be observed.;Законодательные предписания должны соблюдаться.;Nomen, f.;b2 law
die Bestrafung, die Bestrafungen;punishment;наказание;Eine gerechte Bestrafung soll vor weiteren Taten abschrecken.;A fair punishment is meant to deter further acts.;Справедливое наказание должно удерживать от новых нарушений.;Nomen, f.;b2 law
der Betrag, die Beträge;amount (of money);сумма;Bitte überweisen Sie den offenen Betrag bis Montag.;Please transfer the outstanding amount by Monday.;Пожалуйста, переведите неоплаченную сумму до понедельника.;Nomen, m.;b2 finance
der Betreiber, die Betreiber;operator;оператор / владелец;Der Betreiber der Website haftet für die Inhalte.;The operator of the website is liable for the content.;Владелец сайта несёт ответственность за содержание.;Nomen, m.;b2 tech
die Betreuung;care / support / supervision;уход / сопровождение / курирование;Die Kinderbetreuung ist in dieser Stadt gut ausgebaut.;Childcare is well developed in this city.;Уход за детьми в этом городе хорошо организован.;Nomen, f.;b2 society
der Betrug;fraud;мошенничество / обман;Die Polizei warnt vor Betrug im Internet.;The police warn against fraud on the internet.;Полиция предупреждает о мошенничестве в интернете.;Nomen, m.;b2 law
die Beurteilung, die Beurteilungen;assessment / evaluation;оценка / характеристика;Am Ende des Praktikums erhältst du eine Beurteilung.;At the end of the internship you receive an evaluation.;В конце практики ты получишь характеристику.;Nomen, f.;b2 work
die Bewegung, die Bewegungen;movement;движение;Regelmäßige Bewegung hält das Herz gesund.;Regular exercise keeps the heart healthy.;Регулярное движение поддерживает сердце здоровым.;Nomen, f.;b2 health
die Bewertung, die Bewertungen;rating / evaluation;оценка / отзыв;Vor dem Kauf lese ich oft Kundenbewertungen.;Before buying I often read customer reviews.;Перед покупкой я часто читаю отзывы покупателей.;Nomen, f.;b2 shopping
die Bewilligung, die Bewilligungen;approval / grant;одобрение / разрешение;Die Bewilligung der Fördermittel dauerte zwei Monate.;Approval of the grant funds took two months.;Одобрение грантовых средств заняло два месяца.;Nomen, f.;b2 finance
der Bewohner, die Bewohner;resident / inhabitant;житель / обитатель;Alle Bewohner des Hauses kennen sich gut.;All residents of the building know each other well.;Все жильцы дома хорошо знают друг друга.;Nomen, m.;b2 home
die Bildungspolitik;education policy;образовательная политика;Die Bildungspolitik wird im Landtag diskutiert.;Education policy is being discussed in the state parliament.;Образовательная политика обсуждается в земельном парламенте.;Nomen, f.;b2 politics
die Bindung, die Bindungen;bond / tie / binding;связь / привязанность;Eine starke familiäre Bindung gibt Kindern Halt.;A strong family bond gives children stability.;Крепкая семейная связь даёт детям опору.;Nomen, f.;b2 family
die Biologie;biology;биология;In der Biologie untersuchen wir heute Zellen.;In biology today we are examining cells.;На биологии мы сегодня изучаем клетки.;Nomen, f.;b2 science
die Blase, die Blasen;bubble / blister / bladder;пузырь / мозоль;Von den neuen Schuhen bekam ich eine Blase.;From the new shoes I got a blister.;От новой обуви у меня появилась мозоль.;Nomen, f.;b2 health
der Blickwinkel, die Blickwinkel;perspective / point of view;точка зрения / ракурс;Aus diesem Blickwinkel sieht die Sache anders aus.;From this perspective the matter looks different.;С этой точки зрения дело выглядит иначе.;Nomen, m.;b2 communication
der Blitz, die Blitze;lightning / flash;молния / вспышка;Ein heller Blitz erleuchtete den Nachthimmel.;A bright flash of lightning lit up the night sky.;Яркая молния осветила ночное небо.;Nomen, m.;b2 nature
die Blockade, die Blockaden;blockade / mental block;блокада / затор;Manchmal hat man bei Prüfungen eine Denkblockade.;Sometimes one has a mental block during exams.;Иногда на экзаменах возникает ступор.;Nomen, f.;b2 psychology
die Blüte, die Blüten;blossom / bloom;цветок / расцвет;Die Kirschblüte zieht jedes Jahr Touristen an.;The cherry blossom attracts tourists every year.;Цветение сакуры каждый год привлекает туристов.;Nomen, f.;b2 nature
die Börse, die Börsen;stock exchange / purse;биржа / кошелёк;An der Börse reagieren Kurse auf politische Nachrichten.;At the stock exchange prices react to political news.;На бирже котировки реагируют на политические новости.;Nomen, f.;b2 finance
der Brauch, die Bräuche;custom / tradition;обычай / традиция;Viele alte Bräuche werden im Dorf noch gepflegt.;Many old customs are still cultivated in the village.;Многие старые обычаи до сих пор соблюдаются в деревне.;Nomen, m.;b2 culture
die Breite, die Breiten;width / latitude;ширина / широта;Messen Sie bitte zuerst die genaue Breite der Tür.;Please first measure the exact width of the door.;Пожалуйста, сначала измерьте точную ширину двери.;Nomen, f.;b2 daily
die Bremse, die Bremsen;brake;тормоз;Die Bremsen des Fahrrads müssen überprüft werden.;The brakes of the bicycle need to be checked.;Тормоза велосипеда нужно проверить.;Nomen, f.;b2 travel
der Brennstoff, die Brennstoffe;fuel;топливо;Fossile Brennstoffe belasten das Klima stark.;Fossil fuels heavily burden the climate.;Ископаемое топливо сильно вредит климату.;Nomen, m.;b2 environment
die Briefwahl;postal voting;голосование по почте;Immer mehr Menschen nutzen die Briefwahl.;More and more people are using postal voting.;Всё больше людей пользуются голосованием по почте.;Nomen, f.;b2 politics
das Bündnis, die Bündnisse;alliance / coalition;союз / альянс;Die Parteien schlossen ein stabiles Bündnis.;The parties formed a stable alliance.;Партии заключили прочный союз.;Nomen, n.;b2 politics
die Bürokratie;bureaucracy;бюрократия;Viele Bürger klagen über zu viel Bürokratie.;Many citizens complain about too much bureaucracy.;Многие граждане жалуются на чрезмерную бюрократию.;Nomen, f.;b2 politics
der Charakter, die Charaktere;character;характер;Eine schwierige Lage zeigt den wahren Charakter.;A difficult situation reveals true character.;Сложная ситуация показывает истинный характер.;Nomen, m.;b2 people
die Chemie;chemistry;химия;Chemie spielt in der modernen Medizin eine große Rolle.;Chemistry plays a big role in modern medicine.;Химия играет большую роль в современной медицине.;Nomen, f.;b2 science
die Chronik, die Chroniken;chronicle;хроника;Die Stadtchronik reicht bis ins Mittelalter zurück.;The city chronicle dates back to the Middle Ages.;Городская хроника уходит корнями в Средневековье.;Nomen, f.;b2 history
das Dachgeschoss, die Dachgeschosse;attic / top floor;мансарда / чердачный этаж;Im Dachgeschoss ist es im Sommer oft sehr warm.;In the attic apartment it is often very warm in summer.;На мансардном этаже летом часто очень жарко.;Nomen, n.;b2 home
die Dankbarkeit;gratitude;благодарность;Er zeigte seine tiefe Dankbarkeit mit einem Brief.;He showed his deep gratitude with a letter.;Он выразил свою глубокую благодарность в письме.;Nomen, f.;b2 feelings
der Datenschutz;data protection / privacy;защита данных;Strenger Datenschutz ist im Internet unverzichtbar.;Strict data protection is indispensable on the internet.;Строгая защита данных в интернете незаменима.;Nomen, m.;b2 tech
die Deckung;coverage / cover;покрытие / укрытие;Die Versicherung bietet volle Deckung bei Schäden.;The insurance offers full coverage for damages.;Страховка обеспечивает полное покрытие при ущербе.;Nomen, f.;b2 finance
die Definition, die Definitionen;definition;определение;Diese Definition ist kurz und leicht zu merken.;This definition is short and easy to remember.;Это определение короткое и легко запоминается.;Nomen, f.;b2 study
das Defizit, die Defizite;deficit;дефицит;Die Gemeinde kämpft mit einem Haushaltsdefizit.;The municipality is struggling with a budget deficit.;Муниципалитет борется с дефицитом бюджета.;Nomen, n.;b2 finance
die Dekoration, die Dekorationen;decoration;декорация / украшение;Die Dekoration im Saal sah sehr festlich aus.;The decoration in the hall looked very festive.;Украшение зала выглядело очень празднично.;Nomen, f.;b2 culture
die Delegation, die Delegationen;delegation;делегация;Eine Delegation aus Japan besuchte das Werk.;A delegation from Japan visited the plant.;Делегация из Японии посетила завод.;Nomen, f.;b2 business
die Demokratie, die Demokratien;democracy;демократия;Freie Wahlen sind das Fundament der Demokratie.;Free elections are the foundation of democracy.;Свободные выборы — фундамент демократии.;Nomen, f.;b2 politics
die Demonstration, die Demonstrationen;demonstration / protest;демонстрация;Auf dem Marktplatz fand eine friedliche Demonstration statt.;A peaceful demonstration took place on the market square.;На рыночной площади прошла мирная демонстрация.;Nomen, f.;b2 politics
das Denkmal, die Denkmäler;monument / memorial;памятник;Das alte Denkmal wird gerade restauriert.;The old monument is currently being restored.;Старый памятник сейчас реставрируют.;Nomen, n.;b2 culture
der Dialekt, die Dialekte;dialect;диалект;In Bayern sprechen viele Menschen einen starken Dialekt.;In Bavaria many people speak a strong dialect.;В Баварии многие люди говорят на сильном диалекте.;Nomen, m.;b2 culture
der Dialog, die Dialoge;dialogue;диалог;Ein offener Dialog hilft Konflikte zu lösen.;An open dialogue helps resolve conflicts.;Открытый диалог помогает решать конфликты.;Nomen, m.;b2 communication
die Dichte;density;плотность;Die Bevölkerungsdichte in Großstädten ist sehr hoch.;Population density in big cities is very high.;Плотность населения в крупных городах очень высока.;Nomen, f.;b2 geography
der Diebstahl, die Diebstähle;theft;кража;Jeder Diebstahl muss der Polizei gemeldet werden.;Every theft must be reported to the police.;О каждой краже нужно сообщать в полицию.;Nomen, m.;b2 law
die Dienstleistung, die Dienstleistungen;service;услуга;Unser Unternehmen bietet digitale Dienstleistungen an.;Our company offers digital services.;Наша компания предлагает цифровые услуги.;Nomen, f.;b2 business
das Diktat, die Diktate;dictation;диктант;Im Sprachkurs schreiben wir oft kurze Diktate.;In the language course we often write short dictations.;На языковых курсах мы часто пишем короткие диктанты.;Nomen, n.;b2 study
die Disziplin, die Disziplinen;discipline;дисциплина;Für das Fernstudium braucht man viel Disziplin.;For distance learning one needs a lot of discipline.;Для дистанционного обучения нужна большая дисциплина.;Nomen, f.;b2 study
das Dokument, die Dokumente;document;документ;Bitte scannen Sie alle relevanten Dokumente ein.;Please scan all relevant documents.;Пожалуйста, отсканируйте все необходимые документы.;Nomen, n.;b2 office
die Dokumentation, die Dokumentationen;documentary / documentation;документальный фильм / документация;Im Fernsehen lief eine spannende Dokumentation über das Meer.;On TV there was an exciting documentary about the sea.;По телевизору шёл увлекательный документальный фильм о море.;Nomen, f.;b2 media
die Dosis, die Dosen;dose;доза;Überschreiten Sie niemals die empfohlene Dosis.;Never exceed the recommended dose.;Никогда не превышайте рекомендованную дозу.;Nomen, f.;b2 health
der Dreh, die Drehs;trick / shoot (film);трюк / съёмка;Mit dem richtigen Dreh lässt sich die Tür leicht öffnen.;With the right trick the door opens easily.;Если знать хитрость, дверь легко открывается.;Nomen, m.;b2 daily
die Drohung, die Drohungen;threat;угроза;Er ließ sich von der Drohung nicht einschüchtern.;He did not let himself be intimidated by the threat.;Он не позволил угрозе себя запугать.;Nomen, f.;b2 society
die Duldung;toleration;терпимость / отсрочка депортации;Gegenseitige Duldung erleichtert das Zusammenleben.;Mutual tolerance makes living together easier.;Взаимная терпимость облегчает совместную жизнь.;Nomen, f.;b2 society
die Durchsage, die Durchsagen;announcement;объявление (по громкой связи);Achten Sie auf die Durchsage am Gleis vier.;Pay attention to the announcement on platform four.;Обратите внимание на объявление на четвёртой платформе.;Nomen, f.;b2 travel
der Durchschnittswert, die Durchschnittswerte;average value;среднее значение;Der Durchschnittswert liegt deutlich über dem Vorjahr.;The average value is clearly above last year.;Среднее значение заметно выше прошлогоднего.;Nomen, m.;b2 science
das Echo, die Echos;echo;эхо;In den Bergen hörte man ein deutliches Echo.;In the mountains one heard a clear echo.;В горах было слышно отчётливое эхо.;Nomen, n.;b2 nature
der Effekt, die Effekte;effect;эффект;Die Maßnahme zeigte sofort den gewünschten Effekt.;The measure immediately showed the desired effect.;Мера сразу дала желаемый эффект.;Nomen, m.;b2 work
die Effizienz;efficiency;эффективность;Neue Abläufe steigern die Effizienz im Betrieb.;New workflows increase efficiency in the company.;Новые процессы повышают эффективность на предприятии.;Nomen, f.;b2 business
der Eigentümer, die Eigentümer;owner;владелец / собственник;Der Eigentümer hat das Gebäude komplett saniert.;The owner completely renovated the building.;Владелец полностью отремонтировал здание.;Nomen, m.;b2 home
die Eignung;suitability / aptitude;пригодность;Ein Test prüft die berufliche Eignung der Bewerber.;A test checks the professional aptitude of applicants.;Тест проверяет профессиональную пригодность кандидатов.;Nomen, f.;b2 work
die Einigung, die Einigungen;agreement / settlement;соглашение / договорённость;Nach langen Verhandlungen gelang endlich eine Einigung.;After long negotiations an agreement was finally reached.;После долгих переговоров наконец удалось достичь соглашения.;Nomen, f.;b2 politics
der Einklang;harmony / accord;согласие / гармония;Mensch und Natur sollten im Einklang leben.;Humans and nature should live in harmony.;Человек и природа должны жить в гармонии.;Nomen, m.;b2 environment
die Einleitung, die Einleitungen;introduction;введение;Die Einleitung eines Aufsatzes weckt das Interesse.;The introduction of an essay arouses interest.;Введение эссе пробуждает интерес.;Nomen, f.;b2 study
die Einnahmequelle, die Einnahmequellen;source of income;источник дохода;Der Tourismus ist für die Region eine wichtige Einnahmequelle.;Tourism is an important source of income for the region.;Туризм является для региона важным источником дохода.;Nomen, f.;b2 economy
die Einreise;entry (into a country);въезд (в страну);Für die Einreise benötigt man ein gültiges Visum.;For entry into the country one needs a valid visa.;Для въезда в страну нужна действующая виза.;Nomen, f.;b2 travel
der Einsatz, die Einsätze;use / commitment / deployment;применение / самоотдача / выезд;Ohne deinen persönlichen Einsatz hätten wir das nicht geschafft.;Without your personal commitment we would not have managed it.;Без твоей личной самоотдачи мы бы с этим не справились.;Nomen, m.;b2 work
die Einschätzung, die Einschätzungen;assessment / estimation;оценка / мнение;Nach meiner Einschätzung dauert die Reparatur zwei Tage.;In my estimation the repair will take two days.;По моей оценке, ремонт займёт два дня.;Nomen, f.;b2 work
die Einschränkung, die Einschränkungen;restriction / limitation;ограничение;Während der Pandemie gab es viele Einschränkungen.;During the pandemic there were many restrictions.;Во время пандемии было много ограничений.;Nomen, f.;b2 society
die Einsparung, die Einsparungen;saving / cut;экономия;Durch moderne Heizungen sind große Einsparungen möglich.;Through modern heating systems large savings are possible.;Благодаря современному отоплению возможна большая экономия.;Nomen, f.;b2 finance
die Einwanderung;immigration;иммиграция;Einwanderung prägt viele europäische Großstädte.;Immigration shapes many major European cities.;Иммиграция формирует облик многих крупных европейских городов.;Nomen, f.;b2 society
der Einwand, die Einwände;objection;возражение;Haben Sie noch Einwände gegen diesen Entwurf?;Do you still have objections to this draft?;У вас ещё есть возражения против этого проекта?;Nomen, m.;b2 communication
die Einwirkung, die Einwirkungen;effect / influence;воздействие;Unter der Einwirkung von Wärme schmilzt das Wachs.;Under the effect of heat the wax melts.;Под воздействием тепла воск плавится.;Nomen, f.;b2 science
der Einzelfall, die Einzelfälle;individual case;отдельный случай;Jeder Einzelfall wird von der Kommission geprüft.;Each individual case is examined by the commission.;Каждый отдельный случай рассматривается комиссией.;Nomen, m.;b2 law
die Einzelhandelsbranche;retail sector;розничная торговля;Die Einzelhandelsbranche spürt die Kaufzurückhaltung.;The retail sector feels the consumer restraint.;Сфера розничной торговли ощущает сдержанность покупателей.;Nomen, f.;b2 economy
das Eisenerz, die Eisenerze;iron ore;железная руда;Für die Stahlproduktion benötigt man viel Eisenerz.;For steel production a lot of iron ore is needed.;Для производства стали требуется много железной руды.;Nomen, n.;b2 economy
das Element, die Elemente;element;элемент;Wasserstoff ist das leichteste chemische Element.;Hydrogen is the lightest chemical element.;Водород — самый лёгкий химический элемент.;Nomen, n.;b2 science
die Emission, die Emissionen;emission;выброс / эмиссия;Der Verkehr verursacht hohe CO2-Emissionen.;Traffic causes high CO2 emissions.;Транспорт вызывает высокие выбросы CO2.;Nomen, f.;b2 environment
die Emotion, die Emotionen;emotion;эмоция;Musik weckt oft starke Emotionen.;Music often awakens strong emotions.;Музыка часто пробуждает сильные эмоции.;Nomen, f.;b2 psychology
die Empfindlichkeit;sensitivity;чувствительность;Die Empfindlichkeit der Sensoren wurde erhöht.;The sensitivity of the sensors was increased.;Чувствительность датчиков была повышена.;Nomen, f.;b2 tech
die Empörung;indignation / outrage;возмущение;Die Ankündigung löste große Empörung aus.;The announcement triggered great outrage.;Объявление вызвало сильное возмущение.;Nomen, f.;b2 society
das Engagement;commitment / involvement;вовлечённость / активность;Ihr ehrenamtliches Engagement verdient großen Respekt.;Her voluntary commitment deserves great respect.;Её волонтёрская активность заслуживает большого уважения.;Nomen, n.;b2 society
der Engpass, die Engpässe;bottleneck / shortage;узкое место / дефицит;Bei der Lieferung kam es zu einem Engpass.;During delivery a bottleneck occurred.;При доставке возник дефицит.;Nomen, m.;b2 business
der Enkel, die Enkel;grandson / grandchild;внук;Am Wochenende besuchten uns unsere Enkel.;On the weekend our grandchildren visited us.;На выходных нас навестили наши внуки.;Nomen, m.;b2 family
die Entdeckung, die Entdeckungen;discovery;открытие;Die Entdeckung des Penicillins rettete Millionen Leben.;The discovery of penicillin saved millions of lives.;Открытие пенициллина спасло миллионы жизней.;Nomen, f.;b2 science
die Entfernung, die Entfernungen;distance / removal;расстояние / удаление;Aus der Entfernung sah der Turm ganz klein aus.;From a distance the tower looked very small.;Издалека башня казалась совсем маленькой.;Nomen, f.;b2 geography
die Entführung, die Entführungen;kidnapping / hijacking;похищение;Die Polizei klärte die Entführung innerhalb eines Tages auf.;The police solved the kidnapping within one day.;Полиция раскрыла похищение за один день.;Nomen, f.;b2 law
die Entlastung;relief / exoneration;облегчение / разгрузка;Die neue Umgehungsstraße bringt eine spürbare Entlastung.;The new bypass road brings noticeable relief.;Новая объездная дорога приносит заметное облегчение.;Nomen, f.;b2 city
die Entschädigung, die Entschädigungen;compensation;компенсация;Bei Flugverspätungen steht Passagieren oft eine Entschädigung zu.;In case of flight delays passengers are often entitled to compensation.;При задержках рейса пассажирам часто положена компенсация.;Nomen, f.;b2 law
die Entspannung;relaxation / easing;расслабление / разрядка;Yoga sorgt bei mir für schnelle Entspannung.;Yoga provides quick relaxation for me.;Йога обеспечивает мне быстрое расслабление.;Nomen, f.;b2 health
die Entstehung;origin / emergence;возникновение;Die Entstehung des Universums fasziniert Forscher.;The origin of the universe fascinates researchers.;Возникновение Вселенной завораживает исследователей.;Nomen, f.;b2 science
die Enttäuschung, die Enttäuschungen;disappointment;разочарование;Nach der Niederlage war die Enttäuschung groß.;After the defeat the disappointment was great.;После поражения разочарование было велико.;Nomen, f.;b2 feelings
die Epidemie, die Epidemien;epidemic;эпидемия;Hygiene hilft, eine Epidemie einzudämmen.;Hygiene helps contain an epidemic.;Гигиена помогает сдержать эпидемию.;Nomen, f.;b2 health
die Epoche, die Epochen;epoch / era;эпоха;Die Renaissance war eine prägende Epoche der Kunst.;The Renaissance was a formative era of art.;Ренессанс был определяющей эпохой искусства.;Nomen, f.;b2 history
das Erbe;heritage / inheritance;наследие / наследство;Dieses Bauwerk gehört zum kulturellen Erbe.;This building belongs to the cultural heritage.;Это сооружение относится к культурному наследию.;Nomen, n.;b2 culture
das Erdgeschoss, die Erdgeschosse;ground floor;первый этаж;Die Apotheke befindet sich direkt im Erdgeschoss.;The pharmacy is located directly on the ground floor.;Аптека находится прямо на первом этаже.;Nomen, n.;b2 home
das Erdöl;crude oil / petroleum;нефть;Viele Produkte basieren noch immer auf Erdöl.;Many products are still based on petroleum.;Многие товары до сих пор производятся на основе нефти.;Nomen, n.;b2 economy
der Erfinder, die Erfinder;inventor;изобретатель;Der Erfinder meldete ein Patent auf seine Idee an.;The inventor registered a patent for his idea.;Изобретатель оформил патент на свою идею.;Nomen, m.;b2 science
die Erfindung, die Erfindungen;invention;изобретение;Der Buchdruck war eine revolutionäre Erfindung.;Printing was a revolutionary invention.;Книгопечатание было революционным изобретением.;Nomen, f.;b2 history
die Erforschung;exploration / research;исследование;Die Erforschung der Tiefsee steht erst am Anfang.;The exploration of the deep sea is only at the beginning.;Исследование морских глубин только начинается.;Nomen, f.;b2 science
die Erkennung;recognition / detection;распознавание;Die Früherkennung von Krankheiten rettet Leben.;Early detection of diseases saves lives.;Ранняя диагностика болезней спасает жизни.;Nomen, f.;b2 health
die Ermittlung, die Ermittlungen;investigation;расследование;Die polizeilichen Ermittlungen dauern noch an.;The police investigations are still ongoing.;Полицейское расследование всё ещё продолжается.;Nomen, f.;b2 law
die Eröffnung, die Eröffnungen;opening;открытие;Zur Eröffnung der Ausstellung kamen viele Gäste.;Many guests came to the opening of the exhibition.;На открытие выставки пришло много гостей.;Nomen, f.;b2 culture
die Errichtung;erection / establishment;возведение / создание;Die Errichtung des neuen Windparks beginnt im Mai.;Construction of the new wind farm begins in May.;Строительство нового ветропарка начинается в мае.;Nomen, f.;b2 environment
die Erscheinung, die Erscheinungen;phenomenon / appearance;явление / внешность;Dieses Wetterphänomen ist eine seltene Erscheinung.;This weather phenomenon is a rare occurrence.;Это погодное явление — редкий феномен.;Nomen, f.;b2 nature
die Erschöpfung;exhaustion;истощение / изнеможение;Nach dem Wettkampf sank er vor Erschöpfung zu Boden.;After the competition he sank to the ground from exhaustion.;После соревнований он упал на землю от истощения.;Nomen, f.;b2 health
die Ersparnis, die Ersparnisse;savings;сбережения / экономия;Er investierte seine gesamten Ersparnisse in das Haus.;He invested all his savings into the house.;Он вложил все свои сбережения в дом.;Nomen, f.;b2 finance
die Erstattung, die Erstattungen;reimbursement / refund;возмещение / возврат;Die Erstattung des Ticketpreises dauerte eine Woche.;The refund of the ticket price took one week.;Возврат стоимости билета занял неделю.;Nomen, f.;b2 finance
der Ertrag, die Erträge;yield / return;доход / урожай / отдача;Die Solarmodule liefern im Sommer hohe Erträge.;The solar panels deliver high yields in summer.;Солнечные панели дают высокую отдачу летом.;Nomen, m.;b2 economy
die Erweiterung, die Erweiterungen;expansion / extension;расширение;Die Erweiterung der Software bringt neue Funktionen.;The expansion of the software brings new features.;Расширение программы приносит новые функции.;Nomen, f.;b2 tech
die Ethik;ethics;этика;In der Medizin spielt Ethik eine zentrale Rolle.;In medicine ethics plays a central role.;В медицине этика играет центральную роль.;Nomen, f.;b2 science
das Etikett, die Etiketten;label / tag;этикетка;Auf dem Etikett stehen alle Inhaltsstoffe.;On the label all ingredients are listed.;На этикетке указаны все ингредиенты.;Nomen, n.;b2 shopping
die Existenz, die Existenzen;existence / livelihood;существование;Viele kleine Läden kämpfen um ihre Existenz.;Many small shops are fighting for their existence.;Многие маленькие магазины борются за своё существование.;Nomen, f.;b2 economy
das Experiment, die Experimente;experiment;эксперимент;Das Experiment bestätigte unsere Hypothese.;The experiment confirmed our hypothesis.;Эксперимент подтвердил нашу гипотезу.;Nomen, n.;b2 science
der Experte, die Experten;expert;эксперт;Wir haben zu diesem Thema einen Experten eingeladen.;We invited an expert on this topic.;Мы пригласили эксперта по этой теме.;Nomen, m.;b2 work
der Export, die Exporte;export;экспорт;Deutschland lebt stark vom Export.;Germany relies heavily on exports.;Германия во многом живёт за счёт экспорта.;Nomen, m.;b2 economy
das Extrem, die Extreme;extreme;крайность;Man sollte nicht von einem Extrem ins andere fallen.;One should not fall from one extreme into another.;Не стоит впадать из одной крайности в другую.;Nomen, n.;b2 daily
der Fachbereich, die Fachbereiche;department / field of study;факультет / предметная область;An unserer Hochschule gibt es acht Fachbereiche.;At our university there are eight departments.;В нашем вузе восемь факультетов.;Nomen, m.;b2 study
der Fachmann, die Fachleute;specialist / expert;специалист;Für diese Reparatur braucht man einen Fachmann.;For this repair you need a specialist.;Для этого ремонта нужен специалист.;Nomen, m.;b2 work
die Fachrichtung, die Fachrichtungen;specialization / major;специализация;Welche Fachrichtung haben Sie im Studium gewählt?;Which specialization did you choose in your studies?;Какую специализацию вы выбрали во время учёбы?;Nomen, f.;b2 study
die Fakultät, die Fakultäten;faculty (university);факультет;Die juristische Fakultät befindet sich im Altbau.;The law faculty is located in the old building.;Юридический факультет находится в старом здании.;Nomen, f.;b2 study
die Falle, die Fallen;trap;ловушка;Viele Kunden tappen in versteckte Kostenfallen.;Many customers fall into hidden cost traps.;Многие клиенты попадают в ловушки скрытых расходов.;Nomen, f.;b2 finance
die Fälschung, die Fälschungen;forgery / counterfeit;подделка;Experten entlarvten das Gemälde als Fälschung.;Experts exposed the painting as a forgery.;Эксперты разоблачили картину как подделку.;Nomen, f.;b2 law
die Fassung, die Fassungen;version / composure;версия / оправа / самообладание;Das ist die überarbeitete Fassung des Vertrags.;This is the revised version of the contract.;Это переработанная версия договора.;Nomen, f.;b2 work
die Faulheit;laziness;лень;Aus reiner Faulheit blieb er den ganzen Tag im Bett.;Out of sheer laziness he stayed in bed all day.;От чистой лени он весь день пролежал в постели.;Nomen, f.;b2 people
das Fazit;conclusion / summary;итог / вывод;Mein Fazit nach dem Test fällt positiv aus.;My conclusion after the test is positive.;Мой вывод после теста положительный.;Nomen, n.;b2 study
die Feder, die Federn;feather / spring;перо / пружина;Die Matratze hat stabile Stahlfedern.;The mattress has sturdy steel springs.;У матраса прочные стальные пружины.;Nomen, f.;b2 home
die Fehlentscheidung, die Fehlentscheidungen;wrong decision;ошибочное решение;Diese Investition war leider eine Fehlentscheidung.;This investment was unfortunately a wrong decision.;Эта инвестиция, к сожалению, была ошибочным решением.;Nomen, f.;b2 business
die Feierlichkeit, die Feierlichkeiten;ceremony / festivity;торжество;Die Feierlichkeiten zum Jubiläum dauern drei Tage.;The anniversary festivities last three days.;Торжества по случаю юбилея длятся три дня.;Nomen, f.;b2 culture
die Feindschaft, die Feindschaften;hostility / enmity;вражда;Aus dem Missverständnis entstand eine lange Feindschaft.;From the misunderstanding arose a long enmity.;Из недоразумения возникла долгая вражда.;Nomen, f.;b2 people
die Festplatte, die Festplatten;hard drive;жёсткий диск;Ich sichere meine Fotos auf einer externen Festplatte.;I back up my photos on an external hard drive.;Я сохраняю свои фото на внешнем жёстком диске.;Nomen, f.;b2 tech
die Figur, die Figuren;figure / character;фигура / персонаж;Die Hauptfigur des Romans wirkt sehr lebendig.;The main character of the novel feels very lifelike.;Главный герой романа кажется очень живым.;Nomen, f.;b2 culture
die Filiale, die Filialen;branch (office/store);филиал;Unsere Bank eröffnet eine neue Filiale im Norden.;Our bank is opening a new branch in the north.;Наш банк открывает новый филиал на севере.;Nomen, f.;b2 business
die Finanzierung, die Finanzierungen;financing / funding;финансирование;Die Finanzierung des Projekts ist gesichert.;The funding of the project is secured.;Финансирование проекта обеспечено.;Nomen, f.;b2 finance
die Flucht;escape / flight;бегство / побег;Die Familie begab sich auf eine lange Flucht.;The family embarked on a long flight.;Семья отправилась в долгое бегство.;Nomen, f.;b2 society
der Flüchtling, die Flüchtlinge;refugee;беженец;Viele Ehrenamtliche helfen den angekommenen Flüchtlingen.;Many volunteers help the arriving refugees.;Многие волонтёры помогают прибывшим беженцам.;Nomen, m.;b2 society
der Flugverkehr;air traffic;авиасообщение;Durch das Unwetter kam der Flugverkehr zum Erliegen.;Due to the storm air traffic came to a standstill.;Из-за непогоды авиасообщение остановилось.;Nomen, m.;b2 travel
die Flut, die Fluten;flood / high tide;наводнение / прилив;Bei Flut steigt das Wasser an der Nordsee stark an.;At high tide the water at the North Sea rises sharply.;Во время прилива вода в Северном море сильно поднимается.;Nomen, f.;b2 nature
der Fokus;focus;фокус;Der Fokus liegt heute auf erneuerbaren Energien.;The focus today is on renewable energies.;Сегодня фокус сделан на возобновляемых источниках энергии.;Nomen, m.;b2 environment
die Förderung, die Förderungen;support / funding / promotion;поддержка / финансирование;Junge Talente erhalten eine staatliche Förderung.;Young talents receive state funding.;Молодые таланты получают государственную поддержку.;Nomen, f.;b2 society
das Format, die Formate;format;формат;Bitte senden Sie die Datei im PDF-Format.;Please send the file in PDF format.;Пожалуйста, отправьте файл в формате PDF.;Nomen, n.;b2 tech
der Forscher, die Forscher;researcher;исследователь;Die Forscher entdeckten eine neue Tierart.;The researchers discovered a new animal species.;Исследователи открыли новый вид животных.;Nomen, m.;b2 science
die Forschung, die Forschungen;research;исследование / наука;Ohne Forschung gibt es keinen medizinischen Fortschritt.;Without research there is no medical progress.;Без исследований нет медицинского прогресса.;Nomen, f.;b2 science
der Fortbestand;continued existence;дальнейшее существование;Der Fortbestand des Vereins ist nun gesichert.;The continued existence of the club is now secured.;Дальнейшее существование клуба теперь обеспечено.;Nomen, m.;b2 society
die Fortbildung, die Fortbildungen;further training;повышение квалификации;Regelmäßige Fortbildungen halten das Wissen aktuell.;Regular further training keeps knowledge up to date.;Регулярное повышение квалификации поддерживает знания в актуальном состоянии.;Nomen, f.;b2 work
die Fortsetzung, die Fortsetzungen;continuation / sequel;продолжение;Die Fortsetzung des Films kommt nächstes Jahr.;The sequel to the film is coming next year.;Продолжение фильма выйдет в следующем году.;Nomen, f.;b2 culture
die Fraktion, die Fraktionen;parliamentary group;фракция;Die Fraktion stimmte geschlossen für das Gesetz.;The parliamentary group voted unanimously for the law.;Фракция единогласно проголосовала за закон.;Nomen, f.;b2 politics
die Freigabe, die Freigaben;release / approval;одобрение / выпуск;Wir warten noch auf die Freigabe durch den Chef.;We are still waiting for approval from the boss.;Мы всё ещё ждём одобрения от начальника.;Nomen, f.;b2 work
die Freizeitgestaltung;leisure activities;организация досуга;Die Stadt bietet vielfältige Möglichkeiten zur Freizeitgestaltung.;The city offers diverse options for leisure activities.;Город предлагает разнообразные возможности для досуга.;Nomen, f.;b2 daily
die Fremdsprache, die Fremdsprachen;foreign language;иностранный язык;Jede neue Fremdsprache erweitert den Horizont.;Every new foreign language broadens the horizon.;Каждый новый иностранный язык расширяет кругозор.;Nomen, f.;b2 study
der Friedensvertrag, die Friedensverträge;peace treaty;мирный договор;Nach Jahren des Konflikts wurde ein Friedensvertrag unterzeichnet.;After years of conflict a peace treaty was signed.;После лет конфликта был подписан мирный договор.;Nomen, m.;b2 history
die Front, die Fronten;front;фронт / фасад;Die Fronten zwischen den Parteien sind verhärtet.;The fronts between the parties have hardened.;Позиции между партиями ожесточились.;Nomen, f.;b2 politics
die Fülle;abundance / fullness;изобилие / полнота;Die Fülle an Informationen überfordert manche Nutzer.;The abundance of information overwhelms some users.;Изобилие информации перегружает некоторых пользователей.;Nomen, f.;b2 media
das Fundament, die Fundamente;foundation;фундамент;Vertrauen bildet das Fundament jeder Zusammenarbeit.;Trust forms the foundation of every collaboration.;Доверие образует фундамент любого сотрудничества.;Nomen, n.;b2 work
die Furcht;fear / dread;страх / боязнь;Aus Furcht vor Fehlern wagte er keinen Schritt.;Out of fear of mistakes he dared not take a step.;Из страха перед ошибками он не решался сделать шаг.;Nomen, f.;b2 feelings
die Fusion, die Fusionen;merger;слияние;Durch die Fusion entsteht ein starker Konzern.;Through the merger a strong corporation is created.;В результате слияния возникает сильный концерн.;Nomen, f.;b2 business
die Gattung, die Gattungen;genus / genre;род / жанр;Diese literarische Gattung war im 19. Jahrhundert beliebt.;This literary genre was popular in the 19th century.;Этот литературный жанр был популярен в XIX веке.;Nomen, f.;b2 culture
das Gefälle;gradient / disparity;перепад / неравенство;Das wirtschaftliche Gefälle zwischen Stadt und Land wächst.;The economic disparity between city and countryside is growing.;Экономический разрыв между городом и селом растёт.;Nomen, n.;b2 economy
das Geflecht, die Geflechte;network / weave;сплетение / сеть;Ein dichtes Geflecht aus Regeln erschwert den Start.;A dense web of rules complicates the start.;Плотное сплетение правил усложняет старт.;Nomen, n.;b2 society
die Gefährdung, die Gefährdungen;endangerment / hazard;угроза / опасность;Rauchen bedeutet eine erhebliche Gefährdung der Gesundheit.;Smoking poses a considerable hazard to health.;Курение представляет собой значительную угрозу для здоровья.;Nomen, f.;b2 health
der Gegenstand, die Gegenstände;object / subject;предмет / тема;Der Gegenstand unserer Untersuchung ist die Luftqualität.;The subject of our investigation is air quality.;Предметом нашего исследования является качество воздуха.;Nomen, m.;b2 science
der Gegner, die Gegner;opponent;противник / оппонент;Die beiden Gegner begegneten sich mit Respekt.;The two opponents treated each other with respect.;Оба соперника относились друг к другу с уважением.;Nomen, m.;b2 sport
die Geheimhaltung;secrecy / confidentiality;конфиденциальность;Die Mitarbeiter sind zur strengen Geheimhaltung verpflichtet.;Employees are obligated to strict confidentiality.;Сотрудники обязаны соблюдать строгую конфиденциальность.;Nomen, f.;b2 business
die Gelegenheit, die Gelegenheiten;opportunity;возможность / удобный случай;Bei nächster Gelegenheit besuche ich dich in Wien.;At the next opportunity I will visit you in Vienna.;При следующем удобном случае я навещу тебя в Вене.;Nomen, f.;b2 daily
die Gelassenheit;calmness / composure;спокойствие / невозмутимость;Mit großer Gelassenheit meisterte sie die Krise.;With great composure she mastered the crisis.;С большим спокойствием она справилась с кризисом.;Nomen, f.;b2 psychology
das Gemälde, die Gemälde;painting;картина (живопись);Im Museum hängt ein berühmtes Gemälde von Rembrandt.;A famous painting by Rembrandt hangs in the museum.;В музее висит знаменитая картина Рембрандта.;Nomen, n.;b2 culture
die Gemeinde, die Gemeinden;municipality / community;община / муниципалитет;Die Gemeinde investiert in eine neue Grundschule.;The municipality is investing in a new primary school.;Муниципалитет инвестирует в новую начальную школу.;Nomen, f.;b2 politics
die Gemeinschaft, die Gemeinschaften;community;сообщество;Eine starke Gemeinschaft hilft in schweren Zeiten.;A strong community helps in difficult times.;Сильное сообщество помогает в трудные времена.;Nomen, f.;b2 society
die Genauigkeit;accuracy / precision;точность;Bei dieser Arbeit kommt es auf höchste Genauigkeit an.;In this work utmost precision matters.;В этой работе важна максимальная точность.;Nomen, f.;b2 science
die Generation, die Generationen;generation;поколение;Jede Generation hat ihre eigenen Herausforderungen.;Every generation has its own challenges.;У каждого поколения свои вызовы.;Nomen, f.;b2 society
die Genugtuung;satisfaction;удовлетворение;Mit großer Genugtuung nahm er das Urteil auf.;With great satisfaction he received the verdict.;С большим удовлетворением он воспринял приговор.;Nomen, f.;b2 feelings
der Genuss, die Genüsse;enjoyment / pleasure;наслаждение / удовольствие;Ein guter Kaffee am Morgen ist ein kleiner Genuss.;A good coffee in the morning is a small pleasure.;Хороший кофе утром — это маленькое удовольствие.;Nomen, m.;b2 food
die Gerechtigkeit;justice / fairness;справедливость;Alle Menschen sehnen sich nach Gerechtigkeit.;All people long for justice.;Все люди стремятся к справедливости.;Nomen, f.;b2 society
das Geschäftsmodell, die Geschäftsmodelle;business model;бизнес-модель;Das Startup hat ein innovatives Geschäftsmodell entwickelt.;The startup developed an innovative business model.;Стартап разработал инновационную бизнес-модель.;Nomen, n.;b2 business
der Geschmack, die Geschmäcker;taste;вкус;Über Geschmack lässt sich bekanntlich nicht streiten.;There is famously no accounting for taste.;О вкусах, как известно, не спорят.;Nomen, m.;b2 daily
die Gesetzgebung;legislation;законодательство;Die Gesetzgebung muss sich der Technik anpassen.;Legislation must adapt to technology.;Законодательство должно адаптироваться к технологиям.;Nomen, f.;b2 law
die Gestaltung;design / shaping;оформление / дизайн;Die Gestaltung der Website wirkt sehr modern.;The design of the website looks very modern.;Дизайн сайта выглядит очень современно.;Nomen, f.;b2 tech
die Geste, die Gesten;gesture;жест;Eine kleine Geste der Freundlichkeit bewirkt viel.;A small gesture of kindness achieves a lot.;Небольшой жест доброты значит очень много.;Nomen, f.;b2 people
die Gesundheitspolitik;health policy;политика здравоохранения;Die Gesundheitspolitik steht vor großen Reformen.;Health policy faces major reforms.;Политика здравоохранения стоит перед крупными реформами.;Nomen, f.;b2 politics
das Getränk, die Getränke;beverage / drink;напиток;Im Preis sind alkoholfreie Getränke enthalten.;Non-alcoholic beverages are included in the price.;Безалкогольные напитки включены в стоимость.;Nomen, n.;b2 food
das Gewächshaus, die Gewächshäuser;greenhouse;теплица;Im Gewächshaus wachsen Tomaten auch im April.;In the greenhouse tomatoes grow even in April.;В теплице помидоры растут даже в апреле.;Nomen, n.;b2 nature
die Gewähr;guarantee / warranty;гарантия;Für die Richtigkeit übernehmen wir keine Gewähr.;We assume no guarantee for the accuracy.;За точность мы ответственности не несём.;Nomen, f.;b2 law
die Gewerkschaft, die Gewerkschaften;trade union;профсоюз;Die Gewerkschaft vertritt die Interessen der Beschäftigten.;The trade union represents the interests of employees.;Профсоюз представляет интересы работников.;Nomen, f.;b2 work
die Glaubwürdigkeit;credibility;достоверность / доверие;Nach dem Skandal litt seine Glaubwürdigkeit.;After the scandal his credibility suffered.;После скандала его репутация пострадала.;Nomen, f.;b2 media
die Gleichberechtigung;equal rights;равноправие;Gleichberechtigung ist im Grundgesetz verankert.;Equal rights are anchored in the constitution.;Равноправие закреплено в основном законе.;Nomen, f.;b2 society
das Gleichgewicht;balance / equilibrium;равновесие;Die Natur befindet sich in einem empfindlichen Gleichgewicht.;Nature is in a delicate balance.;Природа находится в хрупком равновесии.;Nomen, n.;b2 environment
die Gleichheit;equality;равенство;Vor dem Gesetz gilt das Prinzip der Gleichheit.;Before the law the principle of equality applies.;Перед законом действует принцип равенства.;Nomen, f.;b2 law
die Globalisierung;globalization;глобализация;Die Globalisierung vernetzt Märkte weltweit.;Globalization connects markets worldwide.;Глобализация связывает рынки по всему миру.;Nomen, f.;b2 economy
das Grad, die Grade;degree;градус;Heute messen wir zwanzig Grad im Schatten.;Today we measure twenty degrees in the shade.;Сегодня в тени двадцать градусов.;Nomen, n.;b2 nature
die Grafik, die Grafiken;graphic / chart;графика / диаграмма;Die Grafik verdeutlicht den Anstieg der Kosten.;The chart illustrates the rise in costs.;График наглядно показывает рост расходов.;Nomen, f.;b2 work
der Grundsatz, die Grundsätze;principle;принцип;Ehrlichkeit ist einer meiner wichtigsten Grundsätze.;Honesty is one of my most important principles.;Честность — один из моих главных принципов.;Nomen, m.;b2 people
die Gründung, die Gründungen;founding / establishment;основание / создание;Seit der Gründung wächst das Unternehmen stetig.;Since its founding the company has grown steadily.;С момента основания компания стабильно растёт.;Nomen, f.;b2 business
die Gültigkeit;validity;срок действия / действительность;Die Gültigkeit des Passes läuft bald ab.;The validity of the passport expires soon.;Срок действия паспорта скоро истекает.;Nomen, f.;b2 travel
die Gunst;favor;расположение / милость;Die Gunst des Publikums muss man sich verdienen.;One must earn the favor of the audience.;Расположение публики нужно заслужить.;Nomen, f.;b2 culture
das Gutachten, die Gutachten;expert opinion / report;экспертиза / заключение;Ein unabhängiges Gutachten klärt die Schadenshöhe.;An independent expert report clarifies the amount of damage.;Независимая экспертиза определяет размер ущерба.;Nomen, n.;b2 law
die Haft;custody / detention;заключение / арест;Der Verdächtige befindet sich in Untersuchungshaft.;The suspect is in pre-trial detention.;Подозреваемый находится под стражей.;Nomen, f.;b2 law
die Haftung;liability;ответственность (материальная);Bei Vorsatz gilt die volle Haftung.;In case of intent full liability applies.;При умысле наступает полная ответственность.;Nomen, f.;b2 law
der Halt;stop / support / hold;опора / остановка;In Krisen gibt die Familie wichtigen Halt.;In crises the family gives important support.;В кризисах семья даёт важную опору.;Nomen, m.;b2 family
der Haushalt, die Haushalte;household / budget;домашнее хозяйство / бюджет;Der städtische Haushalt muss gekürzt werden.;The municipal budget has to be cut.;Городской бюджет должен быть сокращён.;Nomen, m.;b2 finance
die Hautfarbe, die Hautfarben;skin color;цвет кожи;Niemand darf wegen seiner Hautfarbe benachteiligt werden.;Nobody may be discriminated against because of skin color.;Никто не должен подвергаться дискриминации из-за цвета кожи.;Nomen, f.;b2 society
die Heilung;healing / cure;исцеление / выздоровление;Ruhe beschleunigt die Heilung nach einer Operation.;Rest speeds up healing after an operation.;Покой ускоряет выздоровление после операции.;Nomen, f.;b2 health
die Hemmung, die Hemmungen;inhibition;стеснение / торможение;Beim Sprechen sollte man seine Hemmungen ablegen.;When speaking one should drop one’s inhibitions.;При разговоре стоит отбросить стеснение.;Nomen, f.;b2 psychology
die Herrschaft;rule / dominance;господство / власть;Die Herrschaft des Gesetzes schützt alle Bürger.;The rule of law protects all citizens.;Верховенство закона защищает всех граждан.;Nomen, f.;b2 politics
die Herstellung;production / manufacturing;производство;Die Herstellung dieses Materials braucht viel Energie.;Manufacturing this material takes a lot of energy.;Производство этого материала требует много энергии.;Nomen, f.;b2 economy
das Hilfsmittel, die Hilfsmittel;aid / tool;вспомогательное средство;Im Test sind keine Hilfsmittel erlaubt.;In the test no aids are allowed.;На тесте вспомогательные средства не разрешены.;Nomen, n.;b2 study
die Hinsicht;respect / regard;отношение (в каком-то смысле);In vielerlei Hinsicht hat sich die Lage gebessert.;In many respects the situation has improved.;Во многих отношениях ситуация улучшилась.;Nomen, f.;b2 communication
der Hintergrund, die Hintergründe;background;фон / подоплёка;Vor diesem Hintergrund ist die Entscheidung verständlich.;Against this background the decision is understandable.;На этом фоне решение понятно.;Nomen, m.;b2 communication
die Hitzewelle, die Hitzewellen;heat wave;волна жары;Im Juli traf eine starke Hitzewelle das Land.;In July a severe heat wave hit the country.;В июле страну накрыла сильная волна жары.;Nomen, f.;b2 environment
der Höhepunkt, die Höhepunkte;highlight / peak;кульминация / пик;Das Feuerwerk war der Höhepunkt des Festes.;The fireworks were the highlight of the festival.;Фейерверк стал кульминацией праздника.;Nomen, m.;b2 culture
die Hürde, die Hürden;hurdle / obstacle;препятствие / барьер;Die erste bürokratische Hürde haben wir genommen.;We have cleared the first bureaucratic hurdle.;Первый бюрократический барьер мы преодолели.;Nomen, f.;b2 work
die Identität, die Identitäten;identity;личность / идентичность;Sprache prägt unsere kulturelle Identität.;Language shapes our cultural identity.;Язык формирует нашу культурную идентичность.;Nomen, f.;b2 society
die Illusion, die Illusionen;illusion;иллюзия;Mach dir keine Illusionen über den Aufwand.;Do not have any illusions about the effort.;Не питай иллюзий насчёт затрат.;Nomen, f.;b2 psychology
die Immobilie, die Immobilien;real estate / property;недвижимость;Immobilien in Großstädten sind sehr teuer geworden.;Real estate in big cities has become very expensive.;Недвижимость в крупных городах стала очень дорогой.;Nomen, f.;b2 finance
der Import, die Importe;import;импорт;Der Import von Rohstoffen verteuerte sich.;The import of raw materials became more expensive.;Импорт сырья подорожал.;Nomen, m.;b2 economy
der Impuls, die Impulse;impulse / stimulus;импульс / стимул;Die Diskussion gab wichtige Impulse für die Forschung.;The discussion gave important impulses for research.;Дискуссия дала важные импульсы для исследования.;Nomen, m.;b2 science
die Industrie, die Industrien;industry;промышленность;Die deutsche Industrie setzt verstärkt auf Automation.;German industry increasingly relies on automation.;Немецкая промышленность всё больше делает ставку на автоматизацию.;Nomen, f.;b2 economy
die Infektion, die Infektionen;infection;инфекция;Händewaschen schützt vor vielen Infektionen.;Washing hands protects against many infections.;Мытьё рук защищает от многих инфекций.;Nomen, f.;b2 health
die Inflation;inflation;инфляция;Eine hohe Inflation mindert die Kaufkraft.;High inflation reduces purchasing power.;Высокая инфляция снижает покупательную способность.;Nomen, f.;b2 finance
die Informationstechnik;information technology;информационные технологии;Ohne moderne Informationstechnik läuft heute kaum ein Büro.;Hardly any office runs today without modern IT.;Без современных информационных технологий сегодня не работает почти ни один офис.;Nomen, f.;b2 tech
die Infrastruktur;infrastructure;инфраструктура;Eine gute Infrastruktur zieht Unternehmen an.;Good infrastructure attracts companies.;Хорошая инфраструктура привлекает компании.;Nomen, f.;b2 economy
die Initiative, die Initiativen;initiative;инициатива;Die Nachbarn gründeten eine Initiative für mehr Grün.;The neighbors founded an initiative for more greenery.;Соседи основали инициативу за большее озеленение.;Nomen, f.;b2 society
die Innovation, die Innovationen;innovation;инновация;Innovation sichert langfristig Arbeitsplätze.;Innovation secures jobs in the long run.;Инновации обеспечивают рабочие места в долгосрочной перспективе.;Nomen, f.;b2 business
die Intelligenz;intelligence;интеллект;Künstliche Intelligenz verändert viele Berufe.;Artificial intelligence is changing many professions.;Искусственный интеллект меняет многие профессии.;Nomen, f.;b2 tech
die Intensität;intensity;интенсивность;Mit zunehmender Intensität trainierte das Team täglich.;With increasing intensity the team trained daily.;С возрастающей интенсивностью команда тренировалась ежедневно.;Nomen, f.;b2 sport
das Interview, die Interviews;interview;интервью;In dem Interview sprach sie offen über ihre Pläne.;In the interview she spoke openly about her plans.;В интервью она открыто рассказала о своих планах.;Nomen, n.;b2 media
die Isolation;isolation;изоляция;Soziale Isolation kann die Gesundheit belasten.;Social isolation can strain health.;Социальная изоляция может навредить здоровью.;Nomen, f.;b2 psychology
das Jahrzehnt, die Jahrzehnte;decade;десятилетие;In den letzten Jahrzehnten hat sich die Welt stark gewandelt.;In recent decades the world has changed greatly.;За последние десятилетия мир сильно изменился.;Nomen, n.;b2 time
der Journalismus;journalism;журналистика;Unabhängiger Journalismus ist für die Demokratie wichtig.;Independent journalism is important for democracy.;Независимая журналистика важна для демократии.;Nomen, m.;b2 media
das Jubiläum, die Jubiläen;anniversary;юбилей;Die Firma feiert ihr fünfzigjähriges Jubiläum.;The company is celebrating its fiftieth anniversary.;Компания празднует свой пятидесятилетний юбилей.;Nomen, n.;b2 business
die Justiz;justice system / judiciary;юстиция / правосудие;Die Unabhängigkeit der Justiz ist garantiert.;The independence of the judiciary is guaranteed.;Независимость правосудия гарантирована.;Nomen, f.;b2 law
das Kapital;capital;капитал;Für die Gründung fehlte anfangs das nötige Kapital.;At first the necessary capital was missing for founding.;Для основания сначала не хватало необходимого капитала.;Nomen, n.;b2 finance
das Kapitel, die Kapitel;chapter;глава;Dieses Kapitel schließt die Einführung ab.;This chapter concludes the introduction.;Эта глава завершает введение.;Nomen, n.;b2 study
die Karriere, die Karrieren;career;карьера;Sie machte schnell Karriere in der Beratung.;She quickly made a career in consulting.;Она быстро сделала карьеру в консалтинге.;Nomen, f.;b2 work
die Kategorie, die Kategorien;category;категория;Wählen Sie im Menü die passende Kategorie aus.;Select the matching category in the menu.;Выберите в меню подходящую категорию.;Nomen, f.;b2 tech
die Kaufkraft;purchasing power;покупательная способность;Steigende Löhne stärken die Kaufkraft.;Rising wages strengthen purchasing power.;Растущие зарплаты укрепляют покупательную способность.;Nomen, f.;b2 economy
das Kennzeichen, die Kennzeichen;license plate / characteristic;номерной знак / признак;Merken Sie sich nach einem Unfall das Kennzeichen.;Remember the license plate after an accident.;Запомните номерной знак после аварии.;Nomen, n.;b2 travel
der Kern, die Kerne;core / nucleus;ядро / суть;Der Kern seiner Aussage blieb unverändert.;The core of his statement remained unchanged.;Суть его высказывания осталась неизменной.;Nomen, m.;b2 communication
die Klärung;clarification;выяснение / прояснение;Zur Klärung des Sachverhalts treffen wir uns morgen.;To clarify the facts we will meet tomorrow.;Для прояснения обстоятельств мы встретимся завтра.;Nomen, f.;b2 work
die Klinik, die Kliniken;clinic / hospital;клиника;Die neue Klinik ist auf Herzmedizin spezialisiert.;The new clinic specializes in cardiology.;Новая клиника специализируется на кардиологии.;Nomen, f.;b2 health
die Koalition, die Koalitionen;coalition;коалиция;Nach der Wahl bildeten drei Parteien eine Koalition.;After the election three parties formed a coalition.;После выборов три партии сформировали коалицию.;Nomen, f.;b2 politics
die Kombination, die Kombinationen;combination;комбинация;Die Kombination aus Theorie und Praxis ist ideal.;The combination of theory and practice is ideal.;Сочетание теории и практики идеально.;Nomen, f.;b2 study
der Komfort;comfort;комфорт;Moderne Züge bieten den Reisenden viel Komfort.;Modern trains offer travelers a lot of comfort.;Современные поезда предлагают пассажирам большой комфорт.;Nomen, m.;b2 travel
der Kommentar, die Kommentare;comment;комментарий;Unter dem Artikel stehen hunderte Kommentare.;Under the article there are hundreds of comments.;Под статьёй сотни комментариев.;Nomen, m.;b2 media
die Kommission, die Kommissionen;commission;комиссия;Eine unabhängige Kommission prüft den Bericht.;An independent commission examines the report.;Независимая комиссия проверяет отчёт.;Nomen, f.;b2 politics
die Kommunikation;communication;коммуникация / общение;Klare Kommunikation vermeidet viele Missverständnisse.;Clear communication avoids many misunderstandings.;Чёткая коммуникация предотвращает многие недоразумения.;Nomen, f.;b2 communication
die Konzentration;concentration;концентрация;Nach fünf Stunden lässt die Konzentration nach.;After five hours concentration drops.;Через пять часов концентрация снижается.;Nomen, f.;b2 study
das Konzept, die Konzepte;concept / draft;концепция;Das neue Verkehrskonzept soll Staus reduzieren.;The new traffic concept is meant to reduce jams.;Новая транспортная концепция должна сократить пробки.;Nomen, n.;b2 city
der Konzern, die Konzerne;corporation / group;концерн;Der Konzern beschäftigt zehntausend Menschen weltweit.;The corporation employs ten thousand people worldwide.;В концерне работают десять тысяч человек по всему миру.;Nomen, m.;b2 business
der Konflikt, die Konflikte;conflict;конфликт;Friedliche Konfliktlösung ist in der Schule wichtig.;Peaceful conflict resolution is important at school.;Мирное разрешение конфликтов важно в школе.;Nomen, m.;b2 society
die Konjunktur;economic trend / cycle;конъюнктура;Die schwache Konjunktur bremst die Investitionen.;The weak economic trend slows down investments.;Слабая экономическая конъюнктура тормозит инвестиции.;Nomen, f.;b2 economy
der Konsum;consumption;потребление;Nachhaltiger Konsum schont unsere Ressourcen.;Sustainable consumption conserves our resources.;Устойчивое потребление бережёт наши ресурсы.;Nomen, m.;b2 environment
die Kontinuität;continuity;непрерывность / преемственность;Für den Erfolg des Teams ist Kontinuität entscheidend.;Continuity is decisive for the team’s success.;Для успеха команды решающее значение имеет преемственность.;Nomen, f.;b2 work
die Kooperation, die Kooperationen;cooperation;сотрудничество / кооперация;Die Kooperation zwischen den Schulen läuft gut.;The cooperation between the schools is going well.;Сотрудничество между школами идёт хорошо.;Nomen, f.;b2 study
die Kopie, die Kopien;copy;копия;Bitte fügen Sie eine Kopie Ihres Ausweises bei.;Please attach a copy of your ID.;Пожалуйста, приложите копию вашего удостоверения личности.;Nomen, f.;b2 office
die Korrektur, die Korrekturen;correction;корректировка / исправление;Nach der letzten Korrektur geht der Text in Druck.;After the last correction the text goes to print.;После последней правки текст уходит в печать.;Nomen, f.;b2 media
die Korruption;corruption;коррупция;Korruption untergräbt das Vertrauen in den Staat.;Corruption undermines trust in the state.;Коррупция подрывает доверие к государству.;Nomen, f.;b2 politics
der Kostenvoranschlag, die Kostenvoranschläge;cost estimate;смета расходов;Vor der Reparatur bitte ich um einen Kostenvoranschlag.;Before the repair I ask for a cost estimate.;Перед ремонтом я прошу составить смету.;Nomen, m.;b2 finance
die Kraftstoffsteuer;fuel tax;налог на топливо;Die Kraftstoffsteuer soll umweltfreundliches Fahren fördern.;The fuel tax is intended to promote eco-friendly driving.;Налог на топливо должен стимулировать экологичное вождение.;Nomen, f.;b2 politics
der Kreislauf, die Kreisläufe;cycle / circulation;круговорот / кровообращение;Der Wasserkreislauf ist lebenswichtig für die Erde.;The water cycle is vital for the Earth.;Круговорот воды жизненно важен для Земли.;Nomen, m.;b2 nature
die Kriminalität;crime;преступность;Die Kriminalität in diesem Viertel ist gesunken.;Crime in this neighborhood has fallen.;Преступность в этом районе снизилась.;Nomen, f.;b2 law
die Kündigung, die Kündigungen;termination / resignation;увольнение / расторжение;Die Kündigung der Wohnung muss schriftlich erfolgen.;The termination of the apartment lease must be in writing.;Расторжение договора аренды квартиры должно быть письменным.;Nomen, f.;b2 home
die Kunst;art;искусство;Zeitgenössische Kunst wirft oft spannende Fragen auf.;Contemporary art often raises exciting questions.;Современное искусство часто поднимает интересные вопросы.;Nomen, f.;b2 culture
die Lage, die Lagen;situation / location;положение / расположение;Die wirtschaftliche Lage stabilisiert sich langsam.;The economic situation is slowly stabilizing.;Экономическое положение медленно стабилизируется.;Nomen, f.;b2 economy
die Laufbahn, die Laufbahnen;career path;карьера / путь;Seine berufliche Laufbahn begann als Praktikant.;His professional career began as an intern.;Его профессиональный путь начался со стажировки.;Nomen, f.;b2 work
die Lautstärke;volume (sound);громкость;Bitte reduzieren Sie abends die Lautstärke.;Please reduce the volume in the evening.;Пожалуйста, уменьшите громкость вечером.;Nomen, f.;b2 daily
der Lebenslauf, die Lebensläufe;resume / CV;резюме / биография;Senden Sie Ihren Lebenslauf bitte als PDF.;Please send your CV as a PDF.;Пожалуйста, отправьте ваше резюме в формате PDF.;Nomen, m.;b2 work
der Lebensstandard;standard of living;уровень жизни;Der Lebensstandard ist in den letzten Jahren gestiegen.;The standard of living has risen in recent years.;Уровень жизни за последние годы вырос.;Nomen, m.;b2 society
die Lebensweise, die Lebensweisen;lifestyle;образ жизни;Eine aktive Lebensweise beugt Beschwerden vor.;An active lifestyle prevents ailments.;Активный образ жизни предотвращает недуги.;Nomen, f.;b2 health
die Leidenschaft, die Leidenschaften;passion;страсть / увлечение;Er spielt mit großer Leidenschaft Klavier.;He plays the piano with great passion.;Он играет на пианино с большой страстью.;Nomen, f.;b2 feelings
der Lieferschein, die Lieferscheine;delivery note;накладная;Bitte unterschreiben Sie den Lieferschein.;Please sign the delivery note.;Пожалуйста, подпишите накладную.;Nomen, m.;b2 business
die Literatur;literature;литература;Deutsche Literatur fasziniert Leser weltweit.;German literature fascinates readers worldwide.;Немецкая литература очаровывает читателей по всему миру.;Nomen, f.;b2 culture
das Lob;praise;похвала;Ein ehrliches Lob motiviert jedes Team.;Honest praise motivates every team.;Искренняя похвала мотивирует любую команду.;Nomen, n.;b2 work
die Logik;logic;логика;Die Logik dieses Arguments leuchtet sofort ein.;The logic of this argument is immediately obvious.;Логика этого аргумента сразу понятна.;Nomen, f.;b2 study
die Lücke, die Lücken;gap;пробел / пустое место;In meiner Planung gibt es noch eine zeitliche Lücke.;In my schedule there is still a time gap.;В моём расписании ещё есть свободное окно.;Nomen, f.;b2 work
das Management;management;менеджмент / управление;Das Management plant eine neue Strategie.;Management is planning a new strategy.;Руководство планирует новую стратегию.;Nomen, n.;b2 business
das Marketing;marketing;маркетинг;Gutes Marketing macht neue Produkte bekannt.;Good marketing makes new products known.;Хороший маркетинг делает новые продукты известными.;Nomen, n.;b2 business
der Marktanteil, die Marktanteile;market share;доля рынка;Das Unternehmen konnte seinen Marktanteil ausbauen.;The company was able to expand its market share.;Компания смогла расширить свою долю рынка.;Nomen, m.;b2 business
der Maßstab, die Maßstäbe;scale / standard;масштаб / критерий;Diese Prüfung setzt einen hohen Maßstab.;This exam sets a high standard.;Этот экзамен задаёт высокую планку.;Nomen, m.;b2 study
das Material, die Materialien;material;материал;Wir verwenden nur recycelte Materialien.;We only use recycled materials.;Мы используем только переработанные материалы.;Nomen, n.;b2 environment
die Materie;matter / subject matter;материя / тема;Er kennt sich in dieser Materie bestens aus.;He knows this subject matter inside out.;Он прекрасно разбирается в этой теме.;Nomen, f.;b2 science
das Medium, die Medien;medium / media;среда / СМИ;Digitale Medien prägen unseren Alltag.;Digital media shape our everyday lives.;Цифровые СМИ формируют нашу повседневность.;Nomen, n.;b2 media
der Meilenstein, die Meilensteine;milestone;веха / важный этап;Dieser Vertrag ist ein Meilenstein für unsere Firma.;This contract is a milestone for our company.;Этот договор — важная веха для нашей фирмы.;Nomen, m.;b2 business
die Meinungsfreiheit;freedom of opinion;свобода слова / мнений;Meinungsfreiheit ist ein zentrales Grundrecht.;Freedom of opinion is a central fundamental right.;Свобода мнений — центральное основное право.;Nomen, f.;b2 politics
die Meldung, die Meldungen;report / message;сообщение / сводка;Diese Meldung verbreitete sich rasend schnell.;This report spread rapidly.;Это сообщение распространилось молниеносно.;Nomen, f.;b2 media
die Mentalität, die Mentalitäten;mentality;менталитет;Jede Region hat ihre eigene Mentalität.;Every region has its own mentality.;У каждого региона свой менталитет.;Nomen, f.;b2 culture
das Merkmal, die Merkmale;characteristic / feature;признак / черта;Ein wichtiges Merkmal ist die hohe Zuverlässigkeit.;An important feature is the high reliability.;Важным признаком является высокая надёжность.;Nomen, n.;b2 tech
die Messe, die Messen;trade fair / mass;выставка (торговая) / месса;Auf der Buchmesse trafen sich Autoren aus aller Welt.;At the book fair authors from all over the world met.;На книжной ярмарке встретились авторы со всего мира.;Nomen, f.;b2 business
die Messung, die Messungen;measurement;измерение;Die Messung der Werte dauert nur wenige Minuten.;Measuring the values takes only a few minutes.;Измерение показателей занимает всего несколько минут.;Nomen, f.;b2 science
die Migration;migration;миграция;Migration gehört zur Geschichte vieler Länder.;Migration is part of the history of many countries.;Миграция является частью истории многих стран.;Nomen, f.;b2 society
der Mindestlohn;minimum wage;минимальная зарплата;Der gesetzliche Mindestlohn wurde erneut erhöht.;The statutory minimum wage was raised again.;Установленная законом минимальная зарплата снова повышена.;Nomen, m.;b2 economy
das Misstrauen;distrust;недоверие;Widersprüchliche Aussagen wecken oft Misstrauen.;Contradictory statements often arouse distrust.;Противоречивые заявления часто вызывают недоверие.;Nomen, n.;b2 feelings
das Missverständnis, die Missverständnisse;misunderstanding;недоразумение;Dieses Missverständnis lässt sich leicht aufklären.;This misunderstanding can be cleared up easily.;Это недоразумение легко прояснить.;Nomen, n.;b2 communication
die Mitarbeit;cooperation / collaboration;сотрудничество;Vielen Dank für Ihre engagierte Mitarbeit!;Thank you very much for your dedicated cooperation!;Большое спасибо за ваше активное участие!;Nomen, f.;b2 work
das Modell, die Modelle;model;модель;Dieses Modell verbraucht deutlich weniger Strom.;This model consumes significantly less electricity.;Эта модель потребляет значительно меньше электроэнергии.;Nomen, n.;b2 tech
die Modernisierung;modernization;модернизация;Die Modernisierung der Bahnstrecke dauert noch an.;The modernization of the railway line is still ongoing.;Модернизация железнодорожной ветки ещё продолжается.;Nomen, f.;b2 city
die Moral;morality / morale;мораль / боевой дух;Nach dem Sieg stieg die Moral im Team deutlich.;After the victory team morale rose significantly.;После победы боевой дух в команде заметно вырос.;Nomen, f.;b2 sport
das Motiv, die Motive;motive / motif;мотив / побуждение;Das Motiv der Tat ist noch nicht bekannt.;The motive of the act is not yet known.;Мотив преступления пока неизвестен.;Nomen, n.;b2 law', now())
on conflict (level) do update set
  title = excluded.title,
  word_count = excluded.word_count,
  csv_content = excluded.csv_content,
  updated_at = now();

insert into public.catalog_corpora (level, title, word_count, csv_content, updated_at)
values ('C1', 'C1 Advanced', 700, 'de;en;ru;exDe;exEn;exRu;ctx;tags
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
marginal;marginal;незначительный / маргинальный;Der Unterschied ist statistisch gesehen marginal.;Statistically speaking, the difference is marginal.;Статистически разница незначительна.;Adjektiv;c1 academic
die Akribie;meticulousness;скрупулёзность;Mit großer Akribie prüfte sie jedes Detail.;With great meticulousness she checked every detail.;С большой скрупулёзностью она проверила каждую деталь.;Nomen, f.;c1 work
die Ambivalenz;ambivalence;амбивалентность / двойственность;Die Ambivalenz dieser Entwicklung ist offensichtlich.;The ambivalence of this development is obvious.;Двойственность этого развития очевидна.;Nomen, f.;c1 academic
die Anmaßung;presumption / arrogance;самонадеянность / дерзость;Eine solche Behauptung grenzt an Anmaßung.;Such a claim borders on arrogance.;Подобное утверждение граничит с самонадеянностью.;Nomen, f.;c1 communication
die Ausprägung, die Ausprägungen;manifestation / form;выраженность / форма проявления;Das Merkmal tritt in verschiedenen Ausprägungen auf.;The trait appears in various manifestations.;Этот признак проявляется в разных формах.;Nomen, f.;c1 academic
die Bandbreite;bandwidth / spectrum;диапазон / спектр;Die Bandbreite der Meinungen war enorm.;The spectrum of opinions was enormous.;Спектр мнений был огромным.;Nomen, f.;c1 communication
die Befangenheit;bias / conflict of interest;предвзятость;Wegen Befangenheit musste der Gutachter abtreten.;Due to bias the expert had to step down.;Из-за предвзятости эксперту пришлось уйти.;Nomen, f.;c1 formal
die Beschaffenheit;nature / composition / texture;свойство / структура;Die Beschaffenheit des Bodens ist ideal.;The composition of the soil is ideal.;Структура почвы идеальна.;Nomen, f.;c1 academic
die Beständigkeit;constancy / durability;постоянство / стойкость;Beständigkeit ist im Wandel besonders wertvoll.;Constancy is especially valuable amid change.;Постоянство особенно ценно во время перемен.;Nomen, f.;c1 formal
die Bündelung;bundling / consolidation;консолидация / объединение;Die Bündelung der Kräfte brachte den Durchbruch.;Pooling forces brought the breakthrough.;Объединение сил принесло прорыв.;Nomen, f.;c1 business
die Deckungsgleichheit;congruence / exact match;совпадение / тождественность;Es besteht hohe Deckungsgleichheit beider Konzepte.;There is high congruence between both concepts.;Между обеими концепциями есть высокая степень совпадения.;Nomen, f.;c1 academic
die Dringlichkeit;urgency;срочность / неотложность;Die Dringlichkeit dieser Reform ist unbestritten.;The urgency of this reform is undisputed.;Срочность этой реформы бесспорна.;Nomen, f.;c1 formal
die Durchsetzungsfähigkeit;assertiveness;напористость / умение добиваться своего;Für diese Position braucht man Durchsetzungsfähigkeit.;For this position one needs assertiveness.;Для этой должности нужно умение отстаивать решения.;Nomen, f.;c1 work
die Eigenständigkeit;independence / autonomy;самостоятельность;Die Eigenständigkeit der Forschung bleibt gewahrt.;The independence of research remains preserved.;Независимость исследований сохраняется.;Nomen, f.;c1 academic
die Einbettung;embedding / integration;встраивание / интеграция;Die Einbettung in den Gesamtkontext ist gelungen.;The integration into the overall context succeeded.;Интеграция в общий контекст удалась.;Nomen, f.;c1 academic
die Eindämmung;containment / curbing;сдерживание / ограничение;Die Eindämmung der Kosten hat Priorität.;Curbing costs has priority.;Сдерживание расходов является приоритетом.;Nomen, f.;c1 economy
die Einordnung;classification / contextualization;классификация / осмысление;Eine sachliche Einordnung hilft bei der Bewertung.;An objective contextualization helps with evaluation.;Деловое осмысление помогает при оценке.;Nomen, f.;c1 academic
die Entkopplung;decoupling;разделение / отвязка;Die Entkopplung von Wachstum und Emissionen gelingt.;Decoupling growth and emissions is succeeding.;Разделение экономического роста и выбросов удаётся.;Nomen, f.;c1 economy
die Entschlossenheit;determination / resolve;решимость;Mit großer Entschlossenheit setzte er den Plan um.;With great resolve he implemented the plan.;С большой решимостью он реализовал план.;Nomen, f.;c1 work
die Erforderlichkeit;necessity / requirement;необходимость;Die Erforderlichkeit dieser Maßnahme wird geprüft.;The necessity of this measure is being examined.;Необходимость этой меры проверяется.;Nomen, f.;c1 formal
die Ergründung;fathoming / investigation;изучение / постижение;Die Ergründung der Ursachen nimmt Zeit in Anspruch.;Investigating the causes takes time.;Выяснение причин требует времени.;Nomen, f.;c1 academic
die Flut;flood / deluge;поток / наплыв;Eine Flut von Anfragen erreichte den Support.;A flood of inquiries reached support.;Поток запросов обрушился на службу поддержки.;Nomen, f.;c1 communication
die Folgerichtigkeit;logical consistency;последовательность / логичность;Die Folgerichtigkeit seines Arguments überzeugt.;The logical consistency of his argument convinces.;Логическая последовательность его аргумента убеждает.;Nomen, f.;c1 academic
die Fragilität;fragility;хрупкость;Die Krise zeigte die Fragilität der Lieferketten.;The crisis revealed the fragility of supply chains.;Кризис показал хрупкость цепочек поставок.;Nomen, f.;c1 economy
die Gängelung;patronizing / over-regulation;мелочная опека / диктат;Viele kritisieren die bürokratische Gängelung.;Many criticize bureaucratic over-regulation.;Многие критикуют бюрократическую мелочную опеку.;Nomen, f.;c1 society
die Gegenüberstellung, die Gegenüberstellungen;juxtaposition / comparison;сопоставление;Die Gegenüberstellung beider Modelle ist aufschlussreich.;The comparison of both models is illuminating.;Сопоставление обеих моделей весьма показательно.;Nomen, f.;c1 academic
entkräften;to refute / invalidate;опровергать / ослаблять (аргумент);Dieser Beleg entkräftet alle bisherigen Vorwürfe.;This evidence invalidates all previous accusations.;Это доказательство опровергает все прежние обвинения.;Verb;c1 formal
entschärfen;to defuse / mitigate;смягчать / разряжать обстановку;Ein offenes Gespräch konnte den Konflikt entschärfen.;An open talk defused the conflict.;Откровенный разговор помог разрядить конфликт.;Verb;c1 communication
erörtern;to discuss in depth;подробно обсуждать;Wir werden diese Frage im Ausschuss erörtern.;We will discuss this question in committee.;Мы подробно обсудим этот вопрос в комитете.;Verb;c1 formal
erschließen;to tap into / deduce / unlock;осваивать / открывать;Mit dieser Methode erschließen wir neue Datenquellen.;With this method we tap new data sources.;С помощью этого метода мы открываем новые источники данных.;Verb;c1 academic
erwägen;to consider / contemplate;взвешивать / рассматривать;Der Vorstand erwägt eine Umstrukturierung.;The board is considering a restructuring.;Правление рассматривает реструктуризацию.;Verb;c1 formal
etablieren;to establish;утверждать / создавать;Das Startup konnte sich am Markt etablieren.;The startup established itself on the market.;Стартап смог закрепиться на рынке.;Verb;c1 business
evaluieren;to evaluate;оценивать;Nach sechs Monaten evaluieren wir die Ergebnisse.;After six months we evaluate the results.;Через шесть месяцев мы оценим результаты.;Verb;c1 academic
fokussieren auf;to focus on;фокусироваться на;Wir fokussieren unsere Arbeit auf Kernfunktionen.;We focus our work on core features.;Мы фокусируем работу на ключевых функциях.;Verb (+ Akk.);c1 work
forcieren;to push / accelerate forcefully;форсировать / ускорять;Das Unternehmen forciert den Ausbau der Cloud.;The company is pushing cloud expansion.;Компания форсирует расширение облачной инфраструктуры.;Verb;c1 business
formulieren;to formulate / phrase;формулировать;Man muss die Kritik konstruktiv formulieren.;One must phrase criticism constructively.;Критику нужно формулировать конструктивно.;Verb;c1 communication
fungieren als;to act as / serve as;выступать в роли;Er fungiert als Vermittler zwischen den Teams.;He acts as a mediator between the teams.;Он выступает посредником между командами.;Verb;c1 formal
gewichten;to weight / prioritize;взвешивать / расставлять веса;Man sollte nicht alle Kriterien gleich gewichten.;One should not weight all criteria equally.;Не стоит придавать всем критериям одинаковый вес.;Verb;c1 academic
hinterfragen;to question critically;критически осмысливать;Man sollte etablierte Routinen regelmäßig hinterfragen.;One should regularly question established routines.;Устоявшиеся рутины стоит регулярно подвергать сомнению.;Verb;c1 academic
illustrieren;to illustrate;иллюстрировать;Ein Beispiel illustriert diesen abstrakten Begriff.;An example illustrates this abstract concept.;Пример иллюстрирует это абстрактное понятие.;Verb;c1 academic
initiieren;to initiate;инициировать;Sie hat das gemeinsame Forschungsprojekt initiiert.;She initiated the joint research project.;Она инициировала совместный исследовательский проект.;Verb;c1 work
innovieren;to innovate;внедрять инновации;Nur wer kontinuierlich innoviert, bleibt vorn.;Only those who continuously innovate stay ahead.;Только тот, кто постоянно внедряет новое, остаётся впереди.;Verb;c1 business
intensivieren;to intensify;усиливать / интенсифицировать;Wir müssen den Austausch mit Kunden intensivieren.;We must intensify exchange with customers.;Нам нужно усилить обмен опытом с клиентами.;Verb;c1 business
interpretieren;to interpret;интерпретировать;Diese Daten lassen sich unterschiedlich interpretieren.;This data can be interpreted differently.;Эти данные можно интерпретировать по-разному.;Verb;c1 academic
kompensieren;to compensate;компенсировать;Höhere Effizienz kann den Personalmangel kompensieren.;Higher efficiency can compensate for staff shortages.;Более высокая эффективность может компенсировать нехватку кадров.;Verb;c1 work
konkretisieren;to make concrete / specify;конкретизировать;Könnten Sie diesen Vorschlag etwas konkretisieren?;Could you make this proposal more concrete?;Не могли бы вы немного конкретизировать это предложение?;Verb;c1 communication
konzipieren;to design / conceive;проектировать / разрабатывать концепцию;Wir konzipieren ein neues Schulungsprogramm.;We are designing a new training program.;Мы разрабатываем новую программу обучения.;Verb;c1 work
koordinieren;to coordinate;координировать;Wer koordiniert die Arbeit zwischen den Standorten?;Who coordinates work between the sites?;Кто координирует работу между филиалами?;Verb;c1 work
legitimieren;to legitimize;легитимизировать / узаконивать;Transparenz legitimiert politische Entscheidungen.;Transparency legitimizes political decisions.;Прозрачность легитимизирует политические решения.;Verb;c1 society
manifestieren;to manifest;проявлять / закреплять;Die Krise manifestierte strukturelle Schwächen.;The crisis manifested structural weaknesses.;Кризис выявил структурные слабости.;Verb;c1 academic
minimieren;to minimize;минимизировать;Durch Tests minimieren wir das Ausfallrisiko.;Through testing we minimize outage risk.;С помощью тестов мы минимизируем риск сбоев.;Verb;c1 tech
modifizieren;to modify;модифицировать;Der Algorithmus wurde leicht modifiziert.;The algorithm was slightly modified.;Алгоритм был слегка модифицирован.;Verb;c1 tech
monieren;to object to / criticize;указывать на недостаток / жаловаться;Der Prüfer monierte fehlende Nachweise.;The auditor criticized missing documentation.;Проверяющий указал на отсутствие подтверждений.;Verb;c1 formal
nivellieren;to level out / equalize;нивелировать / выравнивать;Unterschiede lassen sich nicht völlig nivellieren.;Differences cannot be completely leveled out.;Различия невозможно полностью нивелировать.;Verb;c1 academic
objektivieren;to objectify;объективировать;Kennzahlen helfen, Diskussionen zu objektivieren.;Metrics help objectify discussions.;Показатели помогают сделать дискуссии объективнее.;Verb;c1 academic
operationalisieren;to operationalize;операционализировать;Wir müssen dieses Ziel messbar operationalisieren.;We must operationalize this goal measurably.;Нам нужно перевести эту цель в измеримые показатели.;Verb;c1 business
legitim;legitimate;законный / обоснованный;Diese Kritik ist durchaus legitim.;This criticism is thoroughly legitimate.;Эта критика вполне обоснованна.;Adjektiv;c1 formal
marode;dilapidated / ailing;ветхий / пришедший в упадок;Die marode Infrastruktur muss saniert werden.;The ailing infrastructure must be renovated.;Ветхую инфраструктуру необходимо обновить.;Adjektiv;c1 society
nachvollziehbar;comprehensible / traceable;понятный / логичный;Seine Begründung ist absolut nachvollziehbar.;His reasoning is completely comprehensible.;Его обоснование абсолютно понятно и логично.;Adjektiv;c1 communication
obsolet;obsolete;устаревший;Dieses alte Protokoll ist längst obsolet.;This old protocol has long been obsolete.;Этот старый протокол давно устарел.;Adjektiv;c1 tech
paradox;paradoxical;парадоксальный;Es wirkt paradox, aber weniger ist oft mehr.;It seems paradoxical, but less is often more.;Это кажется парадоксальным, но меньше — часто больше.;Adjektiv;c1 academic
prägnant;concise / pithy;ёмкий / лаконичный;Sie fasste den Bericht sehr prägnant zusammen.;She summarized the report very concisely.;Она очень ёмко резюмировала отчёт.;Adjektiv;c1 communication
prekär;precarious;шаткий / ненадёжный;Die finanzielle Lage blieb lange prekär.;The financial situation remained precarious for long.;Финансовое положение долго оставалось шатким.;Adjektiv;c1 economy
redundant;redundant;избыточный;Diese Information ist im Text redundant.;This information is redundant in the text.;Эта информация в тексте избыточна.;Adjektiv;c1 tech
restriktiv;restrictive;ограничительный;Die Regeln sind bewusst sehr restriktiv gefasst.;The rules are intentionally worded very restrictively.;Правила намеренно сформулированы очень строго.;Adjektiv;c1 formal
schlüssig;conclusive / coherent;убедительный / логичный;Das Gesamtbild ist nun völlig schlüssig.;The overall picture is now completely coherent.;Общая картина теперь полностью логична.;Adjektiv;c1 academic
signifikant;significant;значимый / существенный;Es gibt einen signifikanten Anstieg der Nutzerzahl.;There is a significant increase in user count.;Наблюдается значительный рост числа пользователей.;Adjektiv;c1 academic
stringent;stringent / rigorous;строгий / последовательный;Die Argumentation ist äußerst stringent.;The argumentation is extremely rigorous.;Аргументация предельно последовательна.;Adjektiv;c1 academic
triftig;valid / cogent;веский / уважительный;Ohne triftigen Grund wird nichts verschoben.;Without a valid reason nothing is postponed.;Без веской причины ничего не переносится.;Adjektiv;c1 formal
unumgänglich;unavoidable / inevitable;неизбежный / неизменный;Diese Reform ist langfristig unumgänglich.;This reform is unavoidable in the long run.;Эта реформа в долгосрочной перспективе неизбежна.;Adjektiv;c1 formal
zwingend;compelling / mandatory;обязательный / неопровержимый;Das ist kein zwingender Grund für eine Absage.;That is not a compelling reason for cancellation.;Это не обязательная причина для отмены.;Adjektiv;c1 formal
die Abhandlung, die Abhandlungen;treatise / dissertation;трактат / научная статья;Die Professorin veröffentlichte eine fundierte Abhandlung über Ethik.;The professor published a well-founded treatise on ethics.;Профессор опубликовала основательный трактат об этике.;Nomen, f.;c1 academic
die Abkehr;renunciation / turning away;отход / отказ;Die Reform markiert eine deutliche Abkehr von früheren Modellen.;The reform marks a clear departure from earlier models.;Реформа знаменует явный отход от прежних моделей.;Nomen, f.;c1 politics
die Abwägung, die Abwägungen;weighing / consideration;взвешивание / оценка;Nach sorgfältiger Abwägung aller Risiken fiel die Entscheidung.;After careful weighing of all risks the decision was made.;После тщательного взвешивания всех рисков решение было принято.;Nomen, f.;c1 formal
die Affinität, die Affinitäten;affinity;склонность / сродство;Er zeigte schon früh eine starke Affinität zu Sprachen.;Early on he showed a strong affinity for languages.;Он уже рано проявил сильную склонность к языкам.;Nomen, f.;c1 formal
die Agitation;agitation;агитация;Politische Agitation erschwert oft eine sachliche Debatte.;Political agitation often hampers an objective debate.;Политическая агитация часто затрудняет предметную дискуссию.;Nomen, f.;c1 politics
die Akkumulation;accumulation;накопление / аккумуляция;Die Akkumulation von Daten erfordert strenge Regeln.;The accumulation of data requires strict rules.;Накопление данных требует строгих правил.;Nomen, f.;c1 science
die Akquise;acquisition (clients/funds);привлечение (клиентов);Die Akquise neuer Großkunden verlangt viel Geduld.;Acquiring new major clients requires a lot of patience.;Привлечение новых крупных клиентов требует большого терпения.;Nomen, f.;c1 business
der Aktionismus;hyperactivity / blind activism;бурная бездумная деятельность;Bloßer Aktionismus löst keine strukturellen Probleme.;Mere blind activism does not solve structural problems.;Простая суета не решает структурных проблем.;Nomen, m.;c1 politics
die Akzeptanzschwelle;acceptance threshold;порог приемлемости;Bei den Preisen ist die Akzeptanzschwelle längst überschritten.;With prices the acceptance threshold has long been exceeded.;В ценах порог приемлемости давно превышен.;Nomen, f.;c1 economy
die Allgegenwart;omnipresence;вездесущность;Die Allgegenwart digitaler Medien verändert unsere Aufmerksamkeit.;The omnipresence of digital media changes our attention.;Вездесущность цифровых медиа меняет наше внимание.;Nomen, f.;c1 media
die Ambition, die Ambitionen;ambition;амбиция / стремление;Ohne klare Ambitionen bleibt das Potenzial ungenutzt.;Without clear ambitions potential remains unused.;Без чётких амбиций потенциал остаётся неиспользованным.;Nomen, f.;c1 work
die Anarchie;anarchy;анархия;Ohne verbindliche Regeln droht institutionelle Anarchie.;Without binding rules institutional anarchy threatens.;Без обязательных правил грозит институциональная анархия.;Nomen, f.;c1 politics
die Anfechtung, die Anfechtungen;contestation / challenge;оспаривание;Die Anfechtung des Vertrags erfolgte fristgerecht.;The contestation of the contract took place on time.;Оспаривание договора состоялось в срок.;Nomen, f.;c1 law
die Angemessenheit;appropriateness / proportionality;соразмерность / уместность;Das Gericht prüft die Angemessenheit der Maßnahme.;The court examines the proportionality of the measure.;Суд проверяет соразмерность этой меры.;Nomen, f.;c1 law
die Animosität, die Animositäten;animosity;неприязнь;Persönliche Animositäten sollten die Arbeit nicht stören.;Personal animosities should not disturb work.;Личная неприязнь не должна мешать работе.;Nomen, f.;c1 psychology
die Annäherung, die Annäherungen;rapprochement / approximation;сближение / приближение;Nach dem Gipfel gab es erste Zeichen der Annäherung.;After the summit there were first signs of rapprochement.;После саммита появились первые признаки сближения.;Nomen, f.;c1 politics
die Anomalie, die Anomalien;anomaly;аномалия;Die Messdaten zeigen eine unerklärliche Anomalie.;The measurement data shows an inexplicable anomaly.;Данные измерений показывают необъяснимую аномалию.;Nomen, f.;c1 science
die Anprangerung;denunciation / pillorying;клеймение / разоблачение;Öffentliche Anprangerung ersetzt keine faire Justiz.;Public pillorying does not replace fair justice.;Публичное шельмование не заменяет справедливого суда.;Nomen, f.;c1 society
die Anschauung, die Anschauungen;view / conception;воззрение / взгляд;Philosophische Anschauungen wandeln sich über Jahrhunderte.;Philosophical views change over centuries.;Философские воззрения меняются на протяжении веков.;Nomen, f.;c1 philosophy
der Anstoß, die Anstöße;impetus / impulse;толчок / импульс;Dieses Buch gab den Anstoß zu einer breiten Debatte.;This book gave the impetus for a broad debate.;Эта книга дала толчок широкой дискуссии.;Nomen, m.;c1 society
die Antizipation;anticipation;предвосхищение;Die Antizipation künftiger Trends sichert Wettbewerbsvorteile.;Anticipating future trends secures competitive advantages.;Предвосхищение будущих трендов обеспечивает конкурентные преимущества.;Nomen, f.;c1 business
die Apathie;apathy;апатия;Politische Apathie gefährdet die demokratische Kultur.;Political apathy endangers democratic culture.;Политическая апатия угрожает демократической культуре.;Nomen, f.;c1 society
die Argumentationskette, die Argumentationsketten;chain of reasoning;цепь аргументации;Ihre Argumentationskette war lückenlos und schlüssig.;Her chain of reasoning was seamless and conclusive.;Её цепь аргументации была безупречной и убедительной.;Nomen, f.;c1 academic
die Arroganz;arrogance;высокомерие / надменность;Arroganz verhindert oft konstruktives Lernen.;Arrogance often prevents constructive learning.;Высокомерие часто мешает конструктивному обучению.;Nomen, f.;c1 psychology
die Artikulation;articulation;артикуляция / чёткое выражение;Klare Artikulation ist für Redner unerlässlich.;Clear articulation is indispensable for speakers.;Чёткая артикуляция незаменима для ораторов.;Nomen, f.;c1 communication
die Assimilation;assimilation;ассимиляция;Kulturelle Assimilation verläuft über mehrere Generationen.;Cultural assimilation proceeds over several generations.;Культурная ассимиляция проходит на протяжении нескольких поколений.;Nomen, f.;c1 society
die Asymmetrie, die Asymmetrien;asymmetry;асимметрия;Zwischen beiden Partnern besteht eine Machtasymmetrie.;Between both partners there is an asymmetry of power.;Между обоими партнёрами существует асимметрия власти.;Nomen, f.;c1 politics
das Attribut, die Attribute;attribute;атрибут / свойство;Verlässlichkeit ist das wichtigste Attribut einer Führungskraft.;Reliability is the most important attribute of a leader.;Надёжность — важнейший атрибут руководителя.;Nomen, n.;c1 work
die Aufarbeitung;coming to terms with / processing;осмысление / проработка;Die historische Aufarbeitung braucht offenen Zugang zu Archiven.;Historical reckoning requires open access to archives.;Историческое осмысление требует открытого доступа к архивам.;Nomen, f.;c1 history
die Aufdeckung;uncovering / exposure;раскрытие / разоблачение;Die Aufdeckung des Skandals gelang durch Whistleblower.;Uncovering the scandal succeeded through whistleblowers.;Раскрытие скандала удалось благодаря информаторам.;Nomen, f.;c1 media
die Aufrechterhaltung;maintenance / upholding;поддержание / сохранение;Die Aufrechterhaltung der Ordnung hat Vorrang.;Maintaining order has priority.;Поддержание порядка имеет приоритет.;Nomen, f.;c1 politics
der Aufschub;postponement / delay;отсрочка;Diese Entscheidung duldet keinen weiteren Aufschub.;This decision brooks no further delay.;Это решение не терпит дальнейшей отсрочки.;Nomen, m.;c1 formal
die Ausarbeitung, die Ausarbeitungen;elaboration / drafting;разработка / проработка;Die Ausarbeitung des Konzepts nahm Monate in Anspruch.;Drafting the concept took months.;Разработка концепции заняла месяцы.;Nomen, f.;c1 work
die Ausbeutung;exploitation;эксплуатация (людей/ресурсов);Faire Lieferketten sollen Ausbeutung verhindern.;Fair supply chains are meant to prevent exploitation.;Честные цепочки поставок должны предотвратить эксплуатацию.;Nomen, f.;c1 society
die Ausdifferenzierung;differentiation;дифференциация / детализация;Die Ausdifferenzierung der Märkte schreitet voran.;The differentiation of markets is advancing.;Дифференциация рынков продолжается.;Nomen, f.;c1 economy
die Auslegungssache;matter of interpretation;дело толкования;Viele Klauseln sind leider reine Auslegungssache.;Many clauses are unfortunately purely a matter of interpretation.;Многие пункты, к сожалению, являются делом толкования.;Nomen, f.;c1 law
die Ausrichtung;orientation / alignment;направленность / ориентация;Die strategische Ausrichtung wird jährlich überprüft.;The strategic alignment is reviewed annually.;Стратегическая направленность проверяется ежегодно.;Nomen, f.;c1 business
die Ausschöpfung;exhaustion / full utilization;исчерпание / полное использование;Die Ausschöpfung aller Ressourcen ist nicht nachhaltig.;Exhausting all resources is not sustainable.;Исчерпание всех ресурсов не является устойчивым.;Nomen, f.;c1 environment
die Aussöhnung;reconciliation;примирение;Nach langen Konflikten ist eine Aussöhnung möglich.;After long conflicts reconciliation is possible.;После долгих конфликтов примирение возможно.;Nomen, f.;c1 politics
die Ausuferung, die Ausuferungen;excess / escalation;разрастание / выход за рамки;Klare Grenzen verhindern eine Ausuferung der Kosten.;Clear limits prevent a runaway escalation of costs.;Чёткие границы предотвращают чрезмерный рост расходов.;Nomen, f.;c1 finance
die Ausweitung;expansion / extension;расширение;Die Ausweitung des Angebots stieß auf reges Interesse.;The expansion of the offering met with keen interest.;Расширение предложения вызвало живой интерес.;Nomen, f.;c1 business
die Autarkie;self-sufficiency / autarky;автаркия / самодостаточность;Vollständige Autarkie ist in einer globalen Welt kaum möglich.;Complete self-sufficiency is hardly possible in a global world.;Полная самодостаточность в глобальном мире едва ли возможна.;Nomen, f.;c1 economy
das Axiom, die Axiome;axiom;аксиома;Dieses Prinzip gilt in der Mathematik als Axiom.;This principle is regarded as an axiom in mathematics.;Этот принцип считается в математике аксиомой.;Nomen, n.;c1 science
die Bagatelle, die Bagatellen;trifle / minor matter;пустяк / мелочь;Man sollte sich nicht über solche Bagatellen aufregen.;One should not get upset over such trifles.;Не стоит расстраиваться из-за таких пустяков.;Nomen, f.;c1 formal
die Balance;balance;баланс / равновесие;Die Balance zwischen Freiheit und Sicherheit ist heikel.;The balance between freedom and security is delicate.;Баланс между свободой и безопасностью хрупок.;Nomen, f.;c1 politics
die Banalität, die Banalitäten;banality;банальность;Hinter der Banalität verbirgt sich oft eine Wahrheit.;Behind banality a truth often hides.;За банальностью часто скрывается истина.;Nomen, f.;c1 philosophy
die Barriere, die Barrieren;barrier;барьер / преграда;Sprachliche Barrieren lassen sich durch Bildung abbauen.;Language barriers can be dismantled through education.;Языковые барьеры можно преодолеть с помощью образования.;Nomen, f.;c1 society
die Beachtung;attention / observance;внимание / соблюдение;Dieser Aspekt verdient besondere Beachtung.;This aspect deserves special attention.;Этот аспект заслуживает особого внимания.;Nomen, f.;c1 academic
die Bedächtigkeit;deliberateness / prudence;осмотрительность / рассудительность;Mit großer Bedächtigkeit wählte sie jedes Wort.;With great deliberation she chose every word.;С большой осмотрительностью она выбирала каждое слово.;Nomen, f.;c1 communication
die Bedürftigkeit;neediness / indigence;нуждаемость;Soziale Hilfe richtet sich nach der tatsächlichen Bedürftigkeit.;Social aid is based on actual neediness.;Социальная помощь зависит от фактической нуждаемости.;Nomen, f.;c1 society
die Beeinflussung;influencing / manipulation;воздействие / манипуляция;Gezielte Beeinflussung von Wählern ist problematisch.;Targeted manipulation of voters is problematic.;Целенаправленное воздействие на избирателей проблематично.;Nomen, f.;c1 politics
die Befindlichkeit, die Befindlichkeiten;sensitivity / state of mind;самочувствие / обидчивость;Persönliche Befindlichkeiten sollten sachlich geklärt werden.;Personal sensitivities should be clarified objectively.;Личные обиды стоит прояснять по существу.;Nomen, f.;c1 psychology
die Befriedigung;satisfaction;удовлетворение;Die Befriedigung der Grundbedürfnisse hat Priorität.;Satisfying basic needs has priority.;Удовлетворение базовых потребностей имеет приоритет.;Nomen, f.;c1 psychology
die Begleiterscheinung, die Begleiterscheinungen;side effect / concomitant phenomenon;побочное явление;Staus sind eine typische Begleiterscheinung des Wachstums.;Traffic jams are a typical side effect of growth.;Пробки — типичное сопутствующее явление роста.;Nomen, f.;c1 city
die Begnadigung, die Begnadigungen;pardon (legal);помилование;Das Staatsoberhaupt lehnte das Gesuch auf Begnadigung ab.;The head of state rejected the request for pardon.;Глава государства отклонил прошение о помиловании.;Nomen, f.;c1 law
die Begrifflichkeit, die Begrifflichkeiten;terminology;терминология;In der Fachsprache ist präzise Begrifflichkeit nötig.;In technical language precise terminology is necessary.;В профессиональной речи необходима точная терминология.;Nomen, f.;c1 academic
die Beharrlichkeit;persistence / perseverance;упорство / настойчивость;Ihre Beharrlichkeit zahlte sich am Ende aus.;Her perseverance paid off in the end.;Её настойчивость в итоге окупилась.;Nomen, f.;c1 work
die Beherzigung;heeding / taking to heart;следование (совету);Die Beherzigung dieser Regel vermeidet Konflikte.;Heeding this rule avoids conflicts.;Соблюдение этого правила предотвращает конфликты.;Nomen, f.;c1 formal
die Beilegung;settlement / resolution;урегулирование;Zur Beilegung des Streits wurde ein Mediator gerufen.;To settle the dispute a mediator was called.;Для урегулирования спора пригласили медиатора.;Nomen, f.;c1 law
die Bekräftigung;affirmation / reinforcement;подтверждение / подкрепление;Zur Bekräftigung seiner Aussage legte er Belege vor.;To reinforce his statement he presented evidence.;В подтверждение своего заявления он представил доказательства.;Nomen, f.;c1 formal
die Belanglosigkeit;triviality / insignificance;незначительность / пустяковость;Die Debatte verlor sich leider in Belanglosigkeiten.;The debate unfortunately got lost in trivialities.;Дискуссия, к сожалению, увязла в мелочах.;Nomen, f.;c1 communication
die Beliebigkeit;arbitrariness;произвольность / случайность;Qualität verträgt keine Beliebigkeit bei den Standards.;Quality tolerates no arbitrariness in standards.;Качество не терпит произвольности в стандартах.;Nomen, f.;c1 work
die Bemessung;assessment / calculation;оценка / расчёт;Die Bemessung der Strafe richtet sich nach der Schuld.;The assessment of the penalty is based on guilt.;Определение меры наказания зависит от вины.;Nomen, f.;c1 law
die Benennung, die Benennungen;naming / appointment;наименование / назначение;Die Benennung der Kommission erfolgt nächste Woche.;The appointment of the commission takes place next week.;Назначение комиссии состоится на следующей неделе.;Nomen, f.;c1 politics
die Beredsamkeit;eloquence;красноречие;Seine Beredsamkeit überzeugte selbst kritische Zuhörer.;His eloquence convinced even critical listeners.;Его красноречие убедило даже критически настроенных слушателей.;Nomen, f.;c1 communication
die Bereinigung;cleanup / adjustment;очистка / урегулирование;Die Bereinigung der Datenbank dauerte mehrere Stunden.;Cleaning up the database took several hours.;Очистка базы данных заняла несколько часов.;Nomen, f.;c1 tech
die Beschleunigung;acceleration;ускорение;Die Beschleunigung des Wandels überfordert manche.;The acceleration of change overwhelms some people.;Ускорение перемен перегружает некоторых людей.;Nomen, f.;c1 society
die Beschönigung, die Beschönigungen;euphemism / whitewash;приукрашивание;Ohne Beschönigung nannte er die Zahlen beim Namen.;Without sugarcoating he called the numbers by name.;Без прикрас он назвал цифры своими именами.;Nomen, f.;c1 communication
die Besonnenheit;prudence / level-headedness;рассудительность / благоразумие;In Krisen ist politische Besonnenheit besonders gefragt.;In crises political level-headedness is especially needed.;В кризисах особенно востребована политическая рассудительность.;Nomen, f.;c1 politics
die Bestandsaufnahme, die Bestandsaufnahmen;inventory / stocktaking;инвентаризация / оценка ситуации;Eine ehrliche Bestandsaufnahme ist der erste Schritt.;An honest stocktaking is the first step.;Честная оценка текущего положения — первый шаг.;Nomen, f.;c1 business
die Bestrebung, die Bestrebungen;endeavor / effort;стремление / попытка;Es gibt Bestrebungen, das Verfahren zu vereinfachen.;There are efforts to simplify the procedure.;Есть стремление упростить эту процедуру.;Nomen, f.;c1 politics
die Betroffenheit;dismay / concern;потрясение / озабоченность;Die Nachricht löste tiefe Betroffenheit aus.;The news triggered deep dismay.;Эта новость вызвала глубокую озабоченность.;Nomen, f.;c1 society
die Bewandtnis;reason / significance;обстоятельство / суть;Damit hat es eine ganz besondere Bewandtnis.;There is a very special reason behind this.;В этом есть особый смысл.;Nomen, f.;c1 formal
die Beweisführung;argumentation / presentation of evidence;доказывание / система доказательств;Die Beweisführung der Anklage war äußerst präzise.;The prosecution’s presentation of evidence was extremely precise.;Система доказательств обвинения была предельно точной.;Nomen, f.;c1 law
die Bewerkstelligung;accomplishment / execution;осуществление;Die Bewerkstelligung dieses Plans erfordert Teamarbeit.;Accomplishing this plan requires teamwork.;Осуществление этого плана требует командной работы.;Nomen, f.;c1 formal
die Bewusstseinsbildung;awareness-raising;формирование сознания;Umweltbildung dient der langfristigen Bewusstseinsbildung.;Environmental education serves long-term awareness-raising.;Экологическое образование служит долгосрочному формированию сознания.;Nomen, f.;c1 environment
die Bilanzierung;accounting / balancing;составление баланса;Korrekte Bilanzierung ist gesetzlich vorgeschrieben.;Correct accounting is prescribed by law.;Корректное составление баланса предписано законом.;Nomen, f.;c1 finance
die Billigung;approval / endorsement;одобрение;Ohne Billigung des Rats tritt die Regel nicht in Kraft.;Without approval of the council the rule does not take effect.;Без одобрения совета правило не вступает в силу.;Nomen, f.;c1 politics
die Bindungskraft;binding force / loyalty;обязательная сила / сила притяжения;Verträge haben eine klare rechtliche Bindungskraft.;Contracts have a clear legal binding force.;Договоры имеют чёткую юридическую обязательную силу.;Nomen, f.;c1 law
die Biografie, die Biografien;biography;биография;Die Biografie des Forschers liest sich wie ein Roman.;The researcher’s biography reads like a novel.;Биография исследователя читается как роман.;Nomen, f.;c1 culture
die Binsenweisheit, die Binsenweisheiten;truism / platitude;прописная истина;Dass Gesundheit wichtig ist, bleibt eine Binsenweisheit.;That health is important remains a truism.;То, что здоровье важно, остаётся прописной истиной.;Nomen, f.;c1 communication
die Blockadehaltung;obstructionist stance;позиция блокирования;Eine Blockadehaltung verhindert jeden Fortschritt.;An obstructionist stance prevents any progress.;Позиция блокирования мешает любому прогрессу.;Nomen, f.;c1 politics
die Bonität;creditworthiness;кредитоспособность;Vor der Kreditvergabe prüft die Bank die Bonität.;Before granting a loan the bank checks creditworthiness.;Перед выдачей кредита банк проверяет кредитоспособность.;Nomen, f.;c1 finance
die Breitenwirkung;broad impact;широкий резонанс / массовый эффект;Die Kampagne erzielte eine enorme Breitenwirkung.;The campaign achieved an enormous broad impact.;Кампания добилась огромного общественного резонанса.;Nomen, f.;c1 media
der Bruch, die Brüche;break / fracture / breach;разрыв / перелом / нарушение;Ein solcher Vertrauensbruch lässt sich schwer heilen.;Such a breach of trust is hard to heal.;Такое нарушение доверия трудно исцелить.;Nomen, m.;c1 people
die Bürde, die Bürden;burden;бремя / ноша;Schulden sind für junge Staaten eine schwere Bürde.;Debts are a heavy burden for young states.;Долги — тяжёлое бремя для молодых государств.;Nomen, f.;c1 economy
die Charta;charter;хартия;Die Charta garantiert grundlegende Menschenrechte.;The charter guarantees fundamental human rights.;Хартия гарантирует основные права человека.;Nomen, f.;c1 law
die Chronologie;chronology;хронология;Die genaue Chronologie der Ereignisse wurde rekonstruiert.;The exact chronology of events was reconstructed.;Точная хронология событий была восстановлена.;Nomen, f.;c1 history
die Daseinsvorsorge;public services of general interest;обеспечение жизнедеятельности;Wasser und Strom gehören zur öffentlichen Daseinsvorsorge.;Water and electricity belong to public essential services.;Вода и электричество относятся к базовому жизнеобеспечению.;Nomen, f.;c1 politics
die Debattenkultur;culture of debate;культура дискуссии;Eine respektvolle Debattenkultur stärkt die Demokratie.;A respectful culture of debate strengthens democracy.;Уважительная культура дискуссии укрепляет демократию.;Nomen, f.;c1 society
die Deflation;deflation;дефляция;Anhaltende Deflation kann Investitionen lähmen.;Persistent deflation can paralyze investments.;Затяжная дефляция может парализовать инвестиции.;Nomen, f.;c1 economy
die Degradierung;degradation / demotion;деградация / понижение;Die Degradierung der Böden bedroht die Erträge.;Soil degradation threatens crop yields.;Деградация почв угрожает урожаям.;Nomen, f.;c1 environment
die Dekadenz;decadence;упадок / декаданс;Historiker diskutierten über Anzeichen kultureller Dekadenz.;Historians discussed signs of cultural decadence.;Историки обсуждали признаки культурного упадка.;Nomen, f.;c1 history
die Demografie;demographics;демография;Die Demografie verändert langfristig das Rentensystem.;Demographics change the pension system in the long run.;Демография в долгосрочной перспективе меняет пенсионную систему.;Nomen, f.;c1 society
die Denunziation, die Denunziationen;denunciation;донос;Anonyme Denunziation widerspricht rechtsstaatlichen Prinzipien.;Anonymous denunciation contradicts rule-of-law principles.;Анонимные доносы противоречат принципам правового государства.;Nomen, f.;c1 law
die Deeskalation;de-escalation;деэскалация;Kluge Diplomatie setzt konsequent auf Deeskalation.;Wise diplomacy consistently relies on de-escalation.;Мудрая дипломатия последовательно делает ставку на деэскалацию.;Nomen, f.;c1 politics
die Desinformation;disinformation;дезинформация;Gezielte Desinformation spaltet zunehmend die Gesellschaft.;Targeted disinformation increasingly divides society.;Целенаправленная дезинформация всё больше раскалывает общество.;Nomen, f.;c1 media
die Determinante, die Determinanten;determinant;определяющий фактор;Bildung ist eine zentrale Determinante des Einkommens.;Education is a central determinant of income.;Образование — центральный определяющий фактор дохода.;Nomen, f.;c1 science
die Devise, die Devisen;motto / foreign currency;девиз / валюта;Qualität vor Quantität lautet unsere oberste Devise.;Quality over quantity is our top motto.;Качество важнее количества — наш главный девиз.;Nomen, f.;c1 business
die Dialektik;dialectics;диалектика;Die Dialektik von Freiheit und Verantwortung ist zentral.;The dialectics of freedom and responsibility is central.;Диалектика свободы и ответственности является центральной.;Nomen, f.;c1 philosophy
die Dichotomie, die Dichotomien;dichotomy;дихотомия;Diese künstliche Dichotomie wird der Realität nicht gerecht.;This artificial dichotomy does not do justice to reality.;Эта искусственная дихотомия не отражает реальность.;Nomen, f.;c1 academic
die Diffamierung, die Diffamierungen;defamation;клевета / очернение;Diffamierung hat in einer sachlichen Diskussion keinen Platz.;Defamation has no place in an objective discussion.;Клевете нет места в предметной дискуссии.;Nomen, f.;c1 communication
die Diskreditierung;discrediting;дискредитация;Die gezielte Diskreditierung des Gegners scheiterte.;The targeted discrediting of the opponent failed.;Целенаправленная дискредитация оппонента провалилась.;Nomen, f.;c1 politics
die Diskriminierung;discrimination;дискриминация;Jede Form von Diskriminierung wird rechtlich verfolgt.;Every form of discrimination is legally prosecuted.;Любая форма дискриминации преследуется по закону.;Nomen, f.;c1 law
die Diskussionsgrundlage;basis for discussion;основа для дискуссии;Dieser Entwurf dient als erste Diskussionsgrundlage.;This draft serves as an initial basis for discussion.;Этот проект служит первой основой для дискуссии.;Nomen, f.;c1 work
die Disparität, die Disparitäten;disparity;неравенство / диспропорция;Regionale Disparitäten sollen durch Fördermittel sinken.;Regional disparities are to decrease through subsidies.;Региональные диспропорции должны снизиться за счёт субсидий.;Nomen, f.;c1 economy
die Disproportionalität;disproportionality;непропорциональность;Die Disproportionalität der Strafe wurde scharf kritisiert.;The disproportionality of the penalty was sharply criticized.;Непропорциональность наказания подверглась резкой критике.;Nomen, f.;c1 law
die Distanzierung;distancing;дистанцирование;Es folgte eine klare Distanzierung von den Aussagen.;A clear distancing from the statements followed.;Последовало чёткое дистанцирование от этих заявлений.;Nomen, f.;c1 politics
die Diversifikation;diversification;диверсификация;Diversifikation mindert das Risiko im Portfolio.;Diversification reduces risk in the portfolio.;Диверсификация снижает риск в портфеле.;Nomen, f.;c1 finance
die Doktrin, die Doktrinen;doctrine;доктрина;Diese wirtschaftliche Doktrin prägte ganze Jahrzehnte.;This economic doctrine shaped entire decades.;Эта экономическая доктрина определяла целые десятилетия.;Nomen, f.;c1 politics
die Dominanz;dominance;доминирование;Die Dominanz weniger Konzerne hemmt den Wettbewerb.;The dominance of a few corporations inhibits competition.;Доминирование нескольких концернов тормозит конкуренцию.;Nomen, f.;c1 economy
die Drosselung;throttling / curtailment;сокращение / дросселирование;Eine Drosselung der Produktion senkt kurzfristig Kosten.;Curtailing production lowers costs in the short term.;Сокращение производства в краткосрочной перспективе снижает издержки.;Nomen, f.;c1 economy
die Durchdringung;penetration / permeation;проникновение;Die digitale Durchdringung des Alltags nimmt weiter zu.;The digital permeation of daily life continues to increase.;Цифровое проникновение в повседневность продолжает расти.;Nomen, f.;c1 tech
die Durchführbarkeit;feasibility;выполнимость / осуществимость;Zuerst prüfen wir die technische Durchführbarkeit.;First we examine the technical feasibility.;Сначала мы проверяем техническую осуществимость.;Nomen, f.;c1 tech
die Durchlässigkeit;permeability / social mobility;проницаемость / социальная мобильность;Das Schulsystem braucht mehr soziale Durchlässigkeit.;The school system needs more social mobility.;Школьной системе нужна большая социальная мобильность.;Nomen, f.;c1 society
der Durchschnittsverdiener, die Durchschnittsverdiener;average earner;человек со средним доходом;Steuersenkungen entlasten vor allem Durchschnittsverdiener.;Tax cuts relieve average earners above all.;Снижение налогов облегчает жизнь прежде всего людям со средним доходом.;Nomen, m.;c1 economy
die Dynamisierung;dynamization;придание динамики;Eine Dynamisierung der Renten gleicht Preissteigerungen aus.;Indexing pensions offsets price increases.;Индексация пенсий компенсирует рост цен.;Nomen, f.;c1 economy
die Effektivität;effectiveness;результативность / эффективность;Effektivität misst, ob die richtigen Ziele erreicht werden.;Effectiveness measures whether the right goals are reached.;Результативность измеряет, достигаются ли правильные цели.;Nomen, f.;c1 business
das Ego;ego;эго;Manchmal steht das eigene Ego der Lösung im Weg.;Sometimes one’s own ego stands in the way of the solution.;Иногда собственное эго мешает решению.;Nomen, n.;c1 psychology
die Eigeninitiative;personal initiative;личная инициатива;Eigeninitiative wird in Start-ups besonders geschätzt.;Personal initiative is especially valued in startups.;Личная инициатива особенно ценится в стартапах.;Nomen, f.;c1 work
die Eigenverantwortung;personal responsibility;личная ответственность;Mehr Eigenverantwortung erfordert aber auch klare Regeln.;More personal responsibility also requires clear rules.;Большая личная ответственность требует и чётких правил.;Nomen, f.;c1 society
die Einbindung;integration / involvement;вовлечение / интеграция;Die Einbindung lokaler Akteure sichert Akzeptanz.;Involving local actors secures acceptance.;Вовлечение местных участников обеспечивает принятие.;Nomen, f.;c1 politics
der Eingriff, die Eingriffe;intervention / surgery;вмешательство / операция;Staatliche Eingriffe in den Markt sind oft umstritten.;State interventions in the market are often controversial.;Вмешательство государства в рынок часто вызывает споры.;Nomen, m.;c1 economy
die Einhaltung;compliance / adherence;соблюдение;Die Einhaltung der Fristen wird streng überwacht.;Compliance with deadlines is strictly monitored.;Соблюдение сроков строго контролируется.;Nomen, f.;c1 law
die Einhelligkeit;unanimity;единодушие;In diesem Punkt herrschte seltene Einhelligkeit.;On this point there was rare unanimity.;В этом вопросе царило редкое единодушие.;Nomen, f.;c1 politics
die Einmischung;interference;вмешательство;Eine Einmischung von außen wurde strikt abgelehnt.;External interference was strictly rejected.;Вмешательство извне было категорически отвергнуто.;Nomen, f.;c1 politics
die Einsichtnahme;inspection (of files);ознакомление (с документами);Die Einsichtnahme in die Akten steht Ihnen zu.;Inspection of the files is your right.;Вы имеете право на ознакомление с материалами дела.;Nomen, f.;c1 law
die Einstufung, die Einstufungen;classification / rating;классификация / оценка;Die Einstufung als Kulturerbe bringt Fördermittel.;Classification as cultural heritage brings funding.;Присвоение статуса культурного наследия приносит финансирование.;Nomen, f.;c1 culture
die Einwilligung;consent;согласие;Ohne schriftliche Einwilligung erfolgt keine Verarbeitung.;Without written consent no processing takes place.;Без письменного согласия обработка не производится.;Nomen, f.;c1 law
die Eitelkeit;vanity;тщеславие;Eitelkeit trübt oft den objektiven Blick.;Vanity often clouds objective judgment.;Тщеславие часто затуманивает объективный взгляд.;Nomen, f.;c1 psychology
der Eklat, die Eklats;scandal / uproar;скандал / публичная ссора;Die Rede endete mit einem offenen Eklat.;The speech ended in an open uproar.;Речь закончилась открытым скандалом.;Nomen, m.;c1 politics
die Elastizität;elasticity;эластичность / гибкость;Die Preiselastizität dieses Gutes ist sehr gering.;The price elasticity of this good is very low.;Ценовая эластичность этого товара очень низка.;Nomen, f.;c1 economy
die Elite, die Eliten;elite;элита;Wirtschaftliche Eliten tragen besondere Verantwortung.;Economic elites bear special responsibility.;Экономические элиты несут особую ответственность.;Nomen, f.;c1 society
die Emanzipation;emancipation;эмансипация;Die Emanzipation veränderte gesellschaftliche Rollenbilder.;Emancipation changed societal role models.;Эмансипация изменила общественные ролевые модели.;Nomen, f.;c1 history
die Empathie;empathy;эмпатия / сопереживание;Empathie bildet die Grundlage gelungener Kommunikation.;Empathy forms the basis of successful communication.;Эмпатия образует основу успешной коммуникации.;Nomen, f.;c1 psychology
die Entfremdung;alienation;отчуждение;Die Entfremdung von der Natur wächst in Megastädten.;Alienation from nature is growing in megacities.;Отчуждение от природы растёт в мегаполисах.;Nomen, f.;c1 society
die Entgegennahme;receipt / acceptance;принятие / получение;Zur Entgegennahme des Pakets ist eine Unterschrift nötig.;A signature is required to accept the package.;Для получения посылки необходима подпись.;Nomen, f.;c1 office
die Enthaltung, die Enthaltungen;abstention;воздержание (при голосовании);Mit zehn Ja-Stimmen und zwei Enthaltungen angenommen.;Adopted with ten yes votes and two abstentions.;Принято десятью голосами за при двух воздержавшихся.;Nomen, f.;c1 politics
die Enthemmung;disinhibition;расторможенность / потеря сдержанности;Anonymität im Netz führt oft zu sprachlicher Enthemmung.;Anonymity online often leads to verbal disinhibition.;Анонимность в сети часто ведёт к речевой распущенности.;Nomen, f.;c1 media
die Entkräftung;refutation / exhaustion;опровержение / истощение;Zur Entkräftung der Vorwürfe legte er Belege vor.;To refute the allegations he presented evidence.;Для опровержения обвинений он представил доказательства.;Nomen, f.;c1 law
die Entlastungsoffensive;relief initiative;инициатива по снижению нагрузки;Die Kammer fordert eine spürbare Entlastungsoffensive.;The chamber demands a noticeable relief initiative.;Палата требует ощутимой программы по снижению нагрузки.;Nomen, f.;c1 economy
die Entschärfung;defusing / easing;смягчение / разрядка;Zur Entschärfung des Konflikts trafen sich beide Seiten.;To defuse the conflict both sides met.;Для разрядки конфликта обе стороны встретились.;Nomen, f.;c1 politics
die Entschleunigung;slowing down;замедление (ритма жизни);Urlaub auf dem Land sorgt für wohltuende Entschleunigung.;A vacation in the countryside provides pleasant deceleration.;Отпуск в деревне обеспечивает приятное замедление ритма.;Nomen, f.;c1 life
die Entsprechung, die Entsprechungen;equivalent / counterpart;соответствие / эквивалент;Für diesen Begriff gibt es keine genaue Entsprechung.;There is no exact equivalent for this term.;Для этого понятия нет точного эквивалента.;Nomen, f.;c1 study
die Enttabuisierung;breaking of taboos;снятие табу;Die Enttabuisierung psychischer Leiden ist ein Fortschritt.;Breaking the taboo on mental illness is progress.;Снятие табу с психических заболеваний — это прогресс.;Nomen, f.;c1 society
die Entwertung;devaluation;обесценивание / девальвация;Eine Entwertung der Währung verteuert Importe.;A devaluation of the currency makes imports more expensive.;Девальвация валюты делает импорт дороже.;Nomen, f.;c1 finance
die Entziehung;withdrawal / revocation;лишение / отзыв;Die Entziehung der Lizenz war rechtlich zulässig.;Revocation of the license was legally permissible.;Отзыв лицензии был юридически допустим.;Nomen, f.;c1 law
die Epistemologie;epistemology;эпистемология;Epistemologie fragt nach den Grundlagen unseres Wissens.;Epistemology asks about the foundations of our knowledge.;Эпистемология исследует основы нашего знания.;Nomen, f.;c1 philosophy
die Ergiebigkeit;productivity / richness;продуктивность / содержательность;Die Ergiebigkeit dieser Quelle überraschte alle.;The richness of this source surprised everyone.;Содержательность этого источника удивила всех.;Nomen, f.;c1 science
die Erhebung, die Erhebungen;survey / collection (data);сбор (данных) / обследование;Statistische Erhebungen liefern eine verlässliche Basis.;Statistical surveys provide a reliable basis.;Статистические обследования дают надёжную базу.;Nomen, f.;c1 science
die Erläuterung, die Erläuterungen;explanation / commentary;пояснение / разъяснение;Weitere Erläuterungen finden Sie im Anhang.;Further explanations can be found in the appendix.;Дальнейшие пояснения вы найдёте в приложении.;Nomen, f.;c1 academic
die Ermächtigung, die Ermächtigungen;authorization / empowerment;уполномочивание / полномочие;Ohne gesetzliche Ermächtigung darf das Amt nicht handeln.;Without legal authorization the office may not act.;Без законных полномочий ведомство не вправе действовать.;Nomen, f.;c1 law
die Ermessensentscheidung, die Ermessensentscheidungen;discretionary decision;решение по усмотрению;Hier handelt es sich um eine reine Ermessensentscheidung.;Here it is a purely discretionary decision.;Здесь речь идёт исключительно о решении по усмотрению.;Nomen, f.;c1 law
die Erneuerung;renewal / renovation;обновление;Eine geistige Erneuerung braucht Zeit und Mut.;A spiritual renewal needs time and courage.;Духовное обновление требует времени и смелости.;Nomen, f.;c1 culture
die Erörterung, die Erörterungen;discussion / analysis;обсуждение / разбор;Nach eingehender Erörterung stimmten wir zu.;After thorough discussion we agreed.;После подробного обсуждения мы согласились.;Nomen, f.;c1 academic
die Erpressung, die Erpressungen;blackmail / extortion;шантаж / вымогательство;Erpressung ist ein schweres Delikt.;Extortion is a serious offense.;Вымогательство — тяжкое преступление.;Nomen, f.;c1 law
die Errungenschaft, die Errungenschaften;achievement;достижение / завоевание;Soziale Sicherheit ist eine historische Errungenschaft.;Social security is a historic achievement.;Социальная защита — историческое достижение.;Nomen, f.;c1 history
die Erschütterung, die Erschütterungen;shock / tremor;потрясение / толчок;Leichte Erschütterungen waren im ganzen Tal spürbar.;Slight tremors were felt throughout the valley.;Лёгкие толчки ощущались по всей долине.;Nomen, f.;c1 nature
die Ertragskraft;earning power;доходность / рентабельность;Die Ertragskraft des Konzerns blieb stabil.;The corporation’s earning power remained stable.;Доходность концерна оставалась стабильной.;Nomen, f.;c1 finance
die Eskalation, die Eskalationen;escalation;эскалация;Alle Seiten wollten eine weitere Eskalation verhindern.;All sides wanted to prevent further escalation.;Все стороны хотели предотвратить дальнейшую эскалацию.;Nomen, f.;c1 politics
die Etablierung;establishment;утверждение / становление;Die Etablierung neuer Standards dauert oft Jahre.;Establishing new standards often takes years.;Утверждение новых стандартов часто занимает годы.;Nomen, f.;c1 business
die Evaluation, die Evaluationen;evaluation;оценка / оценивание;Eine externe Evaluation prüft die Lehrqualität.;An external evaluation examines teaching quality.;Внешняя оценка проверяет качество преподавания.;Nomen, f.;c1 academic
die Evakuierung, die Evakuierungen;evacuation;эвакуация;Die Evakuierung des Gebäudes verlief geordnet.;The evacuation of the building proceeded orderly.;Эвакуация здания прошла организованно.;Nomen, f.;c1 safety
die Exekutive;executive branch;исполнительная власть;Die Regierung bildet die Spitze der Exekutive.;The government forms the head of the executive.;Правительство образует вершину исполнительной власти.;Nomen, f.;c1 politics
die Expansion;expansion;экспансия / расширение;Die schnelle Expansion überforderte die Logistik.;Rapid expansion overwhelmed logistics.;Быстрая экспансия перегрузила логистику.;Nomen, f.;c1 business
die Expertise, die Expertisen;expertise / expert report;экспертиза / компетентность;Für diesen Schritt holen wir externe Expertise ein.;For this step we bring in external expertise.;Для этого шага мы привлекаем внешнюю экспертизу.;Nomen, f.;c1 work
die Explikation, die Explikationen;explication;экспликация / разъяснение;Eine präzise Explikation vermeidet begriffliche Unschärfe.;A precise explication avoids conceptual vagueness.;Точная экспликация позволяет избежать понятийной расплывчатости.;Nomen, f.;c1 academic
die Exposition;exposition / exposure;экспозиция / воздействие;Eine lange Exposition gegenüber Lärm schadet dem Gehör.;Long exposure to noise harms hearing.;Длительное воздействие шума вредит слуху.;Nomen, f.;c1 health
die Extrapolation;extrapolation;экстраполяция;Eine Extrapolation über zwanzig Jahre bleibt unsicher.;An extrapolation over twenty years remains uncertain.;Экстраполяция на двадцать лет остаётся ненадёжной.;Nomen, f.;c1 science
die Fahrlässigkeit;negligence;халатность / неосторожность;Grobe Fahrlässigkeit schließt den Versicherungsschutz aus.;Gross negligence excludes insurance coverage.;Грубая халатность исключает страховую защиту.;Nomen, f.;c1 law
die Faktizität;factuality;фактичность;Die Faktizität der historischen Quelle ist unbestritten.;The factuality of the historical source is undisputed.;Фактичность исторического источника неоспорима.;Nomen, f.;c1 history
die Faszination;fascination;очарование / увлечение;Das Weltall übt auf Menschen große Faszination aus.;Space exerts great fascination on humans.;Космос вызывает у людей огромное восхищение.;Nomen, f.;c1 science
die Fehlentwicklung, die Fehlentwicklungen;undesirable development;ошибочное развитие;Diese Fehlentwicklung muss früh korrigiert werden.;This undesirable development must be corrected early.;Эту ошибочную тенденцию нужно вовремя исправить.;Nomen, f.;c1 society
die Fehlinterpretation, die Fehlinterpretationen;misinterpretation;неверная интерпретация;Eine Fehlinterpretation der Daten führte zum Irrtum.;A misinterpretation of the data led to the error.;Неверная интерпретация данных привела к ошибке.;Nomen, f.;c1 science
die Feindseligkeit, die Feindseligkeiten;hostility;враждебность;Offene Feindseligkeit vergiftet jedes Gespräch.;Open hostility poisons every conversation.;Открытая враждебность отравляет любой разговор.;Nomen, f.;c1 society
die Fiktion, die Fiktionen;fiction;вымысел / фикция;In diesem Roman verschwimmen Realität und Fiktion.;In this novel reality and fiction blur.;В этом романе смешиваются реальность и вымысел.;Nomen, f.;c1 culture
die Flexibilisierung;flexibilization;повышение гибкости;Die Flexibilisierung der Arbeitszeit hilft Familien.;Making working hours more flexible helps families.;Повышение гибкости рабочего времени помогает семьям.;Nomen, f.;c1 work
die Floskel, die Floskeln;platitude / empty phrase;пустая фраза / штамп;Statt leerer Floskeln wünschen wir klare Antworten.;Instead of empty phrases we want clear answers.;Вместо пустых фраз мы хотим чётких ответов.;Nomen, f.;c1 communication
die Fokussierung;focusing;фокусировка;Eine konsequente Fokussierung erhöht die Qualität.;Consistent focusing increases quality.;Последовательная фокусировка повышает качество.;Nomen, f.;c1 work
die Folgekosten;follow-up costs;последующие расходы;Vernachlässigte Wartung verursacht hohe Folgekosten.;Neglected maintenance causes high follow-up costs.;Запущенное техобслуживание вызывает высокие последующие расходы.;Nomen, Pl.;c1 finance
die Förmlichkeit;formality;формальность;Die Verleihung verlief ohne übertriebene Förmlichkeit.;The award ceremony proceeded without excessive formality.;Вручение прошло без излишней формальности.;Nomen, f.;c1 formal
die Freizügigkeit;freedom of movement;свобода передвижения;Freizügigkeit gehört zu den Grundpfeilern Europas.;Freedom of movement is one of the pillars of Europe.;Свобода передвижения относится к основным столпам Европы.;Nomen, f.;c1 politics
die Frikton, die Friktionen;friction;трение / разногласие;Beim Zusammenschluss gab es anfangs einige Friktionen.;During the merger there were initially some frictions.;При слиянии поначалу возникали некоторые трения.;Nomen, f.;c1 business
die Frustration;frustration;фрустрация / разочарование;Dauerhafte Frustration senkt die Arbeitsmoral.;Persistent frustration lowers work morale.;Постоянная фрустрация снижает трудовой настрой.;Nomen, f.;c1 psychology
die Fügung;providence / joining;стечение обстоятельств / соединение;Durch eine glückliche Fügung trafen sie sich wieder.;Through a fortunate coincidence they met again.;По счастливому стечению обстоятельств они снова встретились.;Nomen, f.;c1 formal
die Furchtlosigkeit;fearlessness;бесстрашие;Mit großer Furchtlosigkeit sprach sie die Wahrheit aus.;With great fearlessness she spoke the truth.;С большим бесстрашием она сказала правду.;Nomen, f.;c1 people
die Ganzheitlichkeit;holism / wholeness;целостность;Das Konzept überzeugt durch seine Ganzheitlichkeit.;The concept convinces through its holistic nature.;Концепция убеждает своей целостностью.;Nomen, f.;c1 philosophy
die Gefolgschaft;following / allegiance;последователи / свита;Das neue Programm fand rasch eine treue Gefolgschaft.;The new program quickly found a loyal following.;Новая программа быстро обрела верных последователей.;Nomen, f.;c1 society
die Gegendarstellung, die Gegendarstellungen;counter-statement;опровержение (в СМИ);Die Zeitung druckte gestern eine Gegendarstellung.;The newspaper printed a counter-statement yesterday.;Газета вчера напечатала опровержение.;Nomen, f.;c1 media
die Gegenseitigkeit;reciprocity;взаимность;Diplomatische Beziehungen beruhen auf Gegenseitigkeit.;Diplomatic relations are based on reciprocity.;Дипломатические отношения строятся на взаимности.;Nomen, f.;c1 politics
der Gegenwind;headwind;встречный ветер / противодействие;Trotz politischen Gegenwinds blieb sie bei ihrem Kurs.;Despite political headwinds she stuck to her course.;Несмотря на политическое противодействие, она держалась своего курса.;Nomen, m.;c1 politics
die Geisteswissenschaft, die Geisteswissenschaften;humanities;гуманитарные науки;Die Geisteswissenschaften reflektieren kulturelle Werte.;The humanities reflect cultural values.;Гуманитарные науки осмысливают культурные ценности.;Nomen, f.;c1 academic
die Geldpolitik;monetary policy;денежно-кредитная политика;Die Geldpolitik beeinflusst unmittelbar die Zinsen.;Monetary policy directly influences interest rates.;Денежно-кредитная политика напрямую влияет на процентные ставки.;Nomen, f.;c1 economy
die Gemütslage;state of mind / mood;душевное состояние;Seine Gemütslage schwankte zwischen Hoffnung und Skepsis.;His state of mind oscillated between hope and skepticism.;Его душевное состояние колебалось между надеждой и скепсисом.;Nomen, f.;c1 psychology
die Genese;genesis / origin;генезис / происхождение;Die Genese dieses Konflikts reicht weit zurück.;The genesis of this conflict reaches far back.;Генезис этого конфликта уходит далеко в прошлое.;Nomen, f.;c1 history
die Geringschätzung;disdain / disparagement;пренебрежение / недооценка;Geringschätzung gegenüber Kollegen schadet dem Klima.;Disdain toward colleagues harms the atmosphere.;Пренебрежение к коллегам вредит атмосфере.;Nomen, f.;c1 psychology
die Gesetzmäßigkeit, die Gesetzmäßigkeiten;regularity / law (scientific);закономерность;Hinter den Zahlen verbirgt sich eine klare Gesetzmäßigkeit.;Behind the numbers hides a clear regularity.;За цифрами скрывается чёткая закономерность.;Nomen, f.;c1 science
die Gewichtung;weighting / emphasis;взвешивание / расстановка акцентов;Die Gewichtung der einzelnen Kriterien ist transparent.;The weighting of individual criteria is transparent.;Распределение весов отдельных критериев прозрачно.;Nomen, f.;c1 academic
die Gewinnspanne, die Gewinnspannen;profit margin;маржа прибыли;Im Handel sind die Gewinnspannen oft sehr eng.;In retail profit margins are often very tight.;В торговле маржа прибыли часто очень узкая.;Nomen, f.;c1 finance
die Gewissheit;certainty;уверенность / достоверность;Absolute Gewissheit gibt es in der Forschung selten.;Absolute certainty rarely exists in research.;Абсолютная достоверность в науке встречается редко.;Nomen, f.;c1 science
die Gleichförmigkeit;uniformity / monotony;однообразие / равномерность;Die Gleichförmigkeit der Abläufe wirkt ermüdend.;The uniformity of procedures feels tiring.;Однообразие процессов утомляет.;Nomen, f.;c1 work
die Gleichsetzung;equation / equating;отождествление;Eine pauschale Gleichsetzung beider Begriffe ist falsch.;A blanket equating of both terms is wrong.;Огульное отождествление обоих понятий неверно.;Nomen, f.;c1 academic
die Gliederung, die Gliederungen;outline / structure;структура / оглавление;Eine logische Gliederung erleichtert das Verstehen.;A logical outline makes understanding easier.;Логичная структура облегчает понимание.;Nomen, f.;c1 academic
die Gradwanderung, die Gradwanderungen;tightrope walk;балансирование на грани;Die Reform ist eine schwierige Gradwanderung.;The reform is a difficult tightrope walk.;Эта реформа — сложное балансирование на грани.;Nomen, f.;c1 politics
die Gremienarbeit;committee work;работа в комиссиях;Gremienarbeit erfordert Geduld und Kompromissbereitschaft.;Committee work requires patience and willingness to compromise.;Работа в комиссиях требует терпения и готовности к компромиссу.;Nomen, f.;c1 politics
die Grundannahme, die Grundannahmen;basic assumption;базовое допущение;Unsere Grundannahme wurde durch das Experiment widerlegt.;Our basic assumption was refuted by the experiment.;Наше базовое допущение было опровергнуто экспериментом.;Nomen, f.;c1 science
die Grundgesamtheit;statistical population;генеральная совокупность;Die Stichprobe bildet die Grundgesamtheit gut ab.;The sample represents the population well.;Выборка хорошо отражает генеральную совокупность.;Nomen, f.;c1 science
die Grundlegung;laying the foundation;закладывание основ;Dieses Werk diente der Grundlegung der modernen Physik.;This work served to lay the foundation of modern physics.;Этот труд послужил закладкой основ современной физики.;Nomen, f.;c1 science
die Gruppendynamik;group dynamics;групповая динамика;In Workshops achten Trainer stark auf Gruppendynamik.;In workshops trainers pay close attention to group dynamics.;На тренингах тренеры уделяют большое внимание групповой динамике.;Nomen, f.;c1 psychology
die Gültigkeitsdauer;period of validity;срок действия;Die Gültigkeitsdauer des Zertifikats beträgt drei Jahre.;The validity period of the certificate is three years.;Срок действия сертификата составляет три года.;Nomen, f.;c1 formal
die Handlungsfähigkeit;capacity to act;дееспособность / способность действовать;Der Staat muss seine Handlungsfähigkeit bewahren.;The state must preserve its capacity to act.;Государство должно сохранять свою дееспособность.;Nomen, f.;c1 politics
der Handlungsspielraum;scope for action;свобода действий;Das knappe Budget engt unseren Handlungsspielraum ein.;The tight budget narrows our scope for action.;Скудный бюджет сужает нашу свободу действий.;Nomen, m.;c1 business
die Harmonisierung;harmonization;гармонизация / согласование;Die Harmonisierung der Normen erleichtert den Handel.;Harmonizing standards facilitates trade.;Гармонизация норм облегчает торговлю.;Nomen, f.;c1 economy
die Hektik;hectic pace / rush;суета / спешка;In der Vorweihnachtszeit herrscht überall große Hektik.;Before Christmas there is a great rush everywhere.;В предрождественское время повсюду царит большая суета.;Nomen, f.;c1 daily
die Hemmschwelle, die Hemmschwellen;inhibition threshold;психологический барьер;Digitale Angebote senken oft die Hemmschwelle.;Digital services often lower the inhibition threshold.;Цифровые сервисы часто снижают психологический барьер.;Nomen, f.;c1 psychology
die Herangehensweise, die Herangehensweisen;approach;подход;Eine interdisziplinäre Herangehensweise liefert neue Impulse.;An interdisciplinary approach provides new impulses.;Междисциплинарный подход даёт новые импульсы.;Nomen, f.;c1 academic
die Heraufsetzung;increase / raising;повышение;Die Heraufsetzung des Limits wurde diskutiert.;Raising the limit was discussed.;Повышение лимита обсуждалось.;Nomen, f.;c1 finance
die Herabsetzung;reduction / disparagement;снижение / принижение;Eine Herabsetzung der Gebühren entlastet Studierende.;A reduction of fees relieves students.;Снижение сборов облегчает нагрузку на студентов.;Nomen, f.;c1 study
die Heterogenität;heterogeneity;разнородность;Die Heterogenität der Lerngruppe erfordert Differenzierung.;The heterogeneity of the learning group requires differentiation.;Разнородность учебной группы требует дифференциации.;Nomen, f.;c1 study
die Hierarchie, die Hierarchien;hierarchy;иерархия;Flache Hierarchien beschleunigen Entscheidungen.;Flat hierarchies speed up decisions.;Плоские иерархии ускоряют принятие решений.;Nomen, f.;c1 business
die Hingabe;devotion / dedication;преданность / самоотдача;Mit großer Hingabe restaurierte sie das alte Gemälde.;With great devotion she restored the old painting.;С большой самоотдачей она реставрировала старую картину.;Nomen, f.;c1 culture
die Hinterfragung;questioning / scrutiny;критическое осмысление;Die kritische Hinterfragung eigener Routinen lohnt sich.;Critically questioning one’s own routines pays off.;Критическое переосмысление собственных рутин окупается.;Nomen, f.;c1 psychology
die Homogenität;homogeneity;однородность;Die sprachliche Homogenität der Gruppe erleichterte den Start.;The linguistic homogeneity of the group eased the start.;Языковая однородность группы облегчила старт.;Nomen, f.;c1 study
die Idealisierung;idealization;идеализация;Nüchterne Analyse schützt vor falscher Idealisierung.;Sober analysis protects against false idealization.;Трезвый анализ защищает от ложной идеализации.;Nomen, f.;c1 psychology
die Ideologie, die Ideologien;ideology;идеология;Wissenschaft sollte unabhängig von Ideologie arbeiten.;Science should work independently of ideology.;Наука должна работать независимо от идеологии.;Nomen, f.;c1 politics
die Ignoranz;ignorance;невежество / игнорирование;Ignoranz gegenüber Fakten erschwert jede Lösung.;Ignorance toward facts hampers every solution.;Игнорирование фактов затрудняет любое решение.;Nomen, f.;c1 society
die Implikation, die Implikationen;implication;последствие / подтекст;Die rechtlichen Implikationen müssen noch geprüft werden.;The legal implications still have to be examined.;Правовые последствия ещё нужно изучить.;Nomen, f.;c1 law
die Improvisation;improvisation;импровизация;Bei Ausfall der Technik hilft nur gute Improvisation.;When technology fails, only good improvisation helps.;При отказе техники помогает только хорошая импровизация.;Nomen, f.;c1 culture
die Inanspruchnahme;utilization / claiming;использование / обращение за;Die Inanspruchnahme der Beratung ist kostenfrei.;Using the consultation is free of charge.;Обращение за консультацией бесплатно.;Nomen, f.;c1 office
die Indifferenz;indifference;безразличие;Politische Indifferenz schwächt die Beteiligung.;Political indifference weakens participation.;Политическое безразличие ослабляет участие.;Nomen, f.;c1 politics
der Indikator, die Indikatoren;indicator;индикатор / показатель;Bildung gilt als wichtiger Indikator für Chancengleichheit.;Education is considered an important indicator of equal opportunity.;Образование считается важным индикатором равных возможностей.;Nomen, m.;c1 science
die Individualisierung;individualization;индивидуализация;Individualisierung prägt moderne Konsummuster.;Individualization shapes modern consumption patterns.;Индивидуализация формирует современные модели потребления.;Nomen, f.;c1 society
die Induktion;induction;индукция;Durch Induktion schließt man vom Einzelfall aufs Allgemeine.;Through induction one infers the general from the particular.;Через индукцию от частного переходят к общему.;Nomen, f.;c1 academic
die Infrastrukturmaßnahme, die Infrastrukturmaßnahmen;infrastructure measure;инфраструктурная мера;Große Infrastrukturmaßnahmen brauchen lange Planung.;Major infrastructure measures require long planning.;Крупные инфраструктурные проекты требуют долгого планирования.;Nomen, f.;c1 politics
die Inklusion;inclusion;инклюзия;Gelebte Inklusion bereichert jede Schule.;Practiced inclusion enriches every school.;Реальная инклюзия обогащает любую школу.;Nomen, f.;c1 society
die Inkonsistenz, die Inkonsistenzen;inconsistency;непоследовательность / противоречивость;In den Daten zeigten sich mehrere Inkonsistenzen.;Several inconsistencies appeared in the data.;В данных проявились несколько несоответствий.;Nomen, f.;c1 science
die Innovationsoffenheit;openness to innovation;открытость инновациям;Innovationsoffenheit entscheidet über künftige Wettbewerbsfähigkeit.;Openness to innovation decides future competitiveness.;Открытость инновациям определяет будущую конкурентоспособность.;Nomen, f.;c1 business
die Instanz, die Instanzen;instance / authority;инстанция;Das Urteil wurde in der nächsten Instanz bestätigt.;The verdict was confirmed in the next instance.;Приговор был подтверждён в следующей инстанции.;Nomen, f.;c1 law
die Institutionalisierung;institutionalization;институционализация;Die Institutionalisierung des Dialogs schuf Verlässlichkeit.;Institutionalizing the dialogue created reliability.;Институционализация диалога создала надёжность.;Nomen, f.;c1 politics
die Inszenierung, die Inszenierungen;staging / production;постановка / инсценировка;Die mediale Inszenierung lenkte vom Inhalt ab.;Media staging distracted from the content.;Медийная инсценировка отвлекала от сути.;Nomen, f.;c1 media
die Integrität;integrity;честность / целостность;Wissenschaftliche Integrität duldet keine Manipulation.;Scientific integrity tolerates no manipulation.;Научная добросовестность не терпит манипуляций.;Nomen, f.;c1 academic
die Intention, die Intentionen;intention;намерение / интенция;Die ursprüngliche Intention des Gesetzes war eindeutig.;The original intention of the law was clear.;Первоначальное намерение закона было однозначным.;Nomen, f.;c1 law
die Interaktion, die Interaktionen;interaction;взаимодействие;Menschliche Interaktion lässt sich nicht völlig ersetzen.;Human interaction cannot be completely replaced.;Человеческое взаимодействие невозможно полностью заменить.;Nomen, f.;c1 psychology
die Interdependenz, die Interdependenzen;interdependence;взаимозависимость;Globale Märkte zeigen eine hohe Interdependenz.;Global markets show high interdependence.;Глобальные рынки демонстрируют высокую взаимозависимость.;Nomen, f.;c1 economy
die Intoleranz;intolerance;нетерпимость;Intoleranz widerspricht einer pluralistischen Gesellschaft.;Intolerance contradicts a pluralistic society.;Нетерпимость противоречит плюралистическому обществу.;Nomen, f.;c1 society
die Intuition;intuition;интуиция;Erfahrene Ärztinnen verbinden Fakten mit Intuition.;Experienced doctors combine facts with intuition.;Опытные врачи сочетают факты с интуицией.;Nomen, f.;c1 psychology
die Irrelevanz;irrelevance;нерелевантность / несущественность;Die Irrelevanz dieses Details wurde rasch erkannt.;The irrelevance of this detail was quickly recognized.;Несущественность этой детали была быстро понята.;Nomen, f.;c1 academic
die Irritation, die Irritationen;irritation / confusion;раздражение / недоумение;Die unklare Aussage sorgte für Irritationen.;The unclear statement caused confusion.;Неясное заявление вызвало недоумение.;Nomen, f.;c1 communication
der Jargon;jargon;жаргон;Allzu viel Fachjargon erschwert Laien das Verständnis.;Too much technical jargon makes understanding hard for laypeople.;Излишек профессионального жаргона затрудняет понимание для неспециалистов.;Nomen, m.;c1 communication
die Justierung;adjustment / calibration;юстировка / настройка;Die feine Justierung des Instruments dauerte Stunden.;The fine calibration of the instrument took hours.;Тонкая настройка прибора заняла часы.;Nomen, f.;c1 tech
die Kausalität;causality;причинность;Korrelation beweist noch lange keine Kausalität.;Correlation does not prove causality by any means.;Корреляция ещё далеко не доказывает причинность.;Nomen, f.;c1 science
die Kennzahl, die Kennzahlen;key figure / metric;ключевой показатель;Alle wichtigen Kennzahlen stehen im Quartalsbericht.;All important metrics are in the quarterly report.;Все важные показатели указаны в квартальном отчёте.;Nomen, f.;c1 business
die Kernkompetenz, die Kernkompetenzen;core competence;ключевая компетенция;Forschung gehört zu unseren Kernkompetenzen.;Research belongs to our core competences.;Исследования относятся к нашим ключевым компетенциям.;Nomen, f.;c1 business
die Kluft;gap / chasm;пропасть / разрыв;Die soziale Kluft sollte nicht weiter wachsen.;The social gap should not grow any further.;Социальный разрыв не должен расти дальше.;Nomen, f.;c1 society
die Kohärenz;coherence;связность / когерентность;Dem Text fehlt an einigen Stellen die innere Kohärenz.;In some places the text lacks inner coherence.;Тексту местами не хватает внутренней связности.;Nomen, f.;c1 academic
die Kollektivschuld;collective guilt;коллективная вина;Das Konzept der Kollektivschuld ist rechtlich umstritten.;The concept of collective guilt is legally controversial.;Концепция коллективной вины юридически спорна.;Nomen, f.;c1 law
die Kollision, die Kollisionen;collision / conflict;столкновение / коллизия;Bei einer Kollision von Normen gilt das höhere Gesetz.;In a conflict of norms the higher law applies.;При коллизии норм действует более высокий закон.;Nomen, f.;c1 law
die Kommunikationsebene, die Kommunikationsebenen;level of communication;уровень коммуникации;Auf der Sachebene fanden wir schnell eine Lösung.;On the factual level we quickly found a solution.;На деловом уровне мы быстро нашли решение.;Nomen, f.;c1 communication
die Kompatibilität;compatibility;совместимость;Die Kompatibilität beider Systeme wurde getestet.;The compatibility of both systems was tested.;Совместимость обеих систем была протестирована.;Nomen, f.;c1 tech
die Kompensation, die Kompensationen;compensation;компенсация;Als Kompensation erhielt das Team zwei freie Tage.;As compensation the team received two days off.;В качестве компенсации команда получила два выходных дня.;Nomen, f.;c1 work
die Komplexität;complexity;сложность;Die Komplexität moderner Lieferketten ist enorm.;The complexity of modern supply chains is enormous.;Сложность современных цепочек поставок огромна.;Nomen, f.;c1 business
die Konformität;conformity / compliance;соответствие / конформизм;Wir prüfen die Konformität mit europäischen Normen.;We check conformity with European standards.;Мы проверяем соответствие европейским нормам.;Nomen, f.;c1 law
die Konfrontation, die Konfrontationen;confrontation;конфронтация / столкновение;Diplomatie sucht Dialog statt offener Konfrontation.;Diplomacy seeks dialogue instead of open confrontation.;Дипломатия ищет диалог вместо открытой конфронтации.;Nomen, f.;c1 politics
die Kongruenz;congruence;соответствие / совпадение;Inhaltliche Kongruenz stärkt die Glaubwürdigkeit.;Content congruence strengthens credibility.;Содержательное совпадение укрепляет доверие.;Nomen, f.;c1 academic
die Konnotation, die Konnotationen;connotation;коннотация;Dieses Wort hat im Deutschen eine negative Konnotation.;This word has a negative connotation in German.;Это слово в немецком имеет негативную коннотацию.;Nomen, f.;c1 study
die Konsolidierung;consolidation;консолидация / укрепление;Nach der Expansion folgt eine Phase der Konsolidierung.;After expansion follows a phase of consolidation.;После экспансии следует фаза консолидации.;Nomen, f.;c1 finance
die Konstante, die Konstanten;constant;константа / постоянная величина;Die Schwerkraft ist eine physikalische Konstante.;Gravity is a physical constant.;Гравитация — физическая константа.;Nomen, f.;c1 science
die Konstitution;constitution;конституция / телосложение;Die physische Konstitution beeinflusst die Ausdauer.;Physical constitution influences endurance.;Физическая конституция влияет на выносливость.;Nomen, f.;c1 health
die Konstruktion, die Konstruktionen;construction / design;конструкция;Die Konstruktion der Brücke hält extremen Winden stand.;The bridge’s construction withstands extreme winds.;Конструкция моста выдерживает экстремальные ветры.;Nomen, f.;c1 tech
die Kontemplation;contemplation;созерцание;Stille fördert die innere Kontemplation.;Silence promotes inner contemplation.;Тишина способствует внутреннему созерцанию.;Nomen, f.;c1 philosophy
die Kontextualisierung;contextualization;контекстуализация;Historische Quellen brauchen sorgfältige Kontextualisierung.;Historical sources need careful contextualization.;Исторические источники нуждаются в тщательной контекстуализации.;Nomen, f.;c1 history
die Kontingenz;contingency;случайность / контингентность;Kontingenz gehört zu offenen historischen Prozessen.;Contingency belongs to open historical processes.;Непредвиденность присуща открытым историческим процессам.;Nomen, f.;c1 philosophy
die Kontinuitätswahrung;preservation of continuity;сохранение преемственности;Die Kontinuitätswahrung gelang beim Führungswechsel.;Preserving continuity succeeded during the leadership change.;Сохранение преемственности удалось при смене руководства.;Nomen, f.;c1 business
die Konvention, die Konventionen;convention;конвенция / условность;Soziale Konventionen erleichtern oft den Alltag.;Social conventions often make everyday life easier.;Социальные условности часто облегчают повседневность.;Nomen, f.;c1 society
die Konvergenz;convergence;сближение / конвергенция;Technologische Konvergenz verbindet Medien und IT.;Technological convergence connects media and IT.;Технологическая конвергенция соединяет медиа и IT.;Nomen, f.;c1 tech
die Konzeption, die Konzeptionen;conception / design;концепция / замысел;Die Konzeption der Ausstellung dauerte zwei Jahre.;Designing the exhibition took two years.;Разработка концепции выставки заняла два года.;Nomen, f.;c1 culture
die Koordinierung;coordination;координация;Zentrale Koordinierung verhindert unnötige Doppelarbeit.;Central coordination prevents unnecessary duplicate work.;Центральная координация предотвращает лишнюю двойную работу.;Nomen, f.;c1 work
die Korrelation, die Korrelationen;correlation;корреляция;Die Studie zeigt eine starke Korrelation der Werte.;The study shows a strong correlation of the values.;Исследование показывает сильную корреляцию показателей.;Nomen, f.;c1 science
die Korrespondenz;correspondence;переписка / корреспонденция;Die gesamte Korrespondenz wird digital archiviert.;All correspondence is archived digitally.;Вся переписка архивируется в цифровом виде.;Nomen, f.;c1 office
die Kredibilität;credibility;достоверность / доверие;Unabhängige Quellen sichern hohe Kredibilität.;Independent sources ensure high credibility.;Независимые источники обеспечивают высокую достоверность.;Nomen, f.;c1 media
die Krisenbewältigung;crisis management;преодоление кризиса;Schnelle Krisenbewältigung schützt Arbeitsplätze.;Rapid crisis management protects jobs.;Быстрое преодоление кризиса защищает рабочие места.;Nomen, f.;c1 politics
die Kulanz;goodwill / accommodation;лояльность / уступка сверх обязательств;Aus reiner Kulanz tauschte der Händler die Ware um.;Out of pure goodwill the dealer exchanged the goods.;Из чистой лояльности продавец обменял товар.;Nomen, f.;c1 business
die Kulmination;culmination;кульминация;Dieser Konflikt fand dort seine dramatische Kulmination.;This conflict found its dramatic culmination there.;Этот конфликт достиг там своей драматической кульминации.;Nomen, f.;c1 history
die Kultivierung;cultivation;культивирование;Die Kultivierung alter Sorten schützt die Vielfalt.;Cultivating old varieties protects diversity.;Культивирование старых сортов защищает разнообразие.;Nomen, f.;c1 nature
die Kundgebung, die Kundgebungen;rally / demonstration;митинг;Auf der Kundgebung sprachen mehrere Redner.;Several speakers spoke at the rally.;На митинге выступили несколько ораторов.;Nomen, f.;c1 politics
die Kurzsichtigkeit;short-sightedness;близорукость / недальновидность;Politische Kurzsichtigkeit rächt sich oft später.;Political short-sightedness often takes its revenge later.;Политическая близорукость часто аукается позже.;Nomen, f.;c1 politics
die Labilität;instability / lability;неустойчивость / лабильность;Emotionale Labilität erfordert viel Einfühlungsvermögen.;Emotional instability requires a lot of empathy.;Эмоциональная неустойчивость требует большой чуткости.;Nomen, f.;c1 psychology
die Lähmung;paralysis;паралич / парализация;Der Streik führte zu einer Lähmung des Verkehrs.;The strike led to a paralysis of traffic.;Забастовка привела к параличу транспорта.;Nomen, f.;c1 society
die Legitimation;legitimation / authorization;легитимация / полномочие;Demokratische Wahlen sichern politische Legitimation.;Democratic elections secure political legitimation.;Демократические выборы обеспечивают политическую легитимность.;Nomen, f.;c1 politics
die Leerstelle, die Leerstellen;gap / blank space;пробел / лакуна;In der Forschung gibt es hier noch eine Leerstelle.;In research there is still a gap here.;В науке здесь всё ещё есть пробел.;Nomen, f.;c1 academic
die Lehrmeinung, die Lehrmeinungen;academic doctrine / prevailing view;научное мнение / доктрина;Die herrschende Lehrmeinung wird kritisch geprüft.;The prevailing doctrine is critically examined.;Господствующее научное мнение критически проверяется.;Nomen, f.;c1 academic
die Leitlinie, die Leitlinien;guideline;руководящий принцип;Diese Leitlinie gilt für alle Standorte weltweit.;This guideline applies to all locations worldwide.;Этот руководящий принцип действует для всех площадок по миру.;Nomen, f.;c1 business
die Lenkung;steering / control;управление / регулирование;Eine gezielte Lenkung der Investitionen ist nötig.;Targeted steering of investments is necessary.;Необходимо целенаправленное направление инвестиций.;Nomen, f.;c1 economy
die Letargie;lethargy;летаргия / апатия;Nach dem Misserfolg verfiel das Team kurz in Lethargie.;After the failure the team briefly fell into lethargy.;После неудачи команда ненадолго впала в апатию.;Nomen, f.;c1 psychology
die Liberalisierung;liberalization;либерализация;Die Liberalisierung des Marktes senkte die Preise.;Market liberalization lowered prices.;Либерализация рынка снизила цены.;Nomen, f.;c1 economy
die Liquidität;liquidity;ликвидность;Ausreichende Liquidität sichert das Überleben der Firma.;Sufficient liquidity secures the company’s survival.;Достаточная ликвидность обеспечивает выживание фирмы.;Nomen, f.;c1 finance
die Lobbyarbeit;lobbying;лоббирование;Transparente Lobbyarbeit ist gesetzlich geregelt.;Transparent lobbying is regulated by law.;Прозрачное лоббирование регулируется законом.;Nomen, f.;c1 politics
die Loyalität;loyalty;лояльность / верность;Loyalität wächst durch gegenseitiges Vertrauen.;Loyalty grows through mutual trust.;Лояльность растёт благодаря взаимному доверию.;Nomen, f.;c1 work
die Machtverteilung;distribution of power;распределение власти;Die Verfassung regelt die staatliche Machtverteilung.;The constitution regulates the state distribution of power.;Конституция регулирует распределение государственной власти.;Nomen, f.;c1 politics
die Manipulation, die Manipulationen;manipulation;манипуляция;Medienkompetenz schützt vor subtiler Manipulation.;Media literacy protects against subtle manipulation.;Медиаграмотность защищает от тонкой манипуляции.;Nomen, f.;c1 media
die Marginalisierung;marginalization;маргинализация;Soziale Marginalisierung gefährdet den Zusammenhalt.;Social marginalization endangers cohesion.;Социальная маргинализация угрожает сплочённости.;Nomen, f.;c1 society
die Marktmacht;market power;рыночная власть;Kartellämter überwachen übermäßige Marktmacht.;Antitrust authorities monitor excessive market power.;Антимонопольные ведомства контролируют чрезмерную рыночную власть.;Nomen, f.;c1 economy
die Maßregelung, die Maßregelungen;reprimand / disciplinary action;взыскание / выговор;Eine formelle Maßregelung folgte auf den Verstoß.;A formal reprimand followed the violation.;За нарушением последовало официальное взыскание.;Nomen, f.;c1 work
die Maxime, die Maximen;maxim / guiding principle;максима / принцип;Nachhaltigkeit wurde zur leitenden Maxime erhoben.;Sustainability was elevated to a guiding maxim.;Устойчивое развитие стало руководящим принципом.;Nomen, f.;c1 philosophy
die Mehrdeutigkeit;ambiguity;многозначность;In der Lyrik ist Mehrdeutigkeit oft gewollt.;In poetry ambiguity is often intentional.;В поэзии многозначность часто намеренна.;Nomen, f.;c1 culture
die Meinungsbildung;opinion formation;формирование мнений;Unabhängige Presse fördert freie Meinungsbildung.;Independent press promotes free opinion formation.;Независимая пресса способствует свободному формированию мнений.;Nomen, f.;c1 media
die Metamorphose, die Metamorphosen;metamorphosis;метаморфоза;Die Stadt durchlief eine beeindruckende Metamorphose.;The city underwent an impressive metamorphosis.;Город пережил впечатляющую метаморфозу.;Nomen, f.;c1 culture
die Methodik;methodology;методика / методология;Eine saubere Methodik ist das Herz jeder Studie.;A clean methodology is the heart of every study.;Чистая методология — сердце любого исследования.;Nomen, f.;c1 academic
die Mäßigung;moderation;умеренность / сдержанность;In hitzigen Debatten ist Mäßigung eine Tugend.;In heated debates moderation is a virtue.;В жарких дебатах сдержанность — добродетель.;Nomen, f.;c1 communication
die Missachtung;disregard / contempt;пренебрежение / неуважение;Die Missachtung der Regeln hatte Konsequenzen.;Disregarding the rules had consequences.;Пренебрежение правилами имело последствия.;Nomen, f.;c1 law
die Missbilligung;disapproval;неодобрение / порицание;Der Vorschlag stieß auf deutliche Missbilligung.;The proposal met with clear disapproval.;Предложение встретило явное неодобрение.;Nomen, f.;c1 politics
das Missverhältnis;disproportion / mismatch;диспропорция / несоответствие;Zwischen Aufwand und Ertrag besteht ein Missverhältnis.;Between effort and return there is a mismatch.;Между затратами и отдачей существует диспропорция.;Nomen, n.;c1 economy
die Mündigkeit;maturity / coming of age;зрелость / совершеннолетие;Demokratische Mündigkeit zeigt sich im kritischen Denken.;Democratic maturity shows in critical thinking.;Демократическая зрелость проявляется в критическом мышлении.;Nomen, f.;c1 society
die Mutmaßung, die Mutmaßungen;conjecture / speculation;домысел / предположение;Ohne Belege bleibt das eine reine Mutmaßung.;Without evidence that remains pure speculation.;Без доказательств это остаётся чистым домыслом.;Nomen, f.;c1 communication
die Nachahmung;imitation;подражание;Kreative Leistung geht über bloße Nachahmung hinaus.;Creative achievement goes beyond mere imitation.;Творческое достижение выходит за рамки простого подражания.;Nomen, f.;c1 culture
die Nachdrücklichkeit;emphasis / insistence;настойчивость / выразительность;Mit großer Nachdrücklichkeit forderte sie Transparenz.;With great emphasis she demanded transparency.;С большой настойчивостью она требовала прозрачности.;Nomen, f.;c1 communication
die Nachvollziehbarkeit;traceability / comprehensibility;прозрачность / понятность;Wissenschaft verlangt maximale Nachvollziehbarkeit.;Science demands maximum reproducibility.;Наука требует максимальной проверяемости.;Nomen, f.;c1 science
die Naivität;naivety;наивность;Politische Naivität kann teure Folgen haben.;Political naivety can have expensive consequences.;Политическая наивность может иметь дорогие последствия.;Nomen, f.;c1 politics
das Narrativ, die Narrative;narrative;нарратив / повествование;Historische Narrative prägen das kollektive Gedächtnis.;Historical narratives shape collective memory.;Исторические нарративы формируют коллективную память.;Nomen, n.;c1 culture
die Neutralität;neutrality;нейтралитет;Wissenschaftliche Neutralität erfordert Distanz.;Scientific neutrality requires distance.;Научный нейтралитет требует дистанции.;Nomen, f.;c1 academic
die Nische, die Nischen;niche;ниша;Das Startup besetzt erfolgreich eine ökologische Nische.;The startup successfully occupies an ecological niche.;Стартап успешно занимает экологическую нишу.;Nomen, f.;c1 business
die Nivellierung;leveling / equalization;нивелирование / уравнивание;Eine Nivellierung nach unten schadet der Qualität.;A leveling downward harms quality.;Уравнивание по нижней планке вредит качеству.;Nomen, f.;c1 society
die Nomenklatur;nomenclature;номенклатура;In der Chemie folgt man einer festen Nomenklatur.;In chemistry one follows a fixed nomenclature.;В химии следуют строгой номенклатуре.;Nomen, f.;c1 science
die Normierung;standardization;нормирование / стандартизация;Die Normierung von Schnittstellen senkt Kosten.;Standardizing interfaces lowers costs.;Стандартизация интерфейсов снижает издержки.;Nomen, f.;c1 tech
die Notlage, die Notlagen;emergency / plight;бедственное положение / чрезвычайная ситуация;In akuten Notlagen greift schnelle Soforthilfe.;In acute emergencies rapid immediate aid applies.;В острых кризисных ситуациях действует быстрая экстренная помощь.;Nomen, f.;c1 society
die Nuance, die Nuancen;nuance;нюанс / оттенок;Feine Nuancen entscheiden oft über den Ton eines Textes.;Fine nuances often decide the tone of a text.;Тонкие нюансы часто определяют тональность текста.;Nomen, f.;c1 communication
die Obhut;care / custody;попечение / опека;Das wertvolle Manuskript liegt in sicherer Obhut.;The valuable manuscript is in safe custody.;Ценная рукопись находится под надёжной охраной.;Nomen, f.;c1 formal
die Objektivität;objectivity;объективность;Journalistische Objektivität verlangt mehrere Perspektiven.;Journalistic objectivity requires multiple perspectives.;Журналистская объективность требует нескольких точек зрения.;Nomen, f.;c1 media
die Obliegenheit, die Obliegenheiten;duty / obligation;обязанность;Zu ihren Obliegenheiten zählt die Budgetkontrolle.;Her duties include budget control.;В её обязанности входит контроль бюджета.;Nomen, f.;c1 formal
die Offenkundigkeit;obviousness;очевидность;Angesichts der Offenkundigkeit erübrigt sich jede Frage.;In view of the obviousness any question is superfluous.;Ввиду очевидности всякий вопрос излишен.;Nomen, f.;c1 formal
die Ohnmacht;powerlessness / fainting;бессилие / обморок;Viele spürten angesichts der Krise tiefe Ohnmacht.;Many felt deep powerlessness in the face of the crisis.;Многие чувствовали глубокое бессилие перед лицом кризиса.;Nomen, f.;c1 psychology
die Opazität;opacity;непрозрачность;Die Opazität komplexer Finanzprodukte birgt Risiken.;The opacity of complex financial products carries risks.;Непрозрачность сложных финансовых продуктов несёт риски.;Nomen, f.;c1 finance
die Opposition;opposition;оппозиция;Eine starke Opposition kontrolliert die Regierung.;A strong opposition checks the government.;Сильная оппозиция контролирует правительство.;Nomen, f.;c1 politics
das Paradigma, die Paradigmen;paradigm;парадигма;Diese Entdeckung führte zu einem neuen Paradigma.;This discovery led to a new paradigm.;Это открытие привело к новой парадигме.;Nomen, n.;c1 science
das Paradoxon, die Paradoxa;paradox;парадокс;Dieses Paradoxon beschäftigt Philosophen seit langem.;This paradox has occupied philosophers for a long time.;Этот парадокс давно занимает философов.;Nomen, n.;c1 philosophy
die Partizipation;participation;участие (в принятии решений);Bürgerliche Partizipation stärkt lokale Projekte.;Civic participation strengthens local projects.;Гражданское участие укрепляет местные проекты.;Nomen, f.;c1 politics
die Pattsituation, die Pattsituationen;stalemate;патовая ситуация;Die Verhandlungen endeten in einer Pattsituation.;The negotiations ended in a stalemate.;Переговоры закончились патовой ситуацией.;Nomen, f.;c1 politics
die Pauschalierung;lump-sum settlement / generalization;обобщение / паушальный расчёт;Eine grobe Pauschalierung wird dem Einzelfall nicht gerecht.;A rough generalization does not do justice to the individual case.;Грубое обобщение не учитывает особенностей отдельного случая.;Nomen, f.;c1 communication
die Penetranz;penetrance / obtrusiveness;навязчивость;Die Penetranz mancher Werbung nervt viele Nutzer.;The obtrusiveness of some advertising annoys many users.;Навязчивость некоторой рекламы раздражает многих пользователей.;Nomen, f.;c1 media
die Peripherie;periphery;периферия / окраина;An der Peripherie der Stadt entstehen neue Viertel.;At the periphery of the city new districts are emerging.;На окраине города возникают новые кварталы.;Nomen, f.;c1 city
die Permanenz;permanence;постоянство / перманентность;Permanenz des Wandels prägt die digitale Ära.;Permanence of change characterizes the digital era.;Постоянство перемен определяет цифровую эпоху.;Nomen, f.;c1 tech
die Perspektivlosigkeit;lack of prospects;бесперспективность;Bildung wirkt wirksam gegen Perspektivlosigkeit.;Education acts effectively against a lack of prospects.;Образование эффективно борется с бесперспективностью.;Nomen, f.;c1 society
die Plausibilisierung;plausibility check;проверка правдоподобности;Vor der Freigabe erfolgt eine Plausibilisierung der Zahlen.;Before release a plausibility check of the figures takes place.;Перед выпуском проводится проверка достоверности цифр.;Nomen, f.;c1 finance
der Pluralismus;pluralism;плюрализм;Medialer Pluralismus sichert Meinungsvielfalt.;Media pluralism secures diversity of opinion.;Плюрализм СМИ обеспечивает многообразие мнений.;Nomen, m.;c1 media
die Polarisierung;polarization;поляризация;Die zunehmende Polarisierung erschwert Kompromisse.;Increasing polarization makes compromises more difficult.;Растущая поляризация затрудняет компромиссы.;Nomen, f.;c1 society
die Polemik;polemics;полемика / резкий спор;Scharfe Polemik ersetzt keine sachlichen Argumente.;Sharp polemics do not replace objective arguments.;Резкая полемика не заменяет предметных аргументов.;Nomen, f.;c1 communication
die Potenzierung;potentiation / multiplication;усиление / возведение в степень;Die Kombination führte zu einer Potenzierung des Effekts.;The combination led to a multiplication of the effect.;Сочетание привело к многократному усилению эффекта.;Nomen, f.;c1 science
die Prädestination;predestination;предопределение;Moderne Psychologie lehnt starre Prädestination ab.;Modern psychology rejects rigid predestination.;Современная психология отвергает жёсткое предопределение.;Nomen, f.;c1 philosophy
die Prägnanz;conciseness / precision;лаконичность / выразительность;Die Prägnanz seines Stils überzeugt sofort.;The conciseness of his style convinces immediately.;Лаконичность его стиля убеждает сразу.;Nomen, f.;c1 communication
die Prämisse, die Prämissen;premise;предпосылка / посылка;Unter dieser Prämisse ist der Schluss völlig logisch.;Under this premise the conclusion is completely logical.;При такой предпосылке вывод совершенно логичен.;Nomen, f.;c1 academic
die Prävention;prevention;профилактика / предотвращение;Medizinische Prävention senkt langfristig Kosten.;Medical prevention lowers costs in the long run.;Медицинская профилактика снижает расходы в долгосрочной перспективе.;Nomen, f.;c1 health
die Präzision;precision;точность;Chirurgische Eingriffe erfordern höchste Präzision.;Surgical interventions require utmost precision.;Хирургические вмешательства требуют высочайшей точности.;Nomen, f.;c1 health
die Prekarität;precarity / insecurity;нестабильность / уязвимость;Berufliche Prekarität erschwert langfristige Planung.;Occupational precarity complicates long-term planning.;Нестабильность занятости затрудняет долгосрочное планирование.;Nomen, f.;c1 society
das Primat;primacy;примат / первенство;In der Demokratie gilt das Primat der Politik.;In democracy the primacy of politics applies.;В демократии действует примат политики.;Nomen, n.;c1 politics
die Privatisierung;privatization;приватизация;Die Privatisierung öffentlicher Netze wird oft kritisiert.;Privatization of public networks is often criticized.;Приватизация общественных сетей часто критикуется.;Nomen, f.;c1 economy
die Problematisierung;problematization;проблематизация;Die Problematisierung verdeckter Risiken war nötig.;Problematizing hidden risks was necessary.;Проблематизация скрытых рисков была необходима.;Nomen, f.;c1 academic
die Produktivität;productivity;продуктивность / производительность;Gesunde Pausen steigern nachweislich die Produktivität.;Healthy breaks demonstrably increase productivity.;Здоровые перерывы доказанно повышают продуктивность.;Nomen, f.;c1 work
die Profilierung;profiling / carving out a profile;профилирование / самоутверждение;Fachliche Profilierung hilft auf dem Arbeitsmarkt.;Professional profiling helps on the labor market.;Профессиональное позиционирование помогает на рынке труда.;Nomen, f.;c1 work
die Progression;progression;прогрессия;Bei der Einkommensteuer gilt eine klare Progression.;For income tax a clear progression applies.;При подоходном налоге действует чёткая прогрессия.;Nomen, f.;c1 finance
die Proklamation, die Proklamationen;proclamation;провозглашение / декларация;Die Proklamation der Rechte war ein Meilenstein.;The proclamation of rights was a milestone.;Провозглашение прав стало важной вехой.;Nomen, f.;c1 history
die Propaganda;propaganda;пропаганда;Kritische Bildung immunisiert gegen Propaganda.;Critical education immunizes against propaganda.;Критическое образование вырабатывает иммунитет к пропаганде.;Nomen, f.;c1 politics
die Proportionalität;proportionality;пропорциональность;Bei Eingriffen muss die Proportionalität gewahrt bleiben.;During interventions proportionality must be maintained.;При вмешательстве должна соблюдаться пропорциональность.;Nomen, f.;c1 law
die Prosperität;prosperity;процветание;Stabiler Handel fördert allgemeine Prosperität.;Stable trade promotes general prosperity.;Стабильная торговля способствует общему процветанию.;Nomen, f.;c1 economy
die Provenienz;provenance / origin;происхождение (искусства);Museen prüfen heute genau die Provenienz ihrer Werke.;Museums today carefully check the provenance of their works.;Музеи сегодня тщательно проверяют происхождение своих экспонатов.;Nomen, f.;c1 culture
die Provokation, die Provokationen;provocation;провокация;Auf eine plumpe Provokation sollte man ruhig reagieren.;One should react calmly to a clumsy provocation.;На грубую провокацию следует реагировать спокойно.;Nomen, f.;c1 communication
die Publikation, die Publikationen;publication;публикация / издание;Ihre jüngste Publikation wurde viel zitiert.;Her latest publication was widely cited.;Её последняя публикация широко цитировалась.;Nomen, f.;c1 academic
die Quantifizierung;quantification;количественная оценка;Die Quantifizierung weicher Faktoren bleibt schwierig.;Quantifying soft factors remains difficult.;Количественная оценка мягких факторов остаётся сложной.;Nomen, f.;c1 science
die Quintessenz;quintessence;квинтэссенция / суть;Die Quintessenz des Vortrags passte in einen Satz.;The quintessence of the talk fit into one sentence.;Квинтэссенция доклада уместилась в одно предложение.;Nomen, f.;c1 communication
die Ratifizierung;ratification;ратификация;Nach der Ratifizierung tritt das Abkommen in Kraft.;After ratification the agreement enters into force.;После ратификации соглашение вступает в силу.;Nomen, f.;c1 politics
die Rationalisierung;rationalization;рационализация;Rationalisierung senkt Kosten, erfordert aber Feingefühl.;Rationalization lowers costs, but requires sensitivity.;Рационализация снижает издержки, но требует чуткости.;Nomen, f.;c1 economy
die Realisierbarkeit;feasibility;осуществимость;Die finanzielle Realisierbarkeit steht noch infrage.;Financial feasibility is still in question.;Финансовая осуществимость пока под вопросом.;Nomen, f.;c1 business
die Rekonstruktion, die Rekonstruktionen;reconstruction;реконструкция;Die Rekonstruktion des Ablaufs gelang dank Zeugen.;Reconstructing the sequence succeeded thanks to witnesses.;Реконструкция хода событий удалась благодаря свидетелям.;Nomen, f.;c1 law
die Relativierung, die Relativierungen;relativization;релятивизация / смягчение оценки;Eine vorschnelle Relativierung verharmlost das Problem.;A hasty relativization trivializes the problem.;Поспешная релятивизация преуменьшает проблему.;Nomen, f.;c1 communication
die Renommee;reputation / renown;репутация / престиж;Das Institut genießt weltweit höchstes Renommee.;The institute enjoys the highest renown worldwide.;Институт пользуется высочайшим престижем во всём мире.;Nomen, n.;c1 academic
die Repräsentation;representation;представительство / репрезентация;Angemessene Repräsentation stärkt das Vertrauen.;Appropriate representation strengthens trust.;Адекватное представительство укрепляет доверие.;Nomen, f.;c1 politics
die Repression, die Repressionen;repression;репрессия;Politische Repression unterdrückt jede freie Stimme.;Political repression suppresses every free voice.;Политические репрессии подавляют любой свободный голос.;Nomen, f.;c1 politics
die Resonanz;resonance / response;резонанс / отклик;Die Initiative fand breite gesellschaftliche Resonanz.;The initiative found broad societal resonance.;Инициатива нашла широкий общественный отклик.;Nomen, f.;c1 society
die Restriktion, die Restriktionen;restriction;ограничение / рестрикция;Strenge Restriktionen bremsten den Handel aus.;Strict restrictions slowed down trade.;Строгие ограничения затормозили торговлю.;Nomen, f.;c1 economy
die Retrospektive, die Retrospektiven;retrospective;ретроспектива;In der Retrospektive erscheinen manche Fehler klarer.;In retrospective some mistakes appear clearer.;В ретроспективе некоторые ошибки кажутся яснее.;Nomen, f.;c1 culture
die Rezession, die Rezessionen;recession;рецессия;Eine tiefe Rezession trifft vor allem kleine Firmen.;A deep recession hits small firms above all.;Глубокая рецессия бьёт прежде всего по малым фирмам.;Nomen, f.;c1 economy
die Rhetorik;rhetoric;риторика;Klare Rhetorik überzeugt, leere Phrasen ermüden.;Clear rhetoric convinces, empty phrases tire.;Ясная риторика убеждает, пустые фразы утомляют.;Nomen, f.;c1 communication
die Rigorosität;rigor / strictness;строгость / бескомпромиссность;Wissenschaftliche Rigorosität verlangt ehrliche Daten.;Scientific rigor demands honest data.;Научная строгость требует честных данных.;Nomen, f.;c1 academic
die Rückkopplung, die Rückkopplungen;feedback;обратная связь;Schnelle Rückkopplung verbessert jeden Lernprozess.;Fast feedback improves every learning process.;Быстрая обратная связь улучшает любой учебный процесс.;Nomen, f.;c1 tech
die Rücknahme;withdrawal / revocation;отзыв / отмена;Die Rücknahme des Gesetzes wurde begrüßt.;The withdrawal of the law was welcomed.;Отзыв закона был встречен с одобрением.;Nomen, f.;c1 politics
die Rückbesinnung;return / reflection back;возвращение к истокам / переосмысление;Eine Rückbesinnung auf Kernwerte gibt Orientierung.;A return to core values provides orientation.;Возвращение к базовым ценностям даёт ориентир.;Nomen, f.;c1 culture
die Rücksichtslosigkeit;ruthlessness / inconsiderateness;бесцеремонность / безрассудство;Rücksichtslosigkeit im Straßenverkehr gefährdet Leben.;Recklessness in traffic endangers lives.;Безрассудство на дорогах угрожает жизни.;Nomen, f.;c1 society
die Sachlichkeit;objectivity / matter-of-factness;деловитость / объективность;Sachlichkeit hilft, auch heikle Themen zu klären.;Objectivity helps clarify even delicate topics.;Объективность помогает прояснять даже щекотливые темы.;Nomen, f.;c1 communication
die Sanktion, die Sanktionen;sanction;санкция;Wirtschaftliche Sanktionen wirken oft erst mittelfristig.;Economic sanctions often take effect only in the medium term.;Экономические санкции часто действуют лишь в среднесрочной перспективе.;Nomen, f.;c1 politics
die Schärfe;sharpness / severity;острота / резкость;Die Schärfe der Kritik überraschte den Vorstand.;The severity of the criticism surprised the board.;Резкость критики удивила правление.;Nomen, f.;c1 business
die Schattenseite, die Schattenseiten;downside / dark side;теневая сторона;Jeder technische Fortschritt hat auch Schattenseiten.;Every technological progress also has downsides.;У любого технического прогресса есть и теневые стороны.;Nomen, f.;c1 society
die Schlichtung, die Schlichtungen;arbitration / mediation;примирение / арбитраж;Eine unabhängige Schlichtung beendete den Tarifstreit.;An independent arbitration ended the wage dispute.;Независимый арбитраж завершил тарифный спор.;Nomen, f.;c1 work
die Schlussfolgerung, die Schlussfolgerungen;conclusion / inference;умозаключение / вывод;Aus den Daten ziehen wir folgende Schlussfolgerung.;From the data we draw the following conclusion.;Из данных мы делаем следующий вывод.;Nomen, f.;c1 academic
die Schranke, die Schranken;barrier / limit;преграда / шлагбаум;Das Gesetz setzt willkürlichen Eingriffen klare Schranken.;The law sets clear limits on arbitrary interventions.;Закон ставит чёткие преграды произвольному вмешательству.;Nomen, f.;c1 law
die Schwerfälligkeit;sluggishness / clumsiness;неповоротливость / громоздкость;Die Schwerfälligkeit der Verwaltung bremst Projekte.;The sluggishness of administration slows projects down.;Неповоротливость администрации тормозит проекты.;Nomen, f.;c1 politics
die Segmentierung;segmentation;сегментация;Eine feine Segmentierung verbessert die Zielgruppenansprache.;Fine segmentation improves targeting.;Тонкая сегментация улучшает работу с целевой аудиторией.;Nomen, f.;c1 business
die Selektion, die Selektionen;selection;отбор / селекция;Strenge Selektion sichert ein hohes Niveau.;Strict selection ensures a high level.;Строгий отбор обеспечивает высокий уровень.;Nomen, f.;c1 science
die Sensibilisierung;sensitization / awareness-raising;повышение чуткости / осведомлённости;Frühe Sensibilisierung beugt Vorurteilen vor.;Early awareness-raising prevents prejudices.;Раннее просвещение предотвращает предрассудки.;Nomen, f.;c1 society
die Signifikanz;significance;значимость (статистическая);Die statistische Signifikanz der Ergebnisse ist hoch.;The statistical significance of the results is high.;Статистическая значимость результатов высока.;Nomen, f.;c1 science
die Simulation, die Simulationen;simulation;симуляция / моделирование;Eine Computersimulation testet den Ernstfall risikofrei.;A computer simulation tests emergencies risk-free.;Компьютерное моделирование проверяет экстренные ситуации без риска.;Nomen, f.;c1 tech
die Sinnstiftung;meaning-making;создание смысла;Sinnstiftung im Beruf steigert die Zufriedenheit.;Finding meaning in one’s job increases satisfaction.;Осмысленность в профессии повышает удовлетворённость.;Nomen, f.;c1 psychology
die Skrupellosigkeit;unscrupulousness;беспринципность;Mit großer Skrupellosigkeit nutzte er die Lücke aus.;With great unscrupulousness he exploited the loophole.;С большой беспринципностью он использовал эту лазейку.;Nomen, f.;c1 law
die Souveränität;sovereignty / poise;суверенитет / уверенность;Sie beantwortete kritische Fragen mit großer Souveränität.;She answered critical questions with great poise.;Она отвечала на критические вопросы с большой уверенностью.;Nomen, f.;c1 communication
die Spaltung;split / division;раскол;Die gesellschaftliche Spaltung lässt sich durch Dialog überwinden.;Social division can be overcome through dialogue.;Общественный раскол можно преодолеть через диалог.;Nomen, f.;c1 society
die Spekulation, die Spekulationen;speculation;спекуляция / догадка;Über die Gründe gibt es bisher nur Spekulationen.;So far there are only speculations about the reasons.;О причинах пока есть только догадки.;Nomen, f.;c1 media
die Spezifizierung, die Spezifizierungen;specification;спецификация / уточнение;Eine genaue Spezifizierung vermeidet Missverständnisse.;An exact specification avoids misunderstandings.;Точная спецификация предотвращает недоразумения.;Nomen, f.;c1 tech
die Stagnation;stagnation;стагнация / застой;Nach Jahren des Wachstums droht nun Stagnation.;After years of growth stagnation now threatens.;После лет роста теперь грозит стагнация.;Nomen, f.;c1 economy
die Standhaftigkeit;steadfastness / fortitude;стойкость / твёрдость;Ihre Standhaftigkeit in schwierigen Zeiten beeindruckte alle.;Her steadfastness in difficult times impressed everyone.;Её стойкость в трудные времена впечатлила всех.;Nomen, f.;c1 people
die Statussicherung;securing status;сохранение статуса;Statussicherung motiviert viele berufliche Entscheidungen.;Securing status motivates many career decisions.;Сохранение статуса мотивирует многие карьерные решения.;Nomen, f.;c1 society
die Stigmatisierung;stigmatization;стигматизация;Offene Aufklärung baut gesellschaftliche Stigmatisierung ab.;Open education dismantles social stigmatization.;Открытое просвещение снимает общественную стигматизацию.;Nomen, f.;c1 society
die Stimmigkeit;coherence / consistency;согласованность / стройность;Die innere Stimmigkeit des Entwurfs überzeugt.;The internal coherence of the draft is convincing.;Внутренняя стройность проекта убеждает.;Nomen, f.;c1 academic
die Strategieänderung, die Strategieänderungen;change of strategy;смена стратегии;Die plötzliche Strategieänderung überraschte die Anleger.;The sudden change of strategy surprised investors.;Внезапная смена стратегии удивила инвесторов.;Nomen, f.;c1 business
die Stringenz;stringency / rigor;строгость / логичность;Dem Aufsatz fehlt es stellenweise an logischer Stringenz.;The essay lacks logical rigor in places.;Эссе местами не хватает логической строгости.;Nomen, f.;c1 academic
die Subjektivität;subjectivity;субъективность;Jede Bewertung enthält ein Maß an Subjektivität.;Every evaluation contains a degree of subjectivity.;Любая оценка содержит долю субъективности.;Nomen, f.;c1 academic
die Subsidiarität;subsidiarity;субсидиарность;Das Prinzip der Subsidiarität stärkt Kommunen.;The principle of subsidiarity strengthens municipalities.;Принцип субсидиарности укрепляет муниципалитеты.;Nomen, f.;c1 politics
die Subsumtion;subsumption;подведение под понятие / норму;Juristen üben täglich die präzise Subsumtion.;Lawyers practice precise subsumption daily.;Юристы ежедневно практикуют точное подведение фактов под норму.;Nomen, f.;c1 law
die Subtilität;subtlety;тонкость / изощрённость;Die Subtilität dieses Humors erschließt sich erst beim zweiten Lesen.;The subtlety of this humor only reveals itself on a second reading.;Тонкость этого юмора раскрывается лишь при втором прочтении.;Nomen, f.;c1 culture
die Sukzession;succession;преемственность / последовательность;Die geordnete Sukzession sicherte den Fortbestand.;The orderly succession secured continued existence.;Упорядоченная преемственность обеспечила продолжение работы.;Nomen, f.;c1 business
die Symbiose, die Symbiosen;symbiosis;симбиоз;Wirtschaft und Forschung bilden hier eine fruchtbare Symbiose.;Business and research form a fruitful symbiosis here.;Бизнес и наука образуют здесь плодотворный симбиоз.;Nomen, f.;c1 science
die Synthese, die Synthesen;synthesis;синтез;Eine gelungene Synthese verbindet beide Ansätze.;A successful synthesis combines both approaches.;Удачный синтез объединяет оба подхода.;Nomen, f.;c1 academic
die Systematik;systematics / systematic approach;систематика / системность;Klare Systematik erleichtert das Nachschlagen.;Clear systematics makes looking things up easier.;Чёткая систематика облегчает поиск.;Nomen, f.;c1 academic
die Tabuisierung;tabooing;табуирование;Die Tabuisierung von Fehlern hemmt die Lernkultur.;Making mistakes taboo inhibits learning culture.;Табуирование ошибок тормозит культуру обучения.;Nomen, f.;c1 work
die Tangente, die Tangenten;tangent;касательная;Der Vortrag berührte das Thema nur am Rande wie eine Tangente.;The talk touched on the topic only peripherally like a tangent.;Доклад затронул тему лишь по касательной.;Nomen, f.;c1 academic
die Tragfähigkeit;load-bearing capacity / viability;несущая способность / жизнеспособность;Experten prüfen die finanzielle Tragfähigkeit des Plans.;Experts examine the financial viability of the plan.;Эксперты проверяют финансовую жизнеспособность плана.;Nomen, f.;c1 finance
die Transformation, die Transformationen;transformation;трансформация;Die ökologische Transformation braucht verlässliche Regeln.;The ecological transformation needs reliable rules.;Экологическая трансформация нуждается в надёжных правилах.;Nomen, f.;c1 environment
die Trivialität, die Trivialitäten;triviality;тривиальность / банальность;Hinter scheinbarer Trivialität steckt oft Tiefgang.;Behind apparent triviality depth often hides.;За кажущейся тривиальностью часто скрывается глубина.;Nomen, f.;c1 philosophy
die Trugschluss, die Trugschlüsse;fallacy;ложное умозаключение;Diese Annahme beruht auf einem klassischen Trugschluss.;This assumption rests on a classic fallacy.;Это предположение основано на классическом заблуждении.;Nomen, m.;c1 academic
die Tugend, die Tugenden;virtue;добродетель;Geduld gilt in der Diplomatie als hohe Tugend.;Patience is considered a high virtue in diplomacy.;Терпение считается в дипломатии высокой добродетелью.;Nomen, f.;c1 philosophy
die Überalterung;aging (of population);старение населения;Die Überalterung stellt die Pflege vor große Aufgaben.;Population aging poses major tasks for care.;Старение населения ставит перед системой ухода большие задачи.;Nomen, f.;c1 society
die Überbrückung;bridging;преодоление разрыва / временная мера;Ein Kredit dient zur kurzfristigen Überbrückung.;A loan serves for short-term bridging.;Кредит служит для краткосрочного преодоления кассового разрыва.;Nomen, f.;c1 finance
die Übereinkunft, die Übereinkünfte;agreement / convention;соглашение / договорённость;Nach langen Gesprächen traf man eine Übereinkunft.;After long talks an agreement was reached.;После долгих переговоров было достигнуто соглашение.;Nomen, f.;c1 politics
die Überfrachtung;overloading;перегрузка (смыслом/деталями);Eine Überfrachtung der Folien mit Text ermüdet Zuhörer.;Overloading slides with text tires listeners.;Перегрузка слайдов текстом утомляет слушателей.;Nomen, f.;c1 communication
die Überlegenheit;superiority;превосходство;Technologische Überlegenheit erfordert ständige Forschung.;Technological superiority requires constant research.;Технологическое превосходство требует постоянных исследований.;Nomen, f.;c1 tech
die Übermittlung;transmission / delivery;передача / доставка;Die verschlüsselte Übermittlung schützt sensible Daten.;Encrypted transmission protects sensitive data.;Шифрованная передача защищает чувствительные данные.;Nomen, f.;c1 tech
die Überprüfungspflicht;duty to verify;обязанность проверки;Für Plattformen gilt eine klare Überprüfungspflicht.;For platforms a clear duty to verify applies.;Для платформ действует чёткая обязанность проверки.;Nomen, f.;c1 law
die Überschneidung, die Überschneidungen;overlap;пересечение / накладка;Bei den Zuständigkeiten gab es unnötige Überschneidungen.;In responsibilities there were unnecessary overlaps.;В зонах ответственности возникали лишние накладки.;Nomen, f.;c1 work
die Übersteigerung;exaggeration / excess;преувеличение / гипертрофия;Jede Übersteigerung schadet der Glaubwürdigkeit.;Every exaggeration harms credibility.;Любое преувеличение вредит доверию.;Nomen, f.;c1 communication
die Übertragung, die Übertragungen;transfer / transmission;перенос / передача;Die Übertragung dieses Modells auf andere Länder ist schwer.;Transferring this model to other countries is difficult.;Перенос этой модели на другие страны сложен.;Nomen, f.;c1 science
die Überwindung;overcoming;преодоление;Die Überwindung alter Denkmuster braucht Mut.;Overcoming old mindsets takes courage.;Преодоление старых шаблонов мышления требует смелости.;Nomen, f.;c1 psychology
die Umverteilung;redistribution;перераспределение;Steuern dienen auch der sozialen Umverteilung.;Taxes also serve social redistribution.;Налоги служат также социальному перераспределению.;Nomen, f.;c1 economy
die Umwälzung, die Umwälzungen;upheaval / revolution;переворот / коренное изменение;Die Digitalisierung brachte eine tiefgreifende Umwälzung.;Digitalization brought a profound upheaval.;Цифровизация принесла глубокий переворот.;Nomen, f.;c1 society
die Unabdingbarkeit;indispensability;неотъемлемость / необходимость;Die Unabdingbarkeit freier Forschung ist unstrittig.;The indispensability of free research is undisputed.;Необходимость свободной науки неоспорима.;Nomen, f.;c1 academic
die Unbefangenheit;impartiality / naturalness;беспристрастность / непринуждённость;Ein Richter muss völlige Unbefangenheit wahren.;A judge must maintain complete impartiality.;Судья должен сохранять полную беспристрастность.;Nomen, f.;c1 law
die Unberechenbarkeit;unpredictability;непредсказуемость;Die Unberechenbarkeit des Wetters erschwert Ernten.;The unpredictability of the weather complicates harvests.;Непредсказуемость погоды осложняет сбор урожая.;Nomen, f.;c1 nature
die Unbeständigkeit;inconstancy / instability;непостоянство / неустойчивость;Politische Unbeständigkeit schreckt Investoren ab.;Political instability deters investors.;Политическая нестабильность отпугивает инвесторов.;Nomen, f.;c1 economy
die Undurchsichtigkeit;opacity / lack of transparency;непрозрачность;Die Undurchsichtigkeit der Gebühren sorgte für Ärger.;The lack of transparency of fees caused annoyance.;Непрозрачность сборов вызвала недовольство.;Nomen, f.;c1 finance
die Unentschlossenheit;indecisiveness;нерешительность;In Krisen wirkt Unentschlossenheit besonders fatal.;In crises indecisiveness appears especially fatal.;В кризисах нерешительность особенно пагубна.;Nomen, f.;c1 politics
die Unvereinbarkeit;incompatibility;несовместимость;Die Unvereinbarkeit beider Ämter ist gesetzlich geregelt.;The incompatibility of both offices is regulated by law.;Несовместимость обеих должностей регулируется законом.;Nomen, f.;c1 law
die Unverhältnismäßigkeit;disproportionality;несоразмерность;Die Unverhältnismäßigkeit der Mittel wurde gerügt.;The disproportionality of the means was censured.;Несоразмерность мер была подвергнута порицанию.;Nomen, f.;c1 law
die Unverzichtbarkeit;indispensability;незаменимость;Die Unverzichtbarkeit von Pflegekräften ist offensichtlich.;The indispensability of nursing staff is obvious.;Незаменимость медперсонала очевидна.;Nomen, f.;c1 society
die Unvoreingenommenheit;open-mindedness / impartiality;непредвзятость;Wissenschaftliches Arbeiten verlangt Unvoreingenommenheit.;Scientific work requires open-mindedness.;Научная работа требует непредвзятости.;Nomen, f.;c1 academic
die Unzulänglichkeit, die Unzulänglichkeiten;inadequacy / shortcoming;недостаточность / несовершенство;Menschliche Unzulänglichkeiten gehören zum Alltag.;Human shortcomings are part of everyday life.;Человеческие несовершенства — часть повседневности.;Nomen, f.;c1 psychology
die Urheberschaft;authorship;авторство;Die Urheberschaft des Textes ist eindeutig geklärt.;The authorship of the text is clearly established.;Авторство текста однозначно установлено.;Nomen, f.;c1 law
die Utopie, die Utopien;utopia;утопия;Was einst Utopie schien, ist heute oft Realität.;What once seemed utopia is often reality today.;То, что когда-то казалось утопией, сегодня часто реальность.;Nomen, f.;c1 philosophy
die Validierung;validation;валидация / подтверждение;Vor dem Einsatz folgt eine strenge Validierung.;Before deployment a strict validation follows.;Перед применением следует строгая валидация.;Nomen, f.;c1 science
die Variabilität;variability;изменчивость / вариативность;Hohe Variabilität erschwert langfristige Prognosen.;High variability complicates long-term forecasts.;Высокая изменчивость затрудняет долгосрочные прогнозы.;Nomen, f.;c1 science
die Verallgemeinerung, die Verallgemeinerungen;generalization;обобщение;Vorschnelle Verallgemeinerungen führen oft in die Irre.;Hasty generalizations often lead astray.;Поспешные обобщения часто вводят в заблуждение.;Nomen, f.;c1 academic
die Verankerung;anchoring / entrenchment;закрепление;Die gesetzliche Verankerung schafft Verlässlichkeit.;Legal entrenchment creates reliability.;Законодательное закрепление создаёт надёжность.;Nomen, f.;c1 law
die Veranschaulichung;illustration / visualization;наглядное представление;Grafiken dienen zur besseren Veranschaulichung.;Charts serve for better illustration.;Графики служат для лучшей наглядности.;Nomen, f.;c1 academic
die Veräußerung;sale / disposal (assets);отчуждение / продажа;Die Veräußerung von Firmeneigentum bedarf der Zustimmung.;Selling company property requires approval.;Продажа имущества компании требует согласия.;Nomen, f.;c1 law
die Verblendung;delusion / blindness;ослепление / заблуждение;Ideologische Verblendung verhindert jede Selbstkritik.;Ideological blindness prevents any self-criticism.;Идеологическое ослепление мешает любой самокритике.;Nomen, f.;c1 politics
die Verbreitungskette, die Verbreitungsketten;distribution chain;цепочка распространения;Digitale Plattformen verkürzen jede Verbreitungskette.;Digital platforms shorten every distribution chain.;Цифровые платформы сокращают любую цепочку распространения.;Nomen, f.;c1 media
die Verdinglichung;reification / objectification;овеществление;Philosophen kritisieren die Verdinglichung sozialer Beziehungen.;Philosophers criticize the reification of social relations.;Философы критикуют овеществление социальных отношений.;Nomen, f.;c1 philosophy
die Verdrängung;repression / displacement;вытеснение;Psychologische Verdrängung löst Konflikte nicht dauerhaft.;Psychological repression does not resolve conflicts permanently.;Психологическое вытеснение не решает конфликты надолго.;Nomen, f.;c1 psychology
die Verfehlung, die Verfehlungen;misconduct / failing;проступок / нарушение;Schwere Verfehlungen führen zum Ausschluss.;Serious misconduct leads to expulsion.;Серьёзные проступки ведут к исключению.;Nomen, f.;c1 law
die Verflechtung, die Verflechtungen;interweaving / interdependence;переплетение / взаимосвязь;Wirtschaftliche Verflechtungen sichern oft den Frieden.;Economic interdependencies often secure peace.;Экономические взаимосвязи часто обеспечивают мир.;Nomen, f.;c1 economy
die Verfremdung;alienation / estrangement;остранение / отчуждение;Brecht nutzte Verfremdung als Mittel im Theater.;Brecht used estrangement as a device in theater.;Брехт использовал остранение как приём в театре.;Nomen, f.;c1 culture
die Verfügbarkeit;availability;доступность / наличие;Die ständige Verfügbarkeit von Daten verändert Abläufe.;Constant availability of data changes workflows.;Постоянная доступность данных меняет процессы.;Nomen, f.;c1 tech
die Vergeblichkeit;futility;тщетность / напрасность;Trotz drohender Vergeblichkeit gaben sie nicht auf.;Despite looming futility they did not give up.;Несмотря на кажущуюся тщетность, они не сдались.;Nomen, f.;c1 formal
die Vergegenwärtigung;visualization / bringing to mind;осмысление / представление;Geschichtsorte dienen der lebendigen Vergegenwärtigung.;Historical sites serve vivid recollection.;Исторические места служат живому осмыслению прошлого.;Nomen, f.;c1 history
die Vergütung, die Vergütungen;remuneration / compensation;вознаграждение / оплата;Eine faire Vergütung steigert die Mitarbeiterbindung.;Fair remuneration increases employee retention.;Справедливое вознаграждение повышает лояльность сотрудников.;Nomen, f.;c1 work
die Verhältnismäßigkeit;proportionality;соразмерность;Jede staatliche Maßnahme unterliegt der Verhältnismäßigkeit.;Every state measure is subject to proportionality.;Любая государственная мера подчиняется принципу соразмерности.;Nomen, f.;c1 law
die Verharmlosung;trivialization / downplaying;преуменьшение (опасности);Die Verharmlosung von Risiken rächt sich oft.;Downplaying risks often takes its revenge.;Преуменьшение рисков часто оборачивается проблемами.;Nomen, f.;c1 society
die Verhärtung;hardening;ожесточение / затвердевание;Eine Verhärtung der Fronten erschwert Kompromisse.;A hardening of fronts complicates compromises.;Ожесточение позиций затрудняет компромиссы.;Nomen, f.;c1 politics
die Verifizierung;verification;верификация / проверка;Die Verifizierung der Quellen ist journalistische Pflicht.;Verifying sources is a journalistic duty.;Верификация источников — долг журналиста.;Nomen, f.;c1 media
die Verknappung;shortage / scarcity;дефицит / сокращение;Eine künstliche Verknappung treibt die Preise hoch.;Artificial scarcity drives prices up.;Искусственный дефицит толкает цены вверх.;Nomen, f.;c1 economy
die Verknüpfung, die Verknüpfungen;link / linkage;связь / увязка;Die Verknüpfung von Theorie und Empirie ist gelungen.;Linking theory and empiricism succeeded.;Увязка теории и эмпирики удалась.;Nomen, f.;c1 academic
die Verlagerung;shift / relocation;смещение / перенос;Eine Verlagerung der Produktion ins Inland wird geprüft.;Relocating production domestically is being examined.;Рассматривается перенос производства внутрь страны.;Nomen, f.;c1 economy
die Verleumdung, die Verleumdungen;slander / defamation;клевета;Verleumdung ist strafbar und schadet dem Ruf.;Defamation is punishable and harms reputation.;Клевета наказуема и вредит репутации.;Nomen, f.;c1 law
die Vermessung;surveying / measurement;измерение / съёмка;Die genaue Vermessung des Geländes begann heute.;Accurate surveying of the terrain began today.;Точная геодезическая съёмка местности началась сегодня.;Nomen, f.;c1 tech
die Vermittlungsrolle;mediating role;посредническая роль;Sie übernahm in dem Konflikt eine wichtige Vermittlungsrolle.;She assumed an important mediating role in the conflict.;Она взяла на себя важную посредническую роль в конфликте.;Nomen, f.;c1 politics
die Vernachlässigbarkeit;negligibility;незначительность;Die Vernachlässigbarkeit des Fehlers wurde bewiesen.;The negligibility of the error was proven.;Незначительность ошибки была доказана.;Nomen, f.;c1 science
die Verortung;localization / positioning;локализация / определение места;Die politische Verortung der Partei ist nicht eindeutig.;The political positioning of the party is not clear-cut.;Политическое позиционирование партии неоднозначно.;Nomen, f.;c1 politics
die Verpflichtungserklärung, die Verpflichtungserklärungen;declaration of commitment;обязательство;Alle Partner unterschrieben eine Verpflichtungserklärung.;All partners signed a declaration of commitment.;Все партнёры подписали обязательство.;Nomen, f.;c1 law
die Versachlichung;objectification / making objective;перевод в деловое русло;Eine Versachlichung der Debatte tut dringend not.;Making the debate objective is urgently needed.;Перевод дискуссии в конструктивное русло срочно необходим.;Nomen, f.;c1 communication
die Verschleierung;concealment / obfuscation;сокрытие / маскировка;Eine Verschleierung von Kosten verstößt gegen das Gesetz.;Concealing costs violates the law.;Сокрытие расходов нарушает закон.;Nomen, f.;c1 law
die Verschleppung;procrastination / delay;затягивание;Die Verschleppung von Reformen erhöht den Druck.;Delaying reforms increases pressure.;Затягивание реформ усиливает давление.;Nomen, f.;c1 politics
die Verschärfung;tightening / intensification;ужесточение / обострение;Eine Verschärfung der Krise konnte verhindert werden.;An intensification of the crisis could be prevented.;Обострение кризиса удалось предотвратить.;Nomen, f.;c1 politics
die Versorgungsengpass, die Versorgungsengpässe;supply bottleneck;перебой со снабжением;Bei Medikamenten gab es zuletzt Versorgungsengpässe.;Recently there were supply bottlenecks for medicines.;С лекарствами в последнее время возникали перебои поставок.;Nomen, m.;c1 health
die Versöhnung;reconciliation;примирение;Echte Versöhnung setzt ehrliche Aufarbeitung voraus.;True reconciliation presupposes honest coming to terms.;Истинное примирение предполагает честное осмысление.;Nomen, f.;c1 history
die Verstaatlichung;nationalization;национализация;Die Verstaatlichung kritischer Infrastruktur wird diskutiert.;Nationalizing critical infrastructure is being discussed.;Обсуждается национализация критической инфраструктуры.;Nomen, f.;c1 politics', now())
on conflict (level) do update set
  title = excluded.title,
  word_count = excluded.word_count,
  csv_content = excluded.csv_content,
  updated_at = now();
