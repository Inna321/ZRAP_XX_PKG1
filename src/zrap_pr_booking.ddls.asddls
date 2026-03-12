@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Chils Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZRAP_PR_BOOKING as select from /dmo/booking_m
composition[0..*] of ZRAP_PR_BOOKINGSUPL as _BookSupp
association to parent ZRAP_PR_TRAVEL as _Travel on 
$projection.TravelId = _Travel.TravelId
association[1..1] to /DMO/I_Customer as _Customer on 
$projection.CustomerId = _Customer.CustomerID
association[1..1] to /DMO/I_Carrier as _carrier on 
$projection.CarrierId = _carrier.AirlineID
association[1..1] to /DMO/I_Connection as _Connection on
$projection.CarrierId = _Connection.AirlineID and 
$projection.ConnectionId = _Connection.ConnectionID
{
key travel_id as TravelId,
key booking_id as BookingId,
booking_date as BookingDate,
customer_id as CustomerId,
carrier_id as CarrierId,
connection_id as ConnectionId,
flight_date as FlightDate,
@Semantics.amount.currencyCode: 'CurrencyCode'
flight_price as FlightPrice,
currency_code as CurrencyCode,
booking_status as BookingStatus,
@Semantics.systemDateTime.lastChangedAt: true
last_changed_at as LastChangedAt,
_Travel,
_BookSupp,
_Customer,
_carrier,
_Connection
}
