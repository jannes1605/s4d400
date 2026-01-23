@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
@Metadata.allowExtensions: true
define view entity ZC_10_RatingTP
  as projection on ZR_10_RatingTP
{
  key RatingUuid,
      MovieUuid,
      UserName,
      Rating,
      RatingDate,

      /* Associations */
      _MOVIE : redirected to parent ZC_10_MOVIETP
}
