@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

@Metadata.allowExtensions: true

@Search.searchable: true

@UI.lineItem: [ { criticality: 'StatusCriticality' } ]

@UI.presentationVariant: [ { sortOrder: [ { by: 'BeginDate', direction: #DESC },
                                          { by: 'EndDate',   direction: #ASC  } ] } ]

define root view entity ZC_10_TravelTP
  provider contract transactional_query
  as projection on ZR_10_TRAVELTP

{
  key TravelId,
  
      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Agency_StdVH', element: 'AgencyID' } } ]
      AgencyId,
      
      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_10_CustomerVH', element: 'CustomerId' } } ]
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_CurrencyStdVH', element: 'Currency' } } ]
      CurrencyCode,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,

      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      StatusCriticality,
      CustomerName,

      _Bookings : redirected to composition child ZC_10_BookingTP
}
