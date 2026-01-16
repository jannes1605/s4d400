CLASS zcl_10_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA name TYPE string READ-ONLY.
    DATA airplanes TYPE z10_airplanes READ-ONLY.

    METHODS constructor
      IMPORTING name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO zcl_10_airplane.

    METHODS get_biggest_cargo_plane RETURNING VALUE(biggest_cargo_plane) TYPE REF TO zcl_10_cargo_plane.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_carrier IMPLEMENTATION.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA max_cargo_in_tons TYPE i VALUE 0.

    LOOP AT airplanes INTO DATA(airplane).
      IF airplane IS INSTANCE OF zcl_10_cargo_plane AND airplane->get_total_weight_in_tons( ) > max_cargo_in_tons.
        biggest_cargo_plane = CAST #( airplane ).
        max_cargo_in_tons = biggest_cargo_plane->get_total_weight_in_tons( ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
