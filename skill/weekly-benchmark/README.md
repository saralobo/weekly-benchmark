# weekly-benchmark — skill build

Same pipeline as the plugin, packaged as a skill you can install straight into Claude Desktop.

## Install in Claude Desktop

1. Zip this folder: `zip -r weekly-benchmark.zip weekly-benchmark`
2. **Settings → Customize → Skills → add**, and upload the zip.
3. In chat, type `/weekly-benchmark` — or just ask for "a weekly benchmark of my product".

No marketplace, no cache in between: the skill reads what you uploaded.

## Language

The skill's instructions are in English. The **report** comes out in whatever the person picks during setup — English, Portuguese or Spanish — and that choice propagates to every agent, the analysis, the gallery captions and the email.

## Difference from the plugin

| | Plugin | Skill |
|---|---|---|
| Install | git marketplace | direct upload |
| Commands | `/benchmark-setup`, `/benchmark-run`, `/benchmark-status` | `/weekly-benchmark`, which routes itself |
| Agents | named subagents with per-role tool limits | briefings in `references/agents/`, passed to `Agent` |
| Parallelism and isolated context | yes | yes |

Behaviour is the same. What the skill loses is per-agent tool restriction — a detail here, since every role mainly needs web reading and file writing.
