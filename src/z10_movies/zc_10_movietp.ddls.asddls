@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

@Metadata.allowExtensions: true

@Search.searchable: true

@UI.lineItem: [ { criticality: 'AverageRatingCriticality' } ]

@UI.presentationVariant: [ { sortOrder: [ { by: 'AverageRating', direction: #DESC } ] } ]

define root view entity ZC_10_MOVIETP
  as projection on ZR_10_MOVIETP

{
  key MovieUuid,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,

      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      
      GenreText,
      
      AverageRating,
      AverageRatingCriticality,
      
      _Ratings : redirected to composition child ZC_10_RatingTP
}
