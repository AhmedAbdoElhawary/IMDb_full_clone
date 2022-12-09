
import 'package:freezed_annotation/freezed_annotation.dart';
part 'poster_details.g.dart';

@JsonSerializable(includeIfNull: true)
class Posters {
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
  //
  // List<void> posters;
  //
  // List<void> backdrops;

  @JsonKey(defaultValue: "")
  String errorMessage;

  Posters(
      {required this.imDbId,
      required this.title,
      required this.fullTitle,
      required this.type,
      required this.year,
      // required this.posters,
      // required this.backdrops,
      required this.errorMessage});
  factory Posters.fromJson(Map<String, dynamic> json) =>
      _$PostersFromJson(json);

  Map<String, dynamic> toJson() => _$PostersToJson(this);
}
