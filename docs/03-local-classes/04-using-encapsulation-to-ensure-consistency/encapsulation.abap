*"* Demonstration: Using Encapsulation to Ensure Consistency
*"*
*"* This code demonstrates private attributes, instance constructor,
*"* and static constructor (class_constructor).
*"*
*"* See: docs/03-local-classes/04-using-encapsulation-to-ensure-consistency/README.md

*"* ===========================================
*"* Global Class tab
*"* ===========================================
CLASS zcl_##_constructor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_##_constructor IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA connection  TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

* Primeira Instância
**********************************************************************
    TRY.
        connection = NEW #(
          i_carrier_id    = 'LH'
          i_connection_id = '0400'
        ).

        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

* Segunda Instância
**********************************************************************
    TRY.
        connection = NEW #(
          i_carrier_id    = 'AA'
          i_connection_id = '0017'
        ).

        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

* Terceira Instância
**********************************************************************
    TRY.
        connection = NEW #(
          i_carrier_id    = 'SQ'
          i_connection_id = '0001'
        ).

        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

* Output — Functional Method
**********************************************************************
    LOOP AT connections INTO connection.

      out->write( connection->get_output( ) ).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
