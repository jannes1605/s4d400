CLASS zcl_10_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Hello World
**********************************************************************

    DATA text TYPE string. " Deklaration
    text = `Hello World!`. " Wertzuweisung
    out->write( text ). " Ausgabe

**********************************************************************
* Datentypen und Datenobjekte
**********************************************************************

    DATA age TYPE i. " Ganze Zahl
    DATA salary_in_euro TYPE p LENGTH 16 DECIMALS 2. " Kommazahl
    DATA first_name TYPE c LENGTH 40. " Zeichenketten fester Länge
    DATA matriculation_number TYPE n LENGTH 7. " Ziffernfolge
    DATA xmas TYPE d. " Datum
    DATA noon TYPE t. "Zeitangabens
    DATA flag. " Kennzeichen

    DATA carrier_id TYPE c LENGTH 2. " ABAP Standardtyp
    DATA carrier_id2 TYPE /dmo/carrier_id. " Datenelement

**********************************************************************
* Wertzuweisung
**********************************************************************

    " Zuweisungsoperator =
    age = 44.
    salary_in_euro = '6000.52'.
    first_name = 'Daniel'.
    matriculation_number = '1234567'.
    xmas = '20261224'.
    noon = '120000'.
    flag = 'X'.

    flag = ' '.
    flag = ''.
    CLEAR flag.

    " Statische Vorbelegung
    DATA last_name TYPE c LENGTH 40 VALUE 'Appenmaier'.

    " Inlinedeklaration
    DATA(size_in_cm) = 179.
    size_in_cm = '179'.



  ENDMETHOD.
ENDCLASS.
