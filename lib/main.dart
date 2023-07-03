import 'package:fase_dois/presentation/pages/home_page.dart';
import 'package:fase_dois/presentation/pages/progressing_page.dart';
import 'package:fase_dois/presentation/pages/quiz.dart';
import 'package:fase_dois/presentation/theme/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Routes());
}

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeCuston,
      debugShowCheckedModeBanner: false,
      routes: {
        '/HOME': (context) => const HomePage(),
        '/PROG': (context) => const ProgreesingPage(),
        '/QUIZ': (context) => const Quiz()
      },
      home: const HomePage(),
    );
  }
}
