"! Simple Hello World class for Unit 01 Lesson 04
"! Demonstrates the basic structure of an ABAP class
"! To run: press F9 in Eclipse/ADT
CLASS zcl_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    "! Outputs a welcome message
    METHODS say_hello
      RETURNING VALUE(rv_message) TYPE string.

ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( say_hello( ) ).
  ENDMETHOD.

  METHOD say_hello.
    rv_message = 'Hello, ABAP World!'.
  ENDMETHOD.

ENDCLASS.
