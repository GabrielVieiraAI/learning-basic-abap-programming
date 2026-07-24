# Exercícios — Aula 04: Usando Encapsulamento para Garantir Consistência

## Instruções

Todos os exercícios usam a classe global `ZCL_##_CONSTRUCTOR` (ou continue com
`ZCL_##_METHODS`). O código da classe local `lcl_connection` vai na aba
**Local Types**; as chamadas vão no método `main` da aba **Global Class**.

Ative com **Ctrl + F3** após cada tarefa. Use o debugger (**F9**, **F5**)
para inspecionar o fluxo de criação de objetos.

---

## Exercício 1: Tornar atributos privados

1. Na aba **Local Types**, use o Quick Fix (**Ctrl+1**) sobre `carrier_id`
   e escolha **Make carrier_id private**. Repita para `connection_id`.

2. Verifique que ambos foram movidos para a `PRIVATE SECTION`.

3. Tente ativar (**Ctrl+F3**). Se houver erros no método `main` da
   **Global Class**, é porque você está acessando `connection->carrier_id`
   diretamente. Isso é **esperado** — o encapsulamento está funcionando!

4. **Pergunta:** O método `get_output` (que está dentro da própria classe)
   continua funcionando? Por quê?

---

## Exercício 2: Tornar conn_counter READ-ONLY

1. Na `PUBLIC SECTION`, adicione `READ-ONLY` à declaração de `conn_counter`:

   ```abap
   CLASS-DATA conn_counter TYPE i READ-ONLY.
   ```

2. Ative. Tente adicionar `lcl_connection=>conn_counter = 10.` no método
   `main`. O editor deve mostrar **erro de sintaxe** — `READ-ONLY` bloqueia
   escrita externa.

3. Remova a linha problemática.

---

## Exercício 3: Substituir set_attributes por um construtor

1. Comente ou remova o método `set_attributes` (definição e implementação).

2. Posicione o cursor sobre `lcl_connection` e use **Ctrl+1 → Generate
   constructor**. Selecione `carrier_id` e `connection_id`.

3. Estenda o construtor gerado:
   - Adicione `RAISING cx_abap_invalid_value` na definição.
   - Adicione validação `IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.`
   - Se inválido: `RAISE EXCEPTION TYPE cx_abap_invalid_value.`
   - Se válido: atribua os parâmetros aos atributos com `me->`.
   - Após a atribuição: `conn_counter = conn_counter + 1.`

4. Ative.

**Pergunta:** Por que usamos `me->` no construtor? O que aconteceria se
escrevêssemos apenas `carrier_id = i_carrier_id.` sem `me->`?

---

## Exercício 4: Passar parâmetros no NEW #( )

1. Na aba **Global Class**, para cada instância:
   - Mova o `TRY.` para **antes** do `NEW #( )`.
   - Passe os parâmetros diretamente no `NEW`:

     ```abap
     connection = NEW #(
       i_carrier_id    = 'LH'
       i_connection_id = '0400'
     ).
     ```

   - Remova ou comente as chamadas antigas a `set_attributes`.

2. Ative e execute (**F9**). O console deve mostrar as três conexões
   formatadas, como antes.

3. **Teste de robustez:** Substitua `'LH'` por `''` (vazio) na primeira
   instância. Execute. Observe:
   - "Method call failed" para a primeira instância.
   - As outras duas são criadas normalmente.
   - O `LOOP` final mostra apenas 2 conexões.

---

## Exercício 5: Debuggar o construtor

1. Coloque um breakpoint na linha `IF i_carrier_id IS INITIAL ...` dentro
   do construtor.

2. Execute com **F9**. O debugger para **dentro** do construtor — mesmo
   sem você ter chamado `connection->constructor(...)` explicitamente.
   Isso prova que o runtime chama o construtor automaticamente.

3. Pressione **F5** para avançar passo a passo e observe:
   - A validação `IS INITIAL`
   - A atribuição `me->carrier_id = i_carrier_id`
   - O incremento `conn_counter = conn_counter + 1`

4. Pressione **F8** para continuar. Repita para as próximas instâncias e
   observe `conn_counter` aumentar.

---

## ✅ Checklist de conclusão

- [ ] `carrier_id` e `connection_id` movidos para `PRIVATE SECTION`
- [ ] `conn_counter` declarado com `READ-ONLY`
- [ ] `set_attributes` removido/substituído por construtor
- [ ] Construtor tem `IMPORTING` + `RAISING cx_abap_invalid_value`
- [ ] Construtor valida com `IS INITIAL` e incrementa `conn_counter`
- [ ] `NEW #( )` recebe parâmetros: `NEW #( i_carrier_id = ... i_connection_id = ... )`
- [ ] `TRY...CATCH` envolve o `NEW #( )`
- [ ] Acesso externo a `connection->carrier_id` gera erro de sintaxe
- [ ] `get_output( )` continua funcionando (acesso interno)
- [ ] Debugger confirma que o construtor é chamado automaticamente
