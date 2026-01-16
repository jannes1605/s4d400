CLASS zcl_10_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING id                   TYPE string
                                  plane_type           TYPE string
                                  empty_weight_in_tons TYPE i RAISING zcx_abap_initial_parameter.

    DATA id                   TYPE string READ-ONLY.
    DATA plane_type           TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i      READ-ONLY.

    CLASS-DATA numbers_of_airplanes TYPE i READ-ONLY.

    METHODS get_total_weight_in_tons
      RETURNING VALUE(result) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_10_airplane IMPLEMENTATION.

  METHOD constructor.

    IF id IS INITIAL OR plane_type IS INITIAL OR empty_weight_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = |:)| ).
    ENDIF.

    me->id = id.
    me->plane_type = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.
    numbers_of_airplanes += 1.
  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    result = empty_weight_in_tons * '1.1'.
  ENDMETHOD.

ENDCLASS.
