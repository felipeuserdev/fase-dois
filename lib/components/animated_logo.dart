import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

bool isSelected = true;

// Lembrar de faser a logo ficar se movendo, talvez fazer uma animação msm
class _AnimatedLogoState extends State<AnimatedLogo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: AnimatedContainer(
        width: isSelected == true ? 250 : 260,
        height: isSelected == true ? 125 : 130,
        duration: const Duration(milliseconds: 700),
        onEnd: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Image.asset(
          'lib/assets/images/fase_dois.png',
        ),
      ),
    );
  }
}
