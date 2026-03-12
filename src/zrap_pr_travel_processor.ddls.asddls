@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity ZRAP_PR_TRAVEL_Processor
  as projection on ZRAP_PR_TRAVEL
{
      @ObjectModel.text.element: [ 'Description' ]
//      @Consumption.valueHelpDefinition: [{ entity.name: 'ZRAP_PR_TRAVEL',
//                                           entity.element: 'TravelId'
//                                         }]
 
      key TravelId,
      @ObjectModel.text.element: [ 'Agname' ]
      @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Agency',
                                           entity.element: 'AgencyID'
                                        }]
      AgencyId,
      @Semantics.text: true
      Agname,
      @ObjectModel.text.element: [ 'CusName' ]
      @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Customer',
                                           entity.element: 'CustomerID'
                                         }]
      CustomerId,
      @Semantics.text: true
      CusName,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      @Semantics.text: true
      Description,
      @ObjectModel.text.element: [ 'StatusText' ]

      @Consumption.valueHelpDefinition: [{ entity.name: '/DMO/I_Overall_Status_VH',
                                           entity.element: 'OverallStatus'
  }]

      OverallStatus,
      @Semantics.text: true
      StatusText,
      Cricticality,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking,
      _Currency,
      _Customer,
      _Status
}
