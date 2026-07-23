*&---------------------------------------------------------------------*
*& Solution for Unit 01 Lesson 04: Developing Your First ABAP Application
*&
*& Exercise: Modify the Hello World class to greet a specific user
*&           and include the current system date.
*&---------------------------------------------------------------------*
CLASS zcl_hello_user_solution DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS greet_user
      IMPORTING iv_name       TYPE string
      RETURNING VALUE(rv_greeting) TYPE string.

ENDCLASS.

CLASS zcl_hello_user_solution IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( greet_user( iv_name = 'ABAP Developer' ) ).
  ENDMETHOD.

  METHOD greet_user.
    rv_greeting = |Hello, { iv_name }! Today is { cl_abap_context_info=>get_system_date( ) DATE = USER }.|.
  ENDMETHOD.

ENDCLASS.
