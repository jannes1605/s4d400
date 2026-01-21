@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_10_MOVIETP as select from ZI_10_Movie
{
  key MovieUuid,
  Title,
  Genre,
  PublishingYear,
  RuntimeInMin,
  ImageUrl,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy
}
