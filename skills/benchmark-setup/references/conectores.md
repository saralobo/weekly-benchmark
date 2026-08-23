# Conectores

Dois conectores ampliam muito o que o plugin entrega. Nenhum é obrigatório, e **nenhum conector ausente pode derrubar uma rodada** — cada um degrada, e o relatório diz no rodapé o que faltou.

## Regra de conduta

- **Explique o custo antes**, nunca depois. Plano pago, download pesado, tempo de setup.
- **Peça permissão explicitamente** antes de rodar qualquer comando de instalação. A pessoa pode dizer não, e não é um problema.
- **Verifique se funcionou** e registre o resultado no config. Não presuma.

---

## Mobbin MCP

Ofereça **só se a pessoa escolher Mobbin** no catálogo de fontes visuais.

**O que é:** acesso direto e buscável a 621 mil telas e 142 mil fluxos de 1.651 apps que estão no ar. É a melhor base de padrões de produto real que existe.

**O custo, dito antes:** exige **plano pago do Mobbin** — Pro, a partir de cerca de €10/mês. Diga isso antes de qualquer comando. Se a pessoa não tem e não quer assinar, siga com Refero e Screenlane, que cobrem a mesma natureza em menor escala.

**Como conectar:**
```
claude mcp add mobbin --scope user --transport http https://api.mobbin.com/mcp
```
A primeira conexão dispara um fluxo OAuth no navegador. Não há API key para pedir — **nunca peça token, código ou URL de callback à pessoa.**

**Se a sessão for não-interativa**, o OAuth não roda. Avise que ela precisa autorizar numa sessão interativa e siga sem.

**Registre no config:** `mobbin (conector: ativo | indisponível | não escolhido)`.

---

## Playwright MCP

Ofereça **sempre que a trilha `visual` estiver ligada**.

**O que é:** controle de navegador, usado aqui para capturar screenshot das referências.

**Por que importa, em uma frase:** o Artifact bloqueia imagem de host externo, então sem captura a galeria vira uma lista de links — e a trilha visual perde a razão de existir.

**O custo, dito antes:** os binários de navegador ocupam **cerca de 700 MB** em disco. Diga o número.

**Como conectar:**
```
claude mcp add playwright npx @playwright/mcp@latest
```

**Se a pessoa recusar:** a trilha visual funciona em **modo degradado** — título, autor, link e uma descrição textual do padrão, sem imagem. Registre `Screenshots: não` no config e diga que dá para ligar depois a qualquer momento.

---

## Modo degradado, resumido

| Falta | O que acontece |
|---|---|
| Mobbin | Trilha visual usa as fontes web escolhidas. Rodapé registra a ausência. |
| Playwright | Galeria sem imagem: título, autor, link, descrição. Rodapé registra. |
| Gmail | Relatório existe em arquivo e Artifact; o ping não sai. Rodapé registra. |
| Tudo | O relatório em `benchmark/relatorios/` **sempre** sai. É a camada que nunca falha. |
