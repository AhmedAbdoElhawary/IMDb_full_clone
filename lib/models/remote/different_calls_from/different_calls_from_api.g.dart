// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'different_calls_from_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DifferentCallsFromApi implements DifferentCallsFromApi {
  _DifferentCallsFromApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://imdb-api.com/en/API/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<YoutubeTrailerDetails> getYouTubeTrailer(
    id, {
    apiKey = apiKey,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<YoutubeTrailerDetails>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'YouTubeTrailer/${apiKey}/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = YoutubeTrailerDetails.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
