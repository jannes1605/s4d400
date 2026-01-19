CLASS zcl_10_main_vehicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklarationen
    DATA vehicle  TYPE REF TO zcl_10_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_10_vehicle.
    DATA truck    TYPE REF TO zcl_10_truck.

    DATA rental   TYPE REF TO zcl_10_rental.
    DATA carrier  TYPE REF TO zcl_10_carrier.
    DATA partners TYPE TABLE OF REF TO zif_10_partner.

    " Instanzierungen

    out->write( zcl_10_vehicle=>number_of_vehicles ).

    vehicle = NEW zcl_10_car( make  = 'Porsche'
                              model = '911'
                              seats = '2' ).
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_10_truck( make          = 'MAN'
                                model         = 'TGX'
                                cargo_in_tons = 40 ).
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_10_car( make  = 'Skoda'
                              model = 'Superb Combi'
                              seats = 5 ).
    APPEND vehicle TO vehicles.

    rental = NEW #( ).
    carrier = NEW #( 'Lufthansa' ).

    APPEND rental TO partners.
    APPEND carrier TO partners.

    " Ausgabe
    LOOP AT vehicles INTO vehicle.
      TRY.
          vehicle->accelerate( 30 ).
          vehicle->break( 10 ).
          vehicle->accelerate( 300 ).
        CATCH zcx_10_value_too_high INTO DATA(x).
          out->write( x->get_text( ) ).
      ENDTRY.
      IF vehicle IS INSTANCE OF zcl_10_truck.
        truck = CAST #( vehicle ).
        truck->transform( ).
        out->write( |{ COND #( WHEN truck->is_transformed = 'X'
                               THEN 'Der LKW hat sich in einen Autobot transformier       '
                               ELSE 'Der Autobot hat sich wieder in eine LKW transformiert' ) }| ).
      ENDIF.
      out->write( vehicle->to_string( ) ).
    ENDLOOP.

    LOOP AT partners INTO DATA(partner).
      out->write( partner->to_string( ) ).

      IF partner IS INSTANCE OF zcl_10_carrier.
        carrier = CAST #( partner ).
        out->write( carrier->get_biggest_cargo_plane( ) ).
      ENDIF.
    ENDLOOP.

    out->write( zcl_10_vehicle=>number_of_vehicles ).
  ENDMETHOD.
ENDCLASS.
