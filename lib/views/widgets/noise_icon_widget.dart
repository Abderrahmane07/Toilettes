import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';

class NoiseIconWidget extends ConsumerWidget {
  final int index;
  final double iconDimensions;
  final double dimensions;
  final String iconLink;
  const NoiseIconWidget(
      {super.key,
      required this.index,
      required this.iconDimensions,
      required this.iconLink,
      required this.dimensions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        final oList = ref.read(statesBoolProvider);
        oList[index] = !oList[index];
        ref.read(statesBoolProvider.notifier).state = [...oList];
      },
      child: Container(
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
      ),
    );
  }
}
