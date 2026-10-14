---
name: viral-reel-editor
description: Viralni talking-head reel/short (9:16) v stilu 2026 — rez po transkriptu, planer scen (napisi / napisi+UI / pol ekrana / cel ekran), motion grafike po vizualnem vodiču, sound design iz SFX knjižnice. Uporabi, ko Aljaž reče "naredi viralen reel", "edit kot ultimate editors", "naredi planer", "sound design", ali da raw talking-head za Instagram/TikTok/Shorts.
---

# viral-reel-editor

Vir: tutorial "How to Edit VIRAL Instagram Reels Using Opus 5.5" (povzetek v `00-SISTEM/znanje-iz-transkripcij.md`, §12).
Bistvo: AI ni problem, problem je trening. Dva treninga = **vizualni vodič** (`references/visual-guide.md`) + **sound design vodič** (`references/sound-design.md`). Aljaž planira scene, Claude gradi.

Pred začetkom vedno preberi tudi: `F:\claude system\CLAUDE.md`, `<brand>/BRAND.md`, `<brand>/PRAVILA-EDITA.md` (naučena pravila imajo prednost pred tem skillom).

## Koraki

1. **Rez** — word-level transkript (`00-SISTEM/scripts/transcribe.py --lang sl`), odstrani vse tišine in slabe take (ponovljene stavke — obdrži zadnji dober take), padding ~20 ms okoli besed. Vrni očiščen video + nov words.json (časi po rezu). Pokaži "X s raw → Y s".
2. **Planer** — `python scripts/plan_page.py words.json planer.html --title "<ime>"` in ga pošlji Aljažu (odpre v brskalniku). Zgoraj izbere akcent barvo, 2 fonta in barve; za vsako vrstico izbere tip scene, napiše kaj se pokaže in akcent besedo. Shrani `plan.json`.
   - Če Aljaž reče "planiraj sam": izpolni plan po pravilih iz `visual-guide.md` (§ Psihologija) in mu pokaži tabelo v chatu za potrditev, preden gradiš.
3. **Assets** — preden gradiš, **povej katere assete rabiš** (screenshot, logo, fotka predmeta). Kar lahko dobiš sam (javni logotipi, UI posnetki), poišči z brskalnikom.
4. **Gradnja** — HyperFrames (naš animator; `/hyperframes` → embedded-captions / motion-graphics). Remotion je alternativa (skill `remotion-video-creation`). Vsaka scena po tipu iz plan.json in po `visual-guide.md`.
5. **Pregled** — contact sheet + frame-i na vsaki sceni; preveri safe zone 9:16, berljivost, da nič ni čez obraz. Pošlji preview.
6. **Sound design** — po `references/sound-design.md`: popiši vse kar se zgodi na ekranu (gibi, pojavitve, build-upi) → postavi SFX iz `sfx/` (ali brand `assets/sfx/`) → glasba na **-20 dB** pod govorom → master -14 LUFS.
7. **Feedback** → pravila v `<brand>/PRAVILA-EDITA.md` (konkretno, merljivo).

## Časovni okvir (iz tutoriala)
Rez je najpočasnejši del — pri dolgih posnetkih predlagaj ročni rez ali Gling. Planiranje ~15 min Aljaževega časa; animacija in zvok tečeta sama.

## Datoteke
- `scripts/plan_page.py` — words.json → planer.html (izvozi plan.json)
- `scripts/mksfx.py` — ponovno ustvari začetno SFX knjižnico v `sfx/`
- `sfx/` — 18 sintetiziranih efektov (whoosh ×5, click ×3, sci-fi ×3, UI ×3, riser ×2, hit ×2). Začasna knjižnica — ko Aljaž doda plačljiv pack, ga daj v `00-SISTEM/assets/sfx-library/` in posodobi tabelo v `sound-design.md`.
- `references/visual-guide.md`, `references/sound-design.md`

## plan.json
```json
{"style":{"accent":"#3a6ea5","font_main":"Montserrat","font_special":"Instrument Serif Italic","color_text":"#ffffff","color_accent":"#3a6ea5"},
 "lines":[{"i":0,"start":0.0,"end":2.4,"text":"...","type":"captions|captions_ui|half|full","note":"kaj na ekran","accent":"tri napake"}]}
```
