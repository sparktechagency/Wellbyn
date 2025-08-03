import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/custom_button.dart';
import 'package:wellbyn/views/base/icon_text_button.dart';

import '../../../../controllers/TextField/textfield_Controller.dart';
import '../../../../controllers/profile_setting/personal_info.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/nab_ids.dart';
import '../../../base/LabelTextField/labelTextField.dart';
import '../../../base/LableDropDownFielded/lableDropDownFielded.dart';
class EditUploadDocumention extends StatelessWidget {
   EditUploadDocumention({super.key});

   final TextEditingController docname= TextEditingController();
   final TextEditingController date= TextEditingController();
   final DropdownController  dropdownController = Get.put(DropdownController());
   final OnboardingProfileInfo _controller = Get.put(OnboardingProfileInfo(),);

   @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Upload Document",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(id: NavIds.profilenav),
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
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
            Container(
              height: 390,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Appcolors.primary,
                boxShadow: [
                  BoxShadow(
                    color: ShadowColor.shadowColors1.withOpacity(0.10),
                    offset: Offset(0, 3),
                    blurRadius: 4,
                  )
                ]
              ),
              child: ClipRRect(
                borderRadius:BorderRadius.circular(12),
                child: CachedNetworkImage(
                imageUrl: "https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg",
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 300),
                          ),
              ),
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconTextButton(
                  onTap: (){},
                  svgAsset: AppIcons.downloadIcon,
                  svgAssetcolor: Appcolors.action,
                  textColor: Appcolors.action,
                  text: "Download",
                  backgroundColor: Colors.white,
                  width: 121.w,
                  fontsize: 14,
                  height: 42.h,
                ),
                CustomButton(
                  broderColor: Colors.transparent,
                  width:147.w,
                    height: 37.h,
                    onTap: (){},
                    textColor: Appcolors.error700,
                    text: "Delete Document")
              ],
            ),
            SizedBox(height: 29,),
            LabeledTextFielded(
                next: true,
                borderColor: TextColors.neutral900,
                label: "Document Name",
                controller: docname,
                maxline: 1,
                hintText: "",
              ),
              SizedBox(height: 29,),
              LabeledDropdownFielded(
                label: "Category",
                titile: "Category Select",
                items: [
                  "Single",
                  "Married",
                  "Divorced",
                  "Widowed",
                  "Separated",
                  "Unknown",
                ],
                selectedValue: dropdownController.categoySelected,
                onChanged: (value) {
                  // Optional additional logic
                  print("Selected: $value");
                },
              ),
              SizedBox(height: 29,),
              Obx(() => LabeledTextFielded(
                maxline: 1,
                borderColor: Colors.transparent,
                label: "Date of Document ",
                controller: TextEditingController(
                  text: _controller.formattedDate.value,
                ),
                readOnly: true,
                onTap: () => _controller.pickDate(Get.context!),
                suffixSvgAsset: AppIcons.calenderIcon01,
                suffixSvgColor: Appcolors.action,
                hintText: "mm/dd/yyyy",
              ),),
              SizedBox(height: 29,),
              CustomButton(
                color: Appcolors.action,
                  textColor: Appcolors.primary,
                  fontSize: 16,
                  onTap: (){},
                  text: "Save Change"),
              SizedBox(height: 16,),
            ],
          ),
        ),

      ),
    );
  }
}
