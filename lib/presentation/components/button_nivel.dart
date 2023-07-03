import 'dart:developer';
import 'package:flutter/material.dart';

import '../theme/variables.dart';
import 'dialogbox.dart';

//Botão de Niveis

//ignore: must_be_immutable
class ButtonNivel extends StatefulWidget {
  MainAxisAlignment leftorRight;
  String title;
  bool selected = false;
  int numeroQuiz;
  int indexNivel;
  ButtonNivel(
      {super.key,
      this.leftorRight = MainAxisAlignment.end,
      this.title = '',
      this.numeroQuiz = 0,
      this.indexNivel = 0});

  @override
  State<ButtonNivel> createState() => _ButtonNivelState();
}

const double width = 110;
double height = 55;

class _ButtonNivelState extends State<ButtonNivel> {
  //Dialog box
  dialogBox() {
    setState(() {
      widget.selected = !widget.selected;
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            widget: widget,
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.leftorRight,
      children: [
        AnimatedScale(
          duration: const Duration(milliseconds: 100),
          onEnd: () {
            setState(() {
              widget.selected = false;
              log('Fez o loop');
            });
          },
          scale: widget.selected ? 0.95 : 1,
          child: Stack(children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              height: 65,
              width: width,
            ),
            Positioned(
              top: 10,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: colorBlack),
                height: height,
                width: width,
              ),
            ),
            Positioned(
              top: widget.selected ? 10 : 0,
              child: InkWell(
                //Caixa de dialógo
                onTap: () {
                  dialogBox();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    //cor do card ser pasada como parametro?
                    color: colorRed,
                  ),
                  height: height,
                  width: width,
                  child: Center(
                      child: Text(
                    widget.title,
                    style: TextStyle(
                        color: colorBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
