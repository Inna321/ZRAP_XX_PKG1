@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for Booking Suppliment'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZRAP_DD_BOOKSUPPL_PROCESSOR as projection on ZRAP_DD_BOOKSUPPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _booking: redirected to parent ZRAP_DD_BOOKING_Processor,
    _Booksupp,
    _SupplementText,
    _Travel: redirected to ZRAP_DD_TRAVEL_PROCESSOR
}
