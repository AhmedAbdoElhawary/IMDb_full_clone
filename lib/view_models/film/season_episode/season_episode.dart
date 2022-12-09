import 'package:freezed_annotation/freezed_annotation.dart';

part 'season_episode.g.dart';
@JsonSerializable(includeIfNull: true)
class SeasonEpisode {
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
  List<Episodes> episodes;
  @JsonKey(defaultValue: "")
  String errorMessage;

  SeasonEpisode(
      {required this.imDbId,
      required this.title,
      required this.fullTitle,
      required this.type,
      required this.year,
      required this.episodes,
      required this.errorMessage});

  factory SeasonEpisode.fromJson(Map<String, dynamic> json) =>
      _$SeasonEpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonEpisodeToJson(this);
}

@JsonSerializable(includeIfNull: true)
class Episodes {
  @JsonKey(defaultValue: "")
  String id;
  @JsonKey(defaultValue: "")
  String seasonNumber;
  @JsonKey(defaultValue: "")
  String episodeNumber;
  @JsonKey(defaultValue: "")
  String title;
  @JsonKey(defaultValue: "")
  String image;
  @JsonKey(defaultValue: "")
  String year;
  @JsonKey(defaultValue: "")
  String released;
  @JsonKey(defaultValue: "")
  String plot;
  @JsonKey(defaultValue: "")
  String imDbRating;
  @JsonKey(defaultValue: "")
  String imDbRatingCount;

  Episodes(
      {required this.id,
      required this.seasonNumber,
      required this.episodeNumber,
      required this.title,
      required this.image,
      required this.year,
      required this.released,
      required this.plot,
      required this.imDbRating,
      required this.imDbRatingCount});

  factory Episodes.fromJson(Map<String, dynamic> json) =>
      _$EpisodesFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodesToJson(this);
}
