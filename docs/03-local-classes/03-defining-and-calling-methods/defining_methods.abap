*"* Demonstration: Defining and Calling Methods
*"* 
*"* This code demonstrates the full exercise solution combining:
*"*   - Local Types tab: class lcl_connection with methods
*"*   - Global Class tab: method calls with exception handling
*"*
*"* See: docs/03-local-classes/03-defining-and-calling-methods/README.md

*"* ===========================================
*"* Global Class tab
*"* ===========================================
CLASS zcl_##_methods DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_##_methods IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA connection  TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

* Primeira Instância
**********************************************************************
    connection = NEW #( ).

    TRY.
        connection->set_attributes(
          EXPORTING
            i_carrier_id    = 'LH'
            i_connection_id = '0400'
        ).

        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

* Segunda Instância
**********************************************************************
    connection = NEW #( ).

    TRY.
        connection->set_attributes(
          EXPORTING
            i_carrier_id    = 'AA'
            i_connection_id = '0017'
        ).

        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

* Terceira Instância
**********************************************************************
    connection = NEW #( ).

    TRY.
        connection->set_attributes(
          EXPORTING
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
