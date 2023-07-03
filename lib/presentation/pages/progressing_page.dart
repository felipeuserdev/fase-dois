import 'package:flutter/material.dart';

import '../components/background_custom.dart';
import '../components/card_custom.dart';
import '../theme/variables.dart';

class ProgreesingPage extends StatefulWidget {
  const ProgreesingPage({super.key});

  @override
  State<ProgreesingPage> createState() => _ProgreesingPageState();
}

class _ProgreesingPageState extends State<ProgreesingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorBlack,
          iconTheme: IconThemeData(color: colorWhite),
          title: Text('PROGRESSO',
              style: TextStyle(fontSize: 28, color: colorWhite)),
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            const BackgroundCustom(),
            CardCustom(),
          ],
        ));
  }
}
