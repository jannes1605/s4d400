CLASS zcl_10_abap_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_abap_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA client_id TYPE /dmo/customer_id.
    DATA firstname TYPE /dmo/first_name.
    DATA lastname TYPE /dmo/last_name.
    DATA city TYPE /dmo/city.
    DATA country TYPE land1.

    client_id = '187120'.
    firstname = 'Hugo'.
    lastname = 'Hugga'.
    city = 'Walldorf'.
    country = 'DE'.

    out->write( |{ client_id }, { firstname } { lastname }, { city } ({ country })| ).

  ENDMETHOD.
ENDCLASS.
