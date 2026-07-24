*&---------------------------------------------------------------------*
*& Control Structures Demonstration
*& Unit 02 - Lesson 04: Using Control Structures in ABAP
*&---------------------------------------------------------------------*
*& Demonstrates: IF/ELSEIF/ELSE/ENDIF, CASE/ENDCASE,
*& TRY/CATCH/ENDTRY, DO/ENDDO, sy-index, EXIT.
*&---------------------------------------------------------------------*
CLASS zcl_control_structures_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
ENDCLASS.

CLASS zcl_control_structures_demo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " ── Example 1: IF ... ENDIF ────────────────────────────────────
    out->write( `=== Example 1: IF ... ENDIF ===` ).

    DATA lv_value TYPE i VALUE 0.

    IF lv_value = 0.
      out->write( `Value is zero` ).
    ELSEIF lv_value > 0.
      out->write( `Value is positive` ).
    ELSE.
      out->write( `Value is negative` ).
    ENDIF.

    " Test with different values
    lv_value = 42.
    IF lv_value = 0.
      out->write( `Value is zero` ).
    ELSEIF lv_value > 0.
      out->write( `Value is positive` ).
    ELSE.
      out->write( `Value is negative` ).
    ENDIF.

    lv_value = -5.
    IF lv_value = 0.
      out->write( `Value is zero` ).
    ELSEIF lv_value > 0.
      out->write( `Value is positive` ).
    ELSE.
      out->write( `Value is negative` ).
    ENDIF.
    out->write( `----------------------------------------` ).

    " ── Example 2: Logical Expressions ─────────────────────────────
    out->write( `=== Example 2: Logical Expressions ===` ).

    DATA lv_age TYPE i VALUE 25.

    IF lv_age >= 18 AND lv_age <= 65.
      out->write( |Age { lv_age }: Working age| ).
    ELSE.
      out->write( |Age { lv_age }: Not working age| ).
    ENDIF.

    " IS INITIAL / IS NOT INITIAL
    DATA lv_name TYPE string.
    IF lv_name IS INITIAL.
      out->write( `Name is empty (initial)` ).
    ENDIF.

    lv_name = `Gabriel`.
    IF lv_name IS NOT INITIAL.
      out->write( |Name is: { lv_name }| ).
    ENDIF.

    " BETWEEN ... AND
    DATA lv_score TYPE i VALUE 75.
    IF lv_score BETWEEN 60 AND 100.
      out->write( |Score { lv_score }: Passed| ).
    ELSE.
      out->write( |Score { lv_score }: Failed| ).
    ENDIF.
    out->write( `----------------------------------------` ).

    " ── Example 3: CASE ... ENDCASE ────────────────────────────────
    out->write( `=== Example 3: CASE ... ENDCASE ===` ).

    DATA lv_day TYPE i VALUE 3.

    CASE lv_day.
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
        out->write( `Invalid day number` ).
    ENDCASE.
    out->write( `----------------------------------------` ).

    " ── Example 4: TRY ... CATCH ... ENDTRY ────────────────────────
    out->write( `=== Example 4: Exception Handling ===` ).

    DATA lv_result TYPE i.

    " 4a: Conversion error
    out->write( `--- 4a: Conversion Error ---` ).
    DATA(lv_text) = 'ABC'.

    TRY.
        lv_result = lv_text.
        out->write( |Converted: { lv_result }| ).
      CATCH cx_sy_conversion_no_number.
        out->write( |Error: '{ lv_text }' is not a number!| ).
    ENDTRY.

    " No error case
    lv_text = '123'.
    TRY.
        lv_result = lv_text.
        out->write( |Converted: { lv_result }| ).
      CATCH cx_sy_conversion_no_number.
        out->write( |Error: '{ lv_text }' is not a number!| ).
    ENDTRY.

    " 4b: Division by zero
    out->write( `--- 4b: Division by Zero ---` ).
    DATA(lv_divisor) = 0.

    TRY.
        lv_result = 100 / lv_divisor.
        out->write( |100 / { lv_divisor } = { lv_result }| ).
      CATCH cx_sy_zerodivide.
        out->write( `Error: Division by zero!` ).
    ENDTRY.

    " No error case
    lv_divisor = 4.
    TRY.
        lv_result = 100 / lv_divisor.
        out->write( |100 / { lv_divisor } = { lv_result }| ).
      CATCH cx_sy_zerodivide.
        out->write( `Error: Division by zero!` ).
    ENDTRY.
    out->write( `----------------------------------------` ).

    " ── Example 5: DO ... ENDDO ────────────────────────────────────
    out->write( `=== Example 5: DO ... ENDDO ===` ).

    " 5a: Fixed number of iterations
    out->write( `--- 5a: DO with TIMES ---` ).
    DO 3 TIMES.
      out->write( |Iteration { sy-index }: Hello World| ).
    ENDDO.

    " 5b: EXIT condition
    out->write( `--- 5b: DO with EXIT ---` ).
    DATA lv_counter TYPE i VALUE 5.

    DO.
      out->write( |{ sy-index }: Count = { lv_counter }| ).
      lv_counter = lv_counter - 1.

      IF lv_counter <= 0.
        EXIT.
      ENDIF.
    ENDDO.

    " 5c: Countdown with sy-index
    out->write( `--- 5c: Countdown ---` ).
    DO 5 TIMES.
      DATA(lv_remaining) = 6 - sy-index.
      out->write( |{ lv_remaining }...| ).
    ENDDO.
    out->write( `----------------------------------------` ).

    " ── Example 6: Complete Exercise ───────────────────────────────
    out->write( `=== Example 6: Grade Calculator ===` ).

    DATA lv_grade TYPE i.

    DO 5 TIMES.
      " Simulate different grades
      CASE sy-index.
        WHEN 1.
          lv_grade = 95.
        WHEN 2.
          lv_grade = 72.
        WHEN 3.
          lv_grade = 55.
        WHEN 4.
          lv_grade = 38.
        WHEN 5.
          lv_grade = 0.
      ENDCASE.

      " Determine result
      DATA(lv_result_text) = `Unknown`.

      TRY.
          IF lv_grade > 100 OR lv_grade < 0.
            lv_result_text = `Invalid grade`.
          ELSEIF lv_grade >= 90.
            lv_result_text = `A - Excellent`.
          ELSEIF lv_grade >= 70.
            lv_result_text = `B - Good`.
          ELSEIF lv_grade >= 50.
            lv_result_text = `C - Average`.
          ELSEIF lv_grade >= 30.
            lv_result_text = `D - Below Average`.
          ELSE.
            lv_result_text = `F - Fail`.
          ENDIF.

        CATCH cx_sy_conversion_no_number.
          lv_result_text = `Error in calculation`.
      ENDTRY.

      out->write( |Student { sy-index }: { lv_grade }% → { lv_result_text }| ).
    ENDDO.

  ENDMETHOD.

ENDCLASS.
