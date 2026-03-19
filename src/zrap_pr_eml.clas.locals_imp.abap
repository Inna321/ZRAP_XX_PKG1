*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS zcl_read DEFINITION.
  PUBLIC SECTION.
*      INTERFACES if_oo_adt_classrun.
    METHODS read  IMPORTING out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.

CLASS zcl_read IMPLEMENTATION.

  METHOD read.

    READ ENTITIES OF zrap_pr_travel ENTITY travel
*        ALL FIELDS WITH
*        VALUE #(
*          (  TravelId = '00000010' )
*          (  TravelId = '00000024' )
*          (  TravelId = '009595' )
*             )
     FIELDS ( TravelId AgencyId CustomerId OverallStatus ) WITH
     VALUE #(
       (  TravelId = '00000010' )
       (  TravelId = '00000024' )
       (  TravelId = '009595' )
          )
      RESULT DATA(lt_result)
      FAILED DATA(lt_failed_R)
      REPORTED DATA(lt_reported_R).

*        out->write( EXPORTING data = lt_result ).
*        out->write( EXPORTING data = lt_failed_R ).
*        out->write( EXPORTING data = lt_reported_R ).

    IF lt_result IS INITIAL.

      IF lt_failed_R IS NOT INITIAL.
        out->write( 'ERROR' ).
        out->write( lt_failed_R ).
      ENDIF.

      IF lt_reported_R IS NOT INITIAL.
        out->write( 'NOT READ!!!' ).
        out->write( lt_reported_R ).
      ENDIF.
    ELSE.
      out->write( 'READ' ).
      out->write( lt_result ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
*
*CLASS zcl_create DEFINITION.
*  PUBLIC SECTION.
*    METHODS create.
*
*ENDCLASS.
*
*CLASS zcl_create IMPLEMENTATION.
*
*  METHOD create.
*
*  ENDMETHOD.
*
*ENDCLASS.
*
*CLASS zcl_update DEFINITION.
*  PUBLIC SECTION.
*    METHODS update.
*
*ENDCLASS.
*
*CLASS zcl_update IMPLEMENTATION.
*
*  METHOD update.
*
*  ENDMETHOD.
*
*ENDCLASS.
*
CLASS zcl_delete DEFINITION.
  PUBLIC SECTION.
    METHODS delete IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.

CLASS zcl_delete IMPLEMENTATION.

  METHOD delete.
* Delete is working but not showing in the ABAP Console
    DATA(LV_TravelId_D) = '00000000'.


    MODIFY ENTITIES OF zrap_pr_travel
    ENTITY travel
    UPDATE FIELDS ( AgencyId CustomerId BeginDate EndDate BookingFee TotalPrice CurrencyCode Description OverallStatus )
              WITH VALUE #(
                  (
                  TravelId = lv_Travelid_D

                  )
       )
       MAPPED DATA(lt_mapped_D)
       FAILED DATA(lt_failed_D)
       REPORTED DATA(lt_reported_D).

    COMMIT ENTITIES.
*        out->write( EXPORTING data = lt_mapped_D ).
*        out->write( EXPORTING data = lt_failed_D ).
*        out->write( EXPORTING data = lt_reported_D ).

    IF lt_mapped_D IS INITIAL.
      IF lt_failed_D IS NOT INITIAL.
        out->write( 'FAILED!!!' ).
        out->write( lt_failed_D ).
      ELSE.
*            out->write( lt_failed_C ).
      ENDIF.

      IF lt_mapped_D IS INITIAL.
        out->write( 'NOT DELETED!!!' ).
        out->write( lt_reported_D ).
      ELSE.
*            out->write( lt_reported_C ).
      ENDIF.
    ELSE.
      out->write( 'DELETED!!!' ).
      out->write( lt_mapped_D ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
