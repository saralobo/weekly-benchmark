# weekly-benchmark — versão skill

Mesmo pipeline do plugin, empacotado como skill para instalar direto no Claude Desktop.

## Instalar no Claude Desktop

1. Compacte esta pasta: `zip -r weekly-benchmark.zip weekly-benchmark`
2. **Configurações → Personalizar → Habilidades → adicionar**, e suba o zip.
3. No chat, digite `/weekly-benchmark` — ou só peça "monta um benchmark semanal do meu produto".

Sem marketplace e sem cache no meio: a skill lê do que você subiu.

## Diferença para o plugin

| | Plugin | Skill |
|---|---|---|
| Instalação | marketplace via git | upload direto |
| Comandos | `/benchmark-setup`, `/benchmark-run`, `/benchmark-status` | `/weekly-benchmark`, que roteia sozinho |
| Agentes | subagentes nomeados, com ferramentas restritas por papel | briefings em `references/agentes/`, passados ao `Agent` |
| Paralelismo e contexto isolado | sim | sim |

O comportamento é o mesmo. O que a skill perde é a restrição de ferramentas por agente — detalhe aqui, já que todos os papéis precisam basicamente de leitura web e escrita de arquivo.
