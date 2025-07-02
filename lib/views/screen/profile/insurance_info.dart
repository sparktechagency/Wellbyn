import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/nab_ids.dart';
import 'madicalinfoheader.dart';

class InsuranceInfo extends StatelessWidget {
  const InsuranceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Insurance Info",
          style: TextStyle(
            fontSize: 20,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MedicalInfoHeader(
                title: "Medical Information",
                description:
                    'Hi! Please share your personal info to verify your identity and stay connected with your healthcare providers.',
                iconPath: AppIcons.shieduserIcon,
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 2,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      top: index == 0 ? 0 : 8,
                      bottom: 16,
                    ),
                    width: double.infinity,
                    height: 450,
                    decoration: BoxDecoration(
                      color: Appcolors.primary,
                      boxShadow: [
                        BoxShadow(
                          color: TextColors.neutral500.withOpacity(0.25),
                          offset: const Offset(0, 0.3),
                          blurRadius: 5,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Card-1",
                                style: TextStyle(
                                  color: TextColors.neutral500,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: HexColor("#FEF2F2"),
                                  boxShadow: [
                                    BoxShadow(
                                      color: TextColors.neutral500.withOpacity(
                                        0.25,
                                      ),
                                      offset: const Offset(0, 0.3),
                                      blurRadius: 5,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: SvgPicture.asset(
                                  AppIcons.delete02Icon,
                                  height: 15,
                                  width: 15,
                                  color: Appcolors.error,
                                ),
                              ),
                              SizedBox(width: 3),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
