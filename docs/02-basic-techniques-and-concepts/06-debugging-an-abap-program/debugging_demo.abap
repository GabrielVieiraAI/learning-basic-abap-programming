*&---------------------------------------------------------------------*
*& Debugging Demo: Loan Repayment Simulator
*& Unit 02 - Lesson 06: Debugging an ABAP Program
*&---------------------------------------------------------------------*
*& Use this class to practice ABAP Debugger skills:
*&   - Set breakpoints (double-click left margin)
*&   - F5 (Step Into), F6 (Step Over), F8 (Resume)
*&   - Watchpoints on lv_remaining
*&   - Conditional breakpoints (sy-index > 5)
*&   - Change variable values during debug
*&---------------------------------------------------------------------*
CLASS zcl_debugging_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
ENDCLASS.

CLASS zcl_debugging_demo IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " ── Loan Parameters ────────────────────────────────────────────
    CONSTANTS lc_interest_rate TYPE p LENGTH 3 DECIMALS 2 VALUE '5.00'.

    DATA lv_total        TYPE p LENGTH 8 DECIMALS 2 VALUE '5000.00'.
    DATA lv_remaining    TYPE p LENGTH 8 DECIMALS 2.
    DATA lv_repayment    TYPE p LENGTH 8 DECIMALS 2 VALUE '500.00'.
    DATA lv_month        TYPE i.
    DATA lv_interest_amt TYPE p LENGTH 8 DECIMALS 2.

    DATA repayment_plan TYPE TABLE OF string.

    " ── Initialize ─────────────────────────────────────────────────
    " >>> SET BREAKPOINT ON THE NEXT LINE <<<
    lv_remaining = lv_total.
    lv_month     = 0.

    out->write( `=== LOAN REPAYMENT SIMULATOR ===` ).
    out->write( |Loan amount:      { lv_total }| ).
    out->write( |Interest rate:    { lc_interest_rate }%| ).
    out->write( |Monthly payment:  { lv_repayment }| ).
    out->write( `----------------------------------------` ).

    " ── Amortization Loop ──────────────────────────────────────────
    DO.
      lv_month = lv_month + 1.

      " Calculate interest for this month
      lv_interest_amt = lv_remaining * lc_interest_rate / 100 / 12.

      " Check last payment scenario
      IF lv_remaining + lv_interest_amt <= lv_repayment.

        lv_repayment = lv_remaining + lv_interest_amt.
        lv_remaining = 0.

        APPEND |Month { lv_month WIDTH = 2 }: Payment { lv_repayment } → Remaining 0.00 (PAID OFF)| &&
               `` TO repayment_plan.

        EXIT.

      ELSE.
        " Normal payment
        lv_remaining = lv_remaining + lv_interest_amt - lv_repayment.

        APPEND |Month { lv_month WIDTH = 2 }: Payment { lv_repayment } " &
             && |(+ interest { lv_interest_amt WIDTH = 5 ALIGN = LEFT }) " &
             && |→ Remaining { lv_remaining WIDTH = 9 ALIGN = LEFT }|
             TO repayment_plan.
      ENDIF.

      " Safety: max 120 months (10 years)
      IF lv_month >= 120.
        APPEND `WARNING: Loan term exceeded 120 months!` TO repayment_plan.
        EXIT.
      ENDIF.
    ENDDO.

    " ── Output ─────────────────────────────────────────────────────
    out->write( `--- REPAYMENT PLAN ---` ).

    LOOP AT repayment_plan INTO DATA(lv_line).
      out->write( lv_line ).
    ENDLOOP.

    out->write( `----------------------------------------` ).
    out->write( |Total months: { lv_month }| ).
    out->write( |Total paid:   { lv_total + ( lv_total * lc_interest_rate / 100 * lv_month / 12 ) }| ).
    out->write( `=== END ===` ).

  ENDMETHOD.

ENDCLASS.
