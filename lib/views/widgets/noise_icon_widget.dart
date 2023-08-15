import 'package:flutter/material.dart';

class NoiseIconWidget extends StatelessWidget {
  final double iconDimensions;
  final double dimensions;
  final String iconLink;
  const NoiseIconWidget(
      {super.key,
      required this.iconDimensions,
      required this.iconLink,
      required this.dimensions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimensions,
      width: dimensions,
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        iconLink,
        width: iconDimensions,
        height: iconDimensions,
      ),
    );
  }
}
