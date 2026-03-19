CLASS zrap_pr_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: lv_opr TYPE c VALUE 'R'.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zrap_pr_eml IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    CASE lv_opr.
* Read is working
      WHEN 'R'.
        DATA(lo_obj) = NEW zcl_read( ).
        lo_obj->read( out ).

*
*    READ ENTITIES OF zrap_pr_travel ENTITY travel
**        ALL FIELDS WITH
**        VALUE #(
**          (  TravelId = '00000010' )
**          (  TravelId = '00000024' )
**          (  TravelId = '009595' )
**             )
*     FIELDS ( TravelId AgencyId CustomerId OverallStatus ) WITH
*     VALUE #(
*       (  TravelId = '00000010' )
*       (  TravelId = '00000024' )
*       (  TravelId = '009595' )
*          )
*      RESULT DATA(lt_result)
*      FAILED DATA(lt_failed_R)
*      REPORTED DATA(lt_reported_R).
*
**        out->write( EXPORTING data = lt_result ).
**        out->write( EXPORTING data = lt_failed_R ).
**        out->write( EXPORTING data = lt_reported_R ).
*
*    IF lt_result IS INITIAL.
*
*      IF lt_failed_R IS NOT INITIAL.
*        out->write( 'ERROR' ).
*        out->write( lt_failed_R ).
*      ENDIF.
*
*      IF lt_reported_R IS NOT INITIAL.
*        out->write( 'NOT READ!!!' ).
*        out->write( lt_reported_R ).
*      ENDIF.
*    ELSE.
*      out->write( 'READ' ).
*      out->write( lt_result ).
*    ENDIF.


      WHEN 'C'.
* Create is not working
*
*        DATA(lv_Travelid) = '00012345'.
*        DATA(lv_AgencyId) = '070016'.
*        DATA(lv_CustomerId) = '000697'.
*
*        MODIFY ENTITIES OF zrap_pr_travel
*        ENTITY Travel
*        CREATE FIELDS ( TravelId AgencyId CustomerId BeginDate EndDate  Description OverallStatus )
**               CREATE FIELDS ( AgencyId CustomerId BeginDate EndDate BookingFee TotalPrice CurrencyCode Description OverallStatus )
*                WITH VALUE #(
*                    (
*                    %CID = 'CR1'
*                    TravelId = '00012345' " lv_Travelid
*                    AgencyId = lv_AgencyId
*                    CustomerId = lv_CustomerId
*                    BeginDate =  '20260317'
*                    EndDate =   '20260330'
**                    BookingFee = 20
**                    TotalPrice = 100
**                    CurrencyCode = 'SGD'
*                    Description = '1st RAP Record Created'
*                    OverallStatus = 'O'
**                    CreatedBy = 'CD99800004632'
*                    )
*         )
*         MAPPED DATA(lt_mapped_C)
*         FAILED DATA(lt_failed_)
*         REPORTED DATA(lt_reported_C).

*
*        COMMIT ENTITIES.
*        out->write( EXPORTING data = lt_mapped_C ).
*        out->write( EXPORTING data = lt_failed_C ).
*        out->write( EXPORTING data = lt_reported_C ).

        DATA(lv_Travelid)  = '00000001'.
        DATA(lv_AgencyId)  = '070016'.
        DATA(lv_CustomerId) = '000697'.

        MODIFY ENTITIES OF zrap_pr_travel
          ENTITY Travel
           CREATE FROM
           VALUE #(
            (
              %CID       = 'CR1'
              TravelId    = lv_Travelid
              AgencyId    = lv_AgencyId
              CustomerId  = lv_CustomerId
              BeginDate   = sy-datum
              EndDate     = sy-datum + 13
              BookingFee = 20
              TotalPrice = 100
              CurrencyCode = 'SGD'
              Description = '1st RAP Record Created'
              OverallStatus = 'O'
            )
          )
          MAPPED DATA(lt_mapped_C)
          FAILED DATA(lt_failed_C)
          REPORTED DATA(lt_reported_C).

        COMMIT ENTITIES.

*        out->write( lt_mapped_C ).
*        out->write( lt_failed_C ).
*        out->write( lt_reported_C ).

        IF lt_mapped_C IS INITIAL.

          IF lt_failed_C IS NOT INITIAL.
            out->write( 'FAILED!!!' ).
            out->write( lt_failed_C ).
          ELSE.
*            out->write( lt_failed_C ).
          ENDIF.

          IF lt_mapped_C IS INITIAL.
            out->write( 'NOT CREATED!!!' ).
            out->write( lt_reported_C ).
          ELSE.
*            out->write( lt_reported_C ).
          ENDIF.

        ELSE.
          out->write( lt_mapped_C ).
        ENDIF.


      WHEN 'U'.
* Update is not working
        DATA(LV_TravelId_U) = '00000010'.
        DATA(lv_AgencyId_U) = '070016'.
        DATA(lv_CustomerId_U) = '000697'.

        MODIFY ENTITIES OF zrap_pr_travel
        ENTITY travel
        UPDATE FIELDS ( AgencyId CustomerId BeginDate EndDate BookingFee TotalPrice CurrencyCode Description OverallStatus )
                  WITH VALUE #(
                      (
                      TravelId = lv_Travelid
                      AgencyId = lv_AgencyId_U
                      CustomerId = lv_CustomerId_U
                      BeginDate =  '2026-03-17'
                      EndDate =   '2026-03-30'
                      BookingFee = 30
                      TotalPrice = 200
                      CurrencyCode = 'SGD'
                      Description = '1st RAP Record Updated'
                      OverallStatus = 'P'
                      )
           )
           MAPPED DATA(lt_mapped_U)
           FAILED DATA(lt_failed_U)
           REPORTED DATA(lt_reported_U).

        COMMIT ENTITIES.
*        out->write( EXPORTING data = lt_mapped_U ).
*        out->write( EXPORTING data = lt_failed_U ).
*        out->write( EXPORTING data = lt_reported_U ).

        IF lt_mapped_U IS INITIAL.

          IF lt_failed_U IS NOT INITIAL.
            out->write( 'FAILED!!!' ).
            out->write( lt_failed_U ).
          ELSE.
*            out->write( lt_failed_C ).
          ENDIF.

          IF lt_mapped_U IS INITIAL.
            out->write( 'NOT NOT UPDATED!!!' ).
            out->write( lt_reported_U ).
          ELSE.
*            out->write( lt_reported_C ).
          ENDIF.

        ELSE.
          out->write( lt_reported_U ).
        ENDIF.

      WHEN 'D'.


        DATA(lo_obj_D) = NEW zcl_DELETE( ).
        lo_obj_D->delete( out ).

**** Delete is working but not showing in the ABAP Console
***    DATA(LV_TravelId_D) = '00000000'.
***
***
***    MODIFY ENTITIES OF zrap_pr_travel
***    ENTITY travel
***    UPDATE FIELDS ( AgencyId CustomerId BeginDate EndDate BookingFee TotalPrice CurrencyCode Description OverallStatus )
***              WITH VALUE #(
***                  (
***                  TravelId = lv_Travelid_D
***
***                  )
***       )
***       MAPPED DATA(lt_mapped_D)
***       FAILED DATA(lt_failed_D)
***       REPORTED DATA(lt_reported_D).
***
***    COMMIT ENTITIES.
****        out->write( EXPORTING data = lt_mapped_D ).
****        out->write( EXPORTING data = lt_failed_D ).
****        out->write( EXPORTING data = lt_reported_D ).
***
***    IF lt_mapped_D IS INITIAL.
***      IF lt_failed_D IS NOT INITIAL.
***        out->write( 'FAILED!!!' ).
***        out->write( lt_failed_D ).
***      ELSE.
****            out->write( lt_failed_C ).
***      ENDIF.
***
***      IF lt_mapped_D IS INITIAL.
***        out->write( 'NOT DELETED!!!' ).
***        out->write( lt_reported_D ).
***      ELSE.
****            out->write( lt_reported_C ).
***      ENDIF.
***    ELSE.
***      out->write( 'DELETED!!!' ).
***      out->write( lt_mapped_D ).
***    ENDIF.
    ENDCASE .
  ENDMETHOD.
ENDCLASS.
