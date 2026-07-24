*&---------------------------------------------------------------------*
*& Solution: Simple Internal Tables Exercises
*& Unit 02 - Lesson 05
*&---------------------------------------------------------------------*
CLASS zcl_simple_itab_solution DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
ENDCLASS.

CLASS zcl_simple_itab_solution IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " ── Exercise 1: Shopping List ──────────────────────────────────
    out->write( `=== LISTA DE COMPRAS ===` ).

    DATA shopping_list TYPE TABLE OF string.

    APPEND `Arroz`     TO shopping_list.
    APPEND `Feijão`    TO shopping_list.
    APPEND `Macarrão`  TO shopping_list.
    APPEND `Leite`     TO shopping_list.
    APPEND `Pão`       TO shopping_list.

    LOOP AT shopping_list INTO DATA(lv_item).
      out->write( |{ sy-tabix }. { lv_item }| ).
    ENDLOOP.

    out->write( |---| ).
    out->write( |Total: { lines( shopping_list ) } itens| ).
    out->write( `----------------------------------------` ).

    " ── Exercise 2: Statistics Calculator ──────────────────────────
    out->write( `=== Exercise 2: Statistics ===` ).

    DATA scores TYPE TABLE OF i.

    APPEND 85 TO scores.
    APPEND 92 TO scores.
    APPEND 78 TO scores.
    APPEND 95 TO scores.
    APPEND 88 TO scores.
    APPEND 73 TO scores.
    APPEND 90 TO scores.

    DATA(lv_sum)   = 0.
    DATA(lv_max)   = 0.
    DATA(lv_min)   = 999.

    LOOP AT scores INTO DATA(lv_score).
      lv_sum = lv_sum + lv_score.

      IF lv_score > lv_max.
        lv_max = lv_score.
      ENDIF.

      IF lv_score < lv_min.
        lv_min = lv_score.
      ENDIF.
    ENDLOOP.

    DATA(lv_avg) = lv_sum / lines( scores ).

    out->write( |Sum:   { lv_sum }| ).
    out->write( |Count: { lines( scores ) }| ).
    out->write( |Avg:   { lv_avg }| ).
    out->write( |Max:   { lv_max }| ).
    out->write( |Min:   { lv_min }| ).
    out->write( `----------------------------------------` ).

    " ── Exercise 3: Safe Index Access ──────────────────────────────
    out->write( `=== Exercise 3: Safe Index Access ===` ).

    DATA cities TYPE TABLE OF string.

    APPEND `São Paulo`       TO cities.
    APPEND `Rio de Janeiro`  TO cities.
    APPEND `Belo Horizonte`  TO cities.

    out->write( |Cidade 1: { cities[ 1 ] }| ).

    TRY.
        DATA(lv_city) = cities[ 5 ].
        out->write( |Cidade 5: { lv_city }| ).
      CATCH cx_sy_itab_line_not_found.
        out->write( `Erro ao acessar cidade 5: índice não encontrado!` ).
    ENDTRY.
    out->write( `----------------------------------------` ).

    " ── Exercise 4: Multiplication Table ───────────────────────────
    out->write( `=== Exercise 4: Tabuada do 6 ===` ).

    CONSTANTS c_multiplier TYPE i VALUE 6.
    DATA multiplication_table TYPE TABLE OF string.

    DO 10 TIMES.
      APPEND |{ c_multiplier } x { sy-index WIDTH = 2 } = { c_multiplier * sy-index WIDTH = 2 }|
          TO multiplication_table.
    ENDDO.

    LOOP AT multiplication_table INTO DATA(lv_line).
      out->write( lv_line ).
    ENDLOOP.
    out->write( `----------------------------------------` ).

    " ── Exercise 5: Fibonacci Formatted ────────────────────────────
    out->write( `=== Exercise 5: Fibonacci ===` ).

    CONSTANTS max_count TYPE i VALUE 25.
    DATA numbers TYPE TABLE OF i.

    DO max_count TIMES.
      CASE sy-index.
        WHEN 1.
          APPEND 0 TO numbers.
        WHEN 2.
          APPEND 1 TO numbers.
        WHEN OTHERS.
          APPEND numbers[ sy-index - 2 ] + numbers[ sy-index - 1 ]
               TO numbers.
      ENDCASE.
    ENDDO.

    DATA output TYPE TABLE OF string.
    DATA(counter) = 0.

    LOOP AT numbers INTO DATA(number).
      counter = counter + 1.
      APPEND |{ counter WIDTH = 3 ALIGN = RIGHT }: { number WIDTH = 8 ALIGN = RIGHT }|
          TO output.
    ENDLOOP.

    out->write(
       data = output
       name = |The first { max_count } Fibonacci Numbers| ).
    out->write( `----------------------------------------` ).

    " ── Exercise 6: Expense Tracker ────────────────────────────────
    out->write( `=== CONTROLE DE GASTOS ===` ).

    DATA expenses TYPE TABLE OF p LENGTH 8 DECIMALS 2.

    APPEND '150.00' TO expenses.
    APPEND '89.90'  TO expenses.
    APPEND '245.50' TO expenses.
    APPEND '67.30'  TO expenses.
    APPEND '320.00' TO expenses.

    DATA(lv_total_expense) = 0.
    DATA(lv_count_above_100) = 0.
    DATA(lv_max_expense) = 0.

    LOOP AT expenses INTO DATA(lv_expense).
      out->write( |{ sy-tabix }. R$ { lv_expense }| ).

      lv_total_expense = lv_total_expense + lv_expense.

      IF lv_expense > 100.
        lv_count_above_100 = lv_count_above_100 + 1.
      ENDIF.

      IF lv_expense > lv_max_expense.
        lv_max_expense = lv_expense.
      ENDIF.
    ENDLOOP.

    DATA(lv_avg_expense) = lv_total_expense / lines( expenses ).

    out->write( |-------------------------| ).
    out->write( |Total:          R$ { lv_total_expense }| ).
    out->write( |Média:          R$ { lv_avg_expense }| ).
    out->write( |Acima de R$100: { lv_count_above_100 } gastos| ).
    out->write( |Maior gasto:    R$ { lv_max_expense }| ).
    out->write( `=== FIM ===` ).

  ENDMETHOD.

ENDCLASS.
