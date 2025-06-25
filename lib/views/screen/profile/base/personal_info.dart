import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/nab_ids.dart';
class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Patient Info",
          style: TextStyle(
            fontSize: 24,
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back(id: NavIds.profilenav);
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            width: 30.w,
            height: 30.h,
            color: TextColors.neutral900,
          ),
        ),
      ),
    );
  }
}
