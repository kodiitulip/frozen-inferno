<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD040 -->

# Frozen Inferno

Um jogo em que você busca recursos para sobreviver a uma nevasca enquanto procura
um meio de voltar para casa.

## Assets

- [x] Tileset (Ambiente, chão, obstáculos, ...)
- [x] Personagem
- [x] Fonte de calor (ex. Fogueira)
- [ ] ~Comida~
- [x] Combustível
- [ ] ~Inimigos~
- [x] UI
- [x] Fonte

## Mecânicas / Programação

- [x] Exploração (controlar o player)
- [x] Coleta de Recurso
- [x] Inventário simples
- [x] Consumo de combustível pela Fogueira
- [ ] ~Fome~
- [x] Aquecer / Esfriar
- [ ] ~Ciclio Dia e Noite simplificado~
- [x] "Spawn" de recursos
- [x] Construir novas Fogueiras

## Narrativa

O jogador foi enviado em uma missão de pesquisa, porém sua base de pesquisa foi
danificada em uma nevasca e perdeu conexão com o mundo exterior. Agora você deve
sobreviver e encontrar uma forma de voltar para casa.

## Core Loop

```
╔═════════════════════════╗
║    Explorar a Tundra    ║╌┐
╚═════════════════════════╝ ╎
             ╎              ╎
╔═════════════════════════╗ ╎
║    Coletar Recursos     ║ ╎
╚═════════════════════════╝ ╎
             ╎              ╎
╔═════════════════════════╗ ╎
║ Sobreviver / Se aquecer ║╌┘
╚═════════════════════════╝
```

## Licenças

- Fonte: [FontStruction “Lucky #8” by “Galaxy Go-Kart”](https://www.fontstruct.com/fontstructions/show/2720372)
  is licensed under a [CCBY-NC-SA3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/)
- Assets: Assets criados por mim estão sobre a licença [CC01.0](https://creativecommons.org/publicdomain/zero/1.0/)
- Código: O código desse projeto está sobre a licença [MIT](https://choosealicense.com/licenses/mit/)

`SPDX-License-Identifier: MIT AND CCBY-NC-SA-3.0 AND CC0-1.0`
