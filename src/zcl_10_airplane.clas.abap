CLASS zcl_10_airplane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING id                   TYPE string
                                  plane_type           TYPE string
                                  empty_weight_in_tons TYPE i RAISING zcx_abap_initial_parameter.

    DATA id                   TYPE string READ-ONLY.
    DATA plane_type           TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i      READ-ONLY.

    CLASS-DATA numbers_of_airplanes type i READ-ONLY.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_10_airplane IMPLEMENTATION.

  METHOD constructor.

    if id is INITIAL or plane_type is INITIAL or empty_weight_in_tons is INITIAL.
      raise EXCEPTION new zcx_abap_initial_parameter( parameter = |:)| ).
    endif.

    me->id = id.
    me->plane_type = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.
    numbers_of_airplanes += 1.
  ENDMETHOD.

ENDCLASS.
