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
                    iconDimensions: 70,
                    iconLink: "assets/images/tassa_black.png",
                    dimensions: 120),
                NoiseIconWidget(
                    iconDimensions: 70,
                    iconLink: "assets/images/shower_black.png",
                    dimensions: 120),
                NoiseIconWidget(
                    iconDimensions: 70,
                    iconLink: "assets/images/tap_black.png",
                    dimensions: 120),
              ],
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                isTassaActive
                    ? const SliderWidget(
                        iconDimensions: 36,
                        iconLink: "assets/images/tassa_black.png",
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 36,
                ),
                isShowerActive
                    ? const SliderWidget(
                        iconDimensions: 36,
                        iconLink: "assets/images/shower_black.png",
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 36,
                ),
                isTapActive
                    ? const SliderWidget(
                        iconDimensions: 36,
                        iconLink: "assets/images/tap_black.png",
                      )
                    : const SizedBox(),
              ],
            ),
            const Spacer(),
            const Text(
              'With using this app you saved a total of 555 litres of water!',
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
