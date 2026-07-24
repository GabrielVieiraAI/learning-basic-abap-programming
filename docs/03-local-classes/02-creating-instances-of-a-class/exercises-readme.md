# Exercícios — Aula 02: Criando Instâncias de uma Classe

## Instruções

Todos os exercícios usam a classe global `ZCL_##_LOCAL_CLASS` (ou
`ZCL_##_INSTANCES`) com a [classe local](../../../GLOSSARY.md#classe-local-local-class)
`lcl_connection` já definida na aba **Local Types**. O código de cada
exercício vai no método `if_oo_adt_classrun~main` da aba **Global Class**.

Ative com **Ctrl + F3** após cada tarefa. Use o debugger (**F9**, **F5**)
para inspecionar as variáveis em memória.

---

## Exercício 1: Primeira instância

1. No método `main`, declare uma [variável de referência](../../../GLOSSARY.md#variavel-de-referencia-reference-variable)
   chamada `connection` do tipo `REF TO lcl_connection`.
2. Crie uma instância com `NEW #( )`.
3. Atribua os valores `'LH'` e `'0400'` aos atributos `carrier_id` e
   `connection_id`.
4. Ative (**Ctrl + F3**) e execute (**F9**).

**Pergunta:** O que acontece se você tentar acessar `connection->carrier_id`
**antes** de executar `NEW #( )`? Teste no debugger e anote o erro.

---

## Exercício 2: Inspecionar no debugger

1. Coloque um breakpoint na linha `connection = NEW #( ).`
2. Execute com **F9**.
3. Dê um duplo clique em `connection` — qual é o valor mostrado?
4. Pressione **F5** — o que mudou no valor de `connection`?
5. Na view **Variables**, expanda `connection`. Todos os atributos estão
   com seus valores iniciais (vazios/zero).
6. Pressione **F5** mais duas vezes. Observe `CARRIER_ID` e `CONNECTION_ID`
   receberem seus valores.
7. Pressione **F8** para continuar.

**Pergunta:** Por que `CONN_COUNTER` (atributo estático) também aparece na
view **Variables** ao expandir `connection`, mesmo sendo um atributo da
classe e não do objeto?

---

## Exercício 3: Múltiplas instâncias com tabela interna

1. Declare uma tabela interna `connections` do tipo `TABLE OF REF TO
   lcl_connection`.
2. Crie três instâncias de `lcl_connection` com os seguintes dados:

   | Instância | carrier_id | connection_id |
   |---|---|---|
   | 1 | `'LH'` | `'0400'` |
   | 2 | `'AA'` | `'0017'` |
   | 3 | `'SQ'` | `'0001'` |

3. Após criar cada instância e definir seus atributos, use
   `APPEND connection TO connections.` para salvar a referência na tabela.
4. Coloque um breakpoint no primeiro `APPEND` e use **F5** para avançar
   passo a passo, inspecionando a tabela `connections` (duplo clique) a
   cada etapa.

**Pergunta:** Após o terceiro `APPEND`, a variável `connection` contém a
referência para qual objeto? E a tabela `connections` — quantas linhas tem
e quais valores cada linha referencia?

---

## Exercício 4: Acessar atributo estático

O atributo `conn_counter` foi declarado com [`CLASS-DATA`](../../../GLOSSARY.md#class-data)
— ele pertence à classe, não a uma instância específica.

1. Após criar as três instâncias, adicione a linha:

   ```abap
   lcl_connection=>conn_counter = 3.
   ```

2. **Pergunta:** Qual seletor foi usado (`->` ou `=>`)? Por quê?

3. No debugger, adicione `lcl_connection=>conn_counter` à view **Variables**
   (botão direito → **Add Variable**) e verifique o valor.

4. **Pergunta extra:** O que acontece se você tentar usar
   `connection->conn_counter` em vez de `lcl_connection=>conn_counter`?
   Teste e anote o resultado.

---

## Exercício 5: Verificação de conceitos

Responda com suas próprias palavras:

1. Qual a diferença entre uma **variável comum** (`DATA lv_nome TYPE string`)
   e uma **variável de referência** (`DATA lo_obj TYPE REF TO lcl_connection`)?

2. Por que o ABAP usa símbolos **diferentes** para acessar membros de
   instância (`->`) e membros estáticos (`=>`)? Qual a vantagem disso?

3. Se você executar `NEW #( )` três vezes usando a **mesma** variável
   `connection` (sem `APPEND`), o que acontece com os dois primeiros
   objetos? Como o [Garbage Collector](../../../GLOSSARY.md#garbage-collector-coletor-de-lixo)
   se relaciona com isso?

4. Por que armazenamos as referências em uma tabela interna
   (`TABLE OF REF TO`) em vez de declarar três variáveis separadas
   (`connection1`, `connection2`, `connection3`)?

---

## ✅ Checklist de conclusão

- [ ] Variável de referência declarada com `TYPE REF TO`
- [ ] Instância criada com `NEW #( )`
- [ ] Atributos acessados com `->`
- [ ] Três instâncias criadas com valores diferentes
- [ ] Referências armazenadas em tabela interna com `APPEND`
- [ ] Debugger usado para inspecionar `connection` e `connections`
- [ ] Atributo estático acessado com `=>`
- [ ] Ativação sem erros
