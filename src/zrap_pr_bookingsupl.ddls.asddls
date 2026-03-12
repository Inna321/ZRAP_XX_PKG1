@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Child Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZRAP_PR_BOOKINGSUPL as select from /dmo/booksuppl_m
association to parent ZRAP_PR_BOOKING as _Booking on
$projection.TravelId = _Booking.TravelId and 
$projection.BookingId = _Booking.BookingId
association[1..1] to ZRAP_PR_TRAVEL as _Travel on 
$projection.TravelId = _Travel.TravelId
association[1..1] to /DMO/I_Supplement as _Product on 
$projection.SupplementId = _Product.SupplementID
{
key travel_id as TravelId,
key booking_id as BookingId,
key booking_supplement_id as BookingSupplementId,
supplement_id as SupplementId,
@Semantics.amount.currencyCode: 'CurrencyCode'
price as Price,
currency_code as CurrencyCode,
@Semantics.systemDateTime.lastChangedAt: true
last_changed_at as LastChangedAt,
_Travel,
_Product,
_Booking
}
