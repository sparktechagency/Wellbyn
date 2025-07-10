import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/nab_ids.dart';
import 'package:wellbyn/views/base/app_text.dart';
import 'package:wellbyn/views/base/icon_text_button.dart';

import '../../../controllers/profile_setting_controller.dart';
import '../../../models/allergies.dart';
import '../../../utils/app_icons.dart';
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
            SizedBox(height: 16,),

            Expanded(
              child: ListView.builder(
                itemCount: 2,
                  itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                                      fontFamily: "Satoshi",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Text(
                                    "Cardiology",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: TextColors.neutral500,
                                      fontFamily: "Satoshi",
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
                                            fontFamily: "Satoshi",
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
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                        padding: const EdgeInsets.symmetric(horizontal: 12),
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
                      ),

                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: IconTextButton(
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
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: LabeledTextFields(
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
                      ),

                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: LabeledTextFields(
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
                      ),

                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: AppText("Current Medications",fontSize: 16,color: TextColors.neutral900,),
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: _buildAllergiesSection(),
                      ),

                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
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
                      ),
                      SizedBox(height: 8),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
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
                    ],
                  ),
                );
              }),
            )
          ],
        ),
    );
  }

   Widget _buildSection({
     required String title,
     required VoidCallback onAdd,
     required Widget child,
   }) {
     return Container(
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(8),
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.1),
             spreadRadius: 1,
             blurRadius: 8,
             offset: const Offset(0, 2),
           ),
         ],
       ),
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   title,
                   style: TextStyle(
                     fontSize: 18,
                     fontFamily: "Satoshi",
                     fontWeight: FontWeight.w500,
                     color: TextColors.neutral900,
                   ),
                 ),
                 GestureDetector(
                   onTap: onAdd,
                   child: const Row(
                     children: [
                       Icon(Icons.add, color: Appcolors.action, size: 20),
                       SizedBox(width: 4),
                       Text(
                         'Add',
                         style: TextStyle(
                           color: Appcolors.action,
                           fontSize: 16,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
             const SizedBox(height: 16),
             child,
           ],
         ),
       ),
     );
   }

   Widget _buildTableHeader(List<String> headers) {
     return Container(
       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
       decoration: BoxDecoration(color: HexColor("#F0F5FE")),
       child: Row(
         children: headers.map((header) {
           bool isAction = header == 'Action';
           return Expanded(
             flex: isAction ? 1 : 2,
             child: Text(
               header,
               style: TextStyle(
                 fontSize: 14,
                 fontWeight: FontWeight.w400,
                 color: TextColors.neutral900,
               ),
             ),
           );
         }).toList(),
       ),
     );
   }

   Widget _buildAllergiesSection() {
     return Container(
       padding: EdgeInsets.only(left: 1, right: 1, top: 1, bottom: 0),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(5),
         border: Border.all(width: 1, color: TextColors.neutral200),
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
