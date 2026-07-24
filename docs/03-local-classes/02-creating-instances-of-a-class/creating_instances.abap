*"* Demonstration: Creating Instances of a Class
*"* 
*"* This code belongs to the Global Class tab of ZCL_##_LOCAL_CLASS
*"* (or ZCL_##_INSTANCES).
*"*
*"* Prerequisites: Local class lcl_connection must be defined in Local Types tab
*"* See: docs/03-local-classes/02-creating-instances-of-a-class/README.md

CLASS zcl_##_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_##_local_class IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA connection  TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

* Primeira Instância
**********************************************************************
    connection = NEW #( ).

    connection->carrier_id    = 'LH'.
    connection->connection_id = '0400'.

    APPEND connection TO connections.

* Segunda Instância
**********************************************************************
    connection = NEW #( ).

    connection->carrier_id    = 'AA'.
    connection->connection_id = '0017'.

    APPEND connection TO connections.

* Terceira Instância
**********************************************************************
    connection = NEW #( ).

    connection->carrier_id    = 'SQ'.
    connection->connection_id = '0001'.

    APPEND connection TO connections.

  ENDMETHOD.

ENDCLASS.
