import 'dart:developer';

import 'package:fase_dois/models/api.dart';
import 'package:fase_dois/models/arguments.dart';
import 'package:flutter/material.dart';

import '../pages/quiz.dart';
import '../theme/variables.dart';
import 'button_nivel.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ButtonNivel widget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getInfo(),
      builder: (context, snapshot) {
        return Dialog(
            insetPadding: const EdgeInsets.all(60),
            backgroundColor: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  // padding: const EdgeInsets.all(16),
                  width: 200,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      border: Border.all(width: 5, color: colorBlack),
                      color: colorRed,
                      borderRadius: BorderRadius.circular(35)),
                  child: MediaQuery.of(context).size.height > 575
                      ? Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            'NIVEL\n${widget.title}',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: colorWhite,
                                fontSize:
                                    MediaQuery.of(context).size.height > 690
                                        ? 32
                                        : 26,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: 190,
                  child: Image.asset('lib/assets/images/glass.png',
                      fit: BoxFit.fill),
                ),
                Positioned(
                  bottom: 24,
                  child: InkWell(
                    onTap: () {
                      log(snapshot.data![widget.indexNivel]['nivel']
                              [widget.numeroQuiz]['quiz']
                          .toString());
                      //onde é feita a navegação sem emplilhar
                      Navigator.pushReplacementNamed(
                        context,
                        '/QUIZ',
                        result: () {
                          indexPergunta = 0;
                        },
                        arguments: Arguments(
                          listaQuiz: snapshot.data![widget.indexNivel]['nivel']
                              [widget.numeroQuiz]['quiz'],
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'COMEÇAR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: colorBlack,
                            overflow: TextOverflow.ellipsis,
                            fontSize: MediaQuery.of(context).size.height > 690
                                ? 24
                                : 18),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
