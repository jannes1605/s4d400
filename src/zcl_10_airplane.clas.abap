CLASS zcl_10_airplane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_id                   RETURNING VALUE(id)        TYPE string.
    METHODS set_id                   IMPORTING i_id                   TYPE string.
    METHODS get_plane_type           RETURNING VALUE(plane_type)        TYPE string.
    METHODS set_plane_type           IMPORTING i_plane_type           TYPE string.
    METHODS get_empty_weight_in_tons RETURNING VALUE(empty_weight_in_tones)        TYPE i.
    METHODS set_empty_weight_in_tons IMPORTING i_empty_weight_in_tons TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

  DATA id type string.
  data plane_type type string.
  data empty_weight_in_tons type i.

ENDCLASS.



CLASS zcl_10_airplane IMPLEMENTATION.
  METHOD get_id.
    id = me->id.
  ENDMETHOD.

  METHOD set_id.
    me->id = i_id.
  ENDMETHOD.

  METHOD get_plane_type.
    plane_type = me->plane_type.
  ENDMETHOD.

  METHOD set_plane_type.
    me->plane_type = i_plane_type.
  ENDMETHOD.

  METHOD get_empty_weight_in_tons.
    empty_weight_in_tones = empty_weight_in_tons.
  ENDMETHOD.

  METHOD set_empty_weight_in_tons.
    me->empty_weight_in_tons = i_empty_weight_in_tons.
  ENDMETHOD.

ENDCLASS.
