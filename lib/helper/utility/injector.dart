import 'package:get_it/get_it.dart';
import 'package:imdb/helper/utility/app_prefs.dart';
// import 'package:imdb/data/repositories_impl/firebase_auth_repo_impl.dart';
// import 'package:imdb/data/repositories_impl/personal_info_repo_impl.dart';
// import 'package:imdb/domain/repositories/auth_repository.dart';
// import 'package:imdb/domain/repositories/personal_info_repository.dart';
// import 'package:imdb/domain/use_cases/auth/log_out.dart';
// import 'package:imdb/domain/use_cases/auth/submit_otp.dart';
// import 'package:imdb/domain/use_cases/auth/submit_phone_umber.dart';
// import 'package:imdb/domain/use_cases/personal_info/create_new_user.dart';
// import 'package:imdb/domain/use_cases/personal_info/get_user_info.dart';
// import 'package:imdb/presentation/cubit/firebaseAuthCubit/firebase_auth_cubit.dart';
// import 'package:imdb/presentation/cubit/personal_info_cubit/personal_info_cubit_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.I;

Future<void> initializeDependencies() async {
  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  injector.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  injector
      .registerLazySingleton<AppPreferences>(() => AppPreferences(injector()));
}
