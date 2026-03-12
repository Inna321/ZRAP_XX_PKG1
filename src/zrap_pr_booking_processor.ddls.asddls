@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection of Booking'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZRAP_PR_BOOKING_Processor as projection on ZRAP_PR_BOOKING
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookSupp,
    _carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZRAP_PR_TRAVEL_Processor
}
