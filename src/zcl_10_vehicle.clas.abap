CLASS zcl_10_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS set_make         IMPORTING make                TYPE string.
    METHODS get_make         RETURNING VALUE(make)         TYPE string.
    METHODS get_speed_in_kmh RETURNING VALUE(speed_in_kmh) TYPE i.
    METHODS set_speed_in_kmh IMPORTING speed_in_kmh        TYPE i.
    METHODS get_model        RETURNING VALUE(model)        TYPE string.
    METHODS set_model        IMPORTING model               TYPE string.
    METHODS accelerate       IMPORTING value               TYPE i.
    METHODS break            IMPORTING value               TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA make TYPE string.
    DATA model TYPE string.
    DATA speed_in_kmh TYPE i.

ENDCLASS.



CLASS zcl_10_vehicle IMPLEMENTATION.
  METHOD get_make.
    make = me->make.
  ENDMETHOD.

  METHOD set_make.
    me->make = make.
  ENDMETHOD.

  METHOD get_model.
    model = me->model.
  ENDMETHOD.

  METHOD set_model.
    me->model = model.
  ENDMETHOD.

  METHOD get_speed_in_kmh.
    speed_in_kmh = me->speed_in_kmh.
  ENDMETHOD.

  METHOD set_speed_in_kmh.
    me->speed_in_kmh = speed_in_kmh.
  ENDMETHOD.

  METHOD accelerate.
    speed_in_kmh = speed_in_kmh + value.
  ENDMETHOD.

  METHOD break.
    speed_in_kmh = speed_in_kmh - value.
  ENDMETHOD.

ENDCLASS.
