// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDetails _$ImageDetailsFromJson(Map<String, dynamic> json) => ImageDetails(
      imDbId: json['imDbId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      fullTitle: json['fullTitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      year: json['year'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$ImageDetailsToJson(ImageDetails instance) =>
    <String, dynamic>{
      'imDbId': instance.imDbId,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'items': instance.items,
      'errorMessage': instance.errorMessage,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
    };
