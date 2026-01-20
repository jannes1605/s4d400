@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Customer With Travels'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z10_CustomerWithTravels
  as select from Z10_Customer

  association [0..*] to Z10_Travel as _Travels on $projection.CustomerId = _Travels.CustomerId

{
  key Z10_Customer.CustomerId,

      Z10_Customer.FirstName,
      Z10_Customer.LastName,
      Z10_Customer.Title,
      Z10_Customer.Street,
      Z10_Customer.PostalCode,
      Z10_Customer.City,

      _Travels
}

where Z10_Customer.CountryCode = 'DE'
