*&---------------------------------------------------------------------*
*& Report ZDATA_TYPES_DEMO
*&---------------------------------------------------------------------*
*& Demonstrates basic data types and control structures
*& Unit 02: Applying Basic Techniques and Concepts
*&---------------------------------------------------------------------*
REPORT zdata_types_demo.

DATA: lv_integer TYPE i VALUE 10,
      lv_string  TYPE string VALUE 'ABAP',
      lv_flag    TYPE abap_bool VALUE abap_true.

START-OF-SELECTION.
  WRITE: / 'Integer:', lv_integer.
  WRITE: / 'String:', lv_string.

  IF lv_flag = abap_true.
    WRITE: / 'Flag is true'.
  ELSE.
    WRITE: / 'Flag is false'.
  ENDIF.
