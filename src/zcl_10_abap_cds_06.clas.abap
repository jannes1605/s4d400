CLASS zcl_10_abap_cds_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_abap_cds_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT
      FROM Z10_CustomerKPIs( p_city = 'Mainz' )
      FIELDS *
      INTO TABLE @DATA(flights).

    SORT flights BY TotalRevenue DESCENDING.

    out->write( flights ).
  ENDMETHOD.
ENDCLASS.
