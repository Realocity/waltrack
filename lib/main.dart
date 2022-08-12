import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:waltrack/pages/splash.dart';
import 'package:waltrack/theme.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox('money');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Expenses',
  theme: myTheme,
  home: const Splash(),
  );
  }
  }
