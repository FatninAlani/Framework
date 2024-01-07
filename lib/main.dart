import 'package:flutter/material.dart';
import 'package:mert_app/mainPage.dart';
import 'package:mert_app/merit.dart';
import 'package:mert_app/program.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/first': (context) => ProgramScreen(),
        '/second': (context) => MeritScreen(
              programName: '',
              selectedLevel: '',
              meritMark: 0,
            ),
      },
    );
  }
}
