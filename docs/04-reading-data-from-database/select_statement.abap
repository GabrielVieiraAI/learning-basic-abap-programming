*&---------------------------------------------------------------------*
*& Report ZSELECT_DEMO
*&---------------------------------------------------------------------*
*& Demonstrates basic ABAP SQL SELECT statements
*& Unit 04: Reading Data from the Database
*&---------------------------------------------------------------------*
REPORT zselect_demo.

DATA: lt_flights TYPE TABLE OF spfli,
      ls_flight  TYPE spfli.

START-OF-SELECTION.
  SELECT *
    FROM spfli
    INTO TABLE lt_flights
   WHERE carrid = 'LH'.

  LOOP AT lt_flights INTO ls_flight.
    WRITE: / ls_flight-carrid, ls_flight-connid, ls_flight-cityfrom, ls_flight-cityto.
  ENDLOOP.
