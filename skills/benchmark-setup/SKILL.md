---
name: benchmark-setup
description: Entrevista o usuário sobre o projeto, produto e objetivos dele e gera o benchmark.config.md que dirige todo o pipeline de benchmark semanal. Use quando alguém quiser configurar, iniciar ou reconfigurar um benchmark recorrente de concorrentes ou de mercado.
---

# Setup do benchmark semanal

Seu trabalho aqui é **produzir um `benchmark/config.md` bom**. Um config raso gera relatórios rasos por meses. Vale gastar 10 minutos aqui.

## Regras da entrevista

- **Uma pergunta por vez.** Nunca despeje um formulário.
- **Pesquise antes de perguntar.** Se a pessoa disser o nome do produto, procure na web e volte com "achei X, Y e Z como concorrentes — quais fazem sentido?" em vez de pedir a lista em branco. Chegar com hipótese vale mais que chegar com formulário.
- **Insista na pergunta de decisão.** Se você não descobrir que decisão esse benchmark alimenta, o relatório vira enciclopédia.
- Use `AskUserQuestion` quando as opções forem fechadas; texto livre quando for descoberta.

## Roteiro

1. **O produto.** O que é, para quem, em uma frase. Peça um link se existir e leia.
2. **A decisão.** "Quando o relatório chegar na segunda, que decisão ele vai te ajudar a tomar?" Roadmap, pricing, posicionamento, campanha, investimento. Isso define o formato da entrega.
3. **Os concorrentes.** Você propõe a partir da pesquisa; a pessoa corta e adiciona. Para cada um, capture: nome, URL, e **por que ele está na lista** (concorrente direto? referência de execução? ameaça futura?). Essa razão muda o que o coletor procura.
4. **As dimensões.** Quais ligar — ofereça e explique o custo de ligar tudo:
   - `produto` — features novas, changelog, releases
   - `preco` — tabelas de preço, planos, promoções
   - `posicionamento` — headline, copy do site, promessa central
   - `conteudo` — blog, social, formatos, temas
   - `reputacao` — reviews, reclamações, comunidades
   - `mercado` — notícias do setor, funding, regulação, tecnologia (não é por concorrente, é transversal)
5. **Os sinais que importam.** "O que teria que mudar num concorrente para você querer ser avisada no mesmo dia?" Vira a lista de gatilhos de urgência.
6. **Entrega.** Dia e hora da rodada, e quem lê. O relatório sempre vai para arquivo local e para um Artifact com URL fixa; pergunte se ela quer também um ping curto por e-mail e para qual endereço.
7. **Fontes proibidas ou obrigatórias.** Sites que ela já acompanha, ou fontes que não quer.

## Saída

Escreva `benchmark/config.md` com este formato exato — o pipeline de execução lê estes cabeçalhos:

```markdown
# Config do benchmark semanal

## Produto
<uma frase> — <url>

## Decisão que este benchmark alimenta
<frase>

## Concorrentes
| Nome | URL | Por que está na lista |
|---|---|---|

## Dimensões ativas
- produto
- preco

## Gatilhos de urgência
- <ex: qualquer concorrente muda preço do plano de entrada>

## Entrega
Quando: <toda segunda, 8h>
Leitores: <quem>
E-mail: <endereço, ou "não">
Artifact URL: <vazio — preenchido pelo pipeline na primeira publicação; não edite>

## Fontes
Obrigatórias: <...>
Proibidas: <...>
```

Crie também `benchmark/snapshots/` (vazia) e `benchmark/historico.md` com só o cabeçalho `# Histórico`.

## Depois de escrever

Mostre o config para a pessoa e pergunte se está certo antes de agendar. Então explique que ela pode agendar com a skill `schedule` rodando `/benchmark-run` no dia escolhido — e ofereça fazer isso. Diga também que a **primeira execução é a linha de base**: não vai ter diff, e isso é esperado.
