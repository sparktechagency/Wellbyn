import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/controllers/insurance_controller.dart';
import 'package:wellbyn/views/base/app_text.dart';
import 'package:wellbyn/views/base/icon_text_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/nab_ids.dart';

import 'base/infoitem.dart';
import 'base/madicalinfoheader.dart';

class InsuranceInfo extends StatelessWidget {
   InsuranceInfo({super.key});

   final InsuranceController controller = Get.put(InsuranceController());


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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MedicalInfoHeader(
                title: "Medical Information",
                description:
                    'Hi! Please share your personal info to verify your identity and stay connected with your healthcare providers.',
                iconPath: AppIcons.shieduserIcon,
              ),
              SizedBox(height: 20,),

              Obx((){
              return IconTextButton(
                isLoading: controller.isLoading.value,
                text: "Add new card",
                svgAsset: AppIcons.addIcon,
                backgroundColor:Appcolors.action,
                textColor: Appcolors.primary,
                bordercolor: Colors.transparent,
                height: 50,
                onTap: () {
                  // Your logic
                  print("Button tapped");
                  controller.startLoading();
                },
              );

              }),

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
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0), // ➤ Right/left padding added here
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Card-${index + 1}", // ➤ Makes the card label dynamic
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
                                  color: Appcolors.error50,
                                  boxShadow: [
                                    BoxShadow(
                                      color: TextColors.neutral500.withOpacity(0.25),
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
                            ],
                          ),
                          SizedBox(height: 32),
                          InfoItem(
                            title: "Insurance Provider",
                            value: "ABC Health Insurance",
                            titleColor: TextColors.neutral500,
                            valueColor: TextColors.neutral900,
                          ),
                          SizedBox(height: 18),
                          InfoItem(
                            title: "Policy Number",
                            value: "H123456789",
                            titleColor: TextColors.neutral500,
                            valueColor: TextColors.neutral900,
                          ),
                          SizedBox(height: 18),
                          InfoItem(
                            title: "Group Number",
                            value: "G987654321",
                            titleColor: TextColors.neutral500,
                            valueColor: TextColors.neutral900,
                          ),
                          SizedBox(height: 18),
                          InfoItem(
                            title: "Phone",
                            value: "+1 9999999999",
                            titleColor: TextColors.neutral500,
                            valueColor: TextColors.neutral900,
                          ),

                          SizedBox(height: 18),
                          AppText("Insurance card",fontSize: 16,color: TextColors.neutral500,),
                          SizedBox(height: 6),
                          IconTextButton(
                            width: 150,
                            height: 40,
                            svgAsset: AppIcons.viewIcon,
                            textColor: Appcolors.action,

                            onTap: () {},
                            bordercolor: Appcolors.action,
                            backgroundColor: Colors.transparent,
                            text: "View card",
                          ),
                          SizedBox(height: 15),
                          Obx((){
                            return IconTextButton(
                              height: 50,
                              isLoading: controller.isLoading.value,
                              svgAsset: AppIcons.editIcon,
                              textColor: Appcolors.action,
                              onTap: () {
                                controller.startLoading();
                                Get.toNamed("/add_insurance",id: NavIds.profilenav);

                              },
                              bordercolor: Appcolors.action,
                              backgroundColor: Colors.transparent,
                              text: "Edit details ",
                            );
                          }),

                          SizedBox(height: 18),


                        ],
                      ),
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




