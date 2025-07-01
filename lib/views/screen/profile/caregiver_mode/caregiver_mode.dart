import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/utils/nab_ids.dart';
import 'package:wellbyn/views/base/app_text.dart';
import '../../../../controllers/caregiver_controller.dart';
import '../base/logout.dart';



class CaregiverScreen extends StatelessWidget {
  final CaregiverController controller = Get.put(CaregiverController());

  CaregiverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Caregivers')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


                AppText("Your Caregiver"),
                SizedBox(height: 10,),
                Container(
                padding: const EdgeInsets.only(bottom: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolors.secondary,
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
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Appcolors.secondary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Name",style: TextStyle(fontFamily: "Satoshi",fontSize: 12,fontWeight: FontWeight.w400)),
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
                          color: index.isEven ? Colors.white : Appcolors.secondary,
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              const Text(
                                "Rosdeb Koch",
                                style: TextStyle(fontFamily: "Satoshi",fontSize: 14,fontWeight: FontWeight.w500),
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
                SizedBox(height: 30,),
                AppText("As a caregiver",),
                SizedBox(height: 10,),
                Container(
                padding: const EdgeInsets.only(bottom: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Appcolors.secondary,
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
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Appcolors.secondary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Name",style: TextStyle(fontFamily: "Satoshi",fontSize: 12,fontWeight: FontWeight.w400),),
                          Text("Relation",style: TextStyle(fontFamily: "Satoshi",fontSize: 12,fontWeight: FontWeight.w400),),
                          Text("Action",style: TextStyle(fontFamily: "Satoshi",fontSize: 12,fontWeight: FontWeight.w400),),
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
                          color: index.isEven ? Colors.white : Appcolors.secondary,
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              const Text(
                                "Jamal",
                                style: TextStyle(fontFamily: "Satoshi",fontSize: 14,fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              const Text(
                             "Brother",
                             style: TextStyle(fontFamily: "Satoshi",fontSize: 14,fontWeight: FontWeight.w500),
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
                SizedBox(height: 20,),
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
                    border: Border.all(color: Appcolors.action, width: 1),
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
