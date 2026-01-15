CLASS zcl_10_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " ---------------------------------------------------------------------
    " Deklaration interner Tabellen
    DATA connections TYPE z10_connections. " TYPE [Tabellentyp]
    DATA connection  TYPE z10_connection.

    " ---------------------------------------------------------------------
    " Hinzufuegen von Datensaetzen
    connections = VALUE #( ( carrier_id = 'LH' connection_id = '0400' )
                           ( carrier_id = 'UA' airport_from_id = 'FRA' )
                           ( connection_id = '0401' airport_to_id = 'FRA' )  ).
    " ---------------------------------------------------------------------
    " Anfuegen von Datensaetzen
    connection = VALUE #( carrier_id      = 'AZ'
                          connection_id   = '0017'
                          airport_from_id = 'BER'
                          airport_to_id   = 'ROM' ).

    connections = VALUE #( BASE connections
                           ( connection ) ).
    " ---------------------------------------------------------------------
    " Lesen von Einzelsaetzen
    TRY.
        connection = connections[ 3 ]. " per Index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connection = connections[ connection_id = '0400' ]. " per Schlüsselkomponente
    ENDIF.
    " ---------------------------------------------------------------------
    " Lesen mehrerer Datensaetze
    " LOOP AT connections INTO DATA(connection2).
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL.
      out->write( |{ sy-tabix } { connection-carrier_id }| ).
    ENDLOOP.
    " ---------------------------------------------------------------------
    " Ändern von Einzelsaetzen
    TRY.
        connections[ 1 ]-airport_from_id = 'FRA'. " per Index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connections[ connection_id = '0400' ]-connection_id = '0402'.
    ENDIF.
    " ---------------------------------------------------------------------
    " Ändern mehrerer Datensaetze (per SY-TABIX)
    LOOP AT connections INTO connection.
      connections[ sy-tabix ]-airport_to_id = 'JFK'.
    ENDLOOP.
    " ---------------------------------------------------------------------
    " Ändern mehrerer Datensaetze (per Datenreferenz)
    DATA connection2 TYPE REF TO z10_connection.
    LOOP AT connections REFERENCE INTO connection2.
      connection2->airport_from_id = 'BER'.
    ENDLOOP.
    " ---------------------------------------------------------------------
    " Ändern mehrerer Datensaetze (per Feldsymbol)
    FIELD-SYMBOLS <connection> TYPE z10_connection.
    LOOP AT connections ASSIGNING <connection>.
      <connection>-carrier_id = 'LH'.
    ENDLOOP.
    " ---------------------------------------------------------------------
    " Sortieren
    SORT connections BY carrier_id DESCENDING.

    " Loeschen
    DELETE connections WHERE airport_from_id = 'FRA'.

    " Anzahl Datensaetze
    out->write( lines( connections ) ).

    " Ausgabe
    out->write( connections ).


  ENDMETHOD.
ENDCLASS.
