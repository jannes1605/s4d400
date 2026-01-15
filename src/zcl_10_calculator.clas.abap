CLASS zcl_10_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    CLASS-METHODS divide
      IMPORTING
                operand1      TYPE z10_decimal
                operand2      TYPE z10_decimal
      RETURNING VALUE(result) TYPE z10_decimal
      RAISING   cx_sy_zerodivide .


    CLASS-METHODS calculate_percentage
      IMPORTING
                percentage              TYPE z10_decimal
                base                    TYPE z10_decimal
      RETURNING VALUE(percentage_value) TYPE z10_decimal.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_calculator IMPLEMENTATION.

  METHOD divide.

    " Eingabepruefung
    IF operand2 IS INITIAL. "If operand2 = 0
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.

    result = operand1 / operand2.
  ENDMETHOD.


  METHOD calculate_percentage.

    percentage_value = ( base / 100 ) * percentage.

  ENDMETHOD.


ENDCLASS.
