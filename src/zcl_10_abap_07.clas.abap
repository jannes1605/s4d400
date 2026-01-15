CLASS zcl_10_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_abap_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA customer_id TYPE /dmo/customer_id VALUE 5.

    DATA(travels) = zcl_10_helper=>get_travels( customer_id ).
    out->write( travels ).

    DELETE travels WHERE begin_date < sy-datum.

    DATA travels2 TYPE REF TO /dmo/travel.
    LOOP AT travels REFERENCE INTO travels2.
      travels2->booking_fee *= '1.1'.
    ENDLOOP.

    SORT travels BY description DESCENDING.
  ENDMETHOD.
ENDCLASS.
