CLASS zcl_10_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING make  TYPE string
                                  model TYPE string.
    METHODS accelerate       IMPORTING !value              TYPE i RAISING zcx_10_value_too_high.
    METHODS break            IMPORTING !value              TYPE i RAISING zcx_10_value_too_high.


    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_10_vehicle IMPLEMENTATION.

  METHOD accelerate.
    if speed_in_kmh + value > 300.
      raise EXCEPTION NEW zcx_10_value_too_high( value = value ) .
    endif.
    speed_in_kmh = speed_in_kmh + value.
  ENDMETHOD.

  METHOD break.
    IF value > speed_in_kmh.
      RAISE EXCEPTION NEW zcx_10_value_too_high( value = value ).
    ENDIF.
    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD constructor.
    me->make = make.
    me->model = model.
    number_of_vehicles += 1.
  ENDMETHOD.

ENDCLASS.
