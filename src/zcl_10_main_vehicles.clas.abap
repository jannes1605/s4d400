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

    " Instanzierungen

    out->write( zcl_10_vehicle=>number_of_vehicles ).

    vehicle = NEW #( make  = 'Porsche'
                     model = '911' ).
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make  = 'MAN'
                     model = 'TGX' ).
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make  = 'Skoda'
                     model = 'Superb Combi' ).
    APPEND vehicle TO vehicles.

    " Ausgabe
    LOOP AT vehicles INTO vehicle.
      TRY.
          vehicle->accelerate( 30 ).
          vehicle->break( 10 ).
          vehicle->accelerate( 300 ).
        CATCH zcx_10_value_too_high INTO DATA(x).
          out->write( x->get_text( ) ).
      ENDTRY.
      out->write( |{ vehicle->make } { vehicle->model }| ).
    ENDLOOP.

    out->write( zcl_10_vehicle=>number_of_vehicles ).
  ENDMETHOD.
ENDCLASS.
