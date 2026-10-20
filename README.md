# marox-ai

**Claude skills for running a small AI agency** — client onboarding, outreach, a morning brief, lean code review and
viral short-form video editing. Built and used daily by [Marox AI](https://github.com/aljaz13223).

Video editing for podcasts lives in its own repo: **[claude-video-editor](https://github.com/aljaz13223/claude-video-editor)**
(cuts, face tracking, captions, motion graphics, pickable edit styles). The skills here work together with it.

## Skills by Marox AI (`skills/`)

| Skill | What it does |
|---|---|
| `marox-jutranji-pregled` | Morning review for the agency: who needs you today (clients, prospects, leads, payments), ranked, with draft replies. *(Slovenian)* |
| `marox-onboarding` | New client from payment to ads live: questionnaire, client profile, price anchor, GHL + funnel setup, pre-launch checklist, first-7-days messages. *(Slovenian)* |
| `marox-outreach` | Finds and researches local businesses, writes personalised messages and follow-ups, with a built-in contact guard. Drafts only. *(Slovenian)* |
| `morning` | Renders a styled morning brief (calendar, mail, tasks) as a page, or sets it up as a weekday task. |
| `ponytail`, `ponytail-review`, `ponytail-audit` | "Lazy senior dev": smallest change that solves the task; change review; whole-repo audit. |
| `viral-reel-editor` | Talking-head reels: cut silences, plan scenes (captions / UI / half / full screen), motion graphics, sound design, starter SFX library. |
| `call-me` | Lets the agent phone you when a long task finishes or needs a decision (Bland.ai). Put your number in `config.json`, the key in the `BLAND_API_KEY` env var. |

## Third-party skills (`third-party/`)

Included because they work well together with the skills above. **Unmodified**, each with its original licence:

| Folder | Source | Licence |
|---|---|---|
| `ecc/` — content-engine, video-editing, brand-voice, article-writing, marketing-campaign, crosspost, market-research, benchmark-methodology, taste-distillation, remotion-video-creation, manim-video | [affaan-m/ECC](https://github.com/affaan-m/ECC) © Affaan Mustafa | MIT |
| `roast-room/skill` — a council of advisor "brains" that stress-tests an idea | [nateherkai/roast-room](https://github.com/nateherkai/roast-room) © AI Automation Society | MIT |
| `OpenMontage` (git submodule) — agentic video production | [calesthio/OpenMontage](https://github.com/calesthio/OpenMontage) | AGPL-3.0 |
| `herk-edit-kit` (git submodule): video-editing kit on HyperFrames + GSAP. Has 15 skills: cut-silences, cut-mistakes, edit-video, short-form-edit, short-form-video, video-storytelling, make-a-video, motion-showreel, style-library, hyperframes, and more. | [nateherkai/herk-edit-kit](https://github.com/nateherkai/herk-edit-kit) © Nate Herk | MIT + kit use permission (bundled HyperFrames under its own licence) |
| `AIS-OS` (git submodule): an AI Operating System starter kit with skills for onboard, grill-me, audit, level-up, link and 3d-brain. | [nateherkai/AIS-OS](https://github.com/nateherkai/AIS-OS) © Nate Herk | MIT |
| `human-speak` (git submodule): removes AI-sounding phrasing from writing and keeps the writer's voice. | [nateherkai/human-speak](https://github.com/nateherkai/human-speak) © Nate Herk | MIT |
| `agent-reach` (git submodule): gives an agent internet access, including web pages, YouTube subtitles, RSS, GitHub, Exa search and optional social channels. | [Panniantong/agent-reach](https://github.com/Panniantong/agent-reach) | MIT |

`git clone --recurse-submodules https://github.com/aljaz13223/marox-ai` to get the submodules (OpenMontage, herk-edit-kit, AIS-OS, human-speak, agent-reach) too.

## Install

Copy any skill folder into `~/.claude/skills/` (or your project's `.claude/skills/`):

```bash
git clone --recurse-submodules https://github.com/aljaz13223/marox-ai
cp -r marox-ai/skills/* ~/.claude/skills/
cp -r marox-ai/third-party/ecc/* ~/.claude/skills/        # optional
```

## Licence

Skills in `skills/` are MIT © 2026 Aljaž Marolt. Everything in `third-party/` keeps its own licence.
