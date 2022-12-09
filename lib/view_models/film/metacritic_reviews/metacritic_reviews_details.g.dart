// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metacritic_reviews_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetacriticReviewsDetails _$MetacriticReviewsDetailsFromJson(
        Map<String, dynamic> json) =>
    MetacriticReviewsDetails(
      imDbId: json['imDbId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      fullTitle: json['fullTitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      year: json['year'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ReviewsItems.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$MetacriticReviewsDetailsToJson(
        MetacriticReviewsDetails instance) =>
    <String, dynamic>{
      'imDbId': instance.imDbId,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'items': instance.items,
      'errorMessage': instance.errorMessage,
    };

MetacriticReviewsItems _$MetacriticReviewsItemsFromJson(
        Map<String, dynamic> json) =>
    MetacriticReviewsItems(
      username: json['username'] as String? ?? '',
      userUrl: json['userUrl'] as String? ?? '',
      reviewLink: json['reviewLink'] as String? ?? '',
      warningSpoilers: json['warningSpoilers'] as bool? ?? true,
      date: json['date'] as String? ?? '',
      rate: json['rate'] as String? ?? '',
      helpful: json['helpful'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$MetacriticReviewsItemsToJson(
        MetacriticReviewsItems instance) =>
    <String, dynamic>{
      'username': instance.username,
      'userUrl': instance.userUrl,
      'reviewLink': instance.reviewLink,
      'warningSpoilers': instance.warningSpoilers,
      'date': instance.date,
      'rate': instance.rate,
      'helpful': instance.helpful,
      'title': instance.title,
      'content': instance.content,
    };
