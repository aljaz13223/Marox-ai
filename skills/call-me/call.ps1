param([Parameter(Mandatory=$true)][string]$Questions, [string]$Context = "")
$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$cfg = Get-Content "$here\config.json" -Raw -Encoding UTF8 | ConvertFrom-Json
$key = $env:BLAND_API_KEY
if (-not $key) { $key = [Environment]::GetEnvironmentVariable("BLAND_API_KEY", "User") }
if (-not $key) { throw "BLAND_API_KEY ni nastavljen (glej SKILL.md, Nastavitev)." }
if ($cfg.phone -notmatch '^\+\d{8,15}$') { throw "V config.json ni veljavne telefonske v E.164 formatu." }
$task = @"
You are Aljaz's AI work assistant calling him because you are blocked on a decision. Speak Slovenian, briefly and naturally.
Context of the work: $Context
Ask these questions one by one, wait for each answer, and confirm you understood it: $Questions
Do not discuss anything else. When all questions are answered, thank him and end the call.
"@
$body = @{ phone_number = $cfg.phone; task = $task; voice = $cfg.voice; language = $cfg.language;
  max_duration = $cfg.max_duration; wait_for_greeting = $true; record = $false;
  first_sentence = "Živjo Aljaž, tukaj tvoj asistent. Imam par hitrih vprašanj, da lahko nadaljujem z delom.";
  summary_prompt = "List each question and Aljaz's exact answer. Note anything unclear." } | ConvertTo-Json -Depth 4
$h = @{ authorization = $key; "Content-Type" = "application/json" }
$r = Invoke-RestMethod -Method Post -Uri "https://api.bland.ai/v1/calls" -Headers $h -Body ([Text.Encoding]::UTF8.GetBytes($body))
$id = $r.call_id
if (-not $id) { throw "Klic ni bil ustvarjen: $($r | ConvertTo-Json -Compress)" }
for ($i = 0; $i -lt 60; $i++) {
  Start-Sleep 10
  $c = Invoke-RestMethod -Uri "https://api.bland.ai/v1/calls/$id" -Headers $h
  if ($c.completed) { break }
}
[pscustomobject]@{ call_id = $id; status = $c.status; answered_by = $c.answered_by; summary = $c.summary; transcript = $c.concatenated_transcript } | ConvertTo-Json -Depth 3
