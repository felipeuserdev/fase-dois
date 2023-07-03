import 'package:flutter/material.dart';

import '../components/animated_logo.dart';
import '../components/background_custom.dart';
import '../components/button_custom.dart';
import '../components/button_home.dart';
import '../theme/variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundCustom(),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.all(80)),
                const AnimatedLogo(),
                const Padding(padding: EdgeInsets.only(top: 56)),
                ButtonHome(title: 'QUAL É A PEÇA ?'),
                const Padding(padding: EdgeInsets.only(top: 60)),
                ButtonCustom(
                  color: colorGreen,
                  title: 'TESTE',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
