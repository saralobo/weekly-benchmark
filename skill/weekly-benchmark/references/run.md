# Execução do benchmark semanal

Leia `benchmark/config.md` antes de qualquer coisa. Se não existir, pare e mande rodar `/benchmark-setup`.

**Escreva tudo no idioma declarado no config** e passe esse idioma a todos os subagents.

Você é o **orquestrador**. Não colete nada você mesma — delegue e monte o resultado.

**Como delegar:** cada papel abaixo tem um briefing em `references/agentes/<nome>.md`. Para acionar um, use a ferramenta `Agent` (tipo `general-purpose`) passando **o conteúdo do briefing** como prompt, mais os dados daquela chamada específica (o concorrente, a fonte, o ângulo) e o idioma do config. Cada agente roda em contexto próprio — é isso que permite disparar oito coletas em paralelo sem encher a sua janela.

## Fase 1 — Coleta, por trilha (paralela)

Dispare em **uma única mensagem** com múltiplas chamadas de `Agent`, só das trilhas ativas:

| Trilha | Despacho |
|---|---|
| `concorrentes` | um `agentes/coletor-concorrente.md` **por concorrente**, com nome, URL, razão de estar na lista e dimensões ativas |
| `visual` | um `agentes/curador-visual.md` **por fonte visual**, com o tema da busca e se há Playwright disponível |
| `inovacao` | um `agentes/scout-inovacao.md` **por ângulo**, com o contexto do config |

Cada um devolve JSON no schema de `references/schema.md`. Não aceite prosa.

**Conector ausente não derruba a rodada.** Se o Mobbin não estiver conectado, siga com as outras fontes. Se não houver Playwright, a galeria sai sem imagem. Registre no rodapé o que faltou.

## Fase 2 — Diff (só concorrentes e inovação)

Encontre o snapshot mais recente em `benchmark/snapshots/`.

- **Se não houver nenhum**: é a linha de base. Salve o snapshot, escreva um relatório de "estado atual do campo" e diga que os deltas começam na semana que vem.
- **Se houver**: chame o `agentes/diffador.md` com o snapshot anterior e a coleta de hoje.

**A trilha visual não passa pelo diffador.** Uma referência de UI não muda entre semanas — ela aparece. Comparar imagem com o mesmo mecanismo dos fatos produz ruído. A galeria é **curadoria acumulativa**: o curador já marcou o que é `nova` conferindo `benchmark/galeria/`, e é só isso que o relatório precisa saber.

## Fase 3 — Análise e verificação (pipeline, não barreira)

Para cada delta de `concorrentes` e cada evento de `inovacao`, em paralelo:

1. `agentes/analista.md` — por que importa **para este produto**, dada a decisão do config
2. `agentes/critico.md` — tenta derrubar o achado

**Todo achado marcado como `refutado`, `sem_fonte`, `artefato` ou `especulacao` é cortado.** Sem exceção. Conte quantos foram — vai no rodapé.

A trilha visual pula esta fase: o filtro dela é o próprio curador, que só traz referência com a frase de "que problema isto resolve".

## Fase 4 — Entrega

Chame o `agentes/editor.md` com os achados sobreviventes, a galeria, o config e o `historico.md`.

Depois:
- salve o snapshot bruto em `benchmark/snapshots/YYYY-MM-DD.json`
- acrescente 3–6 linhas em `benchmark/historico.md` (memória de longo prazo: padrões que se repetem)
- chame o `agentes/publicador.md` com o markdown do editor, a galeria e o config

O `agentes/publicador.md` entrega em três camadas — arquivo local, Artifact na URL estável, ping por e-mail — nessa ordem de confiabilidade. **Não aborte a rodada porque o e-mail não saiu.**

## Semana morta

Se nada relevante mudou, o relatório tem 4 linhas dizendo isso, listando o que foi verificado. **Não invente relevância para justificar a rodada.** Um "nada mudou" honesto é o que faz a pessoa confiar no relatório da semana em que algo mudou.

Uma trilha visual ativa quase nunca dá semana morta — sempre há referência nova. Isso não é motivo para inflar a trilha de concorrentes.

## Padrão de qualidade

Leia `references/qualidade.md` antes de aprovar a saída do editor.
