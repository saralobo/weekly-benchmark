# Connectors

Two connectors greatly widen what this pipeline delivers. Neither is required, and **no missing connector may kill a round** — each degrades, and the report footer says what was unavailable.

## Conduct

- **State the cost up front**, never after. Paid plan, heavy download, setup time.
- **Ask permission explicitly** before running any install command. They can say no, and that's fine.
- **Verify it worked** and record the result in the config. Don't assume.

---

## Mobbin MCP

Offer this **only if they picked Mobbin** in the visual source catalogue.

**What it is:** direct, searchable access to 621k screens and 142k flows from 1,651 shipped apps. The best base of real product patterns that exists.

**The cost, said up front:** it needs a **paid Mobbin plan** — Pro, from roughly €10/month. Say this before any command. If they don't have one and don't want to subscribe, fall back to Refero and Screenlane, which cover the same nature at smaller scale.

**How to connect:**
```
claude mcp add mobbin --scope user --transport http https://api.mobbin.com/mcp
```
The first connection triggers an OAuth flow in the browser. There's no API key to ask for — **never ask the person for a token, code or callback URL.**

**In a non-interactive session** OAuth can't run. Say they'll need to authorise from an interactive session, and continue without it.

**Record in the config:** `mobbin (connector: active | unavailable | not chosen)`.

---

## Playwright MCP

Offer this **whenever the `visual` track is on**.

**What it is:** browser control, used here to capture screenshots of references.

**Why it matters, in one sentence:** the Artifact blocks images from external hosts, so without capture the gallery becomes a list of links — and the visual track loses its reason to exist.

**The cost, said up front:** browser binaries take **about 700 MB** on disk. Say the number.

**How to connect:**
```
claude mcp add playwright npx @playwright/mcp@latest
```

**If they decline:** the visual track runs **degraded** — title, author, link and a written description of the pattern, no image. Record `Screenshots: no` in the config and say it can be enabled later at any time.

---

## Degraded modes, summarised

| Missing | What happens |
|---|---|
| Mobbin | Visual track uses the other chosen sources. Footer records the gap. |
| Playwright | Gallery without images: title, author, link, description. Footer records it. |
| Gmail | Report exists as file and Artifact; the ping doesn't go out. Footer records it. |
| Everything | The report in `benchmark/reports/` **always** ships. It's the layer that never fails. |
