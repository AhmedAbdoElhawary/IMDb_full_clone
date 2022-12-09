import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_details.g.dart';

@JsonSerializable(includeIfNull: true)
class RatingDetails {
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
  String imDb;

  @JsonKey(defaultValue: "")
  String metacritic;

  @JsonKey(defaultValue: "")
  String theMovieDb;

  @JsonKey(defaultValue: "")
  String rottenTomatoes;

  @JsonKey(defaultValue: "")
  String filmAffinity;

  @JsonKey(defaultValue: "")
  String errorMessage;

  RatingDetails(
      {required this.imDbId,
      required this.title,
      required this.fullTitle,
      required this.type,
      required this.year,
      required this.imDb,
      required this.metacritic,
      required this.theMovieDb,
      required this.rottenTomatoes,
      required this.filmAffinity,
      required this.errorMessage});
      
  factory RatingDetails.fromJson(Map<String, dynamic> json) =>
      _$RatingDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RatingDetailsToJson(this);
}
