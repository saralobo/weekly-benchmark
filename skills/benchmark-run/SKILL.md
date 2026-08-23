---
name: benchmark-run
description: Executa uma rodada do benchmark semanal — coleta em paralelo por concorrente e dimensão, compara com o snapshot anterior, analisa impacto, verifica cada achado e publica o relatório. Use quando for hora de rodar o benchmark, manual ou agendado.
---

# Execução do benchmark semanal

Leia `benchmark/config.md` antes de qualquer coisa. Se não existir, pare e mande rodar `/benchmark-setup`.

Você é o **orquestrador**. Não colete nada você mesma — delegue para os subagents e monte o resultado.

## Fase 1 — Coleta (paralela)

Dispare em **uma única mensagem** com múltiplas chamadas de `Agent`:

- um `coletor-concorrente` **por concorrente** do config, passando: nome, URL, por que está na lista, e as dimensões ativas
- um `coletor-mercado` se a dimensão `mercado` estiver ativa

Cada coletor devolve JSON no schema de `references/schema.md`. Não aceite prosa.

## Fase 2 — Diff

Encontre o snapshot mais recente em `benchmark/snapshots/`.

- **Se não houver nenhum**: esta é a linha de base. Salve o snapshot, escreva um relatório curto de "estado atual do campo" e pare. Diga explicitamente que os deltas começam na semana que vem.
- **Se houver**: chame o `diffador` passando o snapshot anterior e a coleta de hoje. Ele devolve só o que mudou, classificado.

## Fase 3 — Análise e verificação (pipeline, não barreira)

Para cada mudança que o diffador retornou, em paralelo:

1. `analista` — por que isso importa **para este produto**, dada a decisão declarada no config
2. `critico` — tenta derrubar o achado

**Todo achado que o crítico marcar como `refutado` ou `sem_fonte` é cortado.** Sem exceção, sem "mas era interessante". Registre quantos foram cortados — esse número vai no rodapé do relatório.

## Fase 4 — Entrega

Chame o `editor` com os achados sobreviventes, o config e o `historico.md`. Ele monta o relatório.

Depois:
- salve o snapshot bruto em `benchmark/snapshots/YYYY-MM-DD.json`
- acrescente 3–6 linhas em `benchmark/historico.md` (a memória de longo prazo: padrões que se repetem)
- chame o `publicador` com o markdown do editor e o config

O `publicador` entrega em três camadas — arquivo local, Artifact na URL estável, ping por e-mail — nessa ordem de confiabilidade. Se uma camada falhar, as anteriores já entregaram. **Não aborte a rodada porque o e-mail não saiu.**

## Semana morta

Se nada relevante mudou, o relatório tem 4 linhas dizendo isso, listando o que foi verificado. **Não invente relevância para justificar a rodada.** Um "nada mudou" honesto é o que faz a pessoa confiar no relatório da semana em que algo mudou.

## Padrão de qualidade

Leia `references/qualidade.md` antes de aprovar a saída do editor.
