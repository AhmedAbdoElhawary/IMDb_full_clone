import 'package:flutter/material.dart';
import 'package:imdb/helper/utility/injector.dart';
import 'package:imdb/views/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(const MyApp());
}
