import 'package:flutter/material.dart';
import 'package:wellbyn/views/screen/Home/home_screen.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../base/bottom_nav.dart';

class ConsentScreen extends StatelessWidget {
  const ConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'HIPAA Consent',
                style: TextStyle(fontSize: 22,  fontFamily: 'Satoshi', fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 32),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Hey 👋\n',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextSpan(
                   style: TextStyle(  fontFamily: 'Satoshi',fontSize: 15),
                    text:
                    'Before we continue, we just need your OK on how we handle your health information.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FD),
                borderRadius: BorderRadius.circular(16),
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    style: TextStyle(  fontFamily: 'Satoshi',fontSize: 15),
                    'We follow strict HIPAA guidelines to protect your privacy and keep your data secure.',
                  ),
                  SizedBox(height: 12),
                  Text(
                    style: TextStyle(  fontFamily: 'Satoshi',fontSize: 15),
                    '📊 To keep improving your experience and help our technology get smarter over time, we may use some of your information — always anonymized and never linked to your name or identity.',
                  ),
                  SizedBox(height: 12),
                  Text(
                    style: TextStyle(  fontFamily: 'Satoshi',fontSize: 15),
                    'Your privacy always comes first. You can choose how your data is used and change your preferences anytime.',
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Appcolors.page,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Tap “I Agree” to continue.',style:TextStyle(  fontFamily: 'Satoshi',fontSize: 15),),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Navigate or handle agreement
                              Get.to(BottomNavScreen());

                            },
                            icon: const Icon(Icons.check, color: Colors.white),
                            label: const Text('I Agree', style: TextStyle( fontFamily: 'Satoshi',fontSize: 16,color: Appcolors.secondary)),

                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2D8BC9),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              textStyle: const TextStyle(
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}