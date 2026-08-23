# benchmark-semanal

Pipeline de benchmark competitivo recorrente para Claude Code. Configura uma vez, roda toda semana, entrega um relatório curto onde toda afirmação tem fonte.

## As três trilhas

Escolhidas no setup — ligue só as que importam.

- **`concorrentes`** — o que empresas específicas mudam: preço, produto, posicionamento, conteúdo, reputação.
- **`visual`** — referências de UI, design e arquitetura entregues como galeria de imagens, vindas de Mobbin, Awwwards, Behance, Dribbble, Savee, Land-book, ArchDaily e outras. Ver [o catálogo](skills/benchmark-setup/references/fontes-visuais.md).
- **`inovacao`** — notícias, artigos, regulação, pesquisa e movimento de capital, varridos por ângulo.

## Conectores

Opcionais, e o setup pede permissão explicando o custo antes de instalar qualquer coisa. Ver [conectores.md](skills/benchmark-setup/references/conectores.md).

- **Mobbin MCP** — 621 mil telas de apps reais. Exige plano pago do Mobbin.
- **Playwright MCP** — captura os screenshots da galeria. ~700MB de binários.

**Nenhum conector ausente derruba a rodada.** Cada um degrada e o rodapé do relatório diz o que faltou.

## Como usar

1. `/benchmark-setup` — pergunta o idioma (pt/en/es), lê o site do seu produto, propõe um perfil de configuração inteiro e ajusta com você. Gera `benchmark/config.md`.
2. Agende `/benchmark-run` no dia que quiser (use a skill `schedule`).
3. `/benchmark-status` a qualquer momento, para ver o que está sendo monitorado.

A primeira execução é a **linha de base** — não tem diff. Os deltas começam na segunda rodada.

## Como funciona

```
config.md
   ↓
trilha concorrentes → coletor-concorrente (1 por concorrente)
trilha visual       → curador-visual   (1 por fonte)  ─┐
trilha inovação     → scout-inovacao   (1 por ângulo)  │
   ↓  JSON com fonte em todo fato                      │
diffador  ──  compara com snapshots/<semana anterior>.json    │
   ↓  só o que mudou, classificado                            │
analista + critico (em paralelo, por delta)                   │
   ↓  só o que sobrevive à tentativa de refutação             │
editor  ←─────────── galeria acumulativa, fora do diff ───────┘
   ↓
publicador
   ↓
relatorios/*.md   →   Artifact (URL fixa)   →   ping por e-mail
     (nunca falha)      (a entrega de verdade)     (degrada sem quebrar)

+ snapshots/YYYY-MM-DD.json  +  historico.md
```

## Instalação

Local, para testar:

```
/plugin marketplace add /caminho/para/benchmark-semanal
/plugin install benchmark-semanal
```

Para outras pessoas: suba esta pasta num repo Git e mande `/plugin marketplace add usuario/repo`.

## As três decisões de design

**O diff é o produto.** Uma coleta sem comparação é uma descrição do mercado — bonita e inútil. O valor está em "o que mudou desde a última vez".

**O crítico tem poder de veto.** Todo achado passa por um agente cujo trabalho é derrubá-lo. Sem fonte verificável, morre. É o que separa um benchmark de um resumo plausível.

**Semana morta é entrega válida.** Quando nada muda, o relatório diz isso em quatro linhas — e o e-mail vai mesmo assim. Silêncio é ambíguo: a pessoa não sabe se nada aconteceu ou se o pipeline quebrou.

**A trilha visual não passa pelo diff.** Uma referência de UI não muda entre semanas — ela aparece. A galeria é curadoria acumulativa, e o filtro dela é uma frase obrigatória por referência: *que problema de design isto resolve?* Sem essa frase, vira mural.

**Imagem tem que ser embutida.** O Artifact bloqueia host externo, então hotlink do Dribbble renderiza quadrado vazio. É por isso que a captura de screenshot não é luxo — é o que faz a trilha visual existir. Toda referência sai com autor, projeto e link.

**A entrega é em camadas.** Arquivo local nunca falha, Artifact é a entrega rica, e-mail é só o ping. Execuções agendadas podem não ter conector autenticado — quando o canal frágil cai, o relatório já existe nas camadas de baixo. O pipeline nunca aborta por causa do e-mail.

## Estado

Tudo em arquivo, na pasta do projeto: `benchmark/config.md`, `benchmark/snapshots/*.json`, `benchmark/historico.md`. Versionável, auditável, sem serviço externo.
