CLASS zcl_10_demo_10 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_10_demo_10 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT
      FROM Z10_Demo08
      FIELDS CarrierId, ConnectionId, \_Carrier-name
      INTO TABLE @DATA(connections).

    out->write( connections ).
  ENDMETHOD.
ENDCLASS.
