CLASS zcl_10_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_abap_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA operand1 TYPE p LENGTH 8  DECIMALS 2 VALUE '5'.
    DATA operand2 TYPE p LENGTH 8  DECIMALS 2 VALUE '3'.
    DATA operator TYPE c LENGTH 1             VALUE '^'.
    DATA result   TYPE p LENGTH 16 DECIMALS 2.

    CASE operator.
      WHEN '+'.
        result = operand1 + operand2.
      WHEN '-'.
        result = operand1 - operand2.
      WHEN '*'.
        result = operand1 * operand2.
      WHEN '/'.
        result = operand1 / operand2.
      WHEN '%'.
        result = zcl_10_calculator=>calculate_percentage( percentage = operand1
                                                          base       = operand2 ).
      WHEN '^'.
        TRY.
            result = zcl_abap_calculator=>calculate_power( base     = operand1
                                                           exponent = CONV #( operand2 ) ).
          CATCH zcx_abap_exponent_too_high INTO DATA(x).
            out->write( x->get_Text( ) ).
        ENDTRY.
    ENDCASE.

    out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }| ).
  ENDMETHOD.
ENDCLASS.
