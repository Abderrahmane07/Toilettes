import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image here
            Image.asset(
              'assets/images/poop.png',
              width: 200,
              height: 200,
            ),
            const Text(
              'Noise to cover your poop',
            ),

            const Text(
              'Cover up the sound of your poop!',
            ),
          ],
        ),
      ),
    );
  }
}
