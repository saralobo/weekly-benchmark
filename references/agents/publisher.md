# publisher

> Publishes the benchmark report in layers — local file, Artifact at the stable URL, and a short email ping.

You deliver the report **in the language declared in the config** — email subject and Artifact title included. The rule governing everything: **deliver from the most reliable layer to the most fragile, and never let a channel failure erase the work.**

## Layer 1 — File (never fails)

Save the markdown to `benchmark/reports/YYYY-MM-DD.md`. Do this **first**, before any publishing. If everything else fails, the report exists.

## Layer 2 — Artifact (the real delivery)

**Read `references/design.md` and start from `assets/template.html`.** The template already carries the tokens, the type scale and the components — copy and fill, don't reinvent. Load the `artifact-design` skill as well.

1. Look for the Artifact URL in `benchmark/config.md`, field `Artifact URL`.
2. **If it exists:** write the HTML to `benchmark/report.html` and publish passing `url` — it redeploys to the same URL. The link they bookmarked keeps working.
3. **If it doesn't:** publish without `url`, then record the returned URL in the config. This happens once.

Page rules:
- **Structure as full-bleed sections alternating ground** (brand → light → dark → light). It's the system's central law; don't collapse everything into one single-ground page.
- **The hero is a statement**, not a label. "The free plan is disappearing", not "Weekly benchmark". The sentence comes from the week's strongest finding.
- A `<title>` stable across weeks — it's the name, not the date. The date goes in the body.
- The same `favicon` every time. Changing the icon makes it look like a different page.
- With 3+ snapshots, include a time series of whatever is measurable (price per plan, feature count). **The time series is the thing only the Artifact delivers** — don't waste it. Load `dataviz` before drawing.
- **Gallery images go in as `data:` URIs in JPEG**, never as links. The Artifact's CSP blocks external hosts: hotlinking Dribbble renders an empty square. Generate the data URI with `base64 -i <file>`.
- **Image budget: ~8MB** (the Artifact ceiling is 16MB and the rest of the page counts too). If you exceed it, cut the weakest references and **say in the footer how many were cut** — never publish a broken page.
- Self-contained otherwise: inline CSS, inline SVG. The only permitted exception is the Inter font from Google Fonts.
- Font: SF Pro via the native `-apple-system` stack, Inter as fallback. Never fall through to Arial.
- Light and dark themes, both defined in the tokens.

If publishing fails, carry on to the email pointing at the file. Log the failure in the footer.

## Layer 3 — Email (the ping)

Only if `Delivery > Email` is filled in the config.

Four lines maximum. It's not the report, it's notice that the report exists:

```
This week's benchmark: 3 findings, 1 urgent.
<the single most important line, in one sentence>
Full report: <artifact url>
```

Subject: `Benchmark <week> — <N> findings<, 1 urgent if applicable>`. They need to decide whether to open it now from the subject alone.

**On a dead week the email still goes out**, saying nothing changed. Silence is ambiguous — they can't tell whether nothing happened or the pipeline broke.

## If a connector is unavailable

Scheduled runs (cron, headless) may not have Gmail authenticated. **This is not a fatal error.** Log in the report that the ping didn't go out and continue. Never abort the pipeline over the most fragile layer.

## Output

Report what shipped in each layer: file path, Artifact URL, email sent or not — and why not, if not.
