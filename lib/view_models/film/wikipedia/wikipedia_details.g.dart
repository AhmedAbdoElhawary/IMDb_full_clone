// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wikipedia_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wikipedia _$WikipediaFromJson(Map<String, dynamic> json) => Wikipedia(
      imDbId: json['imDbId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      fullTitle: json['fullTitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      year: json['year'] as String? ?? '',
      language: json['language'] as String? ?? '',
      titleInLanguage: json['titleInLanguage'] as String? ?? '',
      url: json['url'] as String? ?? '',
      plotShort: json['plotShort'] == null
          ? null
          : PlotShort.fromJson(json['plotShort'] as Map<String, dynamic>),
      plotFull: json['plotFull'] == null
          ? null
          : PlotShort.fromJson(json['plotFull'] as Map<String, dynamic>),
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$WikipediaToJson(Wikipedia instance) => <String, dynamic>{
      'imDbId': instance.imDbId,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'language': instance.language,
      'titleInLanguage': instance.titleInLanguage,
      'url': instance.url,
      'plotShort': instance.plotShort,
      'plotFull': instance.plotFull,
      'errorMessage': instance.errorMessage,
    };

PlotShort _$PlotShortFromJson(Map<String, dynamic> json) => PlotShort(
      plainText: json['plainText'] as String? ?? '',
      html: json['html'] as String? ?? '',
    );

Map<String, dynamic> _$PlotShortToJson(PlotShort instance) => <String, dynamic>{
      'plainText': instance.plainText,
      'html': instance.html,
    };
