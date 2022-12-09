import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb/view_models/film/film_details/film_details.dart';

part 'full_cast_details.g.dart';

@JsonSerializable(includeIfNull: true)
class FullCast {
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
  Directors? directors;
  Directors? writers;

  @JsonKey(defaultValue: [])
  List<ActorList> actors;

  @JsonKey(defaultValue: [])
  List<OthersContribute> others;

  @JsonKey(defaultValue: "")
  String errorMessage;

  FullCast(
      {required this.imDbId,
      required this.title,
      required this.fullTitle,
      required this.type,
      required this.year,
      required this.directors,
      required this.writers,
      required this.actors,
      required this.others,
      required this.errorMessage});
  factory FullCast.fromJson(Map<String, dynamic> json) =>
      _$FullCastFromJson(json);

  Map<String, dynamic> toJson() => _$FullCastToJson(this);
}
