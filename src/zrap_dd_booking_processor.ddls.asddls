@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for Booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZRAP_DD_BOOKING_Processor 
as projection on ZRAP_DD_BOOKING
{
    key TravelId,
    key BookingId,
    BookingDate,
    @Consumption: { valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID' } }] }
    CustomerId,
    @Consumption: { valueHelpDefinition: [{ entity: { name: '/DMO/I_Carrier', element: 'AirlineID' } }] }
    CarrierId,
     @Consumption: { valueHelpDefinition: [
                                             { entity: { name: '/DMO/I_Connection', element: 'ConnectionID' },
                                             additionalBinding: [
                                                                 { element: 'AirlineID' , localElement: 'CarrierId'}]
                                                                  }
                                                                  ] }
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookingStatus,
    _BookingSupp: redirected to composition child ZRAP_DD_BOOKSUPPL_PROCESSOR,
    _Carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZRAP_DD_TRAVEL_PROCESSOR
}
