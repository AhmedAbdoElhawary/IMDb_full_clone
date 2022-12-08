import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb/helper/functions/network_exceptions.dart';

part 'cubit_result_state.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.initial() = initial<T>;

  const factory ResultState.loading() = Loading<T>;

  const factory ResultState.success(T data) = Success<T>;

  const factory ResultState.error(NetworkExceptions networkExceptions) =Error<T>;
}
