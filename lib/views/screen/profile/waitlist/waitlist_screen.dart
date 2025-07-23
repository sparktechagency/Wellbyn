import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:wellbyn/views/base/custom_button.dart';

import '../../../../controllers/dotted_boder.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/nab_ids.dart';
import '../../../base/Apptext/app_text.dart';

class WaitlistScreen extends StatelessWidget {
  const WaitlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();
    String formattedDate = DateFormat('dd MMMM yyyy').format(datetime);
    print(formattedDate);

    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Your Waitlist",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Inter",
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
      body: ListView.builder(
        cacheExtent: 500,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Appcolors.primary,
              // boxShadow: [
              //   BoxShadow(
              //     color: TextColors.neutral500.withOpacity(0.25),
              //     offset: const Offset(0, 0.3),
              //     blurRadius: 5,
              //   ),
              // ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          'assets/image/doctor_image.png',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dr. Moule Marrk",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              "Cardiology",
                              style: TextStyle(
                                fontSize: 14,
                                color: TextColors.neutral500,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(AppIcons.hospitallocationIcon),
                                const SizedBox(width: 5),
                                const Expanded(
                                  child: Text(
                                    "Sylhet Health Center",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: TextColors.neutral900,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _iconButton(AppIcons.chatIcon, Appcolors.action),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Text(
                        "Current appointment Date & time",
                        style: TextStyle(
                          fontSize: 13,
                          color: TextColors.neutral500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            color: TextColors.neutral200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.calenderIcon,
                        color: TextColors.neutral900,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          color: TextColors.neutral900,
                        ),
                      ),
                      Spacer(),
                      SvgPicture.asset(AppIcons.clockIcon),
                      const Text("10:25pm", style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        color: TextColors.neutral900,
                      ),),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color(0xff38c976),
                            size: 13,
                          ),
                          SizedBox(width: 3),
                          AppText(
                            "Confirmed",
                            color: TextColors.neutral900,
                            fontSize: 13,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomButton(
                    fontSize: 16,
                    height: 45,
                    color: Appcolors.primary,
                    broderColor: Appcolors.primary,
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.of(context).pop(); // Close dialog after delay

                            // Optional: Show success message
                            Get.snackbar(
                              "Success",
                              "Request removed successfully.",
                              backgroundColor: Colors.green.shade50,
                              colorText: Colors.green.shade900,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 2),
                            );
                          });

                          return Dialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            insetPadding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Lottie.asset(
                                    'assets/animations/loading.json',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    "Removing request...",
                                    style: TextStyle(
                                      color: TextColors.neutral900,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Inter",
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    text: "Remove request",
                    textColor: Appcolors.error700,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _iconButton(
      String iconAsset,
      Color bgColor, {
        Color? borderColor,
        Color? iconColor,
      }) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: bgColor,
        border: borderColor != null ? Border.all(color: borderColor) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: SvgPicture.asset(
          iconAsset,
          height: 20,
          width: 20,
          color: iconColor,
        ),
      ),
    );
  }


  Widget _buildSectionContainer({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Appcolors.primary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Appcolors.secondary,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0.2, 0.2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            AppText(title, color: TextColors.neutral500),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }
}