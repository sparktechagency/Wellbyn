import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/app_icons.dart';

import '../../../utils/app_colors.dart';
import '../../base/comfirmscreen/confrim_screen.dart';
import 'Hipaa_Consent.dart';
class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmationScreen(
      svgAsset: 'assets/icons/check.svg',
      buttonAsset: AppIcons.backIcon,
      title: 'Password Changed!',
      message:
      'Return to the login page to enter your account with your new password.',
      buttonText: 'Back to Sign In',
      buttonColor: Appcolors.action,
      buttonTextColor: Colors.white,
      onButtonTap: () {
        Get.to(ConsentScreen());
      },
    );

  }
}
