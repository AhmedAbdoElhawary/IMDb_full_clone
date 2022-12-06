import 'package:flutter/material.dart';
// import 'package:imdb/presentation/cubit/firebaseAuthCubit/firebase_auth_cubit.dart';
// import 'package:imdb/presentation/cubit/personal_info_cubit/personal_info_cubit_cubit.dart';

class MultiBlocs extends StatelessWidget {
  final Widget materialApp;

  const MultiBlocs(this.materialApp, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return materialApp;
    // return MultiBlocProvider(providers: [
    //   BlocProvider<FirebaseAuthCubit>(
    //     create: (context) => injector<FirebaseAuthCubit>(),
    //   ),
    //   BlocProvider<PersonalInfoCubitCubit>(
    //     create: (context) => injector<PersonalInfoCubitCubit>(),
    //   ),
    // ], child: materialApp);
  }
}
