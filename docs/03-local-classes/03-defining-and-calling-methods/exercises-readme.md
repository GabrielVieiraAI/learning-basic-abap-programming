# Exercícios — Aula 03: Definindo e Chamando Métodos

## Instruções

Todos os exercícios usam a classe global `ZCL_##_METHODS` (ou continue com
`ZCL_##_LOCAL_CLASS`). O código da classe local `lcl_connection` vai na aba
**Local Types**; as chamadas vão no método `main` da aba **Global Class**.

Ative com **Ctrl + F3** após cada tarefa. Use o debugger (**F9**, **F5**)
para inspecionar o fluxo de chamadas.

---

## Exercício 1: Definir método set_attributes

1. Na aba **Local Types**, dentro da `PUBLIC SECTION` de `lcl_connection`,
   declare o método `set_attributes` com:

   - Parâmetro `IMPORTING` `i_carrier_id` do tipo `/dmo/carrier_id`
   - Parâmetro `IMPORTING` `i_connection_id` do tipo `/dmo/connection_id`
   - Cláusula `RAISING cx_abap_invalid_value`

2. Use o Quick Fix (**Ctrl+1**) para gerar a implementação.

3. Implemente o método: se qualquer parâmetro for `IS INITIAL`, lance
   `RAISE EXCEPTION TYPE cx_abap_invalid_value`. Caso contrário, atribua
   os parâmetros aos atributos correspondentes.

4. Ative (**Ctrl+F3**).

**Pergunta:** Por que usamos o prefixo `i_` nos nomes dos parâmetros? O que
aconteceria se os parâmetros tivessem o mesmo nome dos atributos?

---

## Exercício 2: Definir método funcional get_output

1. Na `PUBLIC SECTION` de `lcl_connection`, declare o método `get_output`:

   ```abap
   METHODS get_output
     RETURNING
       VALUE(r_output) TYPE string_table.
   ```

2. Gere a implementação com **Ctrl+1**.

3. Implemente o método: use `APPEND` para adicionar linhas formatadas a
   `r_output` com os valores de `carrier_id` e `connection_id` usando
   [templates de string](../../../GLOSSARY.md#template-de-string-string-template).

4. Ative.

**Pergunta:** Por que `VALUE( )` é obrigatório no `RETURNING` e não pode ter
espaços dentro dos parênteses? O que torna `get_output` um **método funcional**?

---

## Exercício 3: Chamar set_attributes com TRY...CATCH

1. Na aba **Global Class**, no método `main`, substitua o acesso direto aos
   atributos da **primeira instância** por uma chamada a `set_attributes`.

2. Envolva a chamada com `TRY...ENDTRY` e capture `cx_abap_invalid_value`.
   O `APPEND` deve ficar **dentro** do `TRY`, após a chamada bem-sucedida.

3. No `CATCH`, exiba `'Method call failed'` no console.

4. Teste: execute com **F9** e verifique que a primeira instância é criada
   normalmente.

5. Agora **quebre propositalmente**: passe `''` (vazio) para `i_carrier_id`.
   Execute novamente e veja a mensagem "Method call failed".

6. Restaure os valores corretos.

---

## Exercício 4: Chamar set_attributes para todas as instâncias

1. Aplique o mesmo padrão `TRY...CATCH` para as **três instâncias**.

2. Comente (usando `"`) as linhas antigas de acesso direto aos atributos.

3. Ative e execute. O console **não** deve mostrar "Method call failed".

4. **Teste de robustez:** passe `''` para `i_connection_id` da **segunda**
   instância. Execute e observe:
   - A primeira instância é adicionada à tabela normalmente.
   - A segunda falha — "Method call failed".
   - A terceira é adicionada normalmente.
   - O `LOOP` final mostra apenas 2 conexões.

   Isso mostra que `TRY...CATCH` isola falhas — um erro em uma instância
   não impede as outras de funcionarem.

---

## Exercício 5: Chamar get_output como método funcional

1. No final do método `main`, após criar as três instâncias, adicione um
   `LOOP AT connections INTO connection.`

2. Dentro do loop, use `out->write( connection->get_output( ) )`.

3. Execute. O console deve mostrar as conexões formatadas.

4. **Experimente** outras formas de usar o método funcional:

   ```abap
   " Atribuição com declaração inline
   DATA(output) = connection->get_output( ).

   " Em expressão condicional
   IF connection->get_output( ) IS NOT INITIAL.
     out->write( `Tem dados!` ).
   ENDIF.
   ```

---

## ✅ Checklist de conclusão

- [ ] Método `set_attributes` definido com `IMPORTING` + `RAISING`
- [ ] Método `get_output` definido com `RETURNING VALUE( )`
- [ ] Ambos os métodos implementados (sem erros "Implementation missing")
- [ ] `set_attributes` valida parâmetros com `IS INITIAL` e `RAISE EXCEPTION`
- [ ] Três instâncias chamam `set_attributes` em vez de acesso direto
- [ ] Cada chamada está envolta em `TRY...CATCH`
- [ ] `APPEND` só executa se `set_attributes` não lançar exceção
- [ ] `LOOP` final usa `get_output( )` como método funcional
- [ ] Console mostra saída formatada das conexões
- [ ] Teste com parâmetro vazio mostra "Method call failed" sem crash
