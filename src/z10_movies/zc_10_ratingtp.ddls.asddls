@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
@Metadata.allowExtensions: true

@UI.presentationVariant: [ { sortOrder: [ { by: 'RatingDate', direction: #DESC },
                                          { by: 'UserName',   direction: #ASC  } ] } ]
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
