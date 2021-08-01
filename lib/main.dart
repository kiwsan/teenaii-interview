import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:teenaii/features/app.dart';
import 'injection_container.dart' as di;
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDir.path);
  //Hive.registerAdapter(MovieTableAdapter());

  runApp(App());
}
