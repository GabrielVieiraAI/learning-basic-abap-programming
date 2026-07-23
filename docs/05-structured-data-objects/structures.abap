*&---------------------------------------------------------------------*
*& Report ZSTRUCTURES_DEMO
*&---------------------------------------------------------------------*
*& Demonstrates structures and work areas
*& Unit 05: Working with Structured Data Objects
*&---------------------------------------------------------------------*
REPORT zstructures_demo.

TYPES: BEGIN OF ty_employee,
         id   TYPE i,
         name TYPE string,
       END OF ty_employee.

DATA: ls_employee TYPE ty_employee,
      lt_employees TYPE TABLE OF ty_employee.

START-OF-SELECTION.
  ls_employee-id = 1.
  ls_employee-name = 'Alice'.
  APPEND ls_employee TO lt_employees.

  ls_employee-id = 2.
  ls_employee-name = 'Bob'.
  APPEND ls_employee TO lt_employees.

  LOOP AT lt_employees INTO ls_employee.
    WRITE: / ls_employee-id, ls_employee-name.
  ENDLOOP.
