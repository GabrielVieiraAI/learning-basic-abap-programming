# Exercícios — Aula 02: Trabalhando com Objetos de Dados Básicos e Tipos de Dados

## Instruções

Para cada exercício abaixo, crie uma nova [classe ABAP](../../../GLOSSARY.md#classe-abap-abap-class) global que implementa [`IF_OO_ADT_CLASSRUN`](../../../GLOSSARY.md#if_oo_adt_classrun) e escreva o código no método `if_oo_adt_classrun~main( )`. Ative com **Ctrl + F3** e execute com **F9**.

---

## Exercício 1: Declaração de variáveis

Declare variáveis para armazenar os seguintes dados de um funcionário e exiba todas no console com `out->write( )`:

| Dado | Tipo ABAP adequado | Valor de exemplo |
|---|---|---|
| Nome completo | `string` | `'Maria Silva'` |
| Idade | `i` | `32` |
| Salário (com 2 casas decimais) | `p LENGTH 8 DECIMALS 2` | `'7500.50'` |
| Código do funcionário (5 dígitos) | `n LENGTH 5` | `'00123'` |
| Data de admissão | `d` | `'20240701'` |
| Ativo (sim/não) | `abap_bool` | `abap_true` |

---

## Exercício 2: Tipos locais com TYPES

1. Defina um tipo local `tp_cep` baseado em `n LENGTH 8`.
2. Defina um tipo local `tp_score` baseado em `i`.
3. Declare duas variáveis usando esses tipos locais:
   - `lv_meu_cep` do tipo `tp_cep` com valor `'01001000'`
   - `lv_meu_score` do tipo `tp_score` com valor `850`
4. Exiba ambas no console.
5. Use **F2** (ou **F3**) sobre `lv_meu_cep` e confirme que o tipo mostrado é `tp_cep`.

---

## Exercício 3: Constantes e CLEAR

1. Crie uma constante `lc_taxa_juros` do tipo `p LENGTH 3 DECIMALS 2` com valor `'5.25'`.
2. Crie uma variável `lv_valor` do tipo `p LENGTH 8 DECIMALS 2` com valor inicial `'1000.00'`.
3. Exiba ambas no console.
4. Atribua `lv_valor = '2500.00'` e exiba novamente.
5. Execute `CLEAR lv_valor` e exiba novamente.
6. Observe que `CLEAR` restaurou `lv_valor` para `0.00` (valor inicial do tipo `p`), **não** para `'1000.00'` (o `VALUE` da declaração).

**Pergunta:** O que aconteceria se você tentasse escrever `lc_taxa_juros = '6.00'`? Por quê?

---

## Exercício 4: Conversão implícita de tipo

1. Declare `lv_numero TYPE i`.
2. Atribua `lv_numero = '100'` e exiba — deve funcionar (texto numérico → inteiro).
3. Comente a linha anterior (use `"`) e atribua `lv_numero = 'XYZ'`.
4. **Execute e veja o erro em runtime.** Anote a mensagem de erro.
5. Descomente a linha problemática e execute novamente para limpar o erro.
6. Declare `lv_curto TYPE c LENGTH 4` e atribua `lv_curto = 'ABCDEFGH'`. Exiba o resultado. Qual valor aparece? Por quê?

---

## Exercício 5: Mini-aplicação de cadastro

Crie um programa que simula o cadastro de um produto:

1. Declare as variáveis:

| Campo | Tipo | Valor |
|---|---|---|
| Nome do produto | `string` | `` `Notebook XPS 15` `` |
| Preço unitário | `p LENGTH 8 DECIMALS 2` | `'4599.90'` |
| Quantidade em estoque | `i` | `25` |
| Código do produto | `c LENGTH 6` | `'NB-X15'` |
| Data do cadastro | `d` | data de hoje (use `sy-datum`) |

2. Calcule o valor total do estoque (`preço × quantidade`) usando uma **declaração inline** (`DATA(...)`).
3. Exiba todos os campos usando `out->write( )`, formatando as mensagens de forma legível.

**Exemplo de saída esperada:**

```
─── CADASTRO DE PRODUTO ───
Nome:      Notebook XPS 15
Preço:     4,599.90
Qtd:       25
Valor Total: 114,997.50
Código:    NB-X15
Data Cad:  24/07/2026
─── FIM ───
```

---

## Perguntas de Reflexão

1. Por que a SAP recomenda usar `string` em vez de `c` sempre que possível no ABAP moderno?
2. Qual a diferença prática entre um **text literal** (`'...'`) e um **string literal** (`` `...` ``)? Dê um exemplo onde a diferença importa.
3. Quando você usaria `TYPES` (tipo local) em vez de declarar a variável direto com um tipo built-in?
4. Por que conversões implícitas de tipo são perigosas? Cite dois riscos concretos que você observou nos exercícios.
