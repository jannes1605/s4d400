CLASS zcl_10_main_airplanes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_main_airplanes IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA airplane TYPE REF TO zcl_10_airplane.
    DATA airplanes TYPE TABLE of REF TO zcl_10_airplane.

    airplane = NEW #(  ).
    airplane->set_id( 'D-ABUK' ).
    airplane->set_plane_type( 'Airbus A380-800' ).
    airplane->set_empty_weight_in_tons( '277' ).
    APPEND airplane to airplanes.

    airplane = NEW #(  ).
    airplane->set_id( 'D-AIND' ).
    airplane->set_plane_type( 'Airbus A320-200' ).
    airplane->set_empty_weight_in_tons( '42' ).
    APPEND airplane to airplanes.

    airplane = NEW #(  ).
    airplane->set_id( 'D-AJKF' ).
    airplane->set_plane_type( 'Boeing 747-400F' ).
    airplane->set_empty_weight_in_tons( '166' ).
    APPEND airplane to airplanes.

    LOOP at airplanes into airplane.
      out->write( |{ airplane->get_id(  ) }, { airplane->get_plane_type(  ) }, { airplane->get_empty_weight_in_tons(  ) }t| ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
