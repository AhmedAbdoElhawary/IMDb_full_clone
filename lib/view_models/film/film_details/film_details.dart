import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb/view_models/film/full_cast/full_cast_details.dart';
import 'package:imdb/view_models/film/image/image_details.dart';
import 'package:imdb/view_models/film/poster/poster_details.dart';
import 'package:imdb/view_models/film/rating/rating_details.dart';
import 'package:imdb/view_models/film/trailer/trailer_details.dart';
import 'package:imdb/view_models/film/wikipedia/wikipedia_details.dart';

part 'film_details.g.dart';

@JsonSerializable(includeIfNull: true)
class FilmDetails {
  @JsonKey(defaultValue: "")
  String id;

  @JsonKey(defaultValue: "")
  String title;

  @JsonKey(defaultValue: "")
  String originalTitle;

  @JsonKey(defaultValue: "")
  String fullTitle;

  @JsonKey(defaultValue: "")
  String type;

  @JsonKey(defaultValue: "")
  String year;

  @JsonKey(defaultValue: "")
  String image;

  @JsonKey(defaultValue: "")
  String releaseDate;

  @JsonKey(defaultValue: "")
  String runtimeMins;

  @JsonKey(defaultValue: "")
  String runtimeStr;

  @JsonKey(defaultValue: "")
  String plot;

  @JsonKey(defaultValue: "")
  String plotLocal;
  @JsonKey(defaultValue: false)
  bool plotLocalIsRtl;

  @JsonKey(defaultValue: "")
  String awards;

  @JsonKey(defaultValue: "")
  String directors;

  @JsonKey(defaultValue: [])
  List<DirectorList> directorList;

  @JsonKey(defaultValue: "")
  String writers;

  @JsonKey(defaultValue: [])
  List<DirectorList> writerList;

  @JsonKey(defaultValue: "")
  String stars;

  @JsonKey(defaultValue: [])
  List<DirectorList> starList;

  @JsonKey(defaultValue: [])
  List<ActorList> actorList;
  FullCast? fullCast;

  @JsonKey(defaultValue: "")
  String genres;

  @JsonKey(defaultValue: [])
  List<GenreList> genreList;

  @JsonKey(defaultValue: "")
  String companies;

  @JsonKey(defaultValue: [])
  List<DirectorList> companyList;

  @JsonKey(defaultValue: "")
  String countries;

  @JsonKey(defaultValue: [])
  List<GenreList> countryList;

  @JsonKey(defaultValue: "")
  String languages;

  @JsonKey(defaultValue: [])
  List<GenreList> languageList;

  @JsonKey(defaultValue: "")
  String contentRating;

  @JsonKey(defaultValue: "")
  String imDbRating;

  @JsonKey(defaultValue: "")
  String imDbRatingVotes;

  @JsonKey(defaultValue: "")
  String metacriticRating;
  RatingDetails? ratings;
  Wikipedia? wikipedia;
  Posters? posters;
  ImageDetails? images;
  TrailerDetails? trailer;
  SubBoxOffice? subBoxOffice;

  @JsonKey(defaultValue: "")
  String keywords;

  @JsonKey(defaultValue: [])
  List<String> keywordList;

  @JsonKey(defaultValue: [])
  List<Similars> similars;
  TvSeriesInfo? tvSeriesInfo;
  // void? tvEpisodeInfo;

  @JsonKey(defaultValue: "")
  String errorMessage;

  FilmDetails(
      {required this.id,
      required this.title,
      required this.originalTitle,
      required this.fullTitle,
      required this.type,
      required this.year,
      required this.image,
      required this.releaseDate,
      required this.runtimeMins,
      required this.runtimeStr,
      required this.plot,
      required this.plotLocal,
      required this.plotLocalIsRtl,
      required this.awards,
      required this.directors,
      required this.directorList,
      required this.writers,
      required this.writerList,
      required this.stars,
      required this.starList,
      required this.actorList,
      required this.fullCast,
      required this.genres,
      required this.genreList,
      required this.companies,
      required this.companyList,
      required this.countries,
      required this.countryList,
      required this.languages,
      required this.languageList,
      required this.contentRating,
      required this.imDbRating,
      required this.imDbRatingVotes,
      required this.metacriticRating,
      this.ratings,
      this.wikipedia,
      this.posters,
      this.images,
      this.trailer,
      this.subBoxOffice,
      required this.keywords,
      required this.keywordList,
      required this.similars,
      required this.tvSeriesInfo,
      required this.errorMessage});
  factory FilmDetails.fromJson(Map<String, dynamic> json) =>
      _$FilmDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$FilmDetailsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class DirectorList {
  @JsonKey(defaultValue: "")
  String id;

  @JsonKey(defaultValue: "")
  String name;

  DirectorList({required this.id, required this.name});
  factory DirectorList.fromJson(Map<String, dynamic> json) =>
      _$DirectorListFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorListToJson(this);
}

@JsonSerializable(includeIfNull: true)
class ActorList {
  @JsonKey(defaultValue: "")
  String id;

  @JsonKey(defaultValue: "")
  String image;

  @JsonKey(defaultValue: "")
  String name;

  @JsonKey(defaultValue: "")
  String asCharacter;

  ActorList(
      {required this.id,
      required this.image,
      required this.name,
      required this.asCharacter});
  factory ActorList.fromJson(Map<String, dynamic> json) =>
      _$ActorListFromJson(json);

  Map<String, dynamic> toJson() => _$ActorListToJson(this);
}

@JsonSerializable(includeIfNull: true)
class OthersContribute {
  @JsonKey(defaultValue: "")
  String job;

  @JsonKey(defaultValue: [])
  List<OthersItems> othersItems;

  OthersContribute({required this.job, required this.othersItems});
  factory OthersContribute.fromJson(Map<String, dynamic> json) =>
      _$OthersContributeFromJson(json);

  Map<String, dynamic> toJson() => _$OthersContributeToJson(this);
}

@JsonSerializable(includeIfNull: true)
class OthersItems {
  @JsonKey(defaultValue: "")
  String id;

  @JsonKey(defaultValue: "")
  String name;

  @JsonKey(defaultValue: "")
  String description;

  OthersItems(
      {required this.id, required this.name, required this.description});
  factory OthersItems.fromJson(Map<String, dynamic> json) =>
      _$OthersItemsFromJson(json);

  Map<String, dynamic> toJson() => _$OthersItemsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Directors {
  @JsonKey(defaultValue: "")
  String job;

  @JsonKey(defaultValue: [])
  List<DirectorsItems> items;

  Directors({required this.job, required this.items});
  factory Directors.fromJson(Map<String, dynamic> json) =>
      _$DirectorsFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class DirectorsItems {
  @JsonKey(defaultValue: "")
  String id;

  @JsonKey(defaultValue: "")
  String name;

  @JsonKey(defaultValue: "")
  String description;

  DirectorsItems(
      {required this.id, required this.name, required this.description});
  factory DirectorsItems.fromJson(Map<String, dynamic> json) =>
      _$DirectorsItemsFromJson(json);

  Map<String, dynamic> toJson() => _$DirectorsItemsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class GenreList {
  @JsonKey(defaultValue: "")
  String key;

  @JsonKey(defaultValue: "")
  String value;

  GenreList({required this.key, required this.value});
  factory GenreList.fromJson(Map<String, dynamic> json) =>
      _$GenreListFromJson(json);

  Map<String, dynamic> toJson() => _$GenreListToJson(this);
}

@JsonSerializable(includeIfNull: true)
class SubBoxOffice {
  @JsonKey(defaultValue: "")
  String budget;

  @JsonKey(defaultValue: "")
  String openingWeekendUSA;

  @JsonKey(defaultValue: "")
  String grossUSA;

  @JsonKey(defaultValue: "")
  String cumulativeWorldwideGross;

  SubBoxOffice(
      {required this.budget,
      required this.openingWeekendUSA,
      required this.grossUSA,
      required this.cumulativeWorldwideGross});
  factory SubBoxOffice.fromJson(Map<String, dynamic> json) =>
      _$SubBoxOfficeFromJson(json);

  Map<String, dynamic> toJson() => _$SubBoxOfficeToJson(this);
}

@JsonSerializable(includeIfNull: true)
class TvSeriesInfo {
  @JsonKey(defaultValue: "")
  String yearEnd;

  @JsonKey(defaultValue: "")
  String creators;

  @JsonKey(defaultValue: [])
  List<DirectorList> creatorList;

  @JsonKey(defaultValue: [])
  List<String> seasons;

  TvSeriesInfo(
      {required this.yearEnd,
      required this.creators,
      required this.creatorList,
      required this.seasons});

  factory TvSeriesInfo.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeriesInfoToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Similars {
  @JsonKey(defaultValue: "")
  String id;

  @JsonKey(defaultValue: "")
  String title;

  @JsonKey(defaultValue: "")
  String image;

  @JsonKey(defaultValue: "")
  String imDbRating;

  Similars(
      {required this.id,
      required this.title,
      required this.image,
      required this.imDbRating});
  factory Similars.fromJson(Map<String, dynamic> json) =>
      _$SimilarsFromJson(json);

  Map<String, dynamic> toJson() => _$SimilarsToJson(this);
}
