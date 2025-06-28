import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class LottieExample extends StatelessWidget {
  const LottieExample({Key? key}) : super(key: key);

  Future<bool> _checkAssetExists() async {
    try {
      await rootBundle.load('assets/animations/loading.json');
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<bool>(
          future: _checkAssetExists(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasData && snapshot.data == true) {
              return Lottie.asset(
                'assets/animations/loading.json',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
                repeat: true,
                errorBuilder: (context, error, stackTrace) {
                  return const SimpleLoadingWidget(
                    width: 200,
                    height: 200,
                    loadingText: "Lottie failed to load",
                  );
                },
              );
            } else {
              return const SimpleLoadingWidget(
                width: 200,
                height: 200,
                loadingText: "Animation not found",
              );
            }
          },
        ),
      ),
    );
  }
}

class SimpleLoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  final String loadingText;

  const SimpleLoadingWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.loadingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: const CircularProgressIndicator(),
        ),
        const SizedBox(height: 12),
        Text(
          loadingText,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
