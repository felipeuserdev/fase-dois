import 'dart:developer';
import 'package:fase_dois/variables/variables.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class ButtonCustom extends StatefulWidget {
  String title;
  Color? color;
  bool check = false;
  bool isPress;
  int indexButton;

  ButtonCustom({
    super.key,
    this.title = '',
    this.color,
    this.check = false,
    this.isPress = false,
    this.indexButton = 0,
  });

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

int height = 56;
double width = 200;
double fontSize = 20;

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 180),
        scale: widget.isPress ? 1 : 0.95,
        onEnd: () {
          setState(() {
            widget.isPress = true;

            log('o index do botão clicado é: ${widget.indexButton.toString()}');
          });
        },
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: 40,
            width: MediaQuery.of(context).size.width - 32,
          ),
          Positioned(
            top: 8,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: colorBlack),
              height: 32,
              width: MediaQuery.of(context).size.width - 32,
            ),
          ),
          Positioned(
            top: widget.isPress ? 0 : 8,
            child: InkWell(
              // //Caixa de dialógo
              // onTap: () {
              //   setState(() {
              //     isPress = !isPress;
              //     // widget.check = !widget.check;
              //     log('clicou');
              //     state = !state;
              //     log('o estado é ${state}');
              //     log('o index é : ${widget.indexButton}');
              //   });
              // },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //cor do card ser pasada como parametro?
                  color: widget.color == null
                      ? colorWhite
                      //mudança de cor
                      : widget.check == true
                          ? colorYellow
                          : widget.color,
                ),
                height: 32,
                width: MediaQuery.of(context).size.width - 32,
                child: widget.check
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.title.toUpperCase(),
                              style: TextStyle(
                                  color: colorBlack,
                                  fontSize: widget.title.length > 32
                                      ? 10
                                      : widget.title.length > 22
                                          ? 14
                                          : fontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.check_circle,
                              color: colorBlack,
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: Text(
                          widget.title.toUpperCase(),
                          style: TextStyle(
                              color: colorBlack,
                              fontSize: widget.title.length > 32
                                  ? 10
                                  : widget.title.length > 22
                                      ? 14
                                      : fontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
