---
name: weekly-benchmark
description: Benchmark competitivo recorrente em três trilhas — concorrentes (preço, produto, posicionamento, reputação), referências visuais (Mobbin, Awwwards, Behance, Dribbble, Savee, ArchDaily) e inovação (notícias, regulação, capital, pesquisa). Configura por entrevista em português, inglês ou espanhol, roda toda semana comparando com a rodada anterior, verifica cada achado contra a fonte e publica um relatório visual. Use quando alguém quiser montar, rodar ou consultar um benchmark semanal, monitorar concorrentes, acompanhar referências de design ou UI, ou varrer inovação de um setor.
---

# Benchmark semanal

Pipeline de benchmark recorrente. Configura uma vez, roda toda semana, entrega um relatório curto onde toda afirmação tem fonte.

## Descubra o que fazer

Leia `benchmark/config.md` na pasta de trabalho.

| Situação | Faça |
|---|---|
| Não existe config, ou a pessoa quer (re)configurar | **Setup** — siga `references/setup.md` |
| Existe config e é hora de rodar | **Execução** — siga `references/run.md` |
| A pessoa quer saber o estado | **Status** — veja abaixo |

Se a pessoa pediu algo ambíguo ("faz o benchmark"), e já existe config, rode. Se não existe, faça o setup.

## Como este pipeline delega

Os papéis vivem em `references/agentes/`. Para acionar um, use a ferramenta `Agent` (tipo `general-purpose`) passando **o conteúdo do briefing** como prompt, junto com os dados daquela chamada e o idioma do config.

| Briefing | Papel |
|---|---|
| `coletor-concorrente.md` | estado atual de um concorrente, com fonte em todo fato |
| `coletor-mercado.md` | eventos transversais do setor |
| `curador-visual.md` | referências de UI e design de uma fonte, com screenshot e crédito |
| `scout-inovacao.md` | varredura de um ângulo: capital, regulação, tecnologia, pesquisa |
| `diffador.md` | o que mudou desde a rodada anterior |
| `analista.md` | por que um delta importa para este produto |
| `critico.md` | tenta derrubar cada achado antes de ele entrar no relatório |
| `editor.md` | monta o relatório |
| `publicador.md` | entrega em arquivo, Artifact e e-mail |

**Dispare em paralelo** — todas as coletas numa única mensagem com várias chamadas de `Agent`. Cada uma roda em contexto próprio, então oito concorrentes não enchem a sua janela.

## Status

Leia `benchmark/config.md`, liste `benchmark/snapshots/` e leia `benchmark/historico.md`. Responda curto: o que está sendo monitorado, quantas rodadas houve, quando foi a última, e quais padrões se repetiram. Sem config, mande fazer o setup.

## Os princípios que não se negociam

**O diff é o produto.** Coleta sem comparação é descrição do mercado — bonita e inútil.

**O crítico tem veto.** Todo achado passa por um agente cuja função é derrubá-lo. Sem fonte verificável, morre.

**Semana morta é entrega válida.** Nada mudou? Quatro linhas dizendo isso. Inflar rodada vazia destrói a confiança na rodada em que algo aconteceu.

**A trilha visual não passa pelo diff.** Referência de UI não muda entre semanas — ela aparece. É curadoria acumulativa.

**Nenhum conector ausente derruba a rodada.** Cada um degrada, e o rodapé diz o que faltou.

## Mapa dos arquivos

- `references/setup.md` — roteiro da entrevista e formato do config
- `references/run.md` — orquestração da rodada
- `references/perfis.md` — configurações recomendadas por tipo de projeto
- `references/fontes-visuais.md` — catálogo, com o que buscar e o que não buscar em cada fonte
- `references/conectores.md` — Mobbin MCP e Playwright: custo, permissão e degradação
- `references/schema.md` — formato fixo da coleta
- `references/qualidade.md` — os testes que o relatório precisa passar
- `references/design.md` — o sistema visual do relatório
- `assets/template.html` — esqueleto do relatório, para copiar e preencher
