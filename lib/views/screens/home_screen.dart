import 'package:flutter/material.dart';
import 'package:toilettes/views/widgets/logo_widget.dart';
import 'package:toilettes/views/widgets/noise_icon_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LogoWidget(dimensions: 100, fontSize: 16),
            SizedBox(height: 40),
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
