// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQDetails _$FAQDetailsFromJson(Map<String, dynamic> json) => FAQDetails(
      imDbId: json['imDbId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      fullTitle: json['fullTitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      year: json['year'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => FAQItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      spoilerItems: (json['spoilerItems'] as List<dynamic>?)
          ?.map((e) => FAQItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$FAQDetailsToJson(FAQDetails instance) =>
    <String, dynamic>{
      'imDbId': instance.imDbId,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'items': instance.items,
      'spoilerItems': instance.spoilerItems,
      'errorMessage': instance.errorMessage,
    };

FAQItems _$FAQItemsFromJson(Map<String, dynamic> json) => FAQItems(
      question: json['question'] as String? ?? '',
      answer: json['answer'] as String? ?? '',
    );

Map<String, dynamic> _$FAQItemsToJson(FAQItems instance) => <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };
