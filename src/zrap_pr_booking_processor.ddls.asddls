@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection of Booking'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZRAP_PR_BOOKING_Processor as projection on ZRAP_PR_BOOKING
{
    key TravelId,
    key BookingId,
    BookingDate,
      @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Customer',
                                           entity.element: 'CustomerID'
                                         }]
    CustomerId,
      @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Carrier',
                                           entity.element: 'AirlineID'
                                         }]
    CarrierId,
          @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Connection',
                                           entity.element: 'ConnectionID',
                                           additionalBinding: [{ localElement: 'CarrierId',
                                           element: 'AirlineID'  }]
                                         }]
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    
      @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Overall_Status_VH',
                                           entity.element: 'OverallStatus'
  }]
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookSupp : redirected to composition child ZRAP_PR_BOOKINGSUPL_Processor,
    _carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZRAP_PR_TRAVEL_Processor
}
