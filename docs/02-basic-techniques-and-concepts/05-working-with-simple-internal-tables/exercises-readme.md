# Exercícios — Aula 05: Trabalhando com Tabelas Internas Simples

## Instruções

Para cada exercício abaixo, crie uma nova [classe ABAP](../../../GLOSSARY.md#classe-abap-abap-class) global que implementa [`IF_OO_ADT_CLASSRUN`](../../../GLOSSARY.md#if_oo_adt_classrun) e escreva o código no método `if_oo_adt_classrun~main( )`. Ative com **Ctrl + F3** e execute com **F9**.

---

## Exercício 1: Lista de compras

Crie uma lista de compras usando uma tabela interna de strings.

1. Declare `DATA shopping_list TYPE TABLE OF string.`
2. Use `APPEND` para adicionar 5 itens: `Arroz`, `Feijão`, `Macarrão`, `Leite`, `Pão`.
3. Use `LOOP AT` para exibir cada item numerado com `sy-tabix`.
4. Exiba o total de itens usando `lines( shopping_list )`.

**Exemplo de saída:**
```
=== LISTA DE COMPRAS ===
1. Arroz
2. Feijão
3. Macarrão
4. Leite
5. Pão
---
Total: 5 itens
```

---

## Exercício 2: Calculadora de estatísticas

1. Declare `DATA scores TYPE TABLE OF i.`
2. Use `APPEND` para adicionar as notas: 85, 92, 78, 95, 88, 73, 90.
3. Calcule e exiba:
   - A soma de todas as notas (use `LOOP AT` para acumular).
   - A média (soma ÷ número de notas, use `lines( scores )`).
   - A maior nota (use `IF` dentro do loop comparando).
   - A menor nota.

**Desafio:** Use variáveis inline (`DATA(...)`) sempre que possível.

---

## Exercício 3: Acesso por índice com segurança

1. Declare `DATA cities TYPE TABLE OF string.`
2. Adicione: `São Paulo`, `Rio de Janeiro`, `Belo Horizonte`.
3. Teste o acesso por índice:
   - Acesse `cities[ 1 ]` e exiba — deve funcionar.
   - Dentro de um `TRY/CATCH`, tente acessar `cities[ 5 ]` e capture `cx_sy_itab_line_not_found`.
   - Exiba uma mensagem de erro amigável no CATCH.

**Exemplo de saída:**
```
Cidade 1: São Paulo
Erro ao acessar cidade 5: índice não encontrado!
```

---

## Exercício 4: Tabuada com tabela interna

1. Declare `CONSTANTS c_multiplier TYPE i VALUE 6.`
2. Declare `DATA multiplication_table TYPE TABLE OF string.`
3. Use `DO 10 TIMES` para gerar a tabuada do 6.
4. Em cada iteração, calcule `c_multiplier * sy-index` e use `APPEND` para adicionar uma string formatada à tabela:
   `|{ c_multiplier } x { sy-index WIDTH = 2 } = { c_multiplier * sy-index WIDTH = 2 }|`
5. Depois do loop, use `LOOP AT` para exibir a tabela.

---

## Exercício 5: Sequência de Fibonacci formatada

Implemente o exercício oficial da SAP: calcular os primeiros N números de Fibonacci e exibi-los formatados.

1. Declare `CONSTANTS max_count TYPE i VALUE 25.`
2. Declare `DATA numbers TYPE TABLE OF i.`
3. Use `DO max_count TIMES` com `CASE sy-index` para gerar a sequência.
4. Declare `DATA output TYPE TABLE OF string.`
5. Use `LOOP AT numbers INTO DATA(number)` e um contador manual para formatar:
   - Formato: `{ counter WIDTH = 3 ALIGN = RIGHT }: { number WIDTH = 8 ALIGN = RIGHT }`
6. Exiba com `out->write( data = output name = ... )`.

---

## Exercício 6: Mini-aplicativo de controle de gastos

1. Declare `DATA expenses TYPE TABLE OF p LENGTH 8 DECIMALS 2.`
2. Adicione 5 despesas simuladas: `'150.00'`, `'89.90'`, `'245.50'`, `'67.30'`, `'320.00'`.
3. Usando `LOOP AT` e acumuladores, calcule:
   - Total de gastos
   - Média de gastos
   - Quantidade de gastos acima de R$ 100,00
   - Maior gasto
4. Exiba um resumo formatado.

**Exemplo de saída:**
```
=== CONTROLE DE GASTOS ===
1. R$ 150.00
2. R$  89.90
3. R$ 245.50
4. R$  67.30
5. R$ 320.00
-------------------------
Total:          R$ 872.70
Média:          R$ 174.54
Acima de R$100: 3 gastos
Maior gasto:    R$ 320.00
=== FIM ===
```

---

## Perguntas de Reflexão

1. Por que tabelas internas no ABAP usam índice **1-based** e não 0-based como arrays em C#? Como isso afeta seu código?
2. Quando você usaria `APPEND` vs `INSERT` para adicionar dados a uma tabela interna?
3. Qual a diferença prática entre usar `DATA var TYPE TABLE OF i.` (declaração direta) e `TYPES tt TYPE TABLE OF i.` seguido de `DATA var TYPE tt.`?
4. Em que situação `sy-tabix` e `sy-index` teriam valores diferentes dentro de um `LOOP AT`?
