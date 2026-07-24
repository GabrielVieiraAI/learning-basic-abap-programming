*"* Solution: Exercise 02 — Creating Instances of a Class
*"*
*"* File: docs/03-local-classes/02-creating-instances-of-a-class/solution.abap
*"*
*"* This code belongs to the Global Class tab of ZCL_##_INSTANCES
*"* (or ZCL_##_LOCAL_CLASS).
*"*
*"* Prerequisites:
*"*   1. Global class implements IF_OO_ADT_CLASSRUN
*"*   2. Local class lcl_connection defined in Local Types tab
*"*      with attributes carrier_id, connection_id (instance)
*"*      and conn_counter (static)
*"*
*"* To use:
*"*   1. Paste this code in the Global Class tab
*"*   2. Activate with Ctrl + F3
*"*   3. Set breakpoint on first APPEND and debug with F9/F5

CLASS zcl_##_instances DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_##_instances IMPLEMENTATION.

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

* Atributo estático: pertence à classe, não a uma instância
**********************************************************************
    lcl_connection=>conn_counter = 3.

  ENDMETHOD.

ENDCLASS.
