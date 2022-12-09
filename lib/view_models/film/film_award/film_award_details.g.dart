// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_award_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmAwardDetails _$FilmAwardDetailsFromJson(Map<String, dynamic> json) =>
    FilmAwardDetails(
      imDbId: json['imDbId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      fullTitle: json['fullTitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      year: json['year'] as String? ?? '',
      description: json['description'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => FilmAwardItems.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      awardsHtml: json['awardsHtml'] as String? ?? '',
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$FilmAwardDetailsToJson(FilmAwardDetails instance) =>
    <String, dynamic>{
      'imDbId': instance.imDbId,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'description': instance.description,
      'items': instance.items,
      'awardsHtml': instance.awardsHtml,
      'errorMessage': instance.errorMessage,
    };

FilmAwardItems _$FilmAwardItemsFromJson(Map<String, dynamic> json) =>
    FilmAwardItems(
      eventTitle: json['eventTitle'] as String? ?? '',
      eventYear: json['eventYear'] as String? ?? '',
      outcomeItems: (json['outcomeItems'] as List<dynamic>?)
              ?.map((e) => OutcomeItems.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$FilmAwardItemsToJson(FilmAwardItems instance) =>
    <String, dynamic>{
      'eventTitle': instance.eventTitle,
      'eventYear': instance.eventYear,
      'outcomeItems': instance.outcomeItems,
    };

OutcomeItems _$OutcomeItemsFromJson(Map<String, dynamic> json) => OutcomeItems(
      outcomeTitle: json['outcomeTitle'] as String? ?? '',
      outcomeCategory: json['outcomeCategory'] as String? ?? '',
      outcomeDetails: (json['outcomeDetails'] as List<dynamic>?)
              ?.map((e) => OutcomeDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$OutcomeItemsToJson(OutcomeItems instance) =>
    <String, dynamic>{
      'outcomeTitle': instance.outcomeTitle,
      'outcomeCategory': instance.outcomeCategory,
      'outcomeDetails': instance.outcomeDetails,
    };

OutcomeDetails _$OutcomeDetailsFromJson(Map<String, dynamic> json) =>
    OutcomeDetails(
      plainText: json['plainText'] as String? ?? '',
      html: json['html'] as String? ?? '',
    );

Map<String, dynamic> _$OutcomeDetailsToJson(OutcomeDetails instance) =>
    <String, dynamic>{
      'plainText': instance.plainText,
      'html': instance.html,
    };
