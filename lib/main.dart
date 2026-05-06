import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:atheer/app.dart';
import 'package:atheer/injection.dart';
import 'package:atheer/core/services/quran_data_loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize dependencies 
  await initDependencies();

  // Load Quran data from assets into database
  final dataLoader = sl<QuranDataLoader>();
  await dataLoader.loadFromAssets();

  runApp(const AtheerApp());
}
