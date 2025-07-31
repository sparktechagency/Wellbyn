import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/utils/nab_ids.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import '../../../../controllers/caregiver_controller.dart';
import '../base/logout.dart';



class CaregiverScreen extends StatelessWidget {
  final CaregiverController controller = Get.put(CaregiverController());

  CaregiverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Caregiver Mode",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Inter",
            letterSpacing: 0.2,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(height: 24.h,),
                AppText("Your caregiver",),

                SizedBox(height: 16.h,),
                Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolors.primary,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: ShadowColor.shadowColors1.withOpacity(0.10),
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // <-- Important
                  children: [
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDF4FA),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 12,right: 12,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Name",style: TextStyle(fontFamily: "Inter",fontSize: 12,color: TextColors.neutral500,fontWeight: FontWeight.w400)),
                          Text("Action",style: TextStyle(fontFamily: "Inter",fontSize: 12,color: TextColors.neutral500,fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true, // <-- Important
                      physics: const NeverScrollableScrollPhysics(), // Prevent internal scrolling
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 40.h,
                          color: index.isEven ? Appcolors.primary: Color(0xFFEDF4FA),
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Row(
                            children: [
                              const Text(
                                "Rosdeb Koch",
                                style: TextStyle(fontFamily: "Inter",fontSize: 14,fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  onTap: () {
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SvgPicture.asset(AppIcons.viewIcon),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
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


                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
                SizedBox(height: 32,),
                AppText("As a caregiver",),
                SizedBox(height: 16,),
                Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ShadowColor.shadowColors1.withOpacity(0.10),
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                    color: Appcolors.primary,
                    borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // <-- Important
                  children: [
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDF4FA),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Name",style: TextStyle(fontFamily: "Inter",fontSize: 12,color: TextColors.neutral500,fontWeight: FontWeight.w400),),
                          Text("Relation",style: TextStyle(fontFamily: "Inter",fontSize: 12,color: TextColors.neutral500,fontWeight: FontWeight.w400),),
                          Text("Action",style: TextStyle(fontFamily: "Inter",fontSize: 12,color: TextColors.neutral500,fontWeight: FontWeight.w400),),
                          SizedBox(width: 8,),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true, // <-- Important
                      physics: const NeverScrollableScrollPhysics(), // Prevent internal scrolling
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 40.h,
                          color: index.isEven ? Colors.white : Color(0xFFEDF4FA),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              const Text(
                                "Jamal",
                                style: TextStyle(fontFamily: "Inter",fontSize: 14,fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              const Text(
                             "Brother",
                             style: TextStyle(fontFamily: "Inter",fontSize: 14,fontWeight: FontWeight.w500),
                              ),
                              Spacer(),

                              GestureDetector(
                                onTap: (){
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
                                      title: 'Remove as a caregiver',
                                      description: 'Are you sure you want to remove your caregiver?',
                                    ),
                                  );
                                },
                                child: IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Leave as caregiver",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Appcolors.action,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Container(
                                        height: 1,
                                        color: Appcolors.action,
                                      ),
                                    ],
                                  ),
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
                SizedBox(height: 16,),
                GestureDetector(
                onTap: (){
                  print("Click and add the caregiver");
                  Get.toNamed("/start_caregiver",id: NavIds.profilenav);

                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Appcolors.primary,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: ShadowColor.shadowColors1.withOpacity(0.10),
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Appcolors.action,),
                        SizedBox(width: 8),
                        Text(
                          "Add Caregiver",
                          style: TextStyle(color: Appcolors.action,fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

               ],
             ),
         ),
     );
  }
}
