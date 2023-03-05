import 'package:freezed_annotation/freezed_annotation.dart';
part 'personal_info_details.g.dart';

@JsonSerializable(includeIfNull: true)
class PersonalInfoDetails {
  @JsonKey(defaultValue: "")
  String id;
  @JsonKey(defaultValue: "")
  String name;
  @JsonKey(defaultValue: "")
  String role;
  @JsonKey(defaultValue: "")
  String image;
  @JsonKey(defaultValue: "")
  String summary;
  @JsonKey(defaultValue: "")
  String birthDate;
  @JsonKey(defaultValue: "")
  String deathDate;
  @JsonKey(defaultValue: "")
  String awards;
  @JsonKey(defaultValue: "")
  String height;
  @JsonKey(defaultValue: [])
  List<KnownFor> knownFor;
  @JsonKey(defaultValue: [])
  List<CastMovies> castMovies;
  @JsonKey(defaultValue: "")
  String errorMessage;

  PersonalInfoDetails(
      {required this.id,
      required this.name,
      required this.role,
      required this.image,
      required this.summary,
      required this.birthDate,
      required this.deathDate,
      required this.awards,
      required this.height,
      required this.knownFor,
      required this.castMovies,
      required this.errorMessage});

  factory PersonalInfoDetails.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoDetailsToJson(this);
}
@JsonSerializable(includeIfNull: true)
class KnownFor {
  @JsonKey(defaultValue: "")
  String id;
  @JsonKey(defaultValue: "")
  String title;
  @JsonKey(defaultValue: "")
  String fullTitle;
  @JsonKey(defaultValue: "")
  String year;
  @JsonKey(defaultValue: "")
  String role;
  @JsonKey(defaultValue: "")
  String image;

  KnownFor(
      {required this.id,
      required this.title,
      required this.fullTitle,
      required this.year,
      required this.role,
      required this.image});
  factory KnownFor.fromJson(Map<String, dynamic> json) =>
      _$KnownForFromJson(json);

  Map<String, dynamic> toJson() => _$KnownForToJson(this);
}
@JsonSerializable(includeIfNull: true)
class CastMovies {
  @JsonKey(defaultValue: "")
  String id;
  @JsonKey(defaultValue: "")
  String role;
  @JsonKey(defaultValue: "")
  String title;
  @JsonKey(defaultValue: "")
  String year;
  @JsonKey(defaultValue: "")
  String description;

  CastMovies(
      {required this.id,
      required this.role,
      required this.title,
      required this.year,
      required this.description});
  factory CastMovies.fromJson(Map<String, dynamic> json) =>
      _$CastMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$CastMoviesToJson(this);
}
