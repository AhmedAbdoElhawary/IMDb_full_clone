import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb/view_models/film/reviews/reviews_details.dart';

part 'metacritic_reviews_details.g.dart';

@JsonSerializable(includeIfNull: true)
class MetacriticReviewsDetails {
  @JsonKey(defaultValue: "")
  String imDbId;
  @JsonKey(defaultValue: "")
  String title;
  @JsonKey(defaultValue: "")
  String fullTitle;
  @JsonKey(defaultValue: "")
  String type;
  @JsonKey(defaultValue: "")
  String year;
  @JsonKey(defaultValue: [])
  List<ReviewsItems> items;
  @JsonKey(defaultValue: "")
  String errorMessage;

  MetacriticReviewsDetails(
      {required this.imDbId,
      required this.title,
      required this.fullTitle,
      required this.type,
      required this.year,
      required this.items,
      required this.errorMessage});

  factory MetacriticReviewsDetails.fromJson(Map<String, dynamic> json) =>
      _$MetacriticReviewsDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MetacriticReviewsDetailsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class MetacriticReviewsItems {
  @JsonKey(defaultValue: "")
  String username;
  @JsonKey(defaultValue: "")
  String userUrl;
  @JsonKey(defaultValue: "")
  String reviewLink;
  @JsonKey(defaultValue: true)
  bool warningSpoilers;
  @JsonKey(defaultValue: "")
  String date;
  @JsonKey(defaultValue: "")
  String rate;
  @JsonKey(defaultValue: "")
  String helpful;
  @JsonKey(defaultValue: "")
  String title;
  @JsonKey(defaultValue: "")
  String content;

  MetacriticReviewsItems(
      {required this.username,
      required this.userUrl,
      required this.reviewLink,
      required this.warningSpoilers,
      required this.date,
      required this.rate,
      required this.helpful,
      required this.title,
      required this.content});
  factory MetacriticReviewsItems.fromJson(Map<String, dynamic> json) =>
      _$MetacriticReviewsItemsFromJson(json);

  Map<String, dynamic> toJson() => _$MetacriticReviewsItemsToJson(this);
}
