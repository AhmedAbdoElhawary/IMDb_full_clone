
import 'package:freezed_annotation/freezed_annotation.dart';
part 'wikipedia_details.g.dart';

@JsonSerializable(includeIfNull: true)
class Wikipedia {
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
  String language;

  @JsonKey(defaultValue: "")
  String titleInLanguage;

  @JsonKey(defaultValue: "")
  String url;
  PlotShort? plotShort;
  PlotShort? plotFull;

  @JsonKey(defaultValue: "")
  String errorMessage;

  Wikipedia(
      {required this.imDbId,
      required this.title,
      required this.fullTitle,
      required this.type,
      required this.year,
      required this.language,
      required this.titleInLanguage,
      required this.url,
      required this.plotShort,
      required this.plotFull,
      required this.errorMessage});
  factory Wikipedia.fromJson(Map<String, dynamic> json) =>
      _$WikipediaFromJson(json);

  Map<String, dynamic> toJson() => _$WikipediaToJson(this);
}

@JsonSerializable(includeIfNull: true)
class PlotShort {
  @JsonKey(defaultValue: "")
  String plainText;

  @JsonKey(defaultValue: "")
  String html;

  PlotShort({required this.plainText, required this.html});
  factory PlotShort.fromJson(Map<String, dynamic> json) =>
      _$PlotShortFromJson(json);

  Map<String, dynamic> toJson() => _$PlotShortToJson(this);
}
