@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection of Booking Suppliment'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZRAP_PR_BOOKINGSUPL_Processor as projection on ZRAP_PR_BOOKINGSUPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking:redirected to parent ZRAP_PR_BOOKING_Processor,
    _Product,
    _Travel: redirected to ZRAP_PR_TRAVEL_Processor 
}
