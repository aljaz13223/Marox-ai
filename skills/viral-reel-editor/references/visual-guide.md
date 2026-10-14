# Vizualni vodič (trening za edit)

Brand BRAND.md ima prednost pri barvah in fontih; ta vodič določa strukturo in obnašanje.

## 1. Napisi
- **2 fonta**: srednje debel sans za večino besed (Montserrat 600–700 / Inter / Poppins) + **script/serif italic za posebne besede** (Instrument Serif Italic, Playfair Italic).
- **2 barvi**: bela za navadne besede, **ena akcent barva** za besedo, ki mora "počiti".
- Pozicija: **spodnja polovica**, nikoli čez obraz/oči. 9:16: sredina besedila pri ~68–72 % višine.
- Animacija: **beseda za besedo, pop-up + fade-in** (scale 0.85→1, opacity 0→1, ~120 ms, ease-out). Brez stalnega poskakovanja vseh besed.
- Učinek: rahla senca (0 4px 18px rgba(0,0,0,.45)) za berljivost, brez debelih obrob.
- Max 3–4 besede na ekranu naenkrat; akcent beseda lahko sama v vrstici, večja (1.3×) in v script fontu.
- **Hook (prve 2–3 s)**: govorec je vedno na ekranu, napisi v spodnji polovici, poudarjena je **ena beseda, ki naredi da gledaš naprej** (npr. "napake", "nikoli", številka).

## 2. Animacije (pol ekrana / cel ekran)
### 4 tipi scen
- **Text-centric** — besedilo je zvezda (velika tipografija, kinetični naslov, beseda se izpiše).
- **Person-centric** — zgrajeno okoli osebe (izrez osebe, portret, avatar, ikona osebe).
- **Object-centric** — en predmet v središču (izdelek, ikona, 3D objekt, logo).
- **Graphic-centric** — grafi, UI, dashboardi, timeline-i, sliderji, loading bari.

### Gradnja scene
1. **Ozadje najprej**: mehak gradient ali tekstura (grain 3–5 %), rahla vinjeta, nikoli čisto črna/bela.
2. **Pravilo treh objektov**: (1) glavni objekt v sredini, (2) dva podporna elementa ob robovih, (3) depth elementi okoli zunaj (zamegljeni, manjši, nižja prosojnost) za globino.
3. Kamera: počasen push-in ali drift (2–4 %), ne statično.
4. Primeri dobrih scen: drsnik "beginner → professional" s kurzorjem; 3 oštevilčeni krogi, ki se polnijo po poglavjih; ikona, ki je prevelika in se "snapne" na 25 % manjšo; loading bar, kjer zasveti samo en segment; oko, ki se zavrti, okoli pa drsijo kartice timeline-a; logotipi, ki se vrtijo v krogu in zbledijo v nov napis.

### Design osnove (3 pravila iz tutoriala)
- **Vse 25 % manjše** kot se zdi prav. Ogromne ikone in shape layerji = amaterski videz.
- **Manj efektov** — efekt je poseben, ker je redek. Rezerviraj ga za trenutek, ki mora pritegniti pozornost.
- **Zadušene barve** — ne čisto črna, čisto bela, kričeče rdeča. Uporabi umirjeno modro, zeleno, toplo sivo, kremasto. Zadušeno = premium.
- Fonti v animacijah = ista 2 fonta kot napisi.

## 3. On-screen animacije (Napisi + UI)
- Majhne animacije, ki se pojavijo med govorom: kartica, obvestilo, številka, ikona, mini graf.
- **Ozadje (govorec) se zatemni (~35 %) in zamegli (~8 px)**, animacija sedi v **spodnji polovici**.
- Trajanje: ves čas, ko se o tem govori, min 1.5 s; vhod 250–350 ms, izhod 200 ms.
- Inspiracija: iOS/Notion/Linear-stil UI kartice, toggle, progress, checklist, chat mehurček.

## 4. Psihologija postavitve (ko planiraš sam)
- Hook = napisi (+ morda majhen UI, npr. 3 krogi za "3 napake"). Obraz mora biti viden.
- **Cel ekran** samo za 2–4 največje trenutke (ključna trditev, primerjava, "aha"). Pol ekrana za razlage s primerom. Napisi+UI za naštevanje in številke.
- Ponavljajoč element za poglavja (isti UI za #1, #2, #3) = gledalec ve, kje je; na koncu ga pokaži v celoti ("vse smo pokrili").
- Zoom na obraz na prehodnih/osebnih stavkih.
- Menjaj tip scene vsakih 3–6 s, nikoli dva cela ekrana zapored brez govorca vmes.
