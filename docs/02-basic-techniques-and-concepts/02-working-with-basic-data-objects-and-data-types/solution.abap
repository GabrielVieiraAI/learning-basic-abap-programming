*&---------------------------------------------------------------------*
*& Solution: Data Objects and Data Types Exercises
*& Unit 02 - Lesson 02
*&---------------------------------------------------------------------*
CLASS zcl_data_types_data_object DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
ENDCLASS.

CLASS zcl_data_types_data_object IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " ── Exercise 1: Variable Declaration ────────────────────────────
    out->write( `=== Exercise 1: Employee Record ===` ).

    DATA lv_name       TYPE string VALUE 'Maria Silva'.
    DATA lv_age        TYPE i      VALUE 32.
    DATA lv_salary     TYPE p LENGTH 8 DECIMALS 2 VALUE '7500.50'.
    DATA lv_employee_code TYPE n LENGTH 5 VALUE '00123'.
    DATA lv_hire_date  TYPE d      VALUE '20240701'.
    DATA lv_active     TYPE abap_bool VALUE abap_true.

    out->write( |Name:          { lv_name }| ).
    out->write( |Age:           { lv_age }| ).
    out->write( |Salary:        { lv_salary }| ).
    out->write( |Employee Code: { lv_employee_code }| ).
    out->write( |Hire Date:     { lv_hire_date DATE = USER }| ).
    out->write( |Active:        { lv_active }| ).
    out->write( `----------------------------------------` ).

    " ── Exercise 2: Local Types with TYPES ──────────────────────────
    out->write( `=== Exercise 2: Local Types (TYPES) ===` ).

    TYPES: tp_cep   TYPE n LENGTH 8,
           tp_score TYPE i.

    DATA lv_my_cep   TYPE tp_cep   VALUE '01001000'.
    DATA lv_my_score TYPE tp_score VALUE 850.

    out->write( |CEP:   { lv_my_cep }| ).
    out->write( |Score: { lv_my_score }| ).
    out->write( `----------------------------------------` ).

    " ── Exercise 3: Constants and CLEAR ─────────────────────────────
    out->write( `=== Exercise 3: Constants and CLEAR ===` ).

    CONSTANTS lc_interest_rate TYPE p LENGTH 3 DECIMALS 2 VALUE '5.25'.
    DATA lv_value TYPE p LENGTH 8 DECIMALS 2 VALUE '1000.00'.

    out->write( |Interest rate (constant): { lc_interest_rate }| ).
    out->write( |Value (initial):          { lv_value }| ).

    lv_value = '2500.00'.
    out->write( |Value (after assignment): { lv_value }| ).

    CLEAR lv_value.
    out->write( |Value (after CLEAR):      { lv_value }| ).
    out->write( `Note: CLEAR restores type-initial (0.00),` ).
    out->write( `      NOT the VALUE from declaration (1000.00).` ).
    out->write( `----------------------------------------` ).

    " ── Exercise 4: Implicit Type Conversion ────────────────────────
    out->write( `=== Exercise 4: Implicit Type Conversion ===` ).

    DATA lv_number TYPE i.

    " This works: numeric string → integer
    lv_number = '100'.
    out->write( |'100' → i: { lv_number }| ).

    " This would cause runtime error:
    " lv_number = 'XYZ'.  " 💥 Cannot convert 'XYZ' to number
    out->write( `'XYZ' → i: *** RUNTIME ERROR ***` ).

    " Truncation: long text into short character field
    DATA lv_short TYPE c LENGTH 4.
    lv_short = 'ABCDEFGH'.
    out->write( |'ABCDEFGH' → c(4): '{ lv_short }'| ).
    out->write( `Result: Only first 4 chars kept ('ABCD'), rest truncated.` ).
    out->write( `----------------------------------------` ).

    " ── Exercise 5: Product Registration Mini-App ───────────────────
    out->write( `─── PRODUTO ───` ).

    DATA lv_product_name  TYPE string VALUE `Notebook XPS 15`.
    DATA lv_unit_price    TYPE p LENGTH 8 DECIMALS 2 VALUE '4599.90'.
    DATA lv_stock_qty     TYPE i VALUE 25.
    DATA lv_product_code  TYPE c LENGTH 6 VALUE 'NB-X15'.
    DATA lv_reg_date      TYPE d.

    lv_reg_date = sy-datum.

    " Inline declaration for total value (price × quantity)
    DATA(lv_total_value) = lv_unit_price * lv_stock_qty.

    out->write( |Nome:       { lv_product_name }| ).
    out->write( |Preço:      { lv_unit_price }| ).
    out->write( |Qtd:        { lv_stock_qty }| ).
    out->write( |Valor Total:{ lv_total_value }| ).
    out->write( |Código:     { lv_product_code }| ).
    out->write( |Data Cad:   { lv_reg_date DATE = USER }| ).
    out->write( `─── FIM ───` ).

  ENDMETHOD.

ENDCLASS.
