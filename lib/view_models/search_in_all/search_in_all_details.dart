import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_in_all_details.g.dart';

@JsonSerializable(includeIfNull: true)
class SearchInAllDetails {
  @JsonKey(defaultValue: "")
  String searchType;
  @JsonKey(defaultValue: "")
  String expression;
  @JsonKey(defaultValue: [])
  List<SearchAllResults> results;
  @JsonKey(defaultValue: "")
  String errorMessage;

  SearchInAllDetails(
      {required this.searchType,
      required this.expression,
      required this.results,
      required this.errorMessage});
  factory SearchInAllDetails.fromJson(Map<String, dynamic> json) =>
      _$SearchInAllDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchInAllDetailsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class SearchAllResults {
  @JsonKey(defaultValue: "")
  String id;
  @JsonKey(defaultValue: "")
  String resultType;
  @JsonKey(defaultValue: "")
  String image;
  @JsonKey(defaultValue: "")
  String title;
  @JsonKey(defaultValue: "")
  String description;

  SearchAllResults(
      {required this.id,
      required this.resultType,
      required this.image,
      required this.title,
      required this.description});
  factory SearchAllResults.fromJson(Map<String, dynamic> json) =>
      _$SearchAllResultsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchAllResultsToJson(this);
}
