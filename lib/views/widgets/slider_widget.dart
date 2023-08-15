import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final double iconDimensions;
  final String iconLink;
  const SliderWidget({
    super.key,
    required this.iconDimensions,
    required this.iconLink,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _sliderValue = 20; // Initial value

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          widget.iconLink,
          width: widget.iconDimensions,
          height: widget.iconDimensions,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.volume_down_rounded,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              child: Slider(
                activeColor: Colors.redAccent[700],
                value: _sliderValue,
                min: 0,
                max: 100,
                label: _sliderValue.toStringAsFixed(1),
                onChanged: (double value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
            ),
            const Icon(
              Icons.volume_up_rounded,
            ),
          ],
        )
      ],
    );
  }
}
