# Setup

Your job is to **produce a good `benchmark/config.md`**. A shallow config yields shallow reports for months. Ten minutes here is worth it.

## How to run the interview

- **One question at a time.** Never dump a form.
- **Don't ask what you can find out.** Got the product URL? Read the site, infer the sector, the audience and the likely competitors. Arrive with a hypothesis: *"From the site this looks like B2B SaaS for financial ops; I'd suggest these tracks, these dimensions and these sources — what changes?"* People correct faster than they answer.
- **Instruct, don't just collect.** You know the trade-offs; they don't. Say which setup you recommend and why. See `references/profiles.md`.
- **Press on the decision question.** Without knowing what decision the report feeds, it becomes an encyclopedia.
- `AskUserQuestion` for closed choices; free text for discovery.

## Script

### 0. Language — before anything else
`AskUserQuestion`: **English, Portuguese, Spanish.** The interview, the report, the analysis and the email all come out in that language. Ask first, then continue in whatever they chose.

### 1. The product
What it is, who it's for, in one sentence. Ask for the link and **read the site** before moving on.

### 2. The decision
"When the report lands on Monday, what decision will it help you make?" Roadmap, pricing, positioning, campaign, investment, design repertoire.

### 3. Propose a profile
From the site, classify using `references/profiles.md` and propose **tracks + dimensions + sources all at once**, with the reasoning behind each choice. Let them cut.

### 4. Tracks
Confirm which to enable:
- **`competitors`** — what specific companies change: pricing, product, positioning, content, reputation
- **`visual`** — UI, design and architecture references, delivered as an image gallery
- **`innovation`** — news, articles, regulation, research and capital movement in the sector

**Don't encourage enabling everything.** Three tracks across six sources makes a long round and a scattered report. Say so if they ask for all of it.

### 5. If `competitors` is on
Who they are — you propose from research, they cut and add. For each: name, URL, and **why it's on the list** (direct competitor? execution benchmark? future threat?). That reason changes what the collector looks for.

Dimensions: `product`, `pricing`, `positioning`, `content`, `reputation`.

### 6. If `visual` is on
- **The search theme.** Specific: "fintech onboarding", "dense dashboards", "street-level retail". Generic themes produce generic galleries.
- **The sources.** Show `references/visual-sources.md` and recommend 3 to 5, explaining what each is good for and what it isn't.
- **The connectors.** Follow `references/connectors.md`: offer Mobbin only if they pick Mobbin (and say it needs a paid plan **before** running anything), and always offer Playwright (saying it's ~700MB and why the gallery becomes a list of links without it). **Ask permission before installing anything.** Verify it worked and record it in the config.

### 7. If `innovation` is on
What context to sweep, and which angles matter: capital, regulation, technology, behaviour, entrants, research. Recommend 3 to 4 — all six is a shallow sweep.

### 8. Urgency triggers
"What would have to happen for you to want to know the same day?"

### 9. Delivery
Day and time, and who reads it. The report always goes to a local file and an Artifact with a fixed URL; ask whether they also want a short email ping and to which address.

### 10. Required or banned sources
Sites they already follow, or ones they don't want to see.

## Output

Write `benchmark/config.md` in exactly this format — the pipeline reads these headings:

```markdown
# Weekly benchmark config

## Language
en

## Product
<one sentence> — <url>

## Decision this benchmark feeds
<sentence>

## Active tracks
- competitors
- visual
- innovation

## Competitors
| Name | URL | Why it's on the list |
|---|---|---|

## Active dimensions
- product
- pricing

## Visual search theme
<specific>

## Visual sources
- mobbin (connector: active | unavailable | not chosen)
- awwwards
- savee

## Innovation angles
- regulation
- technology

## Connectors
Screenshots: yes | no (Playwright declined)

## Urgency triggers
- <e.g. any competitor changes the entry-tier price>

## Delivery
When: <every Monday, 8am>
Readers: <who>
Email: <address, or "no">
Artifact URL: <empty — filled by the pipeline on first publish; don't edit>

## Sources
Required: <...>
Banned: <...>
```

Also create `benchmark/snapshots/`, `benchmark/reports/`, `benchmark/gallery/` (empty) and `benchmark/history.md` with the heading `# History`.

## Closing

Show the config and confirm before scheduling. Explain that it can be scheduled with the `schedule` skill, and offer to do it. Warn that the **first run is the baseline**: there'll be no diff, and that's expected.
