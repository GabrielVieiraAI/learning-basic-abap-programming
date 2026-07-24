# Exercícios — Aula 04: Usando Estruturas de Controle em ABAP

## Instruções

Para cada exercício abaixo, crie uma nova [classe ABAP](../../../GLOSSARY.md#classe-abap-abap-class) global que implementa [`IF_OO_ADT_CLASSRUN`](../../../GLOSSARY.md#if_oo_adt_classrun) e escreva o código no método `if_oo_adt_classrun~main( )`. Ative com **Ctrl + F3** e execute com **F9**.

---

## Exercício 1: Classificador de números

Crie um programa que classifica um número em positivo, negativo ou zero.

1. Declare uma constante `c_test_number` do tipo `i` com valor `-7`.
2. Use `IF/ELSEIF/ELSE/ENDIF` para classificar e exibir:
   - Se igual a zero: `O número é zero.`
   - Se positivo: `O número é positivo.`
   - Se negativo: `O número é negativo.`
3. Teste alterando `c_test_number` para `0`, `42` e `-7`.

---

## Exercício 2: Dias da semana com CASE

1. Declare `lv_dia` do tipo `i` com valor `4`.
2. Use `CASE/WHEN/ENDCASE` para exibir o nome do dia da semana em inglês:
   - `1` → `Monday`, `2` → `Tuesday`, ..., `7` → `Sunday`
   - Qualquer outro valor → `Dia inválido`
3. Teste com valores `1` a `8`.

---

## Exercício 3: Calculadora segura com TRY/CATCH

1. Declare `lv_num1 TYPE i VALUE 10` e `lv_num2 TYPE i VALUE 0`.
2. Dentro de um `TRY ... ENDTRY`, faça `lv_result = lv_num1 / lv_num2`.
3. Capture `cx_sy_zerodivide` e exiba `Erro: Divisão por zero!`.
4. Se não houver erro, exiba o resultado.
5. Teste com `lv_num2 = 0` (erro) e `lv_num2 = 2` (sucesso).

**Desafio extra:** Adicione um segundo `CATCH` para `cx_sy_conversion_no_number`. Teste atribuindo uma string a um inteiro dentro do `TRY`.

---

## Exercício 4: Tabuada com DO

1. Declare uma constante `c_tabuada` do tipo `i` com valor `7`.
2. Use `DO 10 TIMES` para gerar a tabuada do número.
3. Em cada iteração, calcule `c_tabuada * sy-index` e exiba no formato:
   `7 x 1 = 7`, `7 x 2 = 14`, ..., `7 x 10 = 70`.

**Dica:** Use um [template de string](../../../GLOSSARY.md#template-de-string-string-template) para formatar a saída.

---

## Exercício 5: Contagem regressiva com EXIT

1. Declare `lv_start` do tipo `i` com valor `10`.
2. Use um `DO` **sem** `TIMES`.
3. Dentro do loop:
   - Exiba o valor atual de `lv_start` usando `sy-index`.
   - Decremente `lv_start`.
   - Se `lv_start <= 0`, use `EXIT` para sair.
4. A saída deve ser:
   ```
   1: Contagem = 10
   2: Contagem = 9
   ...
   10: Contagem = 1
   ```

---

## Exercício 6: Mini-aplicativo de notas escolares

Combine **IF, CASE, TRY/CATCH e DO** em um único programa:

1. Crie uma constante `c_qtd_alunos TYPE i VALUE 5`.
2. Use `DO c_qtd_alunos TIMES` para simular 5 alunos.
3. Dentro do loop:
   - Use `CASE sy-index` para atribuir uma nota simulada a `lv_nota` (ex: aluno 1=95, 2=72, 3=88, 4=45, 5=60).
   - Use `IF/ELSEIF/ELSE` para classificar a nota (A: 90+, B: 70-89, C: 50-69, D: 30-49, F: <30).
   - Envolva a classificação em `TRY/CATCH` (simulando segurança, mesmo sem risco real).
4. Exiba no formato: `Aluno 1: Nota 95 → Classificação: A`

**Exemplo de saída esperada:**
```
=== BOLETIM ===
Aluno 1: Nota 95 → A - Excelente
Aluno 2: Nota 72 → B - Bom
Aluno 3: Nota 88 → B - Bom
Aluno 4: Nota 45 → D - Abaixo da média
Aluno 5: Nota 60 → C - Regular
=== FIM ===
```

---

## Perguntas de Reflexão

1. Em que situação você usaria `CASE` em vez de `IF/ELSEIF`? Dê um exemplo concreto.
2. O que acontece com o fluxo do programa se uma exceção ocorre **sem** `TRY/CATCH`? E **com** `TRY/CATCH`?
3. Por que `sy-index` começa em 1 e não em 0? Como isso afeta seu código ao acessar tabelas internas?
4. Qual a diferença entre usar `DO n TIMES` e usar `DO` com `EXIT`? Quando cada um é mais adequado?
