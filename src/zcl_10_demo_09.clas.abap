CLASS zcl_10_demo_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_demo_09 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM Z10_Demo07( p_carrierid = 'UA' )
      FIELDS *
      INTO TABLE @DATA(flights).

    out->write( flights ).
  ENDMETHOD.
ENDCLASS.
