import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Future<void> _startCounting(
      SharedPreferences prefs,
      List<String> storedCounter,
      int index,
    ) async {
      // Increment the counter every 5 seconds while the widget is active
      while (ref.read(statesBoolProvider)[index]) {
        await Future.delayed(const Duration(seconds: 5));
        storedCounter[index] = (int.parse(storedCounter[index]) + 5).toString();
        print(storedCounter);
        prefs.setStringList('theList', storedCounter);
      }
    }

    return GestureDetector(
      onTap: () async {
        final prefs = await SharedPreferences.getInstance();
        final storedCounter = prefs.getStringList('theList') ?? ['0', '0', '0'];
        final oList = ref.read(statesBoolProvider);
        oList[index] = !oList[index];
        ref.read(statesBoolProvider.notifier).state = [...oList];
        if (oList[index]) {
          await ref
              .read(audioPlayerProvider)[index]
              .setReleaseMode(ReleaseMode.loop);

          await ref
              .read(audioPlayerProvider)[index]
              .play(AssetSource(soundLink));

          _startCounting(prefs, storedCounter, index);
        } else {
          print("pause");
          await ref.read(audioPlayerProvider)[index].pause();
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
