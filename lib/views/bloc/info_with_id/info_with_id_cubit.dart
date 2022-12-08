import 'package:bloc/bloc.dart';
import 'package:imdb/view_models/box_office/box_office_details.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';

class InfoWithIdCubit extends Cubit<ResultState<BoxOfficeDetails>> {
  InfoWithIdCubit() : super(const initial());
}
