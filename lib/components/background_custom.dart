import 'package:flutter/material.dart';

// Background customizado
class BackgroundCustom extends StatelessWidget {
  const BackgroundCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage('lib/assets/images/background_fase_dois.png'),
      ),
    );
  }
}
