# Setup do benchmark semanal

Seu trabalho é **produzir um `benchmark/config.md` bom**. Um config raso gera relatórios rasos por meses. Vale gastar 10 minutos aqui.

## Como conduzir

- **Uma pergunta por vez.** Nunca despeje um formulário.
- **Não pergunte o que você pode descobrir.** Deu a URL do produto? Leia o site, deduza o setor, o público e os prováveis concorrentes. Chegue com hipótese: *"Pelo site, parece SaaS B2B de gestão financeira; sugiro estas trilhas, estas dimensões e estas fontes — o que muda?"* A pessoa corrige mais rápido do que responde.
- **Instrua, não só colete.** Você conhece os trade-offs; ela não. Diga qual setup recomenda e por quê. Consulte `references/perfis.md`.
- **Insista na pergunta de decisão.** Sem saber que decisão o relatório alimenta, ele vira enciclopédia.
- `AskUserQuestion` quando as opções são fechadas; texto livre quando é descoberta.

## Roteiro

### 0. Idioma — antes de tudo
`AskUserQuestion`: **Português, Inglês, Espanhol.** Toda a entrevista, o relatório, a análise e o e-mail saem nesse idioma. Pergunte primeiro e siga no idioma escolhido a partir da resposta.

### 1. O produto
O que é, para quem, em uma frase. Peça o link e **leia o site** antes de continuar.

### 2. A decisão
"Quando o relatório chegar na segunda, que decisão ele vai te ajudar a tomar?" Roadmap, pricing, posicionamento, campanha, investimento, repertório de design.

### 3. Proponha o perfil
Com base no site, classifique usando `references/perfis.md` e proponha **trilhas + dimensões + fontes de uma vez**, com a justificativa de cada escolha. Deixe a pessoa cortar.

### 4. Trilhas
Confirme quais ligar:
- **`concorrentes`** — o que empresas específicas mudam: preço, produto, posicionamento, conteúdo, reputação
- **`visual`** — referências de UI, design e arquitetura, entregues como galeria de imagens
- **`inovacao`** — notícias, artigos, regulação, pesquisa e movimento de capital do setor

**Não incentive ligar tudo.** Três trilhas com seis fontes faz uma rodada longa e um relatório disperso. Diga isso se a pessoa pedir tudo.

### 5. Se `concorrentes` estiver ligada
Quem são — você propõe a partir da pesquisa, ela corta e adiciona. Para cada um: nome, URL e **por que está na lista** (concorrente direto? referência de execução? ameaça futura?). Essa razão muda o que o coletor procura.

Dimensões: `produto`, `preco`, `posicionamento`, `conteudo`, `reputacao`.

### 6. Se `visual` estiver ligada
- **O tema da busca.** Específico: "onboarding de fintech", "dashboards densos", "varejo de rua". Genérico produz galeria genérica.
- **As fontes.** Mostre `references/fontes-visuais.md` e recomende de 3 a 5, explicando o que cada uma serve e o que não serve.
- **Os conectores.** Siga `references/conectores.md`: ofereça Mobbin só se ela escolher Mobbin (e diga que exige plano pago **antes** de qualquer comando), e ofereça Playwright sempre (dizendo que são ~700MB e por que sem ele a galeria vira lista de links). **Peça permissão antes de instalar qualquer coisa.** Verifique se funcionou e registre no config.

### 7. Se `inovacao` estiver ligada
Qual o contexto a varrer, e quais ângulos interessam: capital, regulação, tecnologia, comportamento, entrantes, pesquisa. Recomende de 3 a 4 — todos os seis é varredura rasa.

### 8. Gatilhos de urgência
"O que teria que acontecer para você querer ser avisada no mesmo dia?"

### 9. Entrega
Dia e hora, e quem lê. O relatório sempre vai para arquivo local e para um Artifact de URL fixa; pergunte se quer também um ping curto por e-mail e para qual endereço.

### 10. Fontes proibidas ou obrigatórias
Sites que ela já acompanha, ou que não quer ver.

## Saída

Escreva `benchmark/config.md` neste formato exato — o pipeline lê estes cabeçalhos:

```markdown
# Config do benchmark semanal

## Idioma
pt

## Produto
<uma frase> — <url>

## Decisão que este benchmark alimenta
<frase>

## Trilhas ativas
- concorrentes
- visual
- inovacao

## Concorrentes
| Nome | URL | Por que está na lista |
|---|---|---|

## Dimensões ativas
- produto
- preco

## Tema da busca visual
<específico>

## Fontes visuais
- mobbin (conector: ativo | indisponível | não escolhido)
- awwwards
- savee

## Ângulos de inovação
- regulacao
- tecnologia

## Conectores
Screenshots: sim | não (Playwright recusado)

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

Crie também `benchmark/snapshots/`, `benchmark/relatorios/`, `benchmark/galeria/` (vazias) e `benchmark/historico.md` com o cabeçalho `# Histórico`.

## Fechamento

Mostre o config e confirme antes de agendar. Explique que dá para agendar com a skill `schedule` rodando `/benchmark-run`, e ofereça fazer isso. Avise que a **primeira execução é a linha de base**: não vai ter diff, e isso é esperado.
