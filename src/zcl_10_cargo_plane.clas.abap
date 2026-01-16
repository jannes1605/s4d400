CLASS zcl_10_cargo_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_10_airplane
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING
        id                   TYPE string
        plane_type           TYPE string
        empty_weight_in_tons TYPE i
        cargo_in_tons        TYPE i.

    METHODS get_total_weight_in_tons REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_cargo_plane IMPLEMENTATION.

  METHOD constructor.
    super->constructor( id = id plane_type = plane_type empty_weight_in_tons = empty_weight_in_tons ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    result = empty_weight_in_tons * '1.1' + cargo_in_tons.
  ENDMETHOD.

ENDCLASS.
