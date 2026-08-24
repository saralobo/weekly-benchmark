# Report visual system

Reference: **Revolut's** craft. Not copying the site — inheriting the posture.

## The five laws

1. **Full-bleed sections that alternate ground.** The system is neither "dark" nor "light": it's a sequence of full-width bands, each with its own background — pure black, pure white, brand blue. Changing ground is what marks a change of subject. **Never use a border to separate a block.** Separation comes from colour and space.
2. **Enormous headline, small body.** The contrast between the two is brutal: a 120px title next to 17px body. That's what produces the sense of confidence. A timid title kills the whole system.
3. **Medium weight, not heavy.** Headlines are 500–600, never 800. Large and light, not large and fat. With negative tracking (`-.03em`) and tight line-height (`.98`).
4. **Pill button.** `border-radius: 999px`, black on light, white on dark. Compact, with generous horizontal padding. It's the brand's only shape element — use it.
5. **Centre when it's a statement.** Section headers — title, subtitle, pill — centred. Content meant to be read stays left-aligned.

## Tokens

```css
:root{
  --black:#000000;      /* pure black, not near-black */
  --white:#FFFFFF;
  --blue:#0666EB;       /* brand blue */
  --violet:#5B37E8;
  --grad:linear-gradient(140deg,#E6178C 0%,#5B37E8 45%,#0B34D6 100%); /* the card gradient */

  --up:#00C48C; --down:#FF4D57; --warn:#FFB020;

  --font:-apple-system,BlinkMacSystemFont,"SF Pro Display","SF Pro Text",
         "Inter","Inter var",system-ui,sans-serif;
  --r-pill:999px; --r:24px;
}
```

Each section declares its own `--fg` and `--bg` and everything inside inherits. That's how the alternation works without duplicating CSS:

```css
.sec{background:var(--bg);color:var(--fg);padding:120px 24px}
.sec--dark {--bg:#000; --fg:#fff; --muted:rgba(255,255,255,.66)}
.sec--light{--bg:#fff; --fg:#000; --muted:rgba(0,0,0,.62)}
.sec--brand{--bg:#0666EB; --fg:#fff; --muted:rgba(255,255,255,.80)}
```

**Font:** SF Pro via the native `-apple-system`/`BlinkMacSystemFont` stack (Macs and iPhones already have it, nothing to load). **Inter is the fallback**, via `fonts.googleapis.com` — the only external host an Artifact allows. Never let it fall through to Arial.

## Scale

| Role | Size | Weight | Tracking | Line-height |
|---|---|---|---|---|
| Hero | `clamp(48px,9vw,120px)` | 600 | `-.03em` | `.98` |
| Section title | `clamp(34px,5vw,64px)` | 600 | `-.03em` | `1.02` |
| Finding title | `clamp(24px,3vw,36px)` | 600 | `-.025em` | `1.1` |
| Value / delta | `clamp(40px,6vw,80px)` | 600 | `-.035em` | `1` |
| Body | 17px | 400 | `-.005em` | `1.55` |
| Meta | 13px | 500 | `.02em` | — |

Body **does not scale** with the title. It stays small on purpose.

## Components

**Pill (button / filter / tag)** — `999px`, padding `13px 26px`, 15px/500. On light: black fill, white text. On dark: white fill, black text. Secondary variant: transparent with a 1px border in the text colour.

**Delta** — the number is the hero. `before → after`, before struck through at 40% opacity, after at value size. Coloured pill alongside carrying the read (`entry now paid`, `-30%`). It's the equivalent of the big balance on their homepage.

**Finding** — not a card. A section band with space around it: title, delta, two paragraphs, meta line. If several need grouping in one section, separate with a very low-contrast `border-top` — never a box.

**Visual gallery** — 2-column grid (1 on mobile), 32px gap, on dark ground. Image at `border-radius:24px`, `width:100%`, **no border and no shadow**. Below each, outside the image: title 20px/600, the *why* in small muted body, credit at 13px linking to the source.

Never put a caption inside the image, nor an overlay, nor a gradient over it. The image is someone else's work — show it whole. A reference new this week gets a discreet pill above the title.

Without Playwright the same grid becomes text-only cards: title, why, credit. Don't draw a grey placeholder pretending to be an image.

**Innovation** — light ground, no images. Headline at finding size, two sentences, source chip. **The contrast with the gallery is deliberate**: one section is to look at, the other is to read. Blending the two languages erases both.

**Time series** — inline SVG, 2px line, no grid, only the first and last axis label. On a light section the line is black; on dark, white. Colour only marks the point that changed. Load the `dataviz` skill before drawing.

## What not to do

- Cards with visible borders. They don't exist in their system.
- Titles at weight 700+. Reads fat, not confident.
- Large body text. The contrast with the title *is* the effect.
- More than one coloured section per report. Blue is punctuation, not palette.
- Emoji, decorative icons, coloured shadows, glow behind text.
- Density. If it looks crowded, remove content — don't reduce padding.
