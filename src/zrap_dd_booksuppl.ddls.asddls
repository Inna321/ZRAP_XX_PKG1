@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplements as comp tree'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZRAP_DD_BOOKSUPPL as select from /dmo/booksuppl_m
association to parent ZRAP_DD_BOOKING as _booking on $projection.BookingId = _booking.BookingId
                                                 and $projection.TravelId = _booking.TravelId
association[0..1] to /DMO/I_Supplement as _Booksupp on $projection.SupplementId = _Booksupp.SupplementID
association[1..1] to ZRAP_DD_TRAVEL as _Travel on $projection.TravelId = _Travel.TravelId
association[1..*] to /DMO/I_SupplementText as _SupplementText on $projection.SupplementId = _SupplementText.SupplementID 
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    key booking_supplement_id as BookingSupplementId,
    supplement_id as SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
    currency_code as CurrencyCode,
    last_changed_at as LastChangedAt,
    _booking,
    _Travel,
    _Booksupp,
    _SupplementText
}
