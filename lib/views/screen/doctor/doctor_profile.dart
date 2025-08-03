import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../base/Apptext/app_text.dart';
import '../../base/SectionContanter/sectionContainer.dart';

class DoctorProfile extends StatelessWidget {
  DoctorProfile({super.key});

  List<String> item = ["Allergy Consultation","Annual Physical","Back Pain","Cold"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12,),
                SectionContainer(
                  borderRadius: BorderRadius.circular(8),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'assets/image/doctor_image.png',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                "Dr. Moule Marrk",
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                              AppText(
                                "Cardiology",
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: TextColors.neutral500,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppIcons.hospitallocationIcon),
                                  SizedBox(width: 5),
                                  Expanded( // also wrap this Text to allow long names
                                    child: Text(
                                      "Sylhet Health Center",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: TextColors.neutral900,
                                        fontFamily: "Inter",
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text(
                                  "Calle Ceiba #142, Urb. Alturas de Monte Verde, Trujillo Alto, PR 00976",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: TextColors.neutral500,
                                    fontFamily: "Inter",
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                SizedBox(height: 28.h,),
                AppText(
                  "Overview",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,),
                SizedBox(height: 8,),
                SectionContainer(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    children: [
                       Row(
                children: [
                SvgPicture.asset(
                  AppIcons.shieduserIcon,
                  height: 20.h,
                  width: 20.w,
                  color: TextColors.neutral500, // optional, based on your design
                ),
                  SizedBox(width: 12,),
                  AppText(
                    "Accepts 3 insurances",
                    fontSize: 16,)
              ],
            ),
                       SizedBox(height: 12,),
                       ListTile(
                           "BlueCross BlueShield",
                           "assets/image/blue.png"),
                       SizedBox(height: 12,),
                       ListTile(
                          "Cigna",
                          "assets/image/ciga.png"),
                       SizedBox(height: 12,),
                       ListTile(
                          "UnitedHealth",
                          "assets/image/unitedhealth.png"),
                      
                      
                ]),
                SizedBox(height: 28.h,),
                AppText(
                  "Office Location",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,),
                SizedBox(height: 8,),

                SectionContainer(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    children: [

                      AppText(
                        "Ramon Mendez-Sexto, MD",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,),
                      AppText(
                        "1.5 mi • 12 Calle D, Guaynabo, PR, 00965",
                        color: TextColors.neutral500,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
                        child: Image.asset(
                          AppIcons.mapImage,
                          height: 76.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      //============> divided the two user <=================//
                      SizedBox(height: 16,),
                      AppText(
                        "Ramon Mendez-Sexto, MD",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,),
                      AppText(
                        "1.5 mi • 12 Calle D, Guaynabo, PR, 00965",
                        color: TextColors.neutral500,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          AppIcons.mapImage,
                          height: 76.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 16,),
                      //==============> view more <===============//
                      IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "View more",
                              color: TextColors.neutral900,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                            Container(
                              height: 1.1,
                              color: TextColors.neutral900,
                            ),
                          ],
                        ),
                      ),


                    ]),
                SizedBox(height: 28,),
                AppText(
                  "Popular Visit Reasons",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,),
                SizedBox(height: 8,),
                SectionContainer(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(), // prevents conflict with SingleChildScrollView
                        itemCount: item.length, // replace with actual count
                        itemBuilder: (context, index) {
                          final items = item[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: TextColors.neutral500,
                                  size: 16,),

                                SizedBox(width: 6),
                                AppText("${items}", fontSize: 14), // replace with actual data
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10,),
                      IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "see more",
                              color: TextColors.neutral900,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            Container(
                              height: 1.5,
                              color: TextColors.neutral900,
                            ),
                          ],
                        ),
                      ),

                    ]),
                SizedBox(height: 28,),
                SectionContainer(
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                    children: [
                      AppText(
                        "Doctor of Medicine (M.D.)",
                        color: TextColors.neutral900,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      AppText(
                        "University of California, San Francisco",
                        color: TextColors.neutral500,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      AppText(
                        "2008",
                        color: TextColors.neutral500,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      SizedBox(height: 16,),
                      AppText(
                        "Doctor of Medicine (M.D.)",
                        color: TextColors.neutral900,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      AppText(
                        "University of California, San Francisco",
                        color: TextColors.neutral500,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      AppText(
                        "2008",
                        color: TextColors.neutral500,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                ]),
                SizedBox(height: 28,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget ListTile(String title,String svgimage){
    return Row(
      children: [
        Image.asset(
          svgimage,
          height: 35,
          width: 35, // optional, based on your design
        ),
        SizedBox(width: 12,),
        AppText(
          title,
          fontWeight: FontWeight.w500,
          fontSize: 16,)
      ],
    );
  }
}
