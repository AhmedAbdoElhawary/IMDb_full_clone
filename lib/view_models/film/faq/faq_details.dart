import 'package:freezed_annotation/freezed_annotation.dart';
part 'faq_details.g.dart';

@JsonSerializable(includeIfNull: true)
class FAQDetails {
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
  List<FAQItems>? items;
  List<FAQItems>? spoilerItems;
  @JsonKey(defaultValue: "")
  String errorMessage;

  FAQDetails(
      {required  this.imDbId,
      required  this.title,
      required  this.fullTitle,
      required  this.type,
      required  this.year,
      required  this.items,
      required  this.spoilerItems,
      required  this.errorMessage});
  factory FAQDetails.fromJson(Map<String, dynamic> json) =>
      _$FAQDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$FAQDetailsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class FAQItems{
  @JsonKey(defaultValue: "")
  String question;
  @JsonKey(defaultValue: "")
  String answer;

  FAQItems({required  this.question, required  this.answer});
  factory FAQItems.fromJson(Map<String, dynamic> json) =>
      _$FAQItemsFromJson(json);

  Map<String, dynamic> toJson() => _$FAQItemsToJson(this);
}
