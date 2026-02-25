@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking as child entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZRAP_DD_BOOKING as select from /dmo/booking_m
composition[0..*] of ZRAP_DD_BOOKSUPPL as _BookingSupp
association to parent ZRAP_DD_TRAVEL as _Travel on $projection.TravelId = _Travel.TravelId
association[1..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
association[1..1] to /DMO/I_Carrier as _Carrier on $projection.CarrierId = _Carrier.AirlineID
association[1..1] to /DMO/I_Connection as _Connection on $projection.CarrierId = _Connection.AirlineID and $projection.ConnectionId = _Connection.ConnectionID 
association[1..1] to /DMO/I_Booking_Status_VH as _BookingStatus on $projection.BookingStatus = _BookingStatus.BookingStatus 
    
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
//    @Semantics.user.createdBy: true
//    created_by as CreatedBy,
//    @Semantics.systemDateTime.createdAt: true
//    created_at as CreatedAt,
//    @Semantics.user.lastChangedBy: true
//    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    //Local ETag Field --> Odata Etag
    last_changed_at as LastChangedAt,
    _BookingStatus,
    _Travel,
    _BookingSupp,
    _Customer,
    _Carrier,
    _Connection,
    _BookingStatus as _BookingStatusv
}
