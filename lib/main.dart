import 'package:flutter/material.dart';
import 'package:teenaii/core/util/theme.dart';
import 'package:teenaii/features/app.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teenaii',
        theme: CustomTheme.mainTheme,
        home: App());
  }
}
