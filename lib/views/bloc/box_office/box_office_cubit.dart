import 'package:bloc/bloc.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';

class BoxOfficeCubit extends Cubit<ResultState<dynamic>> {
  BoxOfficeCubit() : super(const initial());
}
