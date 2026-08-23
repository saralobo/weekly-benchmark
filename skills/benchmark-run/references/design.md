# Sistema visual dos relatórios

Referência: o craft do **Revolut**. Não é copiar o site — é herdar a postura.

## As cinco leis

1. **Seções full-bleed que alternam de chão.** O sistema não é "escuro" nem "claro": é uma sequência de faixas de largura total, cada uma com sua própria cor de fundo — preto puro, branco puro, azul de marca. A troca de chão é o que marca a troca de assunto. **Nunca use borda para separar bloco.** Separa-se por cor e por espaço.
2. **Headline enorme, corpo pequeno.** O contraste entre os dois é brutal: título de 120px ao lado de corpo de 17px. É o que dá a sensação de confiança. Título tímido mata o sistema inteiro.
3. **Peso médio, não pesado.** As headlines são 500–600, nunca 800. Grande e leve, não grande e gorda. Com tracking negativo (`-.03em`) e line-height apertada (`.98`).
4. **Botão pill.** `border-radius: 999px`, preto sobre claro, branco sobre escuro. Compacto, com padding horizontal generoso. É o único elemento de forma da marca — use-o.
5. **Centralização quando é declaração.** Cabeçalho de seção — título, subtítulo, pill — centralizado. Conteúdo que se lê continua alinhado à esquerda.

## Tokens

```css
:root{
  --black:#000000;      /* preto puro, não quase-preto */
  --white:#FFFFFF;
  --blue:#0666EB;       /* azul de marca */
  --violet:#5B37E8;
  --grad:linear-gradient(140deg,#E6178C 0%,#5B37E8 45%,#0B34D6 100%); /* o gradiente do cartão */

  --up:#00C48C; --down:#FF4D57; --warn:#FFB020;

  --font:-apple-system,BlinkMacSystemFont,"SF Pro Display","SF Pro Text",
         "Inter","Inter var",system-ui,sans-serif;
  --r-pill:999px; --r:24px;
}
```

Cada seção declara `--fg` e `--bg` próprios e tudo dentro herda. É assim que a alternância funciona sem duplicar CSS:

```css
.sec{background:var(--bg);color:var(--fg);padding:120px 24px}
.sec--dark {--bg:#000; --fg:#fff; --muted:rgba(255,255,255,.66)}
.sec--light{--bg:#fff; --fg:#000; --muted:rgba(0,0,0,.62)}
.sec--brand{--bg:#0666EB; --fg:#fff; --muted:rgba(255,255,255,.80)}
```

**Fonte:** SF Pro pela stack nativa `-apple-system`/`BlinkMacSystemFont` (Mac e iPhone já têm, não carrega nada). **Inter é o fallback**, via `fonts.googleapis.com` — único host externo permitido no Artifact. Nunca deixe cair em Arial.

## Escala

| Papel | Tamanho | Peso | Tracking | Line-height |
|---|---|---|---|---|
| Hero | `clamp(48px,9vw,120px)` | 600 | `-.03em` | `.98` |
| Título de seção | `clamp(34px,5vw,64px)` | 600 | `-.03em` | `1.02` |
| Título de achado | `clamp(24px,3vw,36px)` | 600 | `-.025em` | `1.1` |
| Valor / delta | `clamp(40px,6vw,80px)` | 600 | `-.035em` | `1` |
| Corpo | 17px | 400 | `-.005em` | `1.55` |
| Meta | 13px | 500 | `.02em` | — |

O corpo **não cresce** junto com o título. Ele fica pequeno de propósito.

## Componentes

**Pill (botão / filtro / tag)** — `999px`, padding `13px 26px`, 15px/500. Sobre claro: fundo preto, texto branco. Sobre escuro: fundo branco, texto preto. Variante secundária: transparente com borda de 1px na cor do texto.

**Delta** — o número é o herói. `antes → depois`, antes riscado a 40% de opacidade, depois em tamanho de valor. Pill colorida ao lado com a leitura (`entrada paga`, `-30%`). É o equivalente ao saldo grande da home deles.

**Achado** — não é cartão. É uma faixa de seção com espaço em volta: título, delta, dois parágrafos, linha de meta. Se precisar agrupar vários numa mesma seção, separe por `border-top: 1px` de baixíssimo contraste — nunca por caixa.

**Chip de fonte** — 13px, `--muted`, mostrando o domínio e não a URL. Toda afirmação leva um.

**Galeria visual** — grid de 2 colunas (1 no mobile), gap de 32px, sobre chão escuro. Imagem com `border-radius:24px`, `width:100%`, **sem borda e sem sombra**. Abaixo de cada uma, fora da imagem: título 20px/600, o *porquê* em corpo pequeno e muted, crédito 13px com link para a fonte.

Nunca ponha legenda dentro da imagem, nem overlay, nem gradiente por cima. A imagem é a obra de outra pessoa — mostre inteira. Referência nova da semana ganha uma pill discreta acima do título.

Sem Playwright, o mesmo grid vira cartões só de texto: título, o porquê, crédito. Não desenhe placeholder cinza fingindo imagem.

**Inovação** — chão claro, sem imagem. Manchete em `h-find`, duas frases, chip de fonte. **O contraste com a galeria é proposital**: uma seção é para olhar, a outra é para ler. Misturar as duas linguagens apaga as duas.

**Série temporal** — SVG inline, linha de 2px, sem grade, só primeiro e último rótulo. Sobre seção clara, linha preta; sobre escura, branca. Cor só para marcar o ponto que mudou. Carregue `dataviz` antes.

## O que não fazer

- Cartão com borda visível. Não existe no sistema deles.
- Título com peso 700+. Fica gordo, não fica confiante.
- Corpo grande. O contraste com o título é o efeito.
- Mais de uma seção colorida por relatório. O azul é pontuação, não paleta.
- Emoji, ícone decorativo, sombra colorida, glow atrás de texto.
- Densidade. Se ficou cheio, tire conteúdo — não reduza o padding.
