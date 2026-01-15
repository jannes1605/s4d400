CLASS zcl_10_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_abap_06 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA travel_id type /dmo/travel_id value 1.
    DATA(travel) = ZCL_10_helper=>get_travel_with_customer( travel_id ).

    out->write( travel ).

  ENDMETHOD.
ENDCLASS.
