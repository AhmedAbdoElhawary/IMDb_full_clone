import 'package:bloc/bloc.dart';
import 'package:imdb/views/bloc/cubit_result_state.dart';


class NewFilmsCubit extends Cubit<ResultState<dynamic>> {
  NewFilmsCubit() : super(const initial());


}
