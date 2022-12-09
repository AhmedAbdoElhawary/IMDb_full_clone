// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmDetails _$FilmDetailsFromJson(Map<String, dynamic> json) => FilmDetails(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      originalTitle: json['originalTitle'] as String? ?? '',
      fullTitle: json['fullTitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      year: json['year'] as String? ?? '',
      image: json['image'] as String? ?? '',
      releaseDate: json['releaseDate'] as String? ?? '',
      runtimeMins: json['runtimeMins'] as String? ?? '',
      runtimeStr: json['runtimeStr'] as String? ?? '',
      plot: json['plot'] as String? ?? '',
      plotLocal: json['plotLocal'] as String? ?? '',
      plotLocalIsRtl: json['plotLocalIsRtl'] as bool? ?? false,
      awards: json['awards'] as String? ?? '',
      directors: json['directors'] as String? ?? '',
      directorList: (json['directorList'] as List<dynamic>?)
              ?.map((e) => DirectorList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      writers: json['writers'] as String? ?? '',
      writerList: (json['writerList'] as List<dynamic>?)
              ?.map((e) => DirectorList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      stars: json['stars'] as String? ?? '',
      starList: (json['starList'] as List<dynamic>?)
              ?.map((e) => DirectorList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      actorList: (json['actorList'] as List<dynamic>?)
              ?.map((e) => ActorList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      fullCast: json['fullCast'] == null
          ? null
          : FullCast.fromJson(json['fullCast'] as Map<String, dynamic>),
      genres: json['genres'] as String? ?? '',
      genreList: (json['genreList'] as List<dynamic>?)
              ?.map((e) => GenreList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      companies: json['companies'] as String? ?? '',
      companyList: (json['companyList'] as List<dynamic>?)
              ?.map((e) => DirectorList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      countries: json['countries'] as String? ?? '',
      countryList: (json['countryList'] as List<dynamic>?)
              ?.map((e) => GenreList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      languages: json['languages'] as String? ?? '',
      languageList: (json['languageList'] as List<dynamic>?)
              ?.map((e) => GenreList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      contentRating: json['contentRating'] as String? ?? '',
      imDbRating: json['imDbRating'] as String? ?? '',
      imDbRatingVotes: json['imDbRatingVotes'] as String? ?? '',
      metacriticRating: json['metacriticRating'] as String? ?? '',
      ratings: json['ratings'] == null
          ? null
          : RatingDetails.fromJson(json['ratings'] as Map<String, dynamic>),
      wikipedia: json['wikipedia'] == null
          ? null
          : Wikipedia.fromJson(json['wikipedia'] as Map<String, dynamic>),
      posters: json['posters'] == null
          ? null
          : Posters.fromJson(json['posters'] as Map<String, dynamic>),
      images: json['images'] == null
          ? null
          : ImageDetails.fromJson(json['images'] as Map<String, dynamic>),
      trailer: json['trailer'] == null
          ? null
          : TrailerDetails.fromJson(json['trailer'] as Map<String, dynamic>),
      subBoxOffice: json['subBoxOffice'] == null
          ? null
          : SubBoxOffice.fromJson(json['subBoxOffice'] as Map<String, dynamic>),
      keywords: json['keywords'] as String? ?? '',
      keywordList: (json['keywordList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      similars: (json['similars'] as List<dynamic>?)
              ?.map((e) => Similars.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tvSeriesInfo: json['tvSeriesInfo'] == null
          ? null
          : TvSeriesInfo.fromJson(json['tvSeriesInfo'] as Map<String, dynamic>),
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$FilmDetailsToJson(FilmDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'originalTitle': instance.originalTitle,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'image': instance.image,
      'releaseDate': instance.releaseDate,
      'runtimeMins': instance.runtimeMins,
      'runtimeStr': instance.runtimeStr,
      'plot': instance.plot,
      'plotLocal': instance.plotLocal,
      'plotLocalIsRtl': instance.plotLocalIsRtl,
      'awards': instance.awards,
      'directors': instance.directors,
      'directorList': instance.directorList,
      'writers': instance.writers,
      'writerList': instance.writerList,
      'stars': instance.stars,
      'starList': instance.starList,
      'actorList': instance.actorList,
      'fullCast': instance.fullCast,
      'genres': instance.genres,
      'genreList': instance.genreList,
      'companies': instance.companies,
      'companyList': instance.companyList,
      'countries': instance.countries,
      'countryList': instance.countryList,
      'languages': instance.languages,
      'languageList': instance.languageList,
      'contentRating': instance.contentRating,
      'imDbRating': instance.imDbRating,
      'imDbRatingVotes': instance.imDbRatingVotes,
      'metacriticRating': instance.metacriticRating,
      'ratings': instance.ratings,
      'wikipedia': instance.wikipedia,
      'posters': instance.posters,
      'images': instance.images,
      'trailer': instance.trailer,
      'subBoxOffice': instance.subBoxOffice,
      'keywords': instance.keywords,
      'keywordList': instance.keywordList,
      'similars': instance.similars,
      'tvSeriesInfo': instance.tvSeriesInfo,
      'errorMessage': instance.errorMessage,
    };

DirectorList _$DirectorListFromJson(Map<String, dynamic> json) => DirectorList(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$DirectorListToJson(DirectorList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ActorList _$ActorListFromJson(Map<String, dynamic> json) => ActorList(
      id: json['id'] as String? ?? '',
      image: json['image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      asCharacter: json['asCharacter'] as String? ?? '',
    );

Map<String, dynamic> _$ActorListToJson(ActorList instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'asCharacter': instance.asCharacter,
    };

OthersContribute _$OthersContributeFromJson(Map<String, dynamic> json) =>
    OthersContribute(
      job: json['job'] as String? ?? '',
      othersItems: (json['othersItems'] as List<dynamic>?)
              ?.map((e) => OthersItems.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$OthersContributeToJson(OthersContribute instance) =>
    <String, dynamic>{
      'job': instance.job,
      'othersItems': instance.othersItems,
    };

OthersItems _$OthersItemsFromJson(Map<String, dynamic> json) => OthersItems(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$OthersItemsToJson(OthersItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

Directors _$DirectorsFromJson(Map<String, dynamic> json) => Directors(
      job: json['job'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => DirectorsItems.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DirectorsToJson(Directors instance) => <String, dynamic>{
      'job': instance.job,
      'items': instance.items,
    };

DirectorsItems _$DirectorsItemsFromJson(Map<String, dynamic> json) =>
    DirectorsItems(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$DirectorsItemsToJson(DirectorsItems instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

GenreList _$GenreListFromJson(Map<String, dynamic> json) => GenreList(
      key: json['key'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$GenreListToJson(GenreList instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

SubBoxOffice _$SubBoxOfficeFromJson(Map<String, dynamic> json) => SubBoxOffice(
      budget: json['budget'] as String? ?? '',
      openingWeekendUSA: json['openingWeekendUSA'] as String? ?? '',
      grossUSA: json['grossUSA'] as String? ?? '',
      cumulativeWorldwideGross:
          json['cumulativeWorldwideGross'] as String? ?? '',
    );

Map<String, dynamic> _$SubBoxOfficeToJson(SubBoxOffice instance) =>
    <String, dynamic>{
      'budget': instance.budget,
      'openingWeekendUSA': instance.openingWeekendUSA,
      'grossUSA': instance.grossUSA,
      'cumulativeWorldwideGross': instance.cumulativeWorldwideGross,
    };

TvSeriesInfo _$TvSeriesInfoFromJson(Map<String, dynamic> json) => TvSeriesInfo(
      yearEnd: json['yearEnd'] as String? ?? '',
      creators: json['creators'] as String? ?? '',
      creatorList: (json['creatorList'] as List<dynamic>?)
              ?.map((e) => DirectorList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      seasons: (json['seasons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$TvSeriesInfoToJson(TvSeriesInfo instance) =>
    <String, dynamic>{
      'yearEnd': instance.yearEnd,
      'creators': instance.creators,
      'creatorList': instance.creatorList,
      'seasons': instance.seasons,
    };

Similars _$SimilarsFromJson(Map<String, dynamic> json) => Similars(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      imDbRating: json['imDbRating'] as String? ?? '',
    );

Map<String, dynamic> _$SimilarsToJson(Similars instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'imDbRating': instance.imDbRating,
    };
