@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
define view entity ZR_10_RatingTP as select from ZI_10_RATING

association to parent ZR_10_MOVIETP as _MOVIE 
  on $projection.MovieUuid = _MOVIE.MovieUuid
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  _MOVIE
}
