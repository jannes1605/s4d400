@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

define root view entity ZR_10_MOVIETP
  as select from ZI_10_Movie
  
  association [1..1] to ZI_10_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
  association [1..1] to ZI_10_GenreText as _GenreText on $projection.Genre = _GenreText.value_low
  composition[0..*] of ZR_10_RatingTP as _Ratings
  
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
      LastChangedBy,
      _Ratings,
      @EndUserText.label: 'Average Rating'
      @EndUserText.quickInfo: 'Average Rating'
      _AverageRating.AverageRating as AverageRating,
      
      @EndUserText.label: 'Genre'
      @EndUserText.quickInfo: 'Genre'
      _GenreText.GenreName as GenreText,
      case when _AverageRating.AverageRating > 6.7 then 3
           when _AverageRating.AverageRating > 3.4 and _AverageRating.AverageRating < 6.7 then 2
           when _AverageRating.AverageRating > 0.1 and _AverageRating.AverageRating < 3.4 then 1
           else 0 end as AverageRatingCriticality
}
