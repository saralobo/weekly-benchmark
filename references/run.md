# Running a round

Read `benchmark/config.md` before anything else. If it doesn't exist, stop and run setup.

**Write everything in the language declared in the config** and pass that language to every agent.

You are the **orchestrator**. Don't collect anything yourself — delegate and assemble.

**How to delegate:** each role below has a briefing in `references/agents/<name>.md`. To invoke one, use the `Agent` tool (type `general-purpose`) passing **the briefing's contents** as the prompt, plus that call's specific data (the competitor, the source, the angle) and the config language. Each agent runs in its own context — that's what lets you fire eight collections in parallel without flooding your window.

## Phase 1 — Collection, by track (parallel)

Fire in **a single message** with multiple `Agent` calls, only for active tracks:

| Track | Dispatch |
|---|---|
| `competitors` | one `agents/competitor-collector.md` **per competitor**, with name, URL, why it's on the list, and active dimensions |
| `visual` | one `agents/visual-curator.md` **per visual source**, with the search theme and whether Playwright is available |
| `innovation` | one `agents/innovation-scout.md` **per angle**, with the config's context |

Each returns JSON in the schema from `references/schema.md`. Don't accept prose.

**A missing connector doesn't kill the round.** No Mobbin, use the other sources. No Playwright, the gallery ships without images. Record what was missing in the footer.

## Phase 2 — Diff (competitors and innovation only)

Find the most recent snapshot in `benchmark/snapshots/`.

- **If there is none**: this is the baseline. Save the snapshot, write a "current state of the field" report, and say deltas start next week.
- **If there is one**: call `agents/differ.md` with the previous snapshot and today's collection.

**The visual track does not go through the differ.** A UI reference doesn't change between weeks — it appears. Running the fact-comparison machinery over images produces noise. The gallery is **cumulative curation**: the curator already marked what's `new` by checking `benchmark/gallery/`, and that's all the report needs.

## Phase 3 — Analysis and verification (pipeline, not barrier)

For each `competitors` delta and each `innovation` event, in parallel:

1. `agents/analyst.md` — why it matters **for this product**, given the config's decision
2. `agents/critic.md` — tries to knock the finding down

**Anything marked `refuted`, `no_source`, `artifact` or `speculation` is cut.** No exceptions. Count them — the number goes in the footer.

The visual track skips this phase: its filter is the curator itself, which only admits references carrying the "what design problem does this solve" sentence.

## Phase 4 — Delivery

Call `agents/editor.md` with the surviving findings, the gallery, the config and `benchmark/history.md`.

Then:
- save the raw snapshot to `benchmark/snapshots/YYYY-MM-DD.json`
- append 3–6 lines to `benchmark/history.md` (long-term memory: patterns that repeat)
- call `agents/publisher.md` with the editor's markdown, the gallery and the config

The publisher delivers in three layers — local file, Artifact at the stable URL, email ping — in that order of reliability. **Don't abort a round because the email didn't go out.**

## Dead week

If nothing relevant changed, the report is four lines saying so, listing what was checked. **Don't invent relevance to justify the round.** An honest "nothing changed" is what earns trust for the week something does.

An active visual track almost never produces a dead week — there's always a new reference. That is not a reason to pad the competitor track.

## Quality bar

Read `references/quality.md` before approving the editor's output.
