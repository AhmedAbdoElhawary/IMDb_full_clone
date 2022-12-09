// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_in_all_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchInAllDetails _$SearchInAllDetailsFromJson(Map<String, dynamic> json) =>
    SearchInAllDetails(
      searchType: json['searchType'] as String? ?? '',
      expression: json['expression'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => SearchAllResults.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$SearchInAllDetailsToJson(SearchInAllDetails instance) =>
    <String, dynamic>{
      'searchType': instance.searchType,
      'expression': instance.expression,
      'results': instance.results,
      'errorMessage': instance.errorMessage,
    };

SearchAllResults _$SearchAllResultsFromJson(Map<String, dynamic> json) =>
    SearchAllResults(
      id: json['id'] as String? ?? '',
      resultType: json['resultType'] as String? ?? '',
      image: json['image'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$SearchAllResultsToJson(SearchAllResults instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resultType': instance.resultType,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
    };
