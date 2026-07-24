# Exercícios — Aula 03: Processando Dados

## Instruções

Para cada exercício abaixo, crie uma nova [classe ABAP](../../../GLOSSARY.md#classe-abap-abap-class) global que implementa [`IF_OO_ADT_CLASSRUN`](../../../GLOSSARY.md#if_oo_adt_classrun) e escreva o código no método `if_oo_adt_classrun~main( )`. Ative com **Ctrl + F3** e execute com **F9**.

---

## Exercício 1: Calculadora simples

Crie uma mini-calculadora que realiza as 4 operações básicas com dois números e exibe os resultados formatados.

1. Declare duas variáveis inteiras: `lv_a` e `lv_b` com valores de sua escolha (ex: `15` e `4`).
2. Declare uma variável `lv_result` do tipo `p LENGTH 8 DECIMALS 2` para o resultado.
3. Calcule e exiba com `out->write( )` usando templates de string:
   - Soma: `15 + 4 = 19.00`
   - Subtração: `15 - 4 = 11.00`
   - Multiplicação: `15 * 4 = 60.00`
   - Divisão: `15 / 4 = 3.75`

**Exemplo de saída esperada:**
```
=== CALCULATOR ===
15 + 4 = 19.00
15 - 4 = 11.00
15 * 4 = 60.00
15 / 4 = 3.75
```

---

## Exercício 2: Formatação de data de nascimento

1. Declare uma variável `lv_birthdate` do tipo `d` com sua data de nascimento no formato interno `YYYYMMDD` (ex: `'19900115'`).
2. Exiba a data em **três formatos diferentes**:
   - Formato raw (interno): `19890115` (exemplo)
   - Formato ISO: `1989-01-15`
   - Formato USER: depende do seu locale
3. Use **uma única variável** `DATA(lv_text)` reatribuída para cada formato (comente/descomente as linhas).

---

## Exercício 3: Concatenação criativa

Crie uma saudação personalizada usando concatenação:

1. Declare:
   ```abap
   DATA lv_greeting TYPE string VALUE `Bom dia`.
   DATA lv_name     TYPE string VALUE `Gabriel`.
   DATA lv_message  TYPE string VALUE `bem-vindo ao curso de ABAP`.
   ```
2. Usando **apenas concatenação** (`&&`), monte a frase:
   `Bom dia, Gabriel! Seja bem-vindo ao curso de ABAP.`
3. Exiba o resultado com `out->write( )`.

**Dica:** Você precisará adicionar vírgula, espaço, exclamação e ponto final manualmente com literais.

---

## Exercício 4: Formatação de números científicos

1. Declare uma variável `lv_value` do tipo `p LENGTH 8 DECIMALS 4` com valor `'0.00042'`.
2. Exiba o valor em 4 formatos diferentes:
   - Raw (sem formatação)
   - Com `NUMBER = USER`
   - Com `STYLE = SCIENTIFIC`
   - Com `STYLE = ENGINEERING`
3. Compare as diferenças entre `SCIENTIFIC` e `ENGINEERING`.

---

## Exercício 5: Mini-aplicação de pedido

Crie um programa que simula o cálculo de um pedido:

1. Declare:
   - `lv_product` (string) = `` `Mouse Gamer` ``
   - `lv_unit_price` (`p LENGTH 8 DECIMALS 2`) = `'129.90'`
   - `lv_quantity` (`i`) = `3`
   - `lv_discount` (`p LENGTH 3 DECIMALS 2`) = `'10.00'` (10%)

2. Calcule usando **declaração inline** (`DATA(...)`):
   - `lv_subtotal` = preço × quantidade
   - `lv_discount_amount` = subtotal × desconto / 100
   - `lv_total` = subtotal − valor do desconto
   - `lv_receipt` = template de string formatando todo o recibo

3. Exiba o recibo completo.

**Exemplo de saída esperada:**
```
=== RECIBO ===
Produto:    Mouse Gamer
Preço unit: 129.90
Quantidade: 3
Subtotal:   389.70
Desconto:   10.00%
Valor desc: 38.97
TOTAL:      350.73
=== FIM ===
```

---

## Perguntas de Reflexão

1. Por que `10 / 3` com `TYPE i` resulta em `3` e não `3.33`? O que você precisa mudar para obter casas decimais?
2. Qual a diferença entre usar `&&` e usar um template de string com `|...|`? Em que situação cada um é mais adequado?
3. O que acontece se você escrever `|{variavel}|` (sem espaços dentro das chaves)? Por quê?
4. Por que as opções de formatação (`DATE =`, `NUMBER =`) são úteis? Dê um exemplo concreto de onde você usaria cada uma.
