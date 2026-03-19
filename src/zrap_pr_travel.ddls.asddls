@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Root of BO'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZRAP_PR_TRAVEL
  as select from /dmo/travel_m as Travel
  composition [0..*] of ZRAP_PR_BOOKING          as _Booking
  association [1]    to /DMO/I_Agency               as _Agency   on $projection.AgencyId = _Agency.AgencyID
  association [1]    to /DMO/I_Customer             as _Customer on $projection.CustomerId = _Customer.CustomerID
  association [1]    to I_Currency                  as _Currency on $projection.CurrencyCode = _Currency.Currency
  association [1..1] to /DMO/I_Overall_Status_VH as _Status      on $projection.OverallStatus = _Status.OverallStatus
  //association to I_TEXT
{
  key travel_id           as TravelId,

      agency_id           as AgencyId,
      _Agency.Name        as Agname,
      customer_id         as CustomerId,
      _Customer.FirstName as CusName,
      begin_date          as BeginDate,
      end_date            as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee         as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price         as TotalPrice,
      currency_code       as CurrencyCode,
      description         as Description,
      overall_status      as OverallStatus,
      case overall_status
      when 'O' then 'OPEN'
      when 'A' then 'Approved'
      when 'R' then 'Rejected'
      when 'X' then 'Cancelled'
      end                 as StatusText,
      case overall_status
      when 'O' then '2'
      when 'A' then '3'
      when 'R' then '0'
      when 'X' then '1'
      end                 as Cricticality,
      @Semantics.user.createdBy: true
      created_by          as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at          as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by     as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at     as LastChangedAt,
      _Booking,
      _Agency,
      _Customer,
      _Status,
      _Currency
}
