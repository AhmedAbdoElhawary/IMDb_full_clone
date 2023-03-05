
part of 'personal_info_cubit.dart';


abstract class PersonalInfoState {}

class Initial extends PersonalInfoState {}

class Loading extends PersonalInfoState {}

class Success<T> extends PersonalInfoState {
    final T details;
  Success(this.details);
}

class PersonalFailed extends PersonalInfoState {
  NetworkExceptions error;
  PersonalFailed(this.error);
}
