@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Customer KPIs'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z10_CustomerKPIs
  with parameters
    p_city : abap.char(40)

  as select from Z10_TravelWithCustomer as t

{
  key t.CustomerId                      as CustomerId,

      t.CustomerName                    as CustomerName,
      t.Street                          as Street,
      t.PostalCode                      as PostalCode,
      t.City                            as City,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(t.TotalPrice + t.BookingFee)  as TotalRevenue,

      t.CurrencyCode                    as CurrencyCode,
      avg(t.Duration as abap.dec(16,2)) as AverageDuration,
      count(distinct t.AgencyId)        as NumberOffDifferentAgecys
}

where t.City = $parameters.p_city

group by t.CustomerId,
         t.CustomerName,
         t.Street,
         t.PostalCode,
         t.City,
         t.CurrencyCode
         
having sum(t.TotalPrice + t.BookingFee) >= 5000
