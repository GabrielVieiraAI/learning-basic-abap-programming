# Exercícios — Aula 01: Definindo uma Classe Local

## Instruções

Para os exercícios abaixo, você trabalhará em uma única
[classe ABAP](../../../GLOSSARY.md#classe-abap-abap-class) global que
implementa [`IF_OO_ADT_CLASSRUN`](../../../GLOSSARY.md#if_oo_adt_classrun).
Ative com **Ctrl + F3** após cada tarefa para verificar se não há erros.

---

## Exercício 1: Criar a classe global

1. Crie uma nova classe global chamada `ZCL_##_LOCAL_CLASS` (substitua
   `##` pelo seu número de grupo).
2. Adicione a interface `IF_OO_ADT_CLASSRUN`.
3. Atribua a classe ao seu pacote `ZS4D400_##` e a uma
   [Transport Request](../../../GLOSSARY.md#transport-request).
4. Ative a classe (**Ctrl + F3**).

**Pergunta:** Por que precisamos da interface `IF_OO_ADT_CLASSRUN`? O que
aconteceria se tentássemos executar a classe sem ela?

---

## Exercício 2: Gerar o esqueleto da classe local

1. Na aba **Local Types** da classe `ZCL_##_LOCAL_CLASS`, use o code
   completion `lcl + Ctrl + Space` para gerar o esqueleto de uma classe local.
2. Renomeie a classe para `lcl_connection`.
3. Remova a adição `CREATE PRIVATE` da definição.

**Pergunta:** Quais são as três seções de visibilidade geradas pelo template?
Em que ordem elas aparecem? Essa ordem pode ser alterada?

---

## Exercício 3: Declarar atributos de instância

Dentro da `PUBLIC SECTION` de `lcl_connection`, declare os seguintes atributos
de instância:

| Atributo | Tipo ABAP | Descrição |
|---|---|---|
| `carrier_id` | `/dmo/carrier_id` | Código da companhia aérea |
| `connection_id` | `/dmo/connection_id` | Código da conexão (voo) |

Ative a classe e verifique se não há erros.

---

## Exercício 4: Declarar atributo estático

1. Adicione um atributo estático `conn_counter` do tipo `i` (inteiro) à
   `PUBLIC SECTION`.

2. **Pergunta:** Qual é a diferença entre declarar `conn_counter` com
   `DATA` e com `CLASS-DATA`? Se você criar 3 objetos `lcl_connection` e
   cada um incrementar `conn_counter`, qual será o valor final em cada caso?

---

## Exercício 5: Verificação de conceitos

Responda com suas próprias palavras:

1. Qual a diferença entre uma classe **local** e uma classe **global** no ABAP?
   Dê um exemplo de quando você usaria cada uma.

2. O que significam as palavras `DEFINITION` e `IMPLEMENTATION` na estrutura
   de uma classe ABAP? Qual delas é opcional e quando?

3. O que acontece se você inverter a ordem das seções de visibilidade
   (colocar `PRIVATE SECTION` antes de `PUBLIC SECTION`)? Teste no ADT e
   anote a mensagem de erro.

4. Por que o código da classe local fica na aba **Local Types** em vez da
   aba **Global Class**? O que cada aba representa?

---

## ✅ Checklist de conclusão

- [ ] Classe global `ZCL_##_LOCAL_CLASS` criada e ativada
- [ ] Classe local `lcl_connection` definida na aba Local Types
- [ ] Atributos `carrier_id` e `connection_id` declarados com `DATA`
- [ ] Atributo `conn_counter` declarado com `CLASS-DATA`
- [ ] `CREATE PRIVATE` removido da definição
- [ ] Ordem das seções: PUBLIC → PROTECTED → PRIVATE
- [ ] Ativação sem erros
