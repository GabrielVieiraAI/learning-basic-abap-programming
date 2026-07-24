*&---------------------------------------------------------------------*
*& Data Processing Demonstration
*& Unit 02 - Lesson 03: Processing Data
*&---------------------------------------------------------------------*
*& Demonstrates: arithmetic calculations, string templates,
*& format options, and string concatenation.
*&---------------------------------------------------------------------*
CLASS zcl_processing_data_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
ENDCLASS.

CLASS zcl_processing_data_demo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " ── Example 1: Arithmetic Calculations ─────────────────────────
    out->write( `=== Example 1: Arithmetic Calculations ===` ).

    TYPES tp_result TYPE p LENGTH 8 DECIMALS 2.

    DATA lv_add       TYPE tp_result.
    DATA lv_sub       TYPE tp_result.
    DATA lv_mult      TYPE tp_result.
    DATA lv_div       TYPE tp_result.
    DATA lv_pow       TYPE tp_result.
    DATA lv_sqrt      TYPE tp_result.
    DATA lv_precedence TYPE tp_result.

    lv_add        = 10 + 5.
    lv_sub        = 10 - 5.
    lv_mult       = 10 * 5.
    lv_div        = 10 / 3.
    lv_pow        = 2 ** 10.
    lv_sqrt       = sqrt( 81 ).
    lv_precedence = ( 8 * 7 - 6 ) / ( 5 + 4 ).

    out->write( |10 + 5                 = { lv_add }| ).
    out->write( |10 - 5                 = { lv_sub }| ).
    out->write( |10 * 5                 = { lv_mult }| ).
    out->write( |10 / 3                 = { lv_div }| ).
    out->write( |2 ** 10                = { lv_pow }| ).
    out->write( |sqrt(81)               = { lv_sqrt }| ).
    out->write( |(8*7-6)/(5+4)          = { lv_precedence }| ).

    " Compare: division with integer type (truncation!)
    DATA lv_int_div TYPE i.
    lv_int_div = 10 / 3.
    out->write( |10 / 3 (TYPE i → truncado) = { lv_int_div }| ).
    out->write( `----------------------------------------` ).

    " ── Example 2: String Templates ────────────────────────────────
    out->write( `=== Example 2: String Templates ===` ).

    DATA lv_name   TYPE string VALUE `Gabriel`.
    DATA lv_age    TYPE i      VALUE 28.
    DATA lv_city   TYPE string VALUE `São Paulo`.

    " Simple template
    out->write( |Hello World!| ).

    " Template with variables
    out->write( |Name: { lv_name }, Age: { lv_age }, City: { lv_city }| ).

    " Template with arithmetic expression
    DATA lv_price TYPE p LENGTH 8 DECIMALS 2 VALUE '49.90'.
    DATA lv_qty   TYPE i VALUE 3.
    out->write( |Product total: { lv_price * lv_qty } EUR| ).
    out->write( `----------------------------------------` ).

    " ── Example 3: Format Options (Dates) ──────────────────────────
    out->write( `=== Example 3: Date Formatting ===` ).

    DATA lv_date TYPE d VALUE '19891109'.
    out->write( |Raw date:  { lv_date             }| ).
    out->write( |ISO date:  { lv_date DATE = ISO  }| ).
    out->write( |User date: { lv_date DATE = USER }| ).
    out->write( `----------------------------------------` ).

    " ── Example 4: Format Options (Numbers) ────────────────────────
    out->write( `=== Example 4: Number Formatting ===` ).

    DATA lv_number TYPE p LENGTH 5 DECIMALS 2 VALUE '-273.15'.
    out->write( |Raw number:    { lv_number                    }| ).
    out->write( |User format:   { lv_number NUMBER = USER      }| ).
    out->write( |Sign right:    { lv_number SIGN = RIGHT       }| ).
    out->write( |Scientific:    { lv_number STYLE = SCIENTIFIC }| ).
    out->write( `----------------------------------------` ).

    " ── Example 5: String Concatenation ────────────────────────────
    out->write( `=== Example 5: String Concatenation (&&) ===` ).

    DATA lv_part1 TYPE string VALUE `Hello`.
    DATA lv_part2 TYPE string VALUE `World`.

    DATA(lv_no_space)   = lv_part1 && lv_part2.
    DATA(lv_with_space) = lv_part1 && | | && lv_part2.

    out->write( |Without space: { lv_no_space }| ).
    out->write( |With space:    { lv_with_space }| ).

    " Combining templates and concatenation
    DATA lv_amount1 TYPE p LENGTH 8 DECIMALS 2 VALUE '10.50'.
    DATA lv_amount2 TYPE p LENGTH 8 DECIMALS 2 VALUE '20.75'.

    DATA(lv_equation) = |{ lv_amount1 } + { lv_amount2 }| &&
                        | = | &&
                        |{ lv_amount1 + lv_amount2 }|.

    out->write( lv_equation ).
    out->write( `----------------------------------------` ).

    " ── Example 6: Full Exercise - Compute and Format ──────────────
    out->write( `=== Example 6: Full Exercise ===` ).

    DATA lv_num1 TYPE i.
    DATA lv_num2 TYPE i.
    DATA lv_final_result TYPE p LENGTH 8 DECIMALS 2.

    lv_num1 = -8.
    lv_num2 =  3.

    lv_final_result = lv_num1 / lv_num2.

    DATA(lv_output) = |{ lv_num1 } / { lv_num2 } = { lv_final_result }|.

    out->write( lv_output ).
    out->write( `----------------------------------------` ).

  ENDMETHOD.

ENDCLASS.
