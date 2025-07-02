import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/views/base/app_text.dart';

import '../../../../controllers/dotor_details.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/nab_ids.dart';
import '../../../base/icon_text_button.dart';
import 'infoitem.dart';
import 'madicalinfoheader.dart';

class InsuranceInfo extends StatelessWidget {
   InsuranceInfo({super.key});
  final DoctorDetailsController controller = Get.put(DoctorDetailsController());
 TextEditingController name = TextEditingController();

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
              SizedBox(height: 30,),
              IconTextButton(
                text: "Add new Card",
                backgroundColor: Appcolors.action,
                svgAsset: AppIcons.addIcon,
                onTap: () {
                },),
              SizedBox(height: 10,),

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
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(
                      top: index == 0 ? 0 : 8,
                      bottom: 16,
                    ),
                    width: double.infinity,
                    height: 520,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 20,),
                        Row(
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
                        SizedBox(height: 24,),
                        InfoItem(
                          titleFontSize: 14,
                          valueFontSize: 16,
                          title: "Insurance Provider",
                          value: "ABC Health Insurance",
                          titleColor: TextColors.neutral500,
                          valueColor: TextColors.neutral900,
                        ),
                        SizedBox(height: 20,),

                        InfoItem(
                  titleFontSize: 14,
                  valueFontSize: 16,
                  title: "Policy Number ",
                  value: "H123456789",
                  titleColor: TextColors.neutral500,
                  valueColor: TextColors.neutral900,
                  ),
                        SizedBox(height: 20,),
                        InfoItem(
                          titleFontSize: 14,
                          valueFontSize: 16,
                          title: "Grope Number ",
                          value: "G987654321",
                          titleColor: TextColors.neutral500,
                          valueColor: TextColors.neutral900,
                        ),
                        SizedBox(height: 20,),
                        InfoItem(
                          titleFontSize: 14,
                          valueFontSize: 16,
                          title: "Phone  ",
                          value: "+011414412",
                          titleColor: TextColors.neutral500,
                          valueColor: TextColors.neutral900,
                        ),

                        SizedBox(height: 15,),
                        Text(
                            "Insurance Card ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                        SizedBox(height: 4,),

                       Obx((){
                        return IconTextButton(
                        isLoading: controller.isloading.value,
                   //lottieAsset: "assets/animations/loading.json",
                   text: "Edit details ",
                  width: 150,
                  height: 40,
                  textColor: Appcolors.action,
                  bordercolor: Appcolors.action,
                  backgroundColor: Appcolors.primary,
                  svgAsset: AppIcons.viewIcon,
                  onTap: () {
                 // controller.loadDoctordetailesData();

                  },);
                        }) ,
                        SizedBox(height: 15,),

                        Obx((){
                        return IconTextButton(
                          isLoading: controller.isloading.value,
                          text: "Edit details ",
                          //lottieAsset: "assets/animations/loading.json",
                          textColor: Appcolors.action,
                          bordercolor: Appcolors.action,
                          backgroundColor: Appcolors.primary,
                          svgAsset: AppIcons.editIcon,
                          onTap: () {
                            controller.loadDoctordetailesData();
                            Get.toNamed("/add_insurance",id: NavIds.profilenav);

                          },);
                        })

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

