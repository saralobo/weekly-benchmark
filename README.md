# benchmark-semanal

Pipeline de benchmark competitivo recorrente para Claude Code. Configura uma vez, roda toda semana, entrega um relatório curto onde toda afirmação tem fonte.

## Como usar

1. `/benchmark-setup` — entrevista sobre seu produto, concorrentes e a decisão que o benchmark alimenta. Gera `benchmark/config.md`.
2. Agende `/benchmark-run` no dia que quiser (use a skill `schedule`).
3. `/benchmark-status` a qualquer momento, para ver o que está sendo monitorado.

A primeira execução é a **linha de base** — não tem diff. Os deltas começam na segunda rodada.

## Como funciona

```
config.md
   ↓
coletor-concorrente (N em paralelo) + coletor-mercado
   ↓  JSON com fonte em todo fato
diffador  ──  compara com snapshots/<semana anterior>.json
   ↓  só o que mudou, classificado
analista + critico (em paralelo, por delta)
   ↓  só o que sobrevive à tentativa de refutação
editor
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

**A entrega é em camadas.** Arquivo local nunca falha, Artifact é a entrega rica, e-mail é só o ping. Execuções agendadas podem não ter conector autenticado — quando o canal frágil cai, o relatório já existe nas camadas de baixo. O pipeline nunca aborta por causa do e-mail.

## Estado

Tudo em arquivo, na pasta do projeto: `benchmark/config.md`, `benchmark/snapshots/*.json`, `benchmark/historico.md`. Versionável, auditável, sem serviço externo.
