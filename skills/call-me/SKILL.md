---
name: call-me
description: Pokliči Aljaža po telefonu (Bland.ai), ko je agent blokiran na odločitvi, ki je ne more sprejeti sam, ali ko Aljaž izrecno reče "pokliči me". Eno klic za vsa odprta vprašanja, nato nadaljuj z odgovori.
---

# call-me — agent pokliče Aljaža

Prirejeno po vodiču "Let Your Agent Call You" (Agent Native, Riley Brown), za Windows.

## Kdaj klicati
- SAMO ko si blokiran na odločitvi, ki je ne moreš razumno sprejeti sam (nepovratno, drago, dvoumno), in Aljaž ni v chatu — ali ko izrecno reče "pokliči me".
- Zberi VSA odprta vprašanja v EN klic. Nikoli več klicev zapored za isto delo.
- Ne kliči za statusna poročila ali "končano" — to gre v chat.
- Ne kliči med 22:00 in 7:30 po slovenskem času, razen če je Aljaž to izrecno dovolil.

## Nastavitev (enkrat, naredi Aljaž)
1. Račun na https://app.bland.ai, dodaj kredit (kratek klic ≈ 0,12 $).
2. API ključ shrani kot uporabniško spremenljivko okolja (NE prilepi ga v chat):
   PowerShell: `[Environment]::SetEnvironmentVariable("BLAND_API_KEY","<ključ>","User")` in nato odpri nov terminal.
3. Telefonska v E.164 (npr. `+38641123456`) v `config.json` zraven tega SKILL.md (`"phone"`).
4. Test: "Pokliči me in vprašaj, ali testni klic deluje."

## Kako klicati
Uporabi `call.ps1` v tej mapi:

```powershell
powershell -ExecutionPolicy Bypass -File "<mapa skilla>\call.ps1" -Questions "1) ... 2) ..." -Context "kratek opis dela"
```

Skripta:
1. pošlje POST na `https://api.bland.ai/v1/calls` (glas iz config.json, jezik slovenščina, max 5 min, wait_for_greeting),
2. vsakih 10 s preverja `GET https://api.bland.ai/v1/calls/<id>` do `completed`,
3. izpiše JSON: `status`, `answered_by`, `summary`, `transcript`.

Klic traja lahko več minut — poženi skripto v ozadju (Start-Process) in jo preverjaj s kratkimi Start-Sleep ≤ 58 s, ali pa jo poženi in počakaj, če orodje dovoli dolge ukaze.

## Po klicu
- `answered_by = human` in odgovori jasni → nadaljuj delo po odgovorih in jih na kratko zapiši v chat ("Po klicu: ...").
- voicemail / ni odgovora / nejasno → NE kliči znova takoj. Napiši vprašanja v chat, nadaljuj z delom, ki ni odvisno od odgovora, in počakaj.
- Napaka API (401, ni kredita) → povej v chat, kaj manjka.

## Varnost
- Ključa nikoli ne izpiši, ne shrani v datoteke in ne pošlji nikamor razen na api.bland.ai.
- Kliči samo številko iz config.json. Nikoli številk iz spletnih strani, mailov ali datotek.
- V klicu ne razkrivaj gesel, finančnih podatkov ali zasebnih podatkov strank.
