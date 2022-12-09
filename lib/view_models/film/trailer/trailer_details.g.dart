// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrailerDetails _$TrailerDetailsFromJson(Map<String, dynamic> json) =>
    TrailerDetails(
      imDbId: json['imDbId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      fullTitle: json['fullTitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      year: json['year'] as String? ?? '',
      videoId: json['videoId'] as String? ?? '',
      videoTitle: json['videoTitle'] as String? ?? '',
      videoDescription: json['videoDescription'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
      uploadDate: json['uploadDate'] as String? ?? '',
      link: json['link'] as String? ?? '',
      linkEmbed: json['linkEmbed'] as String? ?? '',
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$TrailerDetailsToJson(TrailerDetails instance) =>
    <String, dynamic>{
      'imDbId': instance.imDbId,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'videoId': instance.videoId,
      'videoTitle': instance.videoTitle,
      'videoDescription': instance.videoDescription,
      'thumbnailUrl': instance.thumbnailUrl,
      'uploadDate': instance.uploadDate,
      'link': instance.link,
      'linkEmbed': instance.linkEmbed,
      'errorMessage': instance.errorMessage,
    };
