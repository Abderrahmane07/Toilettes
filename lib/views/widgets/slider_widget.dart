import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilettes/providers.dart';

class SliderWidget extends ConsumerStatefulWidget {
  final int index;
  final double iconDimensions;
  final String iconLink;
  const SliderWidget({
    super.key,
    required this.index,
    required this.iconDimensions,
    required this.iconLink,
  });

  @override
  ConsumerState<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends ConsumerState<SliderWidget> {
  double _sliderValue = 0.2; // Initial value

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
                min: 0.0,
                max: 1.0,
                label: _sliderValue.toStringAsFixed(1),
                onChanged: (double value) async {
                  await ref
                      .read(audioPlayerProvider)[widget.index]
                      .setVolume(value);
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
