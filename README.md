# weekly-benchmark

A recurring competitive benchmark for Claude, packaged as a single skill. Set it up once, run it every week, get a short report where every claim carries a source.

**[⬇︎ Download the skill](https://github.com/saralobo/weekly-benchmark/raw/main/dist/weekly-benchmark.zip)**

## Install

**Claude Desktop / claude.ai** — download the zip above, then **Settings → Customize → Skills → add** and upload it.

**Claude Code** — clone into your skills folder:
```
git clone https://github.com/saralobo/weekly-benchmark.git ~/.claude/skills/weekly-benchmark
```

Then type `/weekly-benchmark`, or just ask for "a weekly benchmark of my product".

## Three tracks

Chosen during setup — enable only what matters.

- **`competitors`** — what specific companies change: pricing, product, positioning, content, reputation.
- **`visual`** — UI, design and architecture references delivered as an image gallery, from Mobbin, Awwwards, Behance, Dribbble, Savee, Land-book, ArchDaily and others. See [the catalogue](references/visual-sources.md).
- **`innovation`** — news, articles, regulation, research and capital movement, swept angle by angle.

## Language

Setup asks first: **English, Portuguese or Spanish.** The choice propagates to every agent, the analysis, the gallery captions and the email. The skill's own instructions are in English.

## How it works

```
config.md
   ↓
competitors track → competitor-collector (1 per competitor)
visual track      → visual-curator       (1 per source)  ─┐
innovation track  → innovation-scout     (1 per angle)    │
   ↓  JSON with a source on every fact                    │
differ  ──  compares against snapshots/<last week>.json    │
   ↓  only what changed, classified                        │
analyst + critic (in parallel, per delta)                  │
   ↓  only what survives the attempt to refute             │
editor  ←────── cumulative gallery, outside the diff ──────┘
   ↓
publisher
   ↓
reports/*.md   →   Artifact (fixed URL)   →   email ping
  (never fails)      (the real delivery)      (degrades safely)

+ snapshots/YYYY-MM-DD.json  +  history.md
```

Each role is a briefing in [`references/agents/`](references/agents/), invoked through the `Agent` tool so it runs in its own context — eight competitors in parallel won't flood the main window.

## Connectors

Optional. Setup asks permission and states the cost before installing anything. See [connectors.md](references/connectors.md).

- **Mobbin MCP** — 621k screens from shipped apps. Needs a paid Mobbin plan.
- **Playwright MCP** — captures the gallery screenshots. ~700MB of binaries.

**No missing connector kills a round.** Each degrades, and the report footer says what was unavailable.

## Design decisions

**The diff is the product.** Collection without comparison is a description of the market — pretty and useless. The value is in "what changed since last time".

**The critic has veto power.** Every finding passes an agent whose job is to knock it down. No verifiable source, no entry. That's what separates a benchmark from a plausible summary.

**A dead week is a valid delivery.** When nothing changes, the report says so in four lines — and the email still goes out. Silence is ambiguous: the reader can't tell whether nothing happened or the pipeline broke.

**The visual track skips the diff.** A UI reference doesn't change between weeks — it appears. The gallery is cumulative curation, filtered by one mandatory sentence per reference: *what design problem does this solve?* Without it, it's a mood board.

**Images must be embedded.** Artifacts block external hosts, so hotlinking Dribbble renders empty squares. That's why screenshot capture isn't a luxury — it's what makes the visual track exist. Every reference ships with author, project and link.

**Delivery is layered.** A local file never fails, the Artifact is the rich delivery, email is only the ping. Scheduled runs may lack an authenticated connector — when the fragile channel drops, the report already exists in the layers below.

## Report design

Reports follow a visual system derived from Revolut's craft: full-bleed sections alternating ground, enormous headlines against small body text, pill buttons, no card borders. SF Pro via the native stack, Inter as fallback. See [design.md](references/design.md) and [assets/template.html](assets/template.html).

## State

Everything in files, in your project folder: `benchmark/config.md`, `benchmark/snapshots/*.json`, `benchmark/gallery/`, `benchmark/history.md`. Versionable, auditable, no external service.

## Editing

Change `SKILL.md`, `references/` or `assets/`, then run `./build.sh` to rebuild `dist/weekly-benchmark.zip`.
