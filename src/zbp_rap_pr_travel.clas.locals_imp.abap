CLASS lhc_ZRAP_PR_TRAVEL DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Travel RESULT result.
    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE Travel.

ENDCLASS.

CLASS lhc_ZRAP_PR_TRAVEL IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.

    DATA : entity TYPE STRUCTURE FOR CREATE zrap_pr_travel.
    DATA : travel_id_max TYPE /dmo/travel_id.


            ASSERT 1 = 2.


    LOOP AT entities INTO entity WHERE TravelId IS INITIAL.
      APPEND CORRESPONDING #( entity ) TO mapped-travel.
    ENDLOOP.

    TRY.
        cl_numberrange_runtime=>number_get(
          EXPORTING
             nr_range_nr = '01'           "Interval
             object      = '/DMO/TRAVL'   " SNRO Object
             quantity    = 1
         IMPORTING
           number      = DATA(lv_number)
           returncode  = DATA(lv_returncode)
           returned_quantity = DATA(lv_range_returned_quan)
          ).
      CATCH cx_number_ranges INTO DATA(lx_number_ranges) .
* Failed
        APPEND VALUE #( %cid = entity-%cid
                        %key = entity-%key ) TO failed-travel.

        APPEND VALUE #( %cid = entity-%cid
                        %key = entity-%key
                        %msg = lx_number_ranges ) TO reported-travel.
        EXIT.

    ENDTRY.



*  ASSERT lv_range_returned_quan = 1.

  ENDMETHOD.

ENDCLASS.
