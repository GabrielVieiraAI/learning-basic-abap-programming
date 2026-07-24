*"* Solution: Exercise 01 — Defining a Local Class
*"*
*"* File: docs/03-local-classes/01-defining-a-local-class/solution.abap
*"*
*"* This code belongs to the Local Types tab of global class ZCL_##_LOCAL_CLASS.
*"*
*"* 1. Create global class ZCL_##_LOCAL_CLASS implementing IF_OO_ADT_CLASSRUN
*"* 2. Switch to Local Types tab
*"* 3. Paste the code below
*"* 4. Activate with Ctrl + F3

CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    CLASS-DATA conn_counter TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

ENDCLASS.
