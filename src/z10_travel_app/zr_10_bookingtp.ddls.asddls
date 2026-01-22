@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
define view entity ZR_10_BOOKINGTP
  as select from ZI_10_Booking

  association to parent ZR_10_TRAVELTP as _Travel 
  on $projection.TravelId = _Travel.TravelId
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      _Travel
}
