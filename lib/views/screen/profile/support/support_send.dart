import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/utils/nab_ids.dart';

import '../../../../utils/app_colors.dart';
import '../../../base/comfirmscreen/confrim_screen.dart';
import '../../auth/Hipaa_Consent.dart';
class SupportSend extends StatelessWidget {
  const SupportSend({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmationScreen(
      buttonAsset: AppIcons.navigationIcon,
      svgAsset: 'assets/icons/check.svg',
      title: "Successfully send",
      message:
      "You will receive a confirmation at your email address: your@gmail.com",
      buttonText: 'Back to login',
      buttonColor: Appcolors.action,
      buttonTextColor: Colors.white,
      onButtonTap: () {
       Get.toNamed("",id: NavIds.profilenav);

      },
    );
  }
}
