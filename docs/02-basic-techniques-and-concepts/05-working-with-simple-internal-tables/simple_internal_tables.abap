*&---------------------------------------------------------------------*
*& Simple Internal Tables Demonstration
*& Unit 02 - Lesson 05: Working with Simple Internal Tables
*&---------------------------------------------------------------------*
*& Demonstrates: TYPE TABLE OF, APPEND, CLEAR, table expressions,
*& LOOP AT/ENDLOOP, sy-tabix, inline declaration, WIDTH/ALIGN.
*&---------------------------------------------------------------------*
CLASS zcl_simple_itab_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
ENDCLASS.

CLASS zcl_simple_itab_demo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " ── Example 1: Declare and Fill Internal Table ─────────────────
    out->write( `=== Example 1: APPEND to Internal Table ===` ).

    DATA numbers TYPE TABLE OF i.

    APPEND 4711 TO numbers.
    APPEND 1234 TO numbers.
    APPEND 2468 TO numbers.

    out->write( |Table has { lines( numbers ) } rows| ).
    out->write( numbers ).
    out->write( `----------------------------------------` ).

    " ── Example 2: Table Expressions (1-based index) ───────────────
    out->write( `=== Example 2: Table Expressions ===` ).

    DATA(lv_first)  = numbers[ 1 ].
    DATA(lv_second) = numbers[ 2 ].
    DATA(lv_third)  = numbers[ 3 ].

    out->write( |Row 1: { lv_first }| ).
    out->write( |Row 2: { lv_second }| ).
    out->write( |Row 3: { lv_third }| ).

    " Direct use in string template
    out->write( |Direct: { numbers[ 1 ] }, { numbers[ 2 ] }| ).
    out->write( `----------------------------------------` ).

    " ── Example 3: LOOP AT with sy-tabix ───────────────────────────
    out->write( `=== Example 3: LOOP AT ... ENDLOOP ===` ).

    LOOP AT numbers INTO DATA(lv_num).
      out->write( |Row { sy-tabix }: { lv_num }| ).
    ENDLOOP.
    out->write( `----------------------------------------` ).

    " ── Example 4: CLEAR internal table ────────────────────────────
    out->write( `=== Example 4: CLEAR ===` ).

    out->write( |Before CLEAR: { lines( numbers ) } rows| ).
    CLEAR numbers.
    out->write( |After CLEAR:  { lines( numbers ) } rows| ).
    out->write( `----------------------------------------` ).

    " ── Example 5: Local Table Type ────────────────────────────────
    out->write( `=== Example 5: Local Table Type ===` ).

    TYPES tt_names TYPE TABLE OF string.
    DATA names TYPE tt_names.

    APPEND `Gabriel` TO names.
    APPEND `Maria`   TO names.
    APPEND `João`    TO names.

    LOOP AT names INTO DATA(lv_name).
      out->write( |{ sy-tabix }. { lv_name }| ).
    ENDLOOP.
    out->write( `----------------------------------------` ).

    " ── Example 6: Global Table Type (string_table) ────────────────
    out->write( `=== Example 6: Global Type (string_table) ===` ).

    DATA fruits TYPE string_table.

    APPEND `Apple`  TO fruits.
    APPEND `Banana` TO fruits.
    APPEND `Orange` TO fruits.

    LOOP AT fruits INTO DATA(lv_fruit).
      out->write( lv_fruit ).
    ENDLOOP.
    out->write( `----------------------------------------` ).

    " ── Example 7: Fibonacci Sequence ──────────────────────────────
    out->write( `=== Example 7: Fibonacci Sequence ===` ).

    CONSTANTS lc_max_count TYPE i VALUE 15.
    DATA fib_numbers TYPE TABLE OF i.

    DO lc_max_count TIMES.
      CASE sy-index.
        WHEN 1.
          APPEND 0 TO fib_numbers.
        WHEN 2.
          APPEND 1 TO fib_numbers.
        WHEN OTHERS.
          APPEND fib_numbers[ sy-index - 2 ] + fib_numbers[ sy-index - 1 ]
               TO fib_numbers.
      ENDCASE.
    ENDDO.

    " Format output with WIDTH and ALIGN
    DATA output_lines TYPE TABLE OF string.

    LOOP AT fib_numbers INTO DATA(lv_fib).
      APPEND |{ sy-tabix WIDTH = 2 ALIGN = RIGHT }: { lv_fib WIDTH = 6 ALIGN = RIGHT }|
          TO output_lines.
    ENDLOOP.

    out->write(
       data = output_lines
       name = |The first { lc_max_count } Fibonacci Numbers| ).
    out->write( `----------------------------------------` ).

    " ── Example 8: Practical - Shopping Cart ───────────────────────
    out->write( `=== Example 8: Shopping Cart ===` ).

    TYPES: tp_price  TYPE p LENGTH 8 DECIMALS 2,
           tt_prices TYPE TABLE OF tp_price.
    DATA cart_prices TYPE tt_prices.

    APPEND '29.90' TO cart_prices.
    APPEND '149.99' TO cart_prices.
    APPEND '9.50' TO cart_prices.

    DATA(lv_subtotal) = 0.
    CONSTANTS lc_tax_rate TYPE p LENGTH 3 DECIMALS 2 VALUE '10.00'.

    LOOP AT cart_prices INTO DATA(lv_price).
      out->write( |Item { sy-tabix }: { lv_price }| ).
      lv_subtotal = lv_subtotal + lv_price.
    ENDLOOP.

    DATA(lv_tax)   = lv_subtotal * lc_tax_rate / 100.
    DATA(lv_total) = lv_subtotal + lv_tax.

    out->write( |------------------------| ).
    out->write( |Subtotal: { lv_subtotal }| ).
    out->write( |Tax ({ lc_tax_rate }%): { lv_tax }| ).
    out->write( |TOTAL:    { lv_total }| ).

  ENDMETHOD.

ENDCLASS.
