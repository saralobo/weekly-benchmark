# Collection schema

Fixed format. The diff only works if week 2 has the same shape as week 1.

```json
{
  "entity": "Competitor name or 'MARKET'",
  "collected_at": "2026-08-24",
  "dimensions": {
    "product": {
      "visible_features": ["..."],
      "recent_releases": [
        {"what": "...", "date": "2026-08-19", "source": "https://..."}
      ]
    },
    "pricing": {
      "plans": [
        {"name": "Pro", "amount": "$29", "period": "month", "includes": ["..."], "source": "https://..."}
      ],
      "promotions": []
    },
    "positioning": {
      "headline": "literal text from the site",
      "promise": "...",
      "stated_audience": "...",
      "source": "https://..."
    },
    "content": {
      "active_channels": ["..."],
      "recurring_themes": ["..."],
      "notable_posts": [{"what": "...", "date": "...", "source": "..."}]
    },
    "reputation": {
      "recurring_praise": ["..."],
      "recurring_complaints": ["..."],
      "sources": ["..."]
    }
  },
  "unverified": ["things you suspect but couldn't confirm"],
  "failures": ["pages that wouldn't open, paywalls, blocks"]
}
```

## `visual` block (returned by the visual curator)

Its own format: the visual track isn't a state you compare, it's a curation that accumulates.

```json
{
  "source": "mobbin",
  "theme": "fintech onboarding",
  "references": [
    {
      "title": "Monzo's progressive onboarding",
      "solves": "asks only for what the next step needs, deferring KYC until after first value is delivered",
      "author": "Monzo",
      "url": "https://mobbin.com/...",
      "screenshot": "benchmark/gallery/2026-08-24/monzo-onboarding.jpg",
      "new": true
    }
  ],
  "failures": []
}
```

`solves` is mandatory — without it the reference doesn't get in. `screenshot` is `null` when Playwright isn't available. `new` is `true` if the URL hasn't appeared in a previous round.

## `innovation` block (returned by the innovation scout)

```json
{
  "entity": "MARKET",
  "angle": "regulation",
  "events": [
    {"what": "...", "date": "2026-08-19",
     "type": "funding|regulation|technology|behaviour|entrant|research|announcement",
     "source": "https://...", "primary_source": "https://...", "why_it_matters": "one sentence"}
  ],
  "unverified": [],
  "failures": []
}
```

`type: announcement` marks something merely announced. Never write an announcement as an accomplished fact.

## Rules

- Only include dimensions active in the config.
- **Every factual item needs a `source` URL.** No URL, it goes to `unverified`.
- Copy literal text in `headline` and `amount` — don't paraphrase. Paraphrase breaks the diff: it manufactures a false change every week.
- Dates as `YYYY-MM-DD`. If the source carries no date, use `null`, never today's.
- `failures` is never empty for convenience. If something wouldn't open, log it. Silence about a failure becomes an invisible hole in the report.
- Reader-facing text — `title`, `solves`, `why_it_matters` — goes **in the language declared in the config**. JSON keys stay exactly as written here.
