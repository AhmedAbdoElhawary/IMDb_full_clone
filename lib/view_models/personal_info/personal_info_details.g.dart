// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfoDetails _$PersonalInfoDetailsFromJson(Map<String, dynamic> json) =>
    PersonalInfoDetails(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      role: json['role'] as String? ?? '',
      image: json['image'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      birthDate: json['birthDate'] as String? ?? '',
      deathDate: json['deathDate'] as String? ?? '',
      awards: json['awards'] as String? ?? '',
      height: json['height'] as String? ?? '',
      knownFor: (json['knownFor'] as List<dynamic>?)
              ?.map((e) => KnownFor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      castMovies: (json['castMovies'] as List<dynamic>?)
              ?.map((e) => CastMovies.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$PersonalInfoDetailsToJson(
        PersonalInfoDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'image': instance.image,
      'summary': instance.summary,
      'birthDate': instance.birthDate,
      'deathDate': instance.deathDate,
      'awards': instance.awards,
      'height': instance.height,
      'knownFor': instance.knownFor,
      'castMovies': instance.castMovies,
      'errorMessage': instance.errorMessage,
    };

KnownFor _$KnownForFromJson(Map<String, dynamic> json) => KnownFor(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      fullTitle: json['fullTitle'] as String? ?? '',
      year: json['year'] as String? ?? '',
      role: json['role'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$KnownForToJson(KnownFor instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'year': instance.year,
      'role': instance.role,
      'image': instance.image,
    };

CastMovies _$CastMoviesFromJson(Map<String, dynamic> json) => CastMovies(
      id: json['id'] as String? ?? '',
      role: json['role'] as String? ?? '',
      title: json['title'] as String? ?? '',
      year: json['year'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$CastMoviesToJson(CastMovies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'title': instance.title,
      'year': instance.year,
      'description': instance.description,
    };
