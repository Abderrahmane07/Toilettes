import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double dimensions;
  final double fontSize;
  const LogoWidget(
      {super.key, required this.dimensions, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
        'assets/images/poop.png',
        width: dimensions,
        height: dimensions,
      ),
      Text(
        'Noise to Cover Your Poop',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}
