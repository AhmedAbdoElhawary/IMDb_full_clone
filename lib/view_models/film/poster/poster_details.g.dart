// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poster_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Posters _$PostersFromJson(Map<String, dynamic> json) => Posters(
      imDbId: json['imDbId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      fullTitle: json['fullTitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      year: json['year'] as String? ?? '',
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$PostersToJson(Posters instance) => <String, dynamic>{
      'imDbId': instance.imDbId,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'errorMessage': instance.errorMessage,
    };
