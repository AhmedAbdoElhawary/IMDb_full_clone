import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_details.g.dart';

@JsonSerializable(includeIfNull: true)
class ImageDetails {
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
  List<Items> items;

  @JsonKey(defaultValue: "")
  String errorMessage;

  ImageDetails(
      {required this.imDbId,
      required this.title,
      required this.fullTitle,
      required this.type,
      required this.year,
      required this.items,
      required this.errorMessage});
  factory ImageDetails.fromJson(Map<String, dynamic> json) =>
      _$ImageDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDetailsToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Items {
  @JsonKey(defaultValue: "")
  String title;

  @JsonKey(defaultValue: "")
  String image;

  Items({required this.title, required this.image});
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
