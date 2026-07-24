*&---------------------------------------------------------------------*
*& Data Objects and Data Types Demonstration
*& Unit 02 - Lesson 02: Working with Basic Data Objects and Data Types
*&---------------------------------------------------------------------*
*& Demonstrates: DATA, CONSTANTS, TYPES, built-in types, CLEAR,
*& inline declarations, and type conversions.
*&---------------------------------------------------------------------*
CLASS zcl_data_objects_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
ENDCLASS.

CLASS zcl_data_objects_demo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " ── Example 1: Variable Declaration (DATA) ──────────────────────
    out->write( `=== Example 1: Variable Declaration (DATA) ===` ).

    DATA lv_integer      TYPE i       VALUE 42.
    DATA lv_text         TYPE string  VALUE 'Hello ABAP'.
    DATA lv_flag         TYPE abap_bool VALUE abap_true.

    out->write( |lv_integer: { lv_integer }| ).
    out->write( |lv_text:    { lv_text }| ).
    out->write( |lv_flag:    { lv_flag }| ).
    out->write( `----------------------------------------` ).

    " ── Example 2: Built-in Types ───────────────────────────────────
    out->write( `=== Example 2: Built-in Types ===` ).

    DATA lv_date         TYPE d.
    DATA lv_time         TYPE t.
    DATA lv_price        TYPE p LENGTH 8 DECIMALS 2.
    DATA lv_char_fixed   TYPE c LENGTH 10.
    DATA lv_num_text     TYPE n LENGTH 8.

    lv_date       = '20260724'.
    lv_time       = '143000'.
    lv_price      = '199.90'.
    lv_char_fixed = 'ABC'.
    lv_num_text   = '00012345'.

    out->write( |lv_date (d):       { lv_date DATE = USER }| ).
    out->write( |lv_time (t):       { lv_time TIME = USER }| ).
    out->write( |lv_price (p):      { lv_price }| ).
    out->write( |lv_char_fixed (c): '{ lv_char_fixed }'| ).
    out->write( |lv_num_text (n):   '{ lv_num_text }'| ).
    out->write( `----------------------------------------` ).

    " ── Example 3: Local Types (TYPES) ──────────────────────────────
    out->write( `=== Example 3: Local Types (TYPES) ===` ).

    TYPES: tp_money   TYPE p LENGTH 8 DECIMALS 2,
           tp_name    TYPE string,
           tp_counter TYPE i.

    DATA lv_salary   TYPE tp_money  VALUE '5000.00'.
    DATA lv_employee TYPE tp_name   VALUE `Gabriel Vieira`.
    DATA lv_count    TYPE tp_counter VALUE 1.

    out->write( |lv_salary:   { lv_salary }| ).
    out->write( |lv_employee: { lv_employee }| ).
    out->write( |lv_count:    { lv_count }| ).
    out->write( `----------------------------------------` ).

    " ── Example 4: Constants (CONSTANTS) ────────────────────────────
    out->write( `=== Example 4: Constants (CONSTANTS) ===` ).

    CONSTANTS: lc_company     TYPE string VALUE `SAP SE`,
               lc_max_retries TYPE i      VALUE 3,
               lc_pi          TYPE p LENGTH 3 DECIMALS 2 VALUE '3.14'.

    out->write( |lc_company:     { lc_company }| ).
    out->write( |lc_max_retries: { lc_max_retries }| ).
    out->write( |lc_pi:          { lc_pi }| ).

    " The following line would cause a syntax error:
    " lc_company = 'SAP Brasil'.  " Cannot assign to a constant!
    out->write( `----------------------------------------` ).

    " ── Example 5: CLEAR ────────────────────────────────────────────
    out->write( `=== Example 5: CLEAR ===` ).

    DATA lv_clear_demo TYPE i VALUE 999.
    out->write( |Before CLEAR: { lv_clear_demo }| ).

    CLEAR lv_clear_demo.
    out->write( |After CLEAR:  { lv_clear_demo }| ).
    out->write( `----------------------------------------` ).

    " ── Example 6: Inline Declaration ────────────────────────────────
    out->write( `=== Example 6: Inline Declaration ===` ).

    DATA(lv_inline_text)   = `Declared inline!`.
    DATA(lv_inline_number) = 100.
    DATA(lv_inline_date)   = sy-datum.

    out->write( |lv_inline_text:   { lv_inline_text }| ).
    out->write( |lv_inline_number: { lv_inline_number }| ).
    out->write( |lv_inline_date:   { lv_inline_date DATE = USER }| ).
    out->write( `----------------------------------------` ).

    " ── Example 7: Type Conversion (careful!) ───────────────────────
    out->write( `=== Example 7: Type Conversion ===` ).

    DATA lv_int      TYPE i.
    DATA lv_string   TYPE string.

    " OK: numeric string to integer
    lv_string = '42'.
    lv_int    = lv_string.
    out->write( |'42' → i: { lv_int }| ).

    " WARNING: This would cause a runtime error!
    " lv_string = 'ABC'.
    " lv_int    = lv_string.  " 💥 runtime error
    out->write( `'ABC' → i would cause runtime error!` ).

    " Truncation example: long string to short c
    DATA lv_short TYPE c LENGTH 5.
    lv_short = 'Hello World'.
    out->write( |'Hello World' → c(5): '{ lv_short }'| ).

  ENDMETHOD.

ENDCLASS.
