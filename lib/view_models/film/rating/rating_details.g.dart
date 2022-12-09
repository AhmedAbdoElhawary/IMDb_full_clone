// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingDetails _$RatingDetailsFromJson(Map<String, dynamic> json) =>
    RatingDetails(
      imDbId: json['imDbId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      fullTitle: json['fullTitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      year: json['year'] as String? ?? '',
      imDb: json['imDb'] as String? ?? '',
      metacritic: json['metacritic'] as String? ?? '',
      theMovieDb: json['theMovieDb'] as String? ?? '',
      rottenTomatoes: json['rottenTomatoes'] as String? ?? '',
      filmAffinity: json['filmAffinity'] as String? ?? '',
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$RatingDetailsToJson(RatingDetails instance) =>
    <String, dynamic>{
      'imDbId': instance.imDbId,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'imDb': instance.imDb,
      'metacritic': instance.metacritic,
      'theMovieDb': instance.theMovieDb,
      'rottenTomatoes': instance.rottenTomatoes,
      'filmAffinity': instance.filmAffinity,
      'errorMessage': instance.errorMessage,
    };
