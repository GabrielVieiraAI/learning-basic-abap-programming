# Aula 03: Processando Dados

## 🎯 Objetivos de Aprendizagem

Depois de completar esta aula, você será capaz de:

- Realizar cálculos aritméticos.
- Aplicar processamento de strings.

---

## 📖 Guia Passo a Passo: Cálculos Aritméticos e Manipulação de Strings

### 🧭 Antes de começar: de variáveis a expressões

Nas [Aulas 01](../01-understanding-the-basics-of-abap/) e [02](../02-working-with-basic-data-objects-and-data-types/),
você aprendeu a declarar variáveis com `DATA`, atribuir valores com `=` e
conheceu os tipos de dados do ABAP. Agora você vai além da simples atribuição:
vai **processar dados** — fazer cálculos com números e construir textos
dinâmicos com strings.

Dois conceitos centrais desta aula:

1. **Expressões aritméticas** (_arithmetic expressions_): combinações de valores,
   operadores e funções que o runtime avalia para produzir um resultado numérico.
2. **Templates de string** (_string templates_): expressões que permitem
   interpolar variáveis e expressões dentro de um texto, com controle de
   formatação.

> 💡 **Analogia .NET:** Expressões aritméticas no ABAP (`2 + 3 * 4`) funcionam
> exatamente como no C#. Templates de string (`|Texto { variavel }|`) são o
> equivalente a `$"Texto {variavel}"` (_string interpolation_) do C# — mas com
> recursos extras de formatação nativa para datas, números e sinais que no .NET
> você faria com `ToString("format")`.

---

### 🔧 O que você vai usar

| Ferramenta/Conceito | Para que serve | Análogo no mundo .NET |
|---|---|---|
| **Expressão aritmética** | Cálculos com `+`, `-`, `*`, `/`, `**`, funções (`sqrt`, `ipow`) | Operadores aritméticos do C# (`+`, `-`, `*`, `/`, `Math.Sqrt`, `Math.Pow`) |
| **Template de string** | Interpolar variáveis em texto com `\|...{ }...\|` | `$"Texto {var}"` (string interpolation) |
| **Opções de formatação** | Controlar exibição de data (`DATE =`), número (`NUMBER =`), sinal (`SIGN =`), estilo (`STYLE =`) | `ToString("format")`, `String.Format` |
| **Operador de concatenação `&&`** | Juntar strings e expressões | `+` para concatenação de strings em C# |

---

### 📋 Pré-requisitos

Antes de começar esta aula, você precisa ter:

1. Saber declarar variáveis com [`DATA`](../../../GLOSSARY.md#data-statement), [`CONSTANTS`](../../../GLOSSARY.md#constants-statement) e [`TYPES`](../../../GLOSSARY.md#types-statement) ([Aula 02](../02-working-with-basic-data-objects-and-data-types/)).
2. Conhecer os tipos de dados built-in ([Aula 02](../02-working-with-basic-data-objects-and-data-types/)).
3. Saber criar uma [classe ABAP](../../../GLOSSARY.md#classe-abap-abap-class) com [`IF_OO_ADT_CLASSRUN`](../../../GLOSSARY.md#if_oo_adt_classrun) e executar com **F9**.

---

### 🪜 Passo 1: Realizar cálculos aritméticos

Expressões aritméticas no ABAP usam os operadores que você já conhece de
qualquer linguagem:

| Operador | Significado | Exemplo |
|---|---|---|
| `+` | Adição | `result = 2 + 3.` → `5` |
| `-` | Subtração | `result = 2 - 3.` → `-1` |
| `*` | Multiplicação | `result = 2 * 3.` → `6` |
| `/` | Divisão | `result = 2 / 3.` → `0.67` (depende do tipo) |
| `**` | Exponenciação | `result = 2 ** 3.` → `8` |
| `( )` | Agrupamento (precedência) | `result = (8 + 2) * 3.` → `30` |

#### Funções aritméticas built-in

Além dos operadores, o ABAP oferece funções matemáticas:

```abap
DATA(result) = sqrt( 16 ).               " raiz quadrada → 4
DATA(power)  = ipow( base = 2 exp = 3 ). " 2³ → 8
```

#### O tipo do resultado importa

O tipo da variável de destino determina como o resultado é armazenado:

```abap
TYPES t_result TYPE p LENGTH 8 DECIMALS 2.  " resultado com 2 casas decimais
DATA result TYPE t_result.
result = 2 / 3.                              " → 0.67

" Se usar TYPE i, perde as casas decimais:
DATA int_result TYPE i.
int_result = 2 / 3.                          " → 0 (truncado!)
```

> ⚠️ **Importante:** Se você fizer `2 / 3` com resultado `TYPE i`, o valor
> é truncado para `0` — não arredondado. Para preservar casas decimais, use
> `TYPE p LENGTH 8 DECIMALS 2` (ou mais decimais). Esta é uma das diferenças
> mais importantes para quem vem de linguagens onde `int / int` pode resultar
> em `float` automaticamente.

> 💡 **Analogia .NET:** Em C#, `int x = 2 / 3;` também resulta em `0` (divisão
> inteira). Para obter `0.67`, você precisaria de `double x = 2.0 / 3;` ou
> `decimal x = 2m / 3;`. No ABAP, a lógica é a mesma: o tipo do resultado
> depende do tipo da variável que o recebe.

---

### 🪜 Passo 2: Executar o primeiro exercício — Cálculos Aritméticos

**Instruções:**

1. Crie uma nova classe global com `IF_OO_ADT_CLASSRUN`.
2. Copie este código para o método `if_oo_adt_classrun~main( )`:

```abap
* Declarations
**********************************************************************

    " comment/uncomment these lines for different result types
    TYPES t_result TYPE p LENGTH 8 DECIMALS 2.
*    TYPES t_result TYPE p LENGTH 8 DECIMALS 0.
*    TYPES t_result TYPE i.

    DATA result TYPE t_result.

* Calculations
**********************************************************************
    " comment/uncomment these lines for different calculations

    result = 2 + 3.
*    result = 2 - 3.
*    result = 2 * 3.
*    result = 2 / 3.
*
*    result = sqrt( 2 ).
*    result = ipow( base = 2 exp = 3 ).
*
*    result = ( 8 * 7 - 6 ) / ( 5 + 4 ).
*    result = 8 * 7 - 6 / 5 + 4.

* Output
**********************************************************************

    out->write( result ).
```

3. **Ctrl + F3** e **F9**.
4. Alterne as operações e os tipos de `t_result`. Observe:
   - Com `DECIMALS 2`, `2 / 3` = `0.67`.
   - Com `DECIMALS 0`, `2 / 3` = `1` (arredondado).
   - Com `TYPE i`, `2 / 3` = `0` (truncado).
   - Compare `(8*7-6)/(5+4)` com `8*7-6/5+4` — a precedência muda tudo.

---

### 🪜 Passo 3: Criar textos dinâmicos com templates de string

Um **template de string** é uma expressão ABAP que produz um resultado do tipo
`string`. Ele começa e termina com o símbolo pipe (`|`). O que torna o template
poderoso é a capacidade de **incorporar expressões** entre chaves `{ }`:

```abap
DATA lv_name   TYPE string VALUE `Gabriel`.
DATA lv_age    TYPE i      VALUE 28.

" Template simples: texto literal
DATA(text) = |Hello World|.                    " → Hello World

" Template com variáveis incorporadas:
DATA(text) = |Nome: { lv_name }, Idade: { lv_age }|.
" → Nome: Gabriel, Idade: 28

" Template com expressão aritmética incorporada:
DATA(price)  = 10.
DATA(qty)    = 3.
DATA(text)   = |Total: { price * qty } EUR|.
" → Total: 30 EUR
```

> ⚠️ **Importante:** A sintaxe ABAP exige **pelo menos um espaço** depois do
> `{` de abertura e **pelo menos um espaço** antes do `}` de fechamento.
> `{ variavel }` ✅ — `{variavel}` ❌.

> 💡 **Analogia .NET:** `|Nome: { lv_name }|` = `$"Nome: {nome}"` em C#.
> A diferença é que no ABAP o delimitador do template é `|...|` em vez de
> `$"..."`, e o delimitador da expressão é `{ }` com espaços obrigatórios.

---

### 🪜 Passo 4: Formatar datas, números e sinais

Templates de string vão além da simples interpolação: você pode **formatar**
os valores incorporados com opções especiais.

#### Formatação de datas

```abap
DATA lv_date TYPE d VALUE '19891109'.

|Raw:  { lv_date }|                " → Raw:  19891109
|ISO:  { lv_date DATE = ISO  }|    " → ISO:  1989-11-09
|USER: { lv_date DATE = USER }|    " → USER: 09.11.1989 (depende do locale)
```

#### Formatação de números

```abap
DATA lv_num TYPE p LENGTH 3 DECIMALS 2 VALUE '-273.15'.

|Raw:      { lv_num }|                    " → Raw:      273.15-
|User:     { lv_num NUMBER = USER }|      " → User:     -273,15
|Sign Right: { lv_num SIGN = RIGHT }|     " → Sign Right: 273.15-
|Scientific: { lv_num STYLE = SCIENTIFIC }| " → Scientific: -2.73E+02
```

| Opção | Valores | Efeito |
|---|---|---|
| `DATE =` | `ISO`, `USER`, `ENVIRONMENT` | Formata uma data no padrão escolhido |
| `NUMBER =` | `USER`, `ENVIRONMENT` | Controla separador decimal (`.` vs `,`) |
| `SIGN =` | `LEFT`, `RIGHT` | Posição do sinal de negativo |
| `STYLE =` | `SCIENTIFIC`, `ENGINEERING` | Notação científica ou de engenharia |

> 💡 **Analogia .NET:** `{ lv_date DATE = ISO }` = `date.ToString("yyyy-MM-dd")`
> em C#. `{ lv_num NUMBER = USER }` = `number.ToString("N2", CultureInfo.CurrentCulture)`.

---

### 🪜 Passo 5: Concatenar strings com `&&`

Para juntar strings, use o operador `&&`:

```abap
DATA(part1) = `Hello`.
DATA(part2) = `World`.

DATA(text) = part1 && part2.              " → HelloWorld
DATA(text) = part1 && | | && part2.       " → Hello World
```

Você também pode combinar concatenação com templates:

```abap
DATA amount1 TYPE p LENGTH 8 DECIMALS 2 VALUE '1.20'.
DATA amount2 TYPE p LENGTH 8 DECIMALS 2 VALUE '2.10'.

DATA(text) = |{ amount1 } + { amount2 }| &&
             | = | &&
             |{ amount1 + amount2 }|.
" → 1.20 + 2.10 = 3.30
```

> ⚠️ **Importante:** O operador `&&` **não insere espaços** entre as partes.
> Se você quiser espaços, precisa incluí-los explicitamente (como no exemplo
> `part1 && | | && part2`).

> 💡 **Analogia .NET:** `&&` no ABAP = `+` no C# para concatenação de strings.
> A diferença é que o ABAP usa `&&` para não confundir com o `+` aritmético
> — no C#, o operador `+` é sobrecarregado para strings, no ABAP não.

---

### 🪜 Passo 6: Executar o segundo exercício — Processamento de Strings

**Instruções:**

1. Crie uma nova classe global com `IF_OO_ADT_CLASSRUN`.
2. Copie este código:

```abap
METHOD if_oo_adt_classrun~main.

* Declarations
**********************************************************************
    TYPES t_amount TYPE p LENGTH 8 DECIMALS 2.

    DATA amount   TYPE t_amount VALUE '3.30'.
    DATA amount1  TYPE t_amount VALUE '1.20'.
    DATA amount2  TYPE t_amount VALUE '2.10'.

    DATA the_date  TYPE d                     VALUE '19891109'.
    DATA my_number TYPE p LENGTH 3 DECIMALS 2 VALUE '-273.15'.

    DATA part1 TYPE string VALUE `Hello`.
    DATA part2 TYPE string VALUE `World`.

* String Templates
**********************************************************************

    " comment/uncomment the following lines for different examples
    DATA(text) = |Hello World|.
*    DATA(text) = |Total: { amount } EUR|.
*    DATA(text) = |Total: { amount1 + amount2 } EUR|.

* Format Options
**********************************************************************

    "Date
*    DATA(text) = |Raw Date: { the_date             }|.
*    DATA(text) = |ISO Date: { the_date DATE = ISO  }|.
*    DATA(text) = |USER Date:{ the_date DATE = USER }|.

    "Number
*    DATA(text) = |Raw Number { my_number                    }|.
*    DATA(text) = |User Format{ my_number NUMBER = USER      }|.
*    DATA(text) = |Sign Right { my_number SIGN = RIGHT       }|.
*    DATA(text) = |Scientific { my_number STYLE = SCIENTIFIC }|.

* String expression (concatenation Operator)
**********************************************************************

*    DATA(text) = part1 && part2.
*    DATA(text) = part1 && | | && part2.
*    DATA(text) = |{ amount1 } + { amount2 }| &&
*                 | = | &&
*                 |{ amount1 + amount2 }|.

* Output
**********************************************************************

    out->write( text ).

ENDMETHOD.
```

3. **Ctrl + F3** e **F9**.
4. Explore:
   - Descomente as opções de string template uma por uma.
   - Teste as formatações de data e número.
   - Compare a saída de `NUMBER = USER` com `SIGN = RIGHT`.
   - Teste a concatenação com `&&`.

---

### 🪜 Passo 7: Exercício completo — Declarar Variáveis e Processar Dados

Este é o exercício final da aula, que consolida tudo. Você vai criar um
programa que recebe dois números, calcula a divisão e exibe o resultado
formatado.

#### Tarefa 1: Declaração de variáveis

```abap
DATA number1 TYPE i.
DATA number2 TYPE i.

number1 = -8.
number2 =  3.
```

#### Tarefa 2: Processamento

```abap
DATA(result) = number1 / number2.
DATA(output) = |{ number1 } / { number2 } = { result }|.
out->write( output ).
```

#### Tarefa 3: Ativar e testar

**Ctrl + F3** e **F9**. A saída será: `-8 / 3 = -3` (divisão inteira).

#### Tarefa 4: Controlar a precisão do resultado

Substitua a declaração inline por uma explícita com casas decimais:

```abap
DATA result TYPE p LENGTH 8 DECIMALS 2.

number1 = -8.
number2 =  3.

result = number1 / number2.
DATA(output) = |{ number1 } / { number2 } = { result }|.
out->write( output ).
```

Agora a saída será: `-8 / 3 = -2.67` — com duas casas decimais.

> 💡 **Analogia .NET:** Trocar `DATA(result) = number1 / number2.` (tipo `i`
> inferido, truncado) por `DATA result TYPE p LENGTH 8 DECIMALS 2.` seguido
> de `result = number1 / number2.` é como trocar `int result = a / b;` por
> `decimal result = (decimal)a / b;` em C#. Você está dizendo ao runtime:
> "quero precisão decimal, não inteira".

---

### ✅ Verificação: deu certo?

Para confirmar que você entendeu os conceitos desta aula, responda:

1. ❓ Por que `2 / 3` com `TYPE i` resulta em `0`?
   <details>
   <summary><b>Resposta</b></summary>
   Porque `TYPE i` é inteiro — a divisão inteira trunca o resultado (descarta a parte decimal). Para obter `0.67`, use `TYPE p LENGTH 8 DECIMALS 2`.
   </details>

2. ❓ Qual a diferença entre `|Hello|` e `` `Hello` ``?
   <details>
   <summary><b>Resposta</b></summary>
   Ambos produzem uma string com o texto "Hello". A diferença é que `|...|` é um **template de string** (permite expressões `{ }` dentro) enquanto `` `...` `` é um **string literal** (texto puro, sem interpolação).
   </details>

3. ❓ Por que `|{variavel}|` (sem espaços) causa erro de sintaxe?
   <details>
   <summary><b>Resposta</b></summary>
   A sintaxe ABAP exige pelo menos um espaço após `{` e antes de `}`: `|{ variavel }|`. É uma regra da linguagem — sem os espaços, o compilador não reconhece como embedded expression.
   </details>

4. ❓ O que o operador `&&` faz e por que ele existe em vez de usar `+`?
   <details>
   <summary><b>Resposta</b></summary>
   `&&` concatena strings. O ABAP usa `&&` em vez de `+` para evitar ambiguidade com o operador aritmético de adição. No C#, `+` é sobrecarregado para strings; no ABAP, as operações são separadas.
   </details>

---

### ❓ Perguntas Frequentes

<details>
<summary><b>"Quando usar template de string vs concatenação com &&?"</b></summary>

Prefira **templates de string** (`|...|`) sempre que possível — são mais
legíveis e oferecem formatação nativa. Use `&&` apenas quando precisar
concatenar strings que já estão em variáveis separadas e não faz sentido
colocá-las em um template.

</details>

<details>
<summary><b>"As opções de formatação (DATE=, NUMBER=) funcionam fora de string templates?"</b></summary>

Não. `DATE = ISO`, `NUMBER = USER` e similares só funcionam **dentro de
embedded expressions** (`{ ... }`) em string templates (`|...|`). Fora disso,
você precisaria usar funções de conversão como `CONV` ou módulos de função.

</details>

<details>
<summary><b>"Qual a diferença entre STYLE = SCIENTIFIC e STYLE = ENGINEERING?"</b></summary>

`SCIENTIFIC` usa notação científica padrão (ex: `-2.73E+02`). `ENGINEERING`
usa notação de engenharia, onde o expoente é sempre múltiplo de 3 (ex:
`-273.15E+00`). Engenharia é útil para grandezas como kilo (10³), mega (10⁶).

</details>

<details>
<summary><b>"Posso fazer `lv_text = 'Hello' && ' World'.`?"</b></summary>

Sim, `&&` funciona com literais, variáveis e expressões. Mas para literais
simples, um string template `|Hello World|` é mais limpo.

</details>

---

### 📚 O que aprendemos

| Conceito | Significado |
|---|---|
| **Expressão aritmética** | Combinação de valores e operadores (`+`, `-`, `*`, `/`, `**`) avaliada em runtime |
| **Template de string** | Expressão `\|...\|` que produz `string`, permite interpolar variáveis com `{ }` |
| **Embedded expression** | Expressão entre `{ }` dentro de um template de string |
| **Opções de formatação** | `DATE =`, `NUMBER =`, `SIGN =`, `STYLE =` dentro de `{ }` para controlar exibição |
| **Operador `&&`** | Concatenação de strings (equivalente ao `+` do C# para strings) |
| **Tipo do resultado** | O tipo da variável de destino determina precisão — `i` trunca, `p` preserva decimais |

---

### 📖 Novos Termos (Glossário)

Estes são os termos do ecossistema SAP que apareceram nesta aula.
Consulte o [glossário completo](../../../GLOSSARY.md) para ver todos os termos.

| Termo | Definição rápida |
|---|---|
| [Template de String](../../../GLOSSARY.md#template-de-string-string-template) | Expressão `\|...\|` que permite interpolar variáveis e formatar valores |
| [Concatenação](../../../GLOSSARY.md#concatenação-de-strings-string-concatenation) | Operador `&&` para unir strings e expressões |
| [Opções de Formatação](../../../GLOSSARY.md#opções-de-formatação-format-options) | Diretivas `DATE =`, `NUMBER =`, `SIGN =`, `STYLE =` dentro de string templates |

---

### ⏭️ Próxima aula

[Aula 04: Usando Estruturas de Controle em ABAP](../04-using-control-structures-in-abap/) — você vai aprender a usar condições (`IF`/`ELSE`, `CASE`) e loops (`DO`, `WHILE`, `LOOP`) para controlar o fluxo do seu programa ABAP.
