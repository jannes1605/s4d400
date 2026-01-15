CLASS zcl_10_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_abap_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA customer TYPE z10_customer_info.

    TRY.
        customer = zcl_abap_helper=>get_customer( '123456' ).
        out->write( customer ).

      CATCH zcx_abap_no_data INTO DATA(x).
        out->write( x->get_Text(  ) ).
    ENDTRY.


  ENDMETHOD.
ENDCLASS.
