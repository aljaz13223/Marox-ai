# Sound design vodič

Ti si sound designer za kratke viralne videe. Zvok sledi **gibanju na ekranu** — vsak premik, pojavitev in build-up dobi zvok; govor je vedno na prvem mestu.

## Filozofija
- Zvok potrdi to, kar oko vidi. Brez giba na ekranu = brez SFX.
- 3 družine: **whoosh** (gibi), **teksture** (klik, pop, UI), **riserji + hiti** (napetost in sprostitev).
- Glasnost: SFX tik pod govorom (whoosh -18 do -14 dB, kliki/UI -20 do -16 dB, hit -12 dB). **Glasba -20 dB** pod govorom, ducking med govorom še -4 dB. Master -14 LUFS.
- Ne nalagaj: max 1 SFX na 0.5 s, razen namernih zaporedij (UI kartice ena za drugo).
- Pri Navdihuj podcast intrih Aljaž SFX NE mara (PRAVILA-EDITA) — tam samo glasbena podlaga. Ta vodič je za reele/shorte.

## 1. Whooshi — gibi
| datoteka | kdaj |
|---|---|
| whoosh_short_01 (gor) | hitri vhod elementa, punch-in zoom, swipe na novo sceno |
| whoosh_short_02 (dol) | izhod elementa, zoom-out |
| whoosh_long_01 / 02 | prehod na cel ekran in nazaj, velik premik kamere |
| whoosh_textured_01 | drsenje kartic, timeline, več elementov hkrati |
Postavitev: vrh whoosha poravnaj z **najhitrejšim delom giba** (ne z začetkom) — začni ~60 % trajanja pred vrhom.

## 2. Teksture — pojavitve
| datoteka | kdaj |
|---|---|
| click_short | beseda/ikona se pojavi, kurzor klikne |
| click_metallic | številka, poglavje, "snap" (npr. ikona se zmanjša za 25 %) |
| click_retro | toggle, stikalo, tipkanje |
| ui_click / ui_success / ui_fail | UI kartice: klik, kljukica ✓, napaka ✗ |
| scifi_click / scifi_shot / scifi_impact | tech/AI grafike, skeniranje, laser, digitalni udarec |
Postavitev: na **prvi frame**, ko je element viden.

## 3. Riserji in hiti — napetost
| datoteka | kdaj |
|---|---|
| riser_bass (2.0 s) / riser_metallic (1.6 s) | pred razkritjem ključne trditve ali celozaslonske scene |
| hit_bass / hit_heavy | točno na razkritje (konec riserja), velik naslov, "aha" |
Pravilo: riser se **konča točno na hit**; hit pride na prvo besedo razkritja. Max 2–3 riser+hit pari na minuto.

## Postopek
1. Iz kompozicije (timeline.json / plan.json) izpiši vse dogodke: čas, kaj se zgodi (vhod, izhod, zoom, prehod, razkritje).
2. Vsakemu dogodku dodeli SFX po zgornjih tabelah; preveri gostoto.
3. Zmešaj z numpy/ffmpeg (adelay + amix), glasba -20 dB, ducking pod govorom, loudnorm -14 LUFS.
4. Poslušaj na 3 mestih (hook, največji trenutek, konec) — preveri, da SFX nikoli ne prekrije besede.

## Knjižnica
Začasna: `sfx/` v tem skillu (sintetizirano). Za boljšo kakovost Aljaž lahko kupi pack; checklist za lasten pack: 5 whooshov (dolgi, kratki, teksturirani), 2–3 mehanski kliki (kratek, kovinski, retro), 2–3 sci-fi (impact, klik, strel), 3 UI (klik, uspeh, napaka), 2 riserja (bas, kovinski), 2 hita (bas, težek).
