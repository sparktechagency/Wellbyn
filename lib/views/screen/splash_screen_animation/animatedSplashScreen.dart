import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../auth/create_acount_screen.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65.0),
          child: Lottie.asset(
              'assets/animations/data.json',
              onLoaded: (composition) {
                Future.delayed(composition.duration, () {
                  Get.offAll(() => CreateAccountPage(role: "doctor"));
                });
              },
            ),
        ),
        ),
    );
  }
}
