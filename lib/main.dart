import 'package:flutter/material.dart';
import 'package:imdb/helper/utility/injector.dart';
import 'package:imdb/views/my_app.dart';

/// Note
/// **************************************************************************
/// Film: refer to movie and TV series together
/// When i want to specify, i will say movie or series
/// **************************************************************************

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}
