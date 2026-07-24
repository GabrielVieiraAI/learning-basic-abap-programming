*&---------------------------------------------------------------------*
*& Solution: Control Structures Exercises
*& Unit 02 - Lesson 04
*&---------------------------------------------------------------------*
CLASS zcl_control_structures_sol DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
ENDCLASS.

CLASS zcl_control_structures_sol IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " ── Exercise 1: Number Classifier ──────────────────────────────
    out->write( `=== Exercise 1: Number Classifier ===` ).

    CONSTANTS c_test_number TYPE i VALUE -7.

    IF c_test_number = 0.
      out->write( `O número é zero.` ).
    ELSEIF c_test_number > 0.
      out->write( `O número é positivo.` ).
    ELSE.
      out->write( `O número é negativo.` ).
    ENDIF.
    out->write( `----------------------------------------` ).

    " ── Exercise 2: Days of the Week ───────────────────────────────
    out->write( `=== Exercise 2: Days of the Week ===` ).

    DATA lv_dia TYPE i VALUE 4.

    CASE lv_dia.
      WHEN 1.
        out->write( `Monday` ).
      WHEN 2.
        out->write( `Tuesday` ).
      WHEN 3.
        out->write( `Wednesday` ).
      WHEN 4.
        out->write( `Thursday` ).
      WHEN 5.
        out->write( `Friday` ).
      WHEN 6.
        out->write( `Saturday` ).
      WHEN 7.
        out->write( `Sunday` ).
      WHEN OTHERS.
        out->write( `Dia inválido` ).
    ENDCASE.
    out->write( `----------------------------------------` ).

    " ── Exercise 3: Safe Calculator ────────────────────────────────
    out->write( `=== Exercise 3: Safe Calculator ===` ).

    DATA lv_num1 TYPE i VALUE 10.
    DATA lv_num2 TYPE i VALUE 0.
    DATA lv_calc_result TYPE p LENGTH 8 DECIMALS 2.

    " Case 1: Division by zero
    TRY.
        lv_calc_result = lv_num1 / lv_num2.
        out->write( |{ lv_num1 } / { lv_num2 } = { lv_calc_result }| ).
      CATCH cx_sy_zerodivide.
        out->write( `Erro: Divisão por zero!` ).
    ENDTRY.

    " Case 2: Success
    lv_num2 = 2.
    TRY.
        lv_calc_result = lv_num1 / lv_num2.
        out->write( |{ lv_num1 } / { lv_num2 } = { lv_calc_result }| ).
      CATCH cx_sy_zerodivide.
        out->write( `Erro: Divisão por zero!` ).
    ENDTRY.

    " Bonus: conversion error
    TRY.
        DATA(lv_bad) = 'XYZ'.
        lv_calc_result = lv_bad.
      CATCH cx_sy_conversion_no_number.
        out->write( `Erro: String não é um número!` ).
    ENDTRY.
    out->write( `----------------------------------------` ).

    " ── Exercise 4: Multiplication Table ───────────────────────────
    out->write( `=== Exercise 4: Multiplication Table ===` ).

    CONSTANTS c_tabuada TYPE i VALUE 7.

    DO 10 TIMES.
      DATA(lv_product) = c_tabuada * sy-index.
      out->write( |{ c_tabuada } x { sy-index } = { lv_product }| ).
    ENDDO.
    out->write( `----------------------------------------` ).

    " ── Exercise 5: Countdown with EXIT ────────────────────────────
    out->write( `=== Exercise 5: Countdown ===` ).

    DATA lv_start TYPE i VALUE 10.

    DO.
      out->write( |{ sy-index }: Contagem = { lv_start }| ).
      lv_start = lv_start - 1.

      IF lv_start <= 0.
        EXIT.
      ENDIF.
    ENDDO.
    out->write( `----------------------------------------` ).

    " ── Exercise 6: Grade Calculator ───────────────────────────────
    out->write( `=== BOLETIM ===` ).

    CONSTANTS c_qtd_alunos TYPE i VALUE 5.
    DATA lv_nota TYPE i.
    DATA lv_classificacao TYPE string.

    DO c_qtd_alunos TIMES.

      " Simulate grades based on student number
      CASE sy-index.
        WHEN 1.
          lv_nota = 95.
        WHEN 2.
          lv_nota = 72.
        WHEN 3.
          lv_nota = 88.
        WHEN 4.
          lv_nota = 45.
        WHEN 5.
          lv_nota = 60.
      ENDCASE.

      " Classify with IF/ELSEIF (inside TRY for safety)
      TRY.
          IF lv_nota >= 90.
            lv_classificacao = `A - Excelente`.
          ELSEIF lv_nota >= 70.
            lv_classificacao = `B - Bom`.
          ELSEIF lv_nota >= 50.
            lv_classificacao = `C - Regular`.
          ELSEIF lv_nota >= 30.
            lv_classificacao = `D - Abaixo da média`.
          ELSE.
            lv_classificacao = `F - Reprovado`.
          ENDIF.

          out->write( |Aluno { sy-index }: Nota { lv_nota } → { lv_classificacao }| ).

        CATCH cx_sy_conversion_no_number.
          out->write( `Erro ao processar nota do aluno { sy-index }` ).
      ENDTRY.

    ENDDO.
    out->write( `=== FIM ===` ).

  ENDMETHOD.

ENDCLASS.
