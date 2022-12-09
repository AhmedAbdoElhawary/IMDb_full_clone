import 'package:freezed_annotation/freezed_annotation.dart';

part 'trailer_details.g.dart';

@JsonSerializable(includeIfNull: true)
class TrailerDetails {
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
  String videoId;

  @JsonKey(defaultValue: "")
  String videoTitle;

  @JsonKey(defaultValue: "")
  String videoDescription;

  @JsonKey(defaultValue: "")
  String thumbnailUrl;

  @JsonKey(defaultValue: "")
  String uploadDate;

  @JsonKey(defaultValue: "")
  String link;

  @JsonKey(defaultValue: "")
  String linkEmbed;

  @JsonKey(defaultValue: "")
  String errorMessage;

  TrailerDetails(
      {required this.imDbId,
      required this.title,
      required this.fullTitle,
      required this.type,
      required this.year,
      required this.videoId,
      required this.videoTitle,
      required this.videoDescription,
      required this.thumbnailUrl,
      required this.uploadDate,
      required this.link,
      required this.linkEmbed,
      required this.errorMessage});
  factory TrailerDetails.fromJson(Map<String, dynamic> json) =>
      _$TrailerDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerDetailsToJson(this);
}
