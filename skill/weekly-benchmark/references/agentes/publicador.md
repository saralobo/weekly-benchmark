# publicador

> Publica o relatório do benchmark em camadas — arquivo local, Artifact na URL estável e ping curto por e-mail. Use no fim do pipeline de benchmark semanal.

Você entrega o relatório **no idioma declarado no config** — assunto de e-mail e título do Artifact incluídos. A regra que governa tudo: **entregue da camada mais confiável para a mais frágil, e nunca deixe uma falha de canal apagar o trabalho.**

## Camada 1 — Arquivo (nunca falha)

Salve o markdown em `benchmark/relatorios/YYYY-MM-DD.md`. Faça isso **primeiro**, antes de qualquer publicação. Se tudo o mais der errado, o relatório existe.

## Camada 2 — Artifact (a entrega de verdade)

**Leia `skills/benchmark-run/references/design.md` e parta de `skills/benchmark-run/assets/template.html`.** O template já traz os tokens, a escala tipográfica e os componentes prontos — copie e preencha, não reinvente. Carregue o skill `artifact-design` também.

1. Procure a URL do Artifact em `benchmark/config.md`, campo `Artifact URL`.
2. **Se existir:** escreva o HTML em `benchmark/relatorio.html` e publique passando `url` — republica na mesma URL. O link que a pessoa guardou continua valendo.
3. **Se não existir:** publique sem `url`, e grave a URL retornada no config. Só acontece uma vez.

Regras da página:
- **Estrutura em seções full-bleed que alternam de chão** (marca → claro → escuro → claro). É a lei central do sistema; não colapse tudo numa página só de um fundo.
- **O hero é uma declaração**, não um rótulo. "O plano grátis está desaparecendo", não "Benchmark semanal". A frase sai do achado mais importante da semana.
- `<title>` estável entre semanas — é o nome, não a data. A data vai no corpo.
- Mesmo `favicon` sempre. Trocar o ícone faz parecer outra página.
- Quando houver 3+ snapshots, inclua um gráfico de evolução do que dá pra medir (preço por plano, contagem de features). **A série temporal é a coisa que só o Artifact entrega** — não desperdice. Carregue o `dataviz` antes de desenhar.
- **Imagens da galeria entram como `data:` URI em JPEG**, nunca como link. A CSP do Artifact bloqueia host externo: hotlink do Dribbble renderiza quadrado vazio. Gere o data URI com `base64 -i <arquivo>`.
- **Orçamento de imagem: ~8MB** (o teto do Artifact é 16MB e o resto da página também conta). Se estourar, corte as referências mais fracas e **diga no rodapé quantas foram cortadas** — nunca publique uma página quebrada.
- Autocontido no resto: CSS inline, SVG inline. A única exceção permitida é a fonte Inter pelo Google Fonts.
- Fonte: SF Pro pela stack nativa `-apple-system`, Inter como fallback. Nunca caia em Arial.
- Tema claro e escuro, ambos definidos nos tokens.

Se a publicação falhar, siga em frente com o e-mail apontando para o arquivo. Registre a falha no rodapé.

## Camada 3 — E-mail (o ping)

Só se `Entrega > E-mail` estiver preenchido no config.

Máximo 4 linhas. Não é o relatório, é o aviso de que ele existe:

```
Benchmark da semana: 3 achados, 1 urgente.
<a linha mais importante, em uma frase>
Relatório completo: <url do artifact>
```

Assunto: `Benchmark <semana> — <N> achados<, 1 urgente se houver>`. A pessoa precisa decidir se abre agora só pelo assunto.

**Em semana morta o e-mail vai mesmo assim**, dizendo que nada mudou. Silêncio é ambíguo — a pessoa não sabe se nada aconteceu ou se o pipeline quebrou.

## Se um conector não estiver disponível

Execuções agendadas (cron, headless) podem não ter Gmail autenticado. **Isso não é erro fatal.** Registre no relatório que o ping não saiu e continue. Nunca aborte o pipeline por causa da camada mais frágil.

## Saída

Relate o que saiu em cada camada: caminho do arquivo, URL do Artifact, e-mail enviado ou não — e o motivo, se não.
