# Aula 04: Usando Estruturas de Controle em ABAP

## 🎯 Objetivos de Aprendizagem

Depois de completar esta aula, você será capaz de:

- Implementar desvios condicionais.
- Tratar exceções.
- Implementar iterações.

---

## 📖 Guia Passo a Passo: Condições, Exceções e Loops

### 🧭 Antes de começar: controlando o fluxo do programa

Até agora, seus programas ABAP executavam **sempre as mesmas instruções, na
mesma ordem, do início ao fim**. Isso é útil para demonstrações, mas programas
reais precisam **tomar decisões** e **repetir tarefas**. É aqui que entram as
**estruturas de controle** (_control structures_): mecanismos da linguagem que
permitem desviar, repetir ou interromper o fluxo de execução com base em
condições.

Três grandes famílias de estruturas de controle no ABAP:

1. **Desvios condicionais** (_conditional branching_): execute este bloco **se**
   uma condição for verdadeira, senão execute aquele outro.
2. **Tratamento de exceções** (_exception handling_): proteja seu código contra
   erros previsíveis em tempo de execução.
3. **Iterações** (_iterations_): repita um bloco de código várias vezes, com
   controle de quantas vezes ou até que uma condição seja atingida.

> 💡 **Analogia .NET:** No C#, você tem `if/else`, `switch/case`, `try/catch`,
> `for`, `while`, `foreach`. O ABAP tem os equivalentes com nomes diferentes:
> `IF/ELSEIF/ELSE/ENDIF`, `CASE/WHEN/ENDCASE`, `TRY/CATCH/ENDTRY`,
> `DO/ENDDO`, `LOOP/ENDLOOP`. A lógica é idêntica — o que muda é a sintaxe
> (blocos terminados explicitamente com `END*`).

---

### 🔧 O que você vai usar

| Ferramenta/Conceito | Para que serve | Análogo no mundo .NET |
|---|---|---|
| **`IF ... ENDIF`** | Desvio condicional simples ou com múltiplos ramos (`ELSEIF`, `ELSE`) | `if / else if / else` |
| **`CASE ... ENDCASE`** | Desvio condicional por valor exato de uma variável | `switch / case` |
| **`TRY ... CATCH ... ENDTRY`** | Capturar e tratar exceções em runtime | `try / catch` |
| **`DO ... ENDDO`** | Loop com número fixo de repetições (`TIMES`) ou com condição de saída (`EXIT`) | `for`, `while` |
| **`LOOP ... ENDLOOP`** | Percorrer linhas de uma tabela interna | `foreach` |
| **`sy-index`** | Contador de iteração (built-in, começa em 1) | `i` em `for (int i = 0; ...)` |

---

### 📋 Pré-requisitos

Antes de começar esta aula, você precisa ter:

1. Saber declarar variáveis com [`DATA`](../../../GLOSSARY.md#data-statement) e [`CONSTANTS`](../../../GLOSSARY.md#constants-statement) ([Aula 02](../02-working-with-basic-data-objects-and-data-types/)).
2. Saber usar [templates de string](../../../GLOSSARY.md#template-de-string-string-template) para saída formatada ([Aula 03](../03-processing-data/)).
3. Saber criar uma [classe ABAP](../../../GLOSSARY.md#classe-abap-abap-class) com [`IF_OO_ADT_CLASSRUN`](../../../GLOSSARY.md#if_oo_adt_classrun) e executar com **F9**.

---

### 🪜 Passo 1: Tomar decisões com `IF ... ENDIF`

A estrutura `IF` é o bloco de decisão mais fundamental do ABAP:

```abap
IF <condição_lógica>.
  " código executado se a condição for verdadeira
ELSEIF <outra_condição>.
  " código executado se a condição anterior for falsa e esta for verdadeira
ELSE.
  " código executado se nenhuma condição anterior for verdadeira
ENDIF.
```

**Funcionamento:**
1. O runtime avalia a condição após `IF`. Se for verdadeira, executa o bloco correspondente e **pula** para depois do `ENDIF`.
2. Se for falsa, avalia a condição após `ELSEIF` (pode ter quantos quiser).
3. Se nenhuma condição for verdadeira, executa o bloco `ELSE` (se existir).

```abap
DATA(lv_number) = 0.

IF lv_number = 0.
  out->write( `O valor é zero` ).
ELSEIF lv_number > 0.
  out->write( `O valor é positivo` ).
ELSE.
  out->write( `O valor é negativo` ).
ENDIF.
```

> ⚠️ **Importante:** Diferente de muitas linguagens, no ABAP cada condição
> lógica — inclusive o `ELSE` — **termina com ponto final** (`.`).
> `IF condição.` ✅ — esquecer o `.` é erro de sintaxe.

> 💡 **Analogia .NET:** `IF ... ELSEIF ... ELSE ... ENDIF.` = `if (...) { }
> else if (...) { } else { }` em C#. A diferença é que o ABAP exige o
> `ENDIF.` explícito (como o `endif` do PHP ou `end` do Ruby) e o `.` após
> cada condição.

---

### 🪜 Passo 2: Construir condições lógicas

Condições lógicas são expressões que o runtime avalia como **verdadeiras** ou
**falsas**. Os operadores de comparação no ABAP:

| Operador ABAP | Significado | Exemplo |
|---|---|---|
| `=` | Igual | `lv_x = lv_y` |
| `<>` | Diferente | `lv_x <> lv_y` |
| `>` | Maior que | `lv_x > lv_y` |
| `<` | Menor que | `lv_x < lv_y` |
| `>=` | Maior ou igual | `lv_x >= lv_y` |
| `<=` | Menor ou igual | `lv_x <= lv_y` |
| `BETWEEN ... AND` | Intervalo | `lv_x BETWEEN 1 AND 10` |

**Operadores lógicos para combinar condições:**

```abap
IF lv_x > 0 AND lv_x < 100.        " ambas verdadeiras
IF lv_x < 0 OR lv_x > 100.         " pelo menos uma verdadeira
IF NOT lv_x IS INITIAL.             " negação
```

**Expressões lógicas especiais do ABAP:**

```abap
IF lv_name IS INITIAL.              " variável contém valor inicial do tipo?
IF lv_name IS NOT INITIAL.          " variável NÃO contém valor inicial?
IF lv_value BETWEEN 1 AND 100.      " valor está no intervalo?
```

> ⚠️ **Importante:** O ABAP usa `=` tanto para **atribuição** (`lv_x = 5.`)
> quanto para **comparação** (`IF lv_x = 5.`). O contexto diferencia: depois
> de `IF` é comparação; em uma instrução isolada, é atribuição. Isso é
> diferente do C#, onde `=` é atribuição e `==` é comparação.

> 💡 **Analogia .NET:** `=` no ABAP = `==` no C# quando dentro de um `IF`.
> `IS INITIAL` = `== default` / `== null` / `== 0` (depende do tipo).
> `BETWEEN x AND y` = `>= x && <= y`.

---

### 🪜 Passo 3: Usar `CASE ... ENDCASE` para múltiplos valores

Quando você precisa comparar uma **única variável** com vários valores
possíveis, `CASE` é mais limpo que um `IF` longo:

```abap
CASE lv_number.
  WHEN 0.
    out->write( `Zero` ).
  WHEN 1.
    out->write( `Um` ).
  WHEN 2.
    out->write( `Dois` ).
  WHEN OTHERS.
    out->write( `Outro valor` ).
ENDCASE.
```

| Parte | Significado |
|---|---|
| `CASE variável.` | Variável a ser comparada |
| `WHEN valor.` | "Se for igual a este valor..." |
| `WHEN OTHERS.` | "Para qualquer outro valor..." (opcional, como `default` no C#) |

> 💡 **Analogia .NET:** `CASE ... ENDCASE` = `switch (...) { case ... break;
> default: ... }` em C#. `WHEN OTHERS` = `default`. Assim como no C#,
> qualquer `CASE` pode ser reescrito como `IF/ELSEIF` — use `CASE` quando
> a decisão depende de uma única variável com valores discretos.

---

### 🪜 Passo 4: Executar exercício — Conditional Branching

1. Crie uma nova classe global com `IF_OO_ADT_CLASSRUN`.
2. Copie este código:

```abap
    CONSTANTS c_number TYPE i VALUE 0.
*    CONSTANTS c_number TYPE i VALUE 1.
*    CONSTANTS c_number TYPE i VALUE 2.
*    CONSTANTS c_number TYPE i VALUE -1.

    " Example 1: Simple IF ... ENDIF
    out->write( `Example 1: Simple IF ... ENDIF` ).

    IF c_number = 0.
      out->write( `The value of C_NUMBER equals zero` ).
    ELSE.
      out->write( `The value of C_NUMBER is NOT zero` ).
    ENDIF.

    " Example 2: IF ... ELSEIF ... ELSE
    out->write( `Example 2: IF ... ELSEIF ... ELSE` ).

    IF c_number = 0.
      out->write( `Zero` ).
    ELSEIF c_number > 0.
      out->write( `Positive` ).
    ELSE.
      out->write( `Negative` ).
    ENDIF.

    " Example 3: CASE ... ENDCASE
    out->write( `Example 3: CASE ... ENDCASE` ).

    CASE c_number.
      WHEN 0.
        out->write( `Zero` ).
      WHEN 1.
        out->write( `One` ).
      WHEN 2.
        out->write( `Two` ).
      WHEN OTHERS.
        out->write( `Other value` ).
    ENDCASE.
```

3. **Ctrl + F3** e **F9**.
4. Altere o valor de `c_number` (descomente outras linhas) e veja como o fluxo muda.

---

### 🪜 Passo 5: Tratar exceções com `TRY ... CATCH ... ENDTRY`

No ABAP, uma **exceção** (_exception_) é uma situação de erro durante a
execução. Sem tratamento, exceções causam **runtime errors** (dumps) que
abortam o programa.

A estrutura `TRY ... CATCH` protege seu código:

```abap
TRY.
    " bloco TRY: código que pode lançar exceção
    result = 'ABC'.   " 💥 vai lançar exceção de conversão
    out->write( result ).
  CATCH cx_sy_conversion_no_number.
    " bloco CATCH: executado se a exceção específica ocorrer
    out->write( `Erro: não é um número!` ).
ENDTRY.
```

**Funcionamento:**
1. Se nenhuma exceção ocorre no bloco `TRY`, os blocos `CATCH` são ignorados e a execução continua após `ENDTRY`.
2. Se ocorre uma exceção e há um `CATCH` correspondente, o bloco `CATCH` é executado e o programa **não aborta**.
3. Se ocorre uma exceção sem `CATCH` correspondente, o programa aborta com dump.

**Exceções comuns do sistema:**

| Classe de exceção | Quando ocorre |
|---|---|
| `cx_sy_conversion_no_number` | Converter texto não numérico para número |
| `cx_sy_zerodivide` | Divisão por zero |
| `cx_sy_itab_line_not_found` | Acessar linha inexistente de tabela interna |

> 💡 **Analogia .NET:** `TRY ... CATCH ... ENDTRY` = `try { } catch
> (SpecificException) { }` em C#. As classes como `cx_sy_zerodivide`
> são equivalentes a `DivideByZeroException` no .NET.

---

### 🪜 Passo 6: Executar exercício — Exception Handling

1. Crie uma nova classe global com `IF_OO_ADT_CLASSRUN`.
2. Copie o código de demonstração de exceções do arquivo [`control_structures.abap`](./control_structures.abap) (seção de exceções).
3. **Ctrl + F3** e **F9**.
4. Explore:
   - Altere `c_text` para `'123'` e veja a conversão funcionar sem erro.
   - Altere `c_number` para `7` e veja a divisão funcionar.
   - Comente todo o bloco `TRY...ENDTRY` e veja o dump acontecer.
   - No exemplo 4, alterne `c_char` entre `'0'`, `'1'`, `'2'`, `'X'` e veja diferentes exceções sendo capturadas.

> ⚠️ **Importante:** Para ver o dump (runtime error), você precisa **comentar**
> o `TRY/CATCH/ENDTRY` e executar com um valor que cause erro. O Eclipse
> mostrará o erro no console e você pode analisar a mensagem.

---

### 🪜 Passo 7: Repetir código com `DO ... ENDDO`

O loop `DO` repete um bloco de código. Sem controle adicional, é um **loop
infinito** — por isso você sempre precisa de uma condição de parada:

#### Com `TIMES` (número fixo de repetições)

```abap
DO 3 TIMES.
  out->write( `Hello World` ).
ENDDO.
" Saída: 3 linhas "Hello World"
```

#### Com `EXIT` (condição de saída)

```abap
DATA(lv_count) = 10.

DO.
  out->write( |Contagem: { lv_count }| ).
  lv_count = lv_count - 1.

  IF lv_count <= 0.
    EXIT.   " sai do loop
  ENDIF.
ENDDO.
```

#### A variável de sistema `sy-index`

Dentro de um `DO`, `sy-index` contém o número da iteração atual — começando
em **1** (não em 0, como em muitas linguagens):

```abap
DO 5 TIMES.
  out->write( |Iteração { sy-index }| ).
ENDDO.
" Saída: Iteração 1, Iteração 2, ..., Iteração 5
```

> ⚠️ **Importante:** `sy-index` começa em **1**, não em 0. Se você vem do
> C# (onde `for (int i = 0; ...)` é o padrão), esse é um detalhe que causa
> bugs sutis — especialmente ao acessar tabelas internas por índice.

> 💡 **Analogia .NET:** `DO n TIMES. ... ENDDO.` = `for (int i = 0; i < n;
> i++) { }`. `sy-index` = `i + 1` (começa em 1). `EXIT` = `break`.

---

### 🪜 Passo 8: Executar exercício — Iterations

1. Crie uma nova classe global com `IF_OO_ADT_CLASSRUN`.
2. Copie este código:

```abap
    CONSTANTS c_number TYPE i VALUE 3.
*    CONSTANTS c_number TYPE i VALUE 5.
*    CONSTANTS c_number TYPE i VALUE 10.

    DATA number TYPE i.

    " Example 1: DO ... ENDDO with TIMES
    out->write( `Example 1: DO ... ENDDO with TIMES` ).

    DO c_number TIMES.
      out->write( `Hello World` ).
    ENDDO.

    " Example 2: DO ... ENDDO with Abort Condition
    out->write( `Example 2: With Abort Condition` ).

    number = c_number * c_number.

    DO.
      out->write( |{ sy-index }: Value of number: { number }| ).
      number = number - 1.

      IF number <= c_number.
        EXIT.
      ENDIF.
    ENDDO.
```

3. **Ctrl + F3** e **F9**.
4. Altere `c_number` e observe:
   - Com `3`: 6 iterações (9 → 3).
   - Com `5`: 20 iterações (25 → 5).
   - `sy-index` conta a partir de 1.

---

### ✅ Verificação: deu certo?

1. ❓ Qual a diferença entre `IF ... ENDIF` e `CASE ... ENDCASE`?
   <details>
   <summary><b>Resposta</b></summary>
   `IF` avalia qualquer condição lógica. `CASE` compara uma única variável com valores exatos (`WHEN 1.`, `WHEN 2.`, `WHEN OTHERS.`). Use `CASE` quando a decisão depende de valores discretos de uma só variável — é mais legível.
   </details>

2. ❓ O que acontece se uma exceção não for capturada com `TRY ... CATCH`?
   <details>
   <summary><b>Resposta</b></summary>
   O programa aborta com um **runtime error** (dump). O Eclipse mostra a mensagem de erro e um short dump é gerado.
   </details>

3. ❓ `sy-index` começa em 0 ou em 1?
   <details>
   <summary><b>Resposta</b></summary>
   Começa em **1**. Esta é uma diferença importante para quem vem do C# (onde `for (int i = 0; ...)` é o padrão).
   </details>

4. ❓ Qual o risco de usar `DO` sem `TIMES` e sem `EXIT`?
   <details>
   <summary><b>Resposta</b></summary>
   Loop infinito — o programa nunca termina. No Eclipse, você precisaria interromper a execução manualmente.
   </details>

---

### ❓ Perguntas Frequentes

<details>
<summary><b>"Por que o ABAP usa = tanto para atribuição quanto para comparação? Não é confuso?"</b></summary>

Sim, é uma das diferenças mais notáveis para quem vem de C# ou Java. O
compilador ABAP distingue pelo **contexto**: depois de `IF`, `ELSEIF`, `WHEN`
é comparação; em uma instrução isolada (`lv_x = 5.`) é atribuição. Com a
prática, você se acostuma.

</details>

<details>
<summary><b>"Quando usar DO vs LOOP?"</b></summary>

`DO` é um loop genérico (como `for`/`while` do C#). `LOOP` é específico para
**percorrer linhas de uma tabela interna** (como `foreach`). Você aprenderá
`LOOP` em detalhes na [Aula 06 do Módulo 02](../06-working-with-complex-internal-tables/).

</details>

<details>
<summary><b>"Preciso decorar os nomes das classes de exceção?"</b></summary>

Não. No Eclipse, você pode usar **Ctrl + Espaço** após `CATCH` para ver as
exceções disponíveis. Os nomes seguem o padrão `cx_sy_*` para exceções do
sistema — com o tempo você internaliza os mais comuns.

</details>

<details>
<summary><b>"Posso ter múltiplos CATCH para diferentes exceções?"</b></summary>

Sim. Um bloco `TRY` pode ter vários `CATCH`, cada um para uma classe de
exceção diferente. O primeiro `CATCH` compatível com a exceção lançada é
executado. Isso é idêntico ao comportamento de `try/catch` no C#.

</details>

---

### 📚 O que aprendemos

| Conceito | Significado |
|---|---|
| **`IF ... ENDIF`** | Desvio condicional: executa bloco se a condição for verdadeira |
| **`ELSEIF` / `ELSE`** | Ramos alternativos dentro de um `IF` |
| **`CASE ... ENDCASE`** | Desvio por valor exato de uma variável (`WHEN`, `WHEN OTHERS`) |
| **`TRY ... CATCH ... ENDTRY`** | Captura e trata exceções, evitando runtime errors |
| **`cx_sy_*`** | Classes de exceção do sistema (conversão, divisão por zero, etc.) |
| **`DO ... ENDDO`** | Loop com controle por `TIMES` ou `EXIT` |
| **`sy-index`** | Contador de iteração (começa em 1) |
| **`EXIT`** | Sai imediatamente de um loop |
| **`=` como comparação** | Dentro de `IF`, `=` significa igualdade (como `==` em C#) |

---

### 📖 Novos Termos (Glossário)

Estes são os termos do ecossistema SAP que apareceram nesta aula.
Consulte o [glossário completo](../../../GLOSSARY.md) para ver todos os termos.

| Termo | Definição rápida |
|---|---|
| [IF / ELSE / ENDIF](../../../GLOSSARY.md#if-else-endif-conditional-branching) | Estrutura de desvio condicional do ABAP |
| [CASE / ENDCASE](../../../GLOSSARY.md#case-endcase) | Desvio condicional por valor exato de uma variável |
| [TRY / CATCH / ENDTRY](../../../GLOSSARY.md#try-catch-endtry-exception-handling) | Estrutura de captura e tratamento de exceções |
| [DO / ENDDO](../../../GLOSSARY.md#do-enddo-iteration) | Loop com controle por `TIMES` ou condição de saída |
| [sy-index](../../../GLOSSARY.md#sy-index) | Variável de sistema: contador de iteração (começa em 1) |
| [EXIT](../../../GLOSSARY.md#exit-statement) | Instrução para sair imediatamente de um loop |

---

### ⏭️ Próxima aula

[Aula 05: Trabalhando com Tabelas Internas Simples](../05-working-with-simple-internal-tables/) — você vai aprender a criar, preencher e percorrer tabelas internas, uma das estruturas de dados mais importantes do ABAP.
