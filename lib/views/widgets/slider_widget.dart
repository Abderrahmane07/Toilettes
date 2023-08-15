import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final double iconDimensions;
  final String iconLink;
  const SliderWidget({
    super.key,
    required this.iconDimensions,
    required this.iconLink,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          iconLink,
          width: iconDimensions,
          height: iconDimensions,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.yellow[200], size: 15),
            // Add a slider widget here
            SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              child: Slider(
                value: 3,
                min: 0,
                max: 5,
                divisions: 5,
                label: '3',
                onChanged: (double value) {},
              ),
            ),
            Icon(Icons.star, color: Colors.yellow[700], size: 15),
          ],
        )
      ],
    );
  }
}
