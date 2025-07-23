import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/nab_ids.dart';
import '../../base/AppButton/app_button.dart';

class Compeleted extends StatelessWidget {
  const Compeleted({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      // Remove container padding and add ListView padding instead
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 2),
      itemCount: 5, // Add itemCount for demo
      itemBuilder: (context, index) {
        return Container(
          // Adjust margin - remove top margin for first item, bottom margin for last item
          margin: EdgeInsets.only(
            top: index == 0 ? 0 : 8,
            bottom: 16,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Appcolors.primary,
            // boxShadow: [
            //   BoxShadow(
            //     color: ShadowColor.shadowColors1.withOpacity(0.10),
            //     offset: const Offset(0, 3),
            //     blurRadius: 4,
            //     spreadRadius: 0,
            //   ),
            // ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/image/doctor_image.png'),
                    ),
                    const SizedBox(width: 10),
                    Expanded( // Add Expanded to prevent overflow
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
                              const Expanded( // Add Expanded to prevent overflow
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
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      "Las appointment time",
                      style: TextStyle(
                        fontSize: 13,
                        color: TextColors.neutral500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                     Expanded(
                      child:Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: TextColors.neutral200,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.calenderIcon,
                      color: TextColors.neutral900,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 5),
                    const Text("16 May 2025"),
                    Spacer(),
                    const Text("10:25pm"),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.check,color: Colors.green,size: 14,),
                        AppText("Complete",color: Colors.green,fontSize: 14,),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      "Upcoming Follow-up",
                      style: TextStyle(
                        fontSize: 13,
                        color: TextColors.neutral500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "- In 7 days",
                      style: TextStyle(
                        fontSize: 13,
                        color: TextColors.action,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppButton(
                  text: "View details",
                  onPressed: () {
                   Get.toNamed('/appoinetment_details',id: NavIds.appointment);

                    print("clicl");

                  },
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }
}