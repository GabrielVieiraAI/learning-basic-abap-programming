*&---------------------------------------------------------------------*
*& Report ZLOCAL_CLASS_DEMO
*&---------------------------------------------------------------------*
*& Demonstrates a local class in ABAP
*& Unit 03: Working with Local Classes
*&---------------------------------------------------------------------*
REPORT zlocal_class_demo.

CLASS lcl_vehicle DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_make TYPE string,
             display_make.
  PRIVATE SECTION.
    DATA: mv_make TYPE string.
ENDCLASS.

CLASS lcl_vehicle IMPLEMENTATION.
  METHOD constructor.
    mv_make = iv_make.
  ENDMETHOD.

  METHOD display_make.
    WRITE: / 'Vehicle make:', mv_make.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA(lo_vehicle) = NEW lcl_vehicle( 'SAP' ).
  lo_vehicle->display_make( ).
