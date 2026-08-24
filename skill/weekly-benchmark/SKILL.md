---
name: weekly-benchmark
description: Recurring competitive benchmark across three tracks — competitors (pricing, product, positioning, reputation), visual references (Mobbin, Awwwards, Behance, Dribbble, Savee, ArchDaily) and innovation (news, regulation, capital, research). Sets up through an interview in English, Portuguese or Spanish, runs weekly against the previous round, verifies every finding against its source, and publishes a visual report. Use when someone wants to set up, run or check a weekly benchmark, track competitors, follow design or UI references, or sweep a sector for innovation.
---

# Weekly benchmark

A recurring benchmark pipeline. Configure once, run every week, deliver a short report where every claim carries a source.

## Figure out what to do

Read `benchmark/config.md` in the working folder.

| Situation | Do this |
|---|---|
| No config, or the person wants to (re)configure | **Setup** — follow `references/setup.md` |
| Config exists and it's time to run | **Run** — follow `references/run.md` |
| The person wants to know the state of things | **Status** — see below |

If the request is ambiguous ("do the benchmark") and a config exists, run it. If none exists, set it up.

## How this pipeline delegates

The roles live in `references/agents/`. To invoke one, use the `Agent` tool (type `general-purpose`), passing **the briefing's contents** as the prompt, along with that call's specific data and the language declared in the config.

| Briefing | Role |
|---|---|
| `competitor-collector.md` | current state of one competitor, with a source for every fact |
| `market-collector.md` | cross-cutting events in the sector |
| `visual-curator.md` | UI and design references from one source, with screenshot and credit |
| `innovation-scout.md` | sweeps one angle: capital, regulation, technology, research |
| `differ.md` | what changed since the previous round |
| `analyst.md` | why a delta matters for this product |
| `critic.md` | tries to knock down every finding before it reaches the report |
| `editor.md` | assembles the report |
| `publisher.md` | delivers to file, Artifact and email |

**Fire them in parallel** — all collection in a single message with multiple `Agent` calls. Each runs in its own context, so eight competitors won't flood your window.

## Status

Read `benchmark/config.md`, list `benchmark/snapshots/` and read `benchmark/history.md`. Answer short: what's being tracked, how many rounds have run, when the last one was, and which patterns repeat. With no config, point to setup.

## Non-negotiable principles

**The diff is the product.** Collection without comparison is a description of the market — pretty and useless.

**The critic has veto power.** Every finding passes an agent whose job is to knock it down. No verifiable source, no entry.

**A dead week is a valid delivery.** Nothing changed? Four lines saying so. Padding an empty round destroys trust in the round where something actually happened.

**The visual track skips the diff.** A UI reference doesn't change between weeks — it appears. It's cumulative curation.

**No missing connector kills a round.** Each one degrades, and the footer says what was unavailable.

## File map

- `references/setup.md` — interview script and config format
- `references/run.md` — how a round is orchestrated
- `references/profiles.md` — recommended setups by project type
- `references/visual-sources.md` — catalogue: what to look for, and what not to, in each source
- `references/connectors.md` — Mobbin MCP and Playwright: cost, permission, degradation
- `references/schema.md` — fixed collection format
- `references/quality.md` — the tests the report has to pass
- `references/design.md` — the report's visual system
- `assets/template.html` — report skeleton, to copy and fill
