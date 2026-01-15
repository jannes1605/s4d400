CLASS zcl_10_abap_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_abap_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA firstname TYPE c length 40.
    DATA lastname TYPE c length 40.

    firstname = 'Bruce'.
    lastname = 'Wayne'.

    out->write( `Hello ` && firstname && ` ` && lastname && `, how are you?` ).

  ENDMETHOD.
ENDCLASS.
