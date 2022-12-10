part of 'box_office_cubit.dart';

abstract class BoxOfficeState {}

class CubitInitial extends BoxOfficeState {}

class CubitLoading extends BoxOfficeState {}

class CubitBoxOfficeLoaded extends BoxOfficeState {
    final BoxOfficeDetails details;
  CubitBoxOfficeLoaded(this.details);
}

class CubitBoxOfficeAllTimeLoaded extends BoxOfficeState {
    final BoxOfficeOfAllTimeDetails details;
  CubitBoxOfficeAllTimeLoaded(this.details);
}

class CubitFailed extends BoxOfficeState {
  NetworkExceptions error;
  CubitFailed(this.error);
}
