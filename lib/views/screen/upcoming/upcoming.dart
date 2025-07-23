import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/nab_ids.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/base/icon_text_button.dart';

import '../../../controllers/profile_setting_controller.dart';
import '../../../models/allergies.dart';
import '../../../utils/app_icons.dart';
import '../../base/LabelTextField/labelTextField.dart';
import '../profile_setting_start/setting_personal_info.dart';
class Upcoming extends StatelessWidget {
   Upcoming({super.key});

   TextEditingController controller = TextEditingController();
   ProfileSettingController _controller = Get.put(ProfileSettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Appcolors.page,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText("Booked appoinment card",fontSize: 20,color: TextColors.neutral900,),
            SizedBox(height: 16.h,),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Appcolors.primary,
                    boxShadow: [
                      BoxShadow(
                        color: ShadowColor.shadowColors1.withOpacity(0.10),
                        offset: const Offset(0,3),
                        blurRadius: 4,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                       Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/image/doctor_image.png'),
                            ),
                            SizedBox(width: 10.w),
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
                                      SizedBox(width: 5.w),
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

                            _iconButton(AppIcons.chatIcon, Appcolors.action),
                          ],
                        ),
                       SizedBox(height: 15.h),
                       Row(
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

                      SizedBox(height: 8.h,),
                      Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.calenderIcon,
                              color: TextColors.neutral900,
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(width: 5.w),
                            const Text("16 May 2025"),
                            Spacer(),
                            const Text("10:25pm"),
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
                        ), // This marks the end of a Row widget that displays appointment details like date, time, and status.


                      SizedBox(height: 15.h),
                      IconTextButton(
                          text: "Check-in",
                          height: 50,
                          bordercolor: BorderColors.warning700,
                          backgroundColor: Appcolors.warning,
                          textColor: BorderColors.warning700,
                          svgAsset: AppIcons.locationcheckIcon,
                          svgAssetcolor: BorderColors.warning700,
                          onTap: (){
                            Get.toNamed("/chekIn_appointment",id: NavIds.appointment);


                          },),
                      SizedBox(height: 12.h),
                      LabeledTextFielded(
                          maxline: 1,
                          borderColor: TextColors.neutral200,
                          label: "Visit Reason",
                          controller: controller,
                          // 👈 Use reactive value
                          readOnly: true,
                          onTap: () {
                           // _contrller.pickDate(context);
                          },
                          hintText: "I need a cleaning",
                        ),
                      SizedBox(height: 12.h),
                      LabeledTextFielded(
                        maxline: 1,
                        borderColor: TextColors.neutral200,
                        label: "Visit Type",
                        controller: controller,
                        // 👈 Use reactive value
                        readOnly: true,
                        onTap: () {
                          // _contrller.pickDate(context);
                        },
                        hintText: "New Patient Visit",
                      ),

                      SizedBox(height: 12.h),
                      LabeledTextFielded(
                        maxline: 1,
                        borderColor: TextColors.neutral200,
                        label: "Insurance",
                        controller: controller,
                        // 👈 Use reactive value
                        readOnly: true,
                        onTap: () {
                          // _contrller.pickDate(context);
                        },
                        hintText: "Blusky",
                      ),
                      SizedBox(height: 12.h),
                      LabeledTextFielded(
                          maxline: 2,
                          borderColor: TextColors.neutral200,
                          label: "Summary",
                          controller: controller,
                          // 👈 Use reactive value
                          readOnly: true,
                          onTap: () {
                            // _contrller.pickDate(context);
                          },
                          hintText: "Problem \n .head",
                        ),


                      SizedBox(height: 20.h,),
                      AppText("Current Medications",fontSize: 16,color: TextColors.neutral900,),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                        //  final doc = documents[index];
                          return documentSection('doc pdf', '12.20kb');
                        },
                      ),
                      SizedBox(height: 8,),
                      _currenMedicineSection(),

                      SizedBox(height: 8.h,),
                      PriorDiagoses(),

                      SizedBox(height: 20.h),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
    );
  }
   Widget documentSection(String name, String size) {
     return Container(
       margin: EdgeInsets.symmetric(vertical: 8.h), // spacing between tiles
       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
       alignment: Alignment.centerLeft,
       decoration: BoxDecoration(
         color: Appcolors.primary,
         borderRadius: BorderRadius.circular(8.r),
         boxShadow: [
           BoxShadow(
             color: ShadowColor.shadowColors1.withOpacity(0.10),
             blurRadius: 4,
             spreadRadius: 0,
             offset: Offset(0, 3),
             blurStyle: BlurStyle.normal,
           ),
         ],
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             name,
             style: TextStyle(
               fontSize: 14,
               color: TextColors.neutral900,
               fontWeight: FontWeight.w500,
             ),
           ),
           SizedBox(height: 4.h),
           Text(
             size,
             style: TextStyle(
               fontSize: 12.sp,
               color: TextColors.neutral500,
               fontWeight: FontWeight.w400,
             ),
           ),
         ],
       ),
     );
   }


   Widget _buildTableHeader(List<String> headers) {
     return Container(
       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
       decoration: BoxDecoration(
           borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
           color: HexColor("#EDF4FA")),
       child: Row(
         children: headers.map((header) {
           bool isAction = header == 'Action';
           return Expanded(
             flex: isAction ? 1 : 2,
             child: Text(
               header,
               style: TextStyle(
                 fontSize: 14,
                 fontWeight: FontWeight.w500,
                 color: TextColors.neutral500,
               ),
             ),
           );
         }).toList(),
       ),
     );
   }

   Widget _currenMedicineSection() {
     return Container(
       padding: EdgeInsets.only(left: 1, right: 1, top: 1, bottom: 0),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(8),
         boxShadow: [
           BoxShadow(
             color: ShadowColor.shadowColors1.withOpacity(0.10),
             offset: const Offset(0,3),
             blurRadius: 4,
           ),
         ],
       ),
       child: Column(
         children: [
           _buildTableHeader(['Name', 'Severity', 'Action']),
           ..._controller.allergies.asMap().entries.map((entry) {
             int index = entry.key;
             Allergy allergy = entry.value;

             // Set color based on even or odd index
             Color rowColor = index % 2 == 0
                 ? const Color(0xFFFFFFFF) // even
                 : const Color(0xFFF0F5FE); // odd

             return Container(
               color: rowColor,
               child: _buildTableRow([
                 allergy.name,
                 allergy.severity,
                 _buildDeleteButton(() => _controller.deleteAllergy(index)),
               ]),
             );
           }).toList(),
         ],
       ),
     );
   }

   Widget PriorDiagoses(){
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Prior Diagnoses",
              style: TextStyle(
                fontFamily: "Inter",
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
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h,),
        Container(
          padding: EdgeInsets.all(8),

          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: ShadowColor.shadowColors1.withOpacity(0.10),
                offset: const Offset(0,3),
                blurRadius: 4,
              ),
            ],
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Patient's medical history includes previous surgeries, allergies to penicillin, and a family history of diabetes. Current concerns involve persistent headaches and occasional dizziness",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  color: TextColors.neutral500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
   }


   Widget _buildDeleteButton(VoidCallback onPressed) {
     return GestureDetector(
       onTap: onPressed,
       child: SvgPicture.asset(AppIcons.delete02Icon),
     );
   }
   Widget _iconButton(
       String iconAsset,
       Color bgColor, {
         Color? borderColor,
         Color? iconColor,
       }) {
     return Container(
       height: 38,
       width: 38,
       decoration: BoxDecoration(
         color: bgColor,
         border: borderColor != null ? Border.all(color: borderColor) : null,
         borderRadius: BorderRadius.circular(8),
       ),
       child: Center(
         child: SvgPicture.asset(
           iconAsset,
           height: 22,
           width: 22,
           color: iconColor,
         ),
       ),
     );
   }

   Widget _buildTableRow(List<dynamic> cells) {
     return Container(
       padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
       decoration: BoxDecoration(
         border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1)),
       ),
       child: Row(
         children: cells.asMap().entries.map((entry) {
           int index = entry.key;
           dynamic cell = entry.value;
           bool isAction = index == cells.length - 1;
           return Expanded(
             flex: isAction ? 1 : 2,
             child: cell is Widget
                 ? cell
                 : Text(
               cell.toString(),
               style: const TextStyle(fontSize: 16, color: Colors.black87),
             ),
           );
         }).toList(),
       ),
     );
   }

}
