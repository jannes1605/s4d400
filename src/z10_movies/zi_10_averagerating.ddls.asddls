@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_10_AverageRating as select from zabap_rating_a
{
  movie_uuid as MovieUuid,
  avg(rating as abap.dec(16, 1)) as AverageRating
}
group by movie_uuid
