import 'package:freezed_annotation/freezed_annotation.dart';

part 'reviews_details.g.dart';

@JsonSerializable(includeIfNull: true)
class ReviewsDetails {
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

  ReviewsDetails(
      {required this.imDbId,
      required this.title,
      required this.fullTitle,
      required this.type,
      required this.year,
      required this.items,
      required this.errorMessage});

  factory ReviewsDetails.fromJson(Map<String, dynamic> json) =>
      _$ReviewsDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsDetailsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class ReviewsItems {
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

  ReviewsItems(
      {required this.username,
      required this.userUrl,
      required this.reviewLink,
      required this.warningSpoilers,
      required this.date,
      required this.rate,
      required this.helpful,
      required this.title,
      required this.content});
  factory ReviewsItems.fromJson(Map<String, dynamic> json) =>
      _$ReviewsItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsItemsToJson(this);
}
