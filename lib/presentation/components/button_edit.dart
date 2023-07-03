import 'package:flutter/material.dart';

import '../theme/variables.dart';

//ignore: must_be_immutable
class ButtonEdit extends StatefulWidget {
  double size;
  String title;
  bool check;
  ButtonEdit({Key? key, this.title = '', this.size = 32, this.check = false})
      : super(key: key);

  @override
  State<ButtonEdit> createState() => _ButtonEditState();
}

class _ButtonEditState extends State<ButtonEdit> {
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isTap ? 1 : 0.99,
      onEnd: () {
        setState(() {
          isTap = true;
        });
      },
      duration: const Duration(milliseconds: 100),
      child: InkWell(
        onTap: () {
          setState(() {
            isTap = !isTap;
          });
        },
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: widget.size,
              width: MediaQuery.of(context).size.width - 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: colorBlack),
            ),
          ),
          Positioned(
            top: isTap ? 0 : 10,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                  //cor do botão
                  color: widget.check ? colorGreen : colorLight,
                  borderRadius: BorderRadius.circular(15)),
              height: widget.size,
              width: MediaQuery.of(context).size.width - 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: colorBlack),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
