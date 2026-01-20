@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 9'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z10_Demo09 as select from Z10_Demo08
{
  key CarrierId,
  key ConnectionId,
  AirportFromId,
  AirportToId,
  _Carrier.name as Name,
  
  /* Associations */
  _Carrier,
  _Flights
}
