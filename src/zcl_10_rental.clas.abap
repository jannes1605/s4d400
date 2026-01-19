CLASS zcl_10_rental DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_10_partner.

    TYPES ty_vehicles TYPE TABLE OF REF TO zcl_10_vehicle.

    DATA vehicles TYPE ty_vehicles READ-ONLY.

    METHODS add_vehicle
      IMPORTING vehicle TYPE REF TO zcl_10_vehicle.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_rental IMPLEMENTATION.
  METHOD add_vehicle.
    APPEND vehicle TO vehicles.
  ENDMETHOD.

  METHOD zif_10_partner~to_string.
    string = 'Ich bin die Autovermietung'.
  ENDMETHOD.

ENDCLASS.
