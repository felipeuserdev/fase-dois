import 'package:flutter/material.dart';

import '../theme/variables.dart';

//ignore: must_be_immutable
class ButtonHome extends StatefulWidget {
  String title;
  ButtonHome({Key? key, this.title = ''}) : super(key: key);

  @override
  State<ButtonHome> createState() => _ButtonHomeState();
}

class _ButtonHomeState extends State<ButtonHome> {
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
            Navigator.pushNamed(context, '/PROG');
          });
        },
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 78,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: colorBlack),
            ),
          ),
          Positioned(
            top: isTap ? 0 : 10,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                  color: colorGreen, borderRadius: BorderRadius.circular(15)),
              height: 78,
              width: 300,
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
