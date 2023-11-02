import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilettes/providers.dart';
import 'package:toilettes/views/widgets/logo_widget.dart';
import 'package:toilettes/views/widgets/noise_icon_widget.dart';
import 'package:toilettes/views/widgets/slider_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final statesBool = ref.watch(statesBoolProvider);
    bool isTassaActive = statesBool[0];
    bool isShowerActive = statesBool[1];
    bool isTapActive = statesBool[2];

    final prefs = ref.watch(prefsProvider);
    List<String> secondsList =
        prefs.value?.getStringList('theList') ?? ['0', '0', '0'];
    int litres = (int.parse(secondsList[0]) * 0.15 +
            int.parse(secondsList[1]) * 0.25 +
            int.parse(secondsList[2]) * 0.2)
        .round();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const LogoWidget(dimensions: 100, fontSize: 16),
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NoiseIconWidget(
                  index: 0,
                  iconDimensions: 70,
                  iconLink: "assets/images/tassa_black.png",
                  soundLink: "sounds/toilet1.mp3",
                  dimensions: 120,
                ),
                NoiseIconWidget(
                  index: 1,
                  iconDimensions: 70,
                  iconLink: "assets/images/shower_black.png",
                  soundLink: "sounds/shower1.mp3",
                  dimensions: 120,
                ),
                NoiseIconWidget(
                  index: 2,
                  iconDimensions: 70,
                  iconLink: "assets/images/tap_black.png",
                  soundLink: "sounds/tap1.mp3",
                  dimensions: 120,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                isTassaActive
                    ? const SliderWidget(
                        index: 0,
                        iconDimensions: 36,
                        iconLink: "assets/images/tassa_black.png",
                      )
                    : const SizedBox(),
                Visibility(
                  visible: isShowerActive,
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 36,
                      ),
                      SliderWidget(
                        index: 1,
                        iconDimensions: 36,
                        iconLink: "assets/images/shower_black.png",
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isTapActive,
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 36,
                      ),
                      SliderWidget(
                        index: 2,
                        iconDimensions: 36,
                        iconLink: "assets/images/tap_black.png",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              'With using this app you saved a total of $litres liters of water!',
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: const Center(child: Text('ad zone')),
            ),
          ],
        ),
      ),
    );
  }
}
