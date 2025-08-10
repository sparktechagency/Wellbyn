import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_plus/share_plus.dart';
import 'package:signature/signature.dart';
import 'package:wellbyn/utils/app_colors.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/base/custombutton/custom_button.dart';
import 'package:wellbyn/views/base/iconsTextbutton/icon_text_button.dart';
import 'package:wellbyn/views/screen/doctor/doctor_details.dart';

import '../../../controllers/datePicker/date_picker_controller.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/nab_ids.dart';
import '../../../utils/row_with_tittle.dart';
import '../doctro_message/doctor_message.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: TextColors.neutral900,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: TextColors.neutral100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.Notification02,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
          backgroundColor: Appcolors.page,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 16, left: 20.w, right: 16.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/image/doctor_image.png"),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hi, Mahmud",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.2,
                        color: TextColors.neutral900,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                      ),
                    ),
                    Text(
                      "Personal account",
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.2,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                        color: TextColors.neutral500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              HeyText(),
              SizedBox(height: 20,),

              RowWithTitleAndAction(
                title: "Next Appointment",
                actionText: "View all",
                onTap: () {
                  print("View all tapped");
                },
                titleColor: TextColors.neutral900,
                actionColor: TextColors.action,
                titleFontSize: 20,
                actionFontSize: 16,
              ),

              SizedBox(height: 15,),
              Nextappointmentdoctor(),
              SizedBox(height: 15,),

               SizedBox(height: 16,),

              //================> available doctor list <=====================//

              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio:  0.48,
                  ),
                  itemCount: 20,
                  itemBuilder: (context,index){
                    return  GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/doctor_details',
                          id: NavIds.profile, // this matches nested key
                          arguments: {
                            'doctorId': 'a1da1dad136adf4566adf1a',
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: ShadowColor.shadowColors1.withOpacity(0.10),
                              blurRadius: 4,
                              // reasonable softness
                              spreadRadius: 0,
                              offset: Offset(0, 3), // downward shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/image/doctor_image.png",
                                    height: 140.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: SvgPicture.asset(
                                      "assets/icons/Heart.svg",
                                      width: 20,
                                      height: 20,
                                      colorFilter: ColorFilter.mode(
                                        TextColors.neutral900,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "Dr. Leo Marwick",
                                style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 0.2,
                                  color: TextColors.neutral900,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Text(
                              "Heart Health Expert",
                              style: TextStyle(
                                color: TextColors.neutral500,
                                fontFamily: 'Inter',
                                fontSize: 14,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(height: 8),
                            CustomButton(
                              onTap: () {
                                //showDoctorBookingSheet(context);
                              },
                              text: 'Book Now',
                              height: 46,
                              fontSize: 16,
                              textColor: Appcolors.primary,
                              broderColor: Colors.transparent,
                              color: Appcolors.action,
                            ),
                            SizedBox(height: 8,),
                            CustomButton(
                              onTap: () {
                               // Get.toNamed("/doctor_profile",id: NavIds.profile);
                              },
                              text: 'Details',
                              fontSize: 16,
                              broderColor: Colors.transparent,
                              textColor: TextColors.primary2,
                              color: Appcolors.primary,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Container HeyText() {
    return Container(
              height: 116,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: HexColor("#FBF7EB"),
                boxShadow:[
                  BoxShadow(
                    color: ShadowColor.shadowColors1.withOpacity(0.10),
                    offset: Offset(0, 3),
                    blurRadius: 4,
                    spreadRadius: 0
                  )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText("Hey!", fontSize: 16, color: TextColors.neutral900,fontWeight: FontWeight.w600,),
                    SizedBox(height: 4,),

                    Text(
                      "Make sure your profile is at least 70% complete before you can book an appointment.",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 13,
                        color: TextColors.primary2,
                        letterSpacing: 0.2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        AppText(
                          "Start",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: TextColors.action,
                        ),
                        SizedBox(width: 4),
                        // optional spacing between text and icon
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: TextColors.action,
                          size: 16, // this replaces your invalid `weight` property
                        ),
                      ],
                    )

                  ],
                ),
              ),
            );
  }

  Container Nextappointmentdoctor() {
    return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Appcolors.primary,
                boxShadow: [
                  BoxShadow(
                    color: ShadowColor.shadowColors1.withOpacity(0.10),
                    offset: const Offset(0, 3),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                              'assets/image/doctor_image.png'),
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
                                  SvgPicture.asset(
                                      AppIcons.hospitallocationIcon),
                                  const SizedBox(width: 5),
                                  const Expanded( // Add Expanded to prevent overflow
                                    child: Text(
                                      "Sylhet Health Center",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: TextColors.primary2,
                                        fontFamily: "Inter",
                                        fontStyle: FontStyle.italic,
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
                          "Date & time",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.2,
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
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.calenderIcon,
                          color: TextColors.primary2,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 5),
                        Text("May 16 2025",style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w500,

                        ),),
                        Spacer(),
                        SvgPicture.asset(AppIcons.clockIcon,color: TextColors.primary2,),
                        const Text("10:25pm",style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w500,

                        ),),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.check, color: TextColors.success , size: 14,),
                            SizedBox(width: 3,),
                            AppText("Confirmed", color: TextColors.success,
                              fontSize: 13,),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child:AppText(
                      "Can't make it on this date?",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: TextColors.neutral500,),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child:Row(
                      children: [
                        IconTextButton(
                            width: 160.w,
                            text: "Reschedule",
                            fontsize: 16,
                            textColor: Appcolors.action,
                            backgroundColor: Appcolors.success50,
                              svgAsset: AppIcons.exchange01Icon,
                              svgAssetcolor: Appcolors.action,
                              onTap: (){}),
                        SizedBox(width: 16.w,),
                        AppText("OR",color: TextColors.neutral500, fontWeight: FontWeight.w500,fontSize: 16,),
                        SizedBox(width: 16.w,),
                        CustomButton(
                            width: 80.w,
                              height: 40,
                              text: "Cancel",
                              textColor: Appcolors.error700,
                              broderColor: Colors.transparent,
                              color: Appcolors.primary,
                              onTap: (){}),
                      ],
                    )
                  ),
                  const SizedBox(height: 10),

                ],
              ),
            );
  }

  void showDoctorBookingSheet(BuildContext context) {
    final DateTimePickerController dateTimeController = Get.find<DateTimePickerController>();

    final List<String> timeSlots = [
      "9:00 AM", "10:00 AM", "11:00 AM",
      "2:00 PM", "3:00 PM", "4:00 PM"
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.5),
      enableDrag: true,
      isDismissible: true,
      builder: (_) {
        return buildDoctorBookingSheet(
          context,
          doctorName: "Dr. Moule Marrk",
          department: "Cardiology",
          location: "Sylhet Health Center",
          timeSlots: timeSlots,
          selectedTime: dateTimeController.selectedTime,
          onSelectTime: dateTimeController.selectTime,
          onWaitlist: () => Get.back(),
        );
      },
    );
  }

  Widget buildDoctorBookingSheet(
      BuildContext context, {
        required String doctorName,
        required String department,
        required String location,
        required List<String> timeSlots,
        required RxString selectedTime,
        required Function(String) onSelectTime,
        required VoidCallback onWaitlist,
      }) {
    final DateTimePickerController controller = Get.put(DateTimePickerController());

    void shareText() {
      SharePlus.instance.share(
        ShareParams(text: 'Check out my website https://example.com'),
      );
    }

    Widget iconButton(String iconAsset, Color bgColor, {Color? iconColor}) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: ShadowColor.shadowColors1.withOpacity(0.10),
                blurRadius: 4,
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ]),
        child: Center(
          child: SvgPicture.asset(
            iconAsset,
            height: 24,
            width: 24,
            color: iconColor,
          ),
        ),
      );
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, scrollController) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.95,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Appcolors.page,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            boxShadow: [
              BoxShadow(
                color: Appcolors.disabled.withOpacity(0.15),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0.3, 0.2),
              ),
            ],
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                Center(
                  child: Container(
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Appcolors.background,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Doctor name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            letterSpacing: 0.2,
                            color: TextColors.neutral900,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),
                        Text(
                          department,
                          style: const TextStyle(
                            color: TextColors.neutral500,
                            fontSize: 16,
                            letterSpacing: 0.2,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppConstants.FONT_FAMILY,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(DoctorMessage());
                            },
                            child: iconButton(AppIcons.chatIcon, Appcolors.action)),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: shareText,
                          child: iconButton(
                            AppIcons.shearIcon,
                            Appcolors.secondary,
                            iconColor: Appcolors.action,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Location
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.hospitallocationIcon,
                      color: Colors.blue,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(
                        color: TextColors.neutral500,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: 0.2,
                        fontFamily: AppConstants.FONT_FAMILY,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Date Picker
                DateTimePickerSection(),

                // Time Slots using Column
                Obx(() => Column(
                  children: [
                    for (int i = 0; i < timeSlots.length; i += 3)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(3, (index) {
                          if (i + index >= timeSlots.length) {
                            return const SizedBox(width: 90);
                          }
                          final time = timeSlots[i + index];
                          final isSelected = controller.selectedTime.value == time;

                          return GestureDetector(
                            onTap: () => controller.selectTime(time),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              width: 98,
                              height: 40,
                              decoration: BoxDecoration(
                                color: isSelected ? TextColors.action : Appcolors.natral25,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF0000001A).withOpacity(0.10),
                                    blurRadius: 4,
                                    offset: const Offset(0, 3),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (isSelected)
                                      const Icon(
                                        Icons.check,
                                        color: Appcolors.primary,
                                        size: 16,
                                      ),
                                    if (isSelected) const SizedBox(width: 4),
                                    Text(
                                      time,
                                      style: TextStyle(
                                        fontFamily: AppConstants.FONT_FAMILY,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: isSelected ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                  ],
                )),

                const SizedBox(height: 12),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: onWaitlist,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Appcolors.primary,
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
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.alamclock1Icon,
                                color: Appcolors.action,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Waitlist",
                                style: TextStyle(
                                  fontFamily: AppConstants.FONT_FAMILY,
                                  fontSize: 16,
                                  color: TextColors.action,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Store the current context
                          // final currentContext = context;
                          //
                          // // Close the bottom sheet first
                          // Navigator.of(context).pop();
                          //
                          // // Navigate to book_report and handle return
                          // Get.toNamed('/book_report', id: NavIds.profile)?.whenComplete(() {
                          //   // Use a post-frame callback to ensure the navigation is complete
                          //   WidgetsBinding.instance.addPostFrameCallback((_) {
                          //     if (currentContext.mounted) {
                          //       showDoctorBookingSheet(currentContext);  // This was re-showing the bottom sheet
                          //     }
                          //   });
                          // });
                          final currentContext = context;

                          // Close the bottom sheet
                          Navigator.of(context).pop();

                          // Navigate to caregiver mode without showing the bottom sheet again
                          Get.toNamed('/book_report', id: NavIds.profile)?.whenComplete(() {
                            // Use a post-frame callback to ensure the navigation is complete
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (currentContext.mounted) {
                                //showDoctorBookingSheet(currentContext);  // This was re-showing the bottom sheet
                              }
                            });
                          });

                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Appcolors.action,
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
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                  fontFamily: AppConstants.FONT_FAMILY,
                                  fontSize: 14,
                                  color: TextColors.neutral200,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget _iconButton(String iconAsset, Color bgColor,
      {Color? borderColor, Color? iconColor}) {
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

}
