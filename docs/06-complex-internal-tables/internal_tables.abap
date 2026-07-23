*&---------------------------------------------------------------------*
*& Report ZINTERNAL_TABLES_DEMO
*&---------------------------------------------------------------------*
*& Demonstrates complex internal table operations
*& Unit 06: Working with Complex Internal Tables
*&---------------------------------------------------------------------*
REPORT zinternal_tables_demo.

TYPES: BEGIN OF ty_product,
         id    TYPE i,
         name  TYPE string,
         price TYPE p LENGTH 10 DECIMALS 2,
       END OF ty_product.

DATA: lt_products TYPE SORTED TABLE OF ty_product WITH UNIQUE KEY id,
      ls_product  TYPE ty_product.

START-OF-SELECTION.
  ls_product-id = 100.
  ls_product-name = 'Laptop'.
  ls_product-price = '1500.00'.
  INSERT ls_product INTO TABLE lt_products.

  ls_product-id = 101.
  ls_product-name = 'Mouse'.
  ls_product-price = '25.00'.
  INSERT ls_product INTO TABLE lt_products.

  READ TABLE lt_products WITH TABLE KEY id = 100 INTO ls_product.
  IF sy-subrc = 0.
    WRITE: / 'Found:', ls_product-name, ls_product-price.
  ENDIF.
