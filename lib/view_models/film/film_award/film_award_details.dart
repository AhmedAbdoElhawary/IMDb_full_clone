import 'package:freezed_annotation/freezed_annotation.dart';

part 'film_award_details.g.dart';

@JsonSerializable(includeIfNull: true)
class FilmAwardDetails {
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
  @JsonKey(defaultValue: "")
  String description;
  @JsonKey(defaultValue: [])
  List<FilmAwardItems> items;
  @JsonKey(defaultValue: "")
  String awardsHtml;
  @JsonKey(defaultValue: "")
  String errorMessage;

  FilmAwardDetails(
      {required this.imDbId,
      required this.title,
      required this.fullTitle,
      required this.type,
      required this.year,
      required this.description,
      required this.items,
      required this.awardsHtml,
      required this.errorMessage});
  factory FilmAwardDetails.fromJson(Map<String, dynamic> json) =>
      _$FilmAwardDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$FilmAwardDetailsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class FilmAwardItems {
  @JsonKey(defaultValue: "")
  String eventTitle;
  @JsonKey(defaultValue: "")
  String eventYear;
  @JsonKey(defaultValue: [])
  List<OutcomeItems> outcomeItems;

  FilmAwardItems(
      {required this.eventTitle,
      required this.eventYear,
      required this.outcomeItems});

  factory FilmAwardItems.fromJson(Map<String, dynamic> json) =>
      _$FilmAwardItemsFromJson(json);

  Map<String, dynamic> toJson() => _$FilmAwardItemsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class OutcomeItems {
  @JsonKey(defaultValue: "")
  String outcomeTitle;
  @JsonKey(defaultValue: "")
  String outcomeCategory;
  @JsonKey(defaultValue: [])
  List<OutcomeDetails> outcomeDetails;

  OutcomeItems(
      {required this.outcomeTitle,
      required this.outcomeCategory,
      required this.outcomeDetails});
  factory OutcomeItems.fromJson(Map<String, dynamic> json) =>
      _$OutcomeItemsFromJson(json);

  Map<String, dynamic> toJson() => _$OutcomeItemsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class OutcomeDetails {
  @JsonKey(defaultValue: "")
  String plainText;
  @JsonKey(defaultValue: "")
  String html;

  OutcomeDetails({required this.plainText, required this.html});
  factory OutcomeDetails.fromJson(Map<String, dynamic> json) =>
      _$OutcomeDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OutcomeDetailsToJson(this);
}
