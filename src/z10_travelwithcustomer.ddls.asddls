@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel with Customer'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z10_TravelWithCustomer
  as select from Z10_Travel   as t

    inner join   Z10_Customer as c on c.CustomerId = t.CustomerId

{
  key t.TravelId,

      t.AgencyId,
      t.BeginDate,
      t.EndDate,
      dats_days_between(t.BeginDate, t.EndDate)                as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => t.BookingFee,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => t.BeginDate,
                          error_handling     => 'SET_TO_NULL') as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => t.TotalPrice,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => t.BeginDate,
                          error_handling     => 'SET_TO_NULL') as TotalPrice,

      cast('EUR' as abap.cuky)                                 as CurrencyCode,
      t.Description,
      t.Status,
      // Status Text
      t.CustomerId,

      case
      when c.Title = ''
        then concat(
               cast(c.FirstName as abap.char(40)),
               concat(' ', cast(c.LastName as abap.char(40)))
             )
      else
        concat(
          concat(
            cast(c.Title as abap.char(10)),
            concat(' ', cast(c.FirstName as abap.char(40)))
          ),
          concat(' ', cast(c.LastName as abap.char(40)))
        )
      end                                                      as CustomerName,

      c.Street,
      c.PostalCode,
      c.City
}

where c.CountryCode = 'DE'
