CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS ValidateGenre FOR VALIDATE ON SAVE
      IMPORTING keys FOR Movie~ValidateGenre.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ValidateGenre.
    DATA movies TYPE TABLE FOR READ RESULT zr_10_movietp.

    READ ENTITIES OF zr_10_movietp IN LOCAL MODE
         ENTITY Movie
         FIELDS ( MovieUuid )
         WITH CORRESPONDING #( keys )
         RESULT movies.

    LOOP AT movies INTO DATA(movie).

      SELECT SINGLE
        FROM ddcds_customer_domain_value_t( p_domain_name = 'ZABAP_GENRE' )
        FIELDS @abap_true
        WHERE value_low = @Movie-Genre
        INTO @DATA(exists).

      IF exists = abap_false.
        APPEND VALUE #( %tky = movie-%tky ) TO failed-movie.
        DATA(message) = NEW zcm_abap_movie( textid   = zcm_abap_movie=>no_genre_found
                                            genre    = movie-Genre
                                            severity = if_abap_behv_message=>severity-error ).

        APPEND VALUE #( %tky               = movie-%tky
                        %msg               = message
                        %element-genre = if_abap_behv=>mk-on )
               TO reported-movie.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
