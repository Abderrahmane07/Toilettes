import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';

class NoiseIconWidget extends ConsumerWidget {
  final int index;
  final double iconDimensions;
  final double dimensions;
  final String iconLink;
  final String soundLink;
  const NoiseIconWidget(
      {super.key,
      required this.index,
      required this.iconDimensions,
      required this.iconLink,
      required this.soundLink,
      required this.dimensions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        final oList = ref.read(statesBoolProvider);
        oList[index] = !oList[index];
        ref.read(statesBoolProvider.notifier).state = [...oList];
        final player = AudioPlayer();
        if (oList[index]) {
          await player.play(AssetSource(soundLink));
        } else {
          await player.pause();
        }
      },
      child: Container(
        height: dimensions,
        width: dimensions,
        decoration: BoxDecoration(
          color: ref.watch(statesBoolProvider)[index]
              ? Colors.pink[300]
              : Colors.pink[50],
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
