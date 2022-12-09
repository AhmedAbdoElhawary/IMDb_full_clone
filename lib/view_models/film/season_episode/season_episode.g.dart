// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonEpisode _$SeasonEpisodeFromJson(Map<String, dynamic> json) =>
    SeasonEpisode(
      imDbId: json['imDbId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      fullTitle: json['fullTitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      year: json['year'] as String? ?? '',
      episodes: (json['episodes'] as List<dynamic>?)
              ?.map((e) => Episodes.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$SeasonEpisodeToJson(SeasonEpisode instance) =>
    <String, dynamic>{
      'imDbId': instance.imDbId,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'episodes': instance.episodes,
      'errorMessage': instance.errorMessage,
    };

Episodes _$EpisodesFromJson(Map<String, dynamic> json) => Episodes(
      id: json['id'] as String? ?? '',
      seasonNumber: json['seasonNumber'] as String? ?? '',
      episodeNumber: json['episodeNumber'] as String? ?? '',
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      year: json['year'] as String? ?? '',
      released: json['released'] as String? ?? '',
      plot: json['plot'] as String? ?? '',
      imDbRating: json['imDbRating'] as String? ?? '',
      imDbRatingCount: json['imDbRatingCount'] as String? ?? '',
    );

Map<String, dynamic> _$EpisodesToJson(Episodes instance) => <String, dynamic>{
      'id': instance.id,
      'seasonNumber': instance.seasonNumber,
      'episodeNumber': instance.episodeNumber,
      'title': instance.title,
      'image': instance.image,
      'year': instance.year,
      'released': instance.released,
      'plot': instance.plot,
      'imDbRating': instance.imDbRating,
      'imDbRatingCount': instance.imDbRatingCount,
    };
