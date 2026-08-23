# Schema de coleta

Formato fixo. O diff só funciona se a semana 2 tiver a mesma forma da semana 1.

```json
{
  "entidade": "Nome do concorrente ou 'MERCADO'",
  "coletado_em": "2026-08-23",
  "dimensoes": {
    "produto": {
      "features_visiveis": ["..."],
      "lancamentos_recentes": [
        {"o_que": "...", "data": "2026-08-19", "fonte": "https://..."}
      ]
    },
    "preco": {
      "planos": [
        {"nome": "Pro", "valor": "R$ 89", "periodicidade": "mês", "inclui": ["..."], "fonte": "https://..."}
      ],
      "promocoes": []
    },
    "posicionamento": {
      "headline": "texto literal do site",
      "promessa": "...",
      "publico_declarado": "...",
      "fonte": "https://..."
    },
    "conteudo": {
      "canais_ativos": ["..."],
      "temas_recorrentes": ["..."],
      "posts_notaveis": [{"o_que": "...", "data": "...", "fonte": "..."}]
    },
    "reputacao": {
      "elogios_recorrentes": ["..."],
      "reclamacoes_recorrentes": ["..."],
      "fontes": ["..."]
    },
    "mercado": {
      "eventos": [{"o_que": "...", "data": "...", "tipo": "funding|regulacao|tecnologia|movimento", "fonte": "..."}]
    }
  },
  "nao_verificado": ["coisas que você suspeita mas não conseguiu confirmar"],
  "falhas": ["páginas que não abriram, paywalls, bloqueios"]
}
```

## Regras

- Só inclua dimensões que estão ativas no config.
- **Todo item factual precisa de `fonte` com URL.** Sem URL, o item vai para `nao_verificado`.
- Copie texto literal em `headline` e `valor` — não parafraseie. Paráfrase quebra o diff: gera mudança falsa toda semana.
- Datas em `YYYY-MM-DD`. Se a fonte não datar, use `null`, nunca a data de hoje.
- `falhas` nunca fica vazio por conveniência. Se algo não abriu, registre. Silêncio sobre falha vira buraco invisível no relatório.
