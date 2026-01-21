@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

@Metadata.allowExtensions: true

@Search.searchable: true

define view entity ZC_10_MOVIETP
  as select from ZR_10_MOVIETP

{
  key MovieUuid,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,

      Genre,
      PublishingYear,
      RuntimeInMin,

      @Semantics.imageUrl: true
      ImageUrl,

      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy
}
