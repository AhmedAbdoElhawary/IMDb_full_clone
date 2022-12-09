// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_cast_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullCast _$FullCastFromJson(Map<String, dynamic> json) => FullCast(
      imDbId: json['imDbId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      fullTitle: json['fullTitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      year: json['year'] as String? ?? '',
      directors: json['directors'] == null
          ? null
          : Directors.fromJson(json['directors'] as Map<String, dynamic>),
      writers: json['writers'] == null
          ? null
          : Directors.fromJson(json['writers'] as Map<String, dynamic>),
      actors: (json['actors'] as List<dynamic>?)
              ?.map((e) => ActorList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      others: (json['others'] as List<dynamic>?)
              ?.map((e) => OthersContribute.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$FullCastToJson(FullCast instance) => <String, dynamic>{
      'imDbId': instance.imDbId,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'directors': instance.directors,
      'writers': instance.writers,
      'actors': instance.actors,
      'others': instance.others,
      'errorMessage': instance.errorMessage,
    };
