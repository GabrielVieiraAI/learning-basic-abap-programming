*&---------------------------------------------------------------------*
*& Solution: Processing Data Exercises
*& Unit 02 - Lesson 03
*&---------------------------------------------------------------------*
CLASS zcl_processing_data_solution DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
ENDCLASS.

CLASS zcl_processing_data_solution IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " ── Exercise 1: Simple Calculator ──────────────────────────────
    out->write( `=== CALCULATOR ===` ).

    DATA lv_a TYPE i VALUE 15.
    DATA lv_b TYPE i VALUE 4.
    DATA lv_result TYPE p LENGTH 8 DECIMALS 2.

    lv_result = lv_a + lv_b.
    out->write( |{ lv_a } + { lv_b } = { lv_result }| ).

    lv_result = lv_a - lv_b.
    out->write( |{ lv_a } - { lv_b } = { lv_result }| ).

    lv_result = lv_a * lv_b.
    out->write( |{ lv_a } * { lv_b } = { lv_result }| ).

    lv_result = lv_a / lv_b.
    out->write( |{ lv_a } / { lv_b } = { lv_result }| ).
    out->write( `----------------------------------------` ).

    " ── Exercise 2: Date Formatting ────────────────────────────────
    out->write( `=== Exercise 2: Date Formatting ===` ).

    DATA lv_birthdate TYPE d VALUE '19900115'.

    DATA(lv_date_raw)  = |Raw date:  { lv_birthdate             }|.
    DATA(lv_date_iso)  = |ISO date:  { lv_birthdate DATE = ISO  }|.
    DATA(lv_date_user) = |User date: { lv_birthdate DATE = USER }|.

    out->write( lv_date_raw ).
    out->write( lv_date_iso ).
    out->write( lv_date_user ).
    out->write( `----------------------------------------` ).

    " ── Exercise 3: Creative Concatenation ─────────────────────────
    out->write( `=== Exercise 3: Creative Concatenation ===` ).

    DATA lv_greeting TYPE string VALUE `Bom dia`.
    DATA lv_name     TYPE string VALUE `Gabriel`.
    DATA lv_message  TYPE string VALUE `bem-vindo ao curso de ABAP`.

    DATA(lv_full_message) = lv_greeting && `, ` &&
                            lv_name && `! Seja ` &&
                            lv_message && `.`.

    out->write( lv_full_message ).
    out->write( `----------------------------------------` ).

    " ── Exercise 4: Scientific Number Formatting ───────────────────
    out->write( `=== Exercise 4: Scientific Number Formatting ===` ).

    DATA lv_value TYPE p LENGTH 8 DECIMALS 4 VALUE '0.00042'.

    out->write( |Raw:         { lv_value                    }| ).
    out->write( |User format: { lv_value NUMBER = USER      }| ).
    out->write( |Scientific:  { lv_value STYLE = SCIENTIFIC }| ).
    out->write( |Engineering: { lv_value STYLE = ENGINEERING}| ).
    out->write( `----------------------------------------` ).

    " ── Exercise 5: Order Receipt Mini-App ─────────────────────────
    out->write( `=== RECIBO ===` ).

    DATA lv_product      TYPE string VALUE `Mouse Gamer`.
    DATA lv_unit_price   TYPE p LENGTH 8 DECIMALS 2 VALUE '129.90'.
    DATA lv_quantity     TYPE i VALUE 3.
    DATA lv_discount_pct TYPE p LENGTH 3 DECIMALS 2 VALUE '10.00'.

    DATA(lv_subtotal)       = lv_unit_price * lv_quantity.
    DATA(lv_discount_amount) = lv_subtotal * lv_discount_pct / 100.
    DATA(lv_total)           = lv_subtotal - lv_discount_amount.

    out->write( |Produto:    { lv_product }| ).
    out->write( |Preço unit: { lv_unit_price }| ).
    out->write( |Quantidade: { lv_quantity }| ).
    out->write( |Subtotal:   { lv_subtotal }| ).
    out->write( |Desconto:   { lv_discount_pct }%| ).
    out->write( |Valor desc: { lv_discount_amount }| ).
    out->write( |TOTAL:      { lv_total }| ).
    out->write( `=== FIM ===` ).

  ENDMETHOD.

ENDCLASS.
