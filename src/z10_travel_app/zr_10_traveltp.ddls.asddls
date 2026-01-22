@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

define root view entity ZR_10_TRAVELTP
  as select from ZI_10_Travel

  association [1..1] to ZI_10_CustomerText as _CustomerText on $projection.CustomerId = _CustomerText.CustomerId 
  composition [0..*] of ZR_10_BOOKINGTP as _Bookings

{
  key TravelId,

      AgencyId,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      case Status when 'X' then 1
                  when 'P' then 2
                  when 'B' then 3
                  else 0 end as StatusCriticality,
      
      _CustomerText.CustomerName as CustomerName,

      _Bookings
}
