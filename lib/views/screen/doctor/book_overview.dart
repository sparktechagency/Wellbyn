import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:wellbyn/views/base/custom_button.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';

import '../../../utils/nab_ids.dart';
import '../../base/app_button.dart';
import '../../base/app_text.dart';
import '../../base/custom_field.dart';
import '../profile/base/logout.dart';
import 'book_report.dart';

class BookOverview extends StatelessWidget {
  BookOverview({super.key});

  TextEditingController controller = TextEditingController();
  TextEditingController optional = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();

    // ✅ Correct format: minutes:seconds AM/PM
    String formattedTime = DateFormat('mm:ss a').format(dateTime);

    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Appointment overview",
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
            Get.back(id: NavIds.profile);
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            width: 30.w,
            height: 30.h,
            color: TextColors.neutral900,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'assets/image/doctor_image.png',
                          ), // your local image path
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr. Moule Marrk",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Satoshi",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Cardiology ",
                              style: TextStyle(
                                fontSize: 14,
                                color: TextColors.neutral900,
                                fontFamily: "Satoshi",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(AppIcons.hospitallocationIcon),
                                SizedBox(width: 5),
                                Text(
                                  "Sylhet Health Center",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: TextColors.neutral900,
                                    fontFamily: "Satoshi",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      children: [
                        Text(
                          "Appointment Date & time",
                          style: TextStyle(
                            fontSize: 14,
                            color: TextColors.neutral500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        // optional space between text and line
                        Expanded(
                          child: DottedLine(
                            dashLength: 2,
                            dashGapLength: 2,
                            lineThickness: 1,
                            dashColor: TextColors.neutral200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          height: 18,
                          width: 18,
                          color: Colors.black,
                          AppIcons.appointmentIcon,
                        ),
                        SizedBox(width: 5),
                        Text("16 May 2025"),
                        Spacer(),
                        Text("$formattedTime"),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(height: 1, color: TextColors.neutral200),
                ],
              ),

              SizedBox(height: 18),
              AppText("Visit Reason", fontSize: 16),
              SizedBox(height: 8),
              _titleContainer('User Name'),
              SizedBox(height: 20),
              AppText("Documentation", fontSize: 16),
              SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    height: 53,
                    margin: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: TextColors.neutral200,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            "doc 1.pdf",
                            fontSize: 14,
                            color: TextColors.neutral900,
                          ),
                          AppText(
                            "20.45kb",
                            fontSize: 12,
                            color: TextColors.neutral900,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 20),
              AppText("Summary", fontSize: 16),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1.w, color: TextColors.neutral200),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Problem\n .head",
                        style: TextStyle(
                          fontSize: 14,
                          color: TextColors.neutral500,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
  margin: EdgeInsets.all(2),
  padding: const EdgeInsets.only(top:8,left: 3,right: 3),
  width: double.infinity,
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: TextColors.neutral500.withOpacity(0.20),
          offset: Offset(0.3, 0.3),
          blurRadius: 2,
        ),
      ]
  ),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        AppText("Current Medications",fontSize: 16,color: TextColors.neutral900,),
        SizedBox(height: 8,),
        Container(
          padding: const EdgeInsets.only(bottom: 3),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Appcolors.disabled,
                width: 1,
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // <-- Important
            children: [
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: Appcolors.normalLight,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Name",style: TextStyle(fontFamily: "Satoshi",fontSize: 12,fontWeight: FontWeight.w400)),
                    Text("Frequency",style: TextStyle(fontFamily: "Satoshi",fontSize: 12,fontWeight: FontWeight.w400)),
                    Text("Action",style: TextStyle(fontFamily: "Satoshi",fontSize: 12,fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true, // <-- Important
                physics: const NeverScrollableScrollPhysics(), // Prevent internal scrolling
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    color:  Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Rosdeb Koch",
                              style: TextStyle(fontFamily: "Satoshi",fontSize: 14,fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Text("Once daily",style: TextStyle(fontFamily: "Satoshi",fontSize: 14,fontWeight: FontWeight.w500)),
                            Spacer(),
                            Spacer(),
                            SizedBox(width: 12,),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => CustomConfirmationDialog(
                                      onConfirm: () {
                                        // Handle confirm logic
                                        Navigator.of(context).pop(); // Close dialog
                                      },
                                      onCancel: () {
                                        Navigator.of(context).pop(); // Just close
                                      },
                                      iconAsset: AppIcons.alertIcon,
                                      title: 'Remove caregiver',
                                      description: 'Are you sure you want to remove your caregiver?',
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SvgPicture.asset(AppIcons.delete02Icon),
                                ),
                              ),
                            ),
                            SizedBox(width: 12,),
                            Divider(height: 10,thickness: 1,color:Colors.black,)


                          ],
                        ),

                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Prior Diagnoses",
                    style: TextStyle(
                      fontFamily: "Satoshi",
                      fontSize: 16,
                      color: TextColors.neutral900,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "(Optional)",
                    style: TextStyle(
                      fontSize: 14,
                      color: TextColors.neutral500,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Container(
                height: 160.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: TextColors.neutral200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello dost how are you Hello dost how are you Hello dost how are you Hello dost how are you Hello dost how are you ",
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 14,
                          color: TextColors.neutral500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              CustomButton(
                onTap: () {},
                fontSize: 16,

                text: "Confirm",
                color: Appcolors.action,
                textColor: Appcolors.primary,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  _titleContainer(String title) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1.w, color: TextColors.neutral200),
      ),
      child: Padding(
        padding: EdgeInsets.all(13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 12, color: TextColors.neutral500),
            ),
          ],
        ),
      ),
    );
  }
}
