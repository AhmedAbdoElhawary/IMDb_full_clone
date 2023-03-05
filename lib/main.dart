import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imdb/helper/utility/injector.dart';
import 'package:imdb/helper/utility/private_key.dart';
import 'package:imdb/views/my_app.dart';

/// Note
/// **************************************************************************
/// Film: refer to movie and TV series together
/// When i want to specify, i will say movie or series
/// **************************************************************************

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  // final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  // final googleAuth = await googleUser?.authentication;
  // String? token = googleAuth?.accessToken ?? "";
  // accessToken = token;
  // print("================> $accessToken");
  runApp(const MyApp());
}
//
// final GoogleSignIn googleSignIn =
// GoogleSignIn(scopes: ['https://www.googleapis.com/auth/youtube.force-ssl']);
//
