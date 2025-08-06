// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:lottie/lottie.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:wellbyn/utils/app_constants.dart';
// import 'package:wellbyn/utils/app_constants.dart';
// import 'package:wellbyn/utils/app_constants.dart';
// import 'package:wellbyn/utils/app_constants.dart';
// import 'package:wellbyn/utils/app_constants.dart';
// import 'package:wellbyn/utils/app_constants.dart';
// import 'package:wellbyn/utils/app_icons.dart';
// import 'package:wellbyn/views/screen/doctor/doctor_details.dart';
//
// import '../../../controllers/date_picker_controller.dart';
// import '../../../controllers/doctor.dart';
// import '../../../controllers/tabcontroller.dart';
// import '../../../utils/app_colors.dart';
// import '../../../utils/nab_ids.dart';
// import '../../base/custom_field.dart';
// import '../../base/doctor_bottom_sheet/dotor_details_bottom_sheet.dart';
// import '../doctro_message/doctor_message.dart';
//
// class Doctor extends StatelessWidget {
//   final void Function(String doctorId)? onDetailsTap;
//
//   Doctor({super.key, this.onDetailsTap});
//
//   final TabControllerX _controller = Get.put(TabControllerX());
//   final TextEditingController searchcontroller = TextEditingController();
//   final DoctorController doctorController = Get.put(DoctorController());
//   final DateTimePickerController controller = Get.put(DateTimePickerController(),);
//   final DateTimePickerController dateTimeController = Get.put(DateTimePickerController());
//
//   final List<String> tabs = ["All", "Favorite (4)"];
//
//   final List<String> timeSlots = [
//     "11:45 am", "2:15 pm", "4:30 am",
//     "6:20 pm", "10:05 pm", "7:00 pm",
//     "1:55 am"
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolors.page,
//       appBar: AppBar(
//         backgroundColor: Appcolors.page,
//         title: Text(
//           "Doctor",
//           style: TextStyle(
//             fontSize: 20,
//             fontFamily: AppConstants.FONT_FAMILY,
//             fontWeight: FontWeight.w500,
//             color: HexColor("#3D3D3D"),
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Get.back(id: NavIds.profile);
//           },
//           icon: SvgPicture.asset(
//             'assets/icons/arrow-left.svg',
//             width: 30.w,
//             height: 30.h,
//             color: TextColors.neutral900,
//           ),
//         ),
//       ),
//       body: Obx(() {
//         if (doctorController.isLoading.value) {
//           return Center(
//             child: Lottie.asset(
//               'assets/animations/loading_2.json',
//               width: 100,
//               height: 100,
//               fit: BoxFit.contain,
//             ),
//           );
//         } else {
//           return GestureDetector(
//             onTap: () => FocusScope.of(context).unfocus(),
//             behavior: HitTestBehavior.opaque,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: [
//                   CustomTextField(
//                     maxLines: 1,
//                     borderColor: TextColors.neutral500,
//                     filColor: Colors.white,
//                     controller: searchcontroller,
//                     hintText: 'Search for a doctor by name or designation...',
//                     prefixIcon: SvgPicture.asset(AppIcons.searchIcon),
//                   ),
//                   SizedBox(height: 16.h),
//                   Stack(
//                     children: [
//                       Container(
//                         color: Colors.transparent,
//                         child: Row(
//                           children: List.generate(tabs.length, (index) {
//                             return Obx(() {
//                               bool isSelected =
//                                   _controller.selectedIndex.value == index;
//                               return GestureDetector(
//                                 behavior: HitTestBehavior.translucent,
//                                 onTap: () => _controller.setTab(index),
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 10,
//                                     vertical: 10,
//                                   ),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Text(
//                                         tabs[index],
//                                         style: TextStyle(
//                                           overflow: TextOverflow.ellipsis,
//                                           color: isSelected
//                                               ? TextColors.action
//                                               : TextColors.secondary,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       SizedBox(height: 4),
//                                       Container(
//                                         height: 2,
//                                         width: 40,
//                                         color: isSelected
//                                             ? TextColors.action
//                                             : Colors.transparent,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             });
//                           }),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         left: 0,
//                         right: 0,
//                         child: Container(
//                           margin: const EdgeInsets.only(
//                             bottom: 10,
//                             left: 10,
//                             right: 10,
//                           ),
//                           height: 1,
//                           color: Appcolors.disabled.withOpacity(0.25),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   // Padding(
//                   //   padding: const EdgeInsets.only(left: 4),
//                   //   child: Align(
//                   //     alignment: Alignment.topLeft,
//                   //     child: Text(
//                   //       "Available Doctor",
//                   //       style: TextStyle(
//                   //         fontFamily: AppConstants.FONT_FAMILY,
//                   //         fontSize: 20,
//                   //         color: HexColor("##3D3D3D"),
//                   //         fontWeight: FontWeight.w500,
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   SizedBox(height: 10),
//
//                   Expanded(
//                     child:  GridView.builder(
//                         physics: BouncingScrollPhysics(),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 8,
//                           crossAxisSpacing: 8,
//                           childAspectRatio: 0.56,
//                         ),
//                         itemCount: 20,
//                         itemBuilder: (context,index){
//                           return  GestureDetector(
//                             onTap: () {
//                               showDoctorBookingSheet(context);
//                              // Get.toNamed('/doctor_details', id: NavIds.profile);
//                             },
//                             child: Container(
//                               margin: EdgeInsets.all(2),
//                               padding: EdgeInsets.all(9),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(12),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: ShadowColor.shadowColors1.withOpacity(0.10),
//                                     blurRadius: 4,
//                                     // reasonable softness
//                                     spreadRadius: 0,
//                                     offset: Offset(0, 3), // downward shadow
//                                   ),
//                                 ],
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Stack(
//                                     children: [
//                                       ClipRRect(
//                                         borderRadius: BorderRadius.circular(8),
//                                         child: Image.asset(
//                                           "assets/image/doctor_image.png",
//                                           height: 140.h,
//                                           width: double.infinity,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                       Positioned(
//                                         right: 0,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(5),
//                                           child: SvgPicture.asset(
//                                             "assets/icons/Heart.svg",
//                                             width: 20,
//                                             height: 20,
//                                             colorFilter: ColorFilter.mode(
//                                               TextColors.neutral900,
//                                               BlendMode.srcIn,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 8),
//                                     child: Text(
//                                       "Dr. Leo Marwick",
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         letterSpacing: 0.2,
//                                         color: TextColors.neutral900,
//                                         fontFamily: 'Inter',
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 1,
//                                     ),
//                                   ),
//                                   Text(
//                                     "Heart Health Expert",
//                                     style: TextStyle(
//                                       color: TextColors.neutral500,
//                                       fontFamily: 'Inter',
//                                       fontSize: 14,
//                                       letterSpacing: 0.2,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 1,
//                                   ),
//                                   SizedBox(height: 8),
//                                   Row(
//                                     children: [
//                                       SvgPicture.asset(
//                                         AppIcons.hospitallocationIcon,
//                                         width: 20,
//                                         height: 20,
//                                         colorFilter: ColorFilter.mode(
//                                           Color(0xFF3D75E6),
//                                           BlendMode.srcIn,
//                                         ),
//                                       ),
//                                       const SizedBox(width: 4),
//                                       Expanded(
//                                         child: Text(
//                                           "Sylhet Health Center",
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                             fontStyle: FontStyle.italic,
//                                             //fontFamily: "Inter",       // <--- uncomment this
//                                             color: TextColors.neutral900,
//                                             fontWeight: FontWeight.w500,  // use w400 for italic because you have only 400 italic
//                                           ),
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 14),
//                                   Row(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(left: 0),
//                                         child: Text(
//                                           "3 Time Available",
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             color: TextColors.neutral900,
//                                             fontFamily: 'Inter',
//                                             letterSpacing: 0.2,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ),
//                                       Spacer(),
//                                       SvgPicture.asset(
//                                         AppIcons.shearIcon,
//                                         width: 20,
//                                         height: 20,
//                                         colorFilter: ColorFilter.mode(
//                                           TextColors.neutral900,
//                                           BlendMode.srcIn,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         })
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//       }),
//     );
//   }
//
//
//   Widget buildDoctorBookingSheet(
//       BuildContext context, {
//         required String doctorName,
//         required String department,
//         required String location,
//         required List<String> timeSlots,
//         required RxString selectedTime,
//         required Function(String) onSelectTime,
//         required VoidCallback onWaitlist,
//       }) {
//     final DateTimePickerController controller = Get.put(DateTimePickerController());
//
//     void shareText() {
//       SharePlus.instance.share(
//         ShareParams(text: 'Check out my website https://example.com'),
//       );
//     }
//
//     Widget iconButton(String iconAsset, Color bgColor, {Color? iconColor}) {
//       return Container(
//         height: 40,
//         width: 40,
//         decoration: BoxDecoration(
//             color: bgColor,
//             borderRadius: BorderRadius.circular(8),
//             boxShadow: [
//               BoxShadow(
//                 color: ShadowColor.shadowColors1.withOpacity(0.10),
//                 blurRadius: 4,
//                 offset: Offset(0, 3),
//                 spreadRadius: 0,
//               )
//             ]),
//         child: Center(
//           child: SvgPicture.asset(
//             iconAsset,
//             height: 24,
//             width: 24,
//             color: iconColor,
//           ),
//         ),
//       );
//     }
//
//     return DraggableScrollableSheet(
//       initialChildSize: 0.95,
//       minChildSize: 0.5,
//       maxChildSize: 0.95,
//       expand: false,
//       builder: (_, scrollController) {
//         return Container(
//           constraints: BoxConstraints(
//             maxHeight: MediaQuery.of(context).size.height * 0.95,
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           decoration: BoxDecoration(
//             color: Appcolors.page,
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
//             boxShadow: [
//               BoxShadow(
//                 color: Appcolors.disabled.withOpacity(0.15),
//                 blurRadius: 5,
//                 spreadRadius: 2,
//                 offset: const Offset(0.3, 0.2),
//               ),
//             ],
//           ),
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             controller: scrollController,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 14),
//                 Center(
//                   child: Container(
//                     height: 4,
//                     width: 40,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: Appcolors.background,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//
//                 // Doctor name
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           doctorName,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 24,
//                             letterSpacing: 0.2,
//                             color: TextColors.neutral900,
//                             fontFamily: AppConstants.FONT_FAMILY,
//                           ),
//                         ),
//                         Text(
//                           department,
//                           style: const TextStyle(
//                             color: TextColors.neutral500,
//                             fontSize: 16,
//                             letterSpacing: 0.2,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: AppConstants.FONT_FAMILY,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         GestureDetector(
//                             onTap: () {
//                               Get.to(DoctorMessage());
//                             },
//                             child: iconButton(AppIcons.chatIcon, Appcolors.action)),
//                         const SizedBox(width: 8),
//                         GestureDetector(
//                           onTap: shareText,
//                           child: iconButton(
//                             AppIcons.shearIcon,
//                             Appcolors.secondary,
//                             iconColor: Appcolors.action,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//
//                 // Location
//                 Row(
//                   children: [
//                     SvgPicture.asset(
//                       AppIcons.hospitallocationIcon,
//                       color: Colors.blue,
//                       width: 24,
//                       height: 24,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       location,
//                       style: const TextStyle(
//                         color: TextColors.neutral500,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 20,
//                         letterSpacing: 0.2,
//                         fontFamily: AppConstants.FONT_FAMILY,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Date Picker
//                 DateTimePickerSection(),
//
//                 // Time Slots using Column
//                 Obx(() => Column(
//                   children: [
//                     for (int i = 0; i < timeSlots.length; i += 3)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: List.generate(3, (index) {
//                           if (i + index >= timeSlots.length) {
//                             return const SizedBox(width: 90);
//                           }
//                           final time = timeSlots[i + index];
//                           final isSelected = controller.selectedTime.value == time;
//
//                           return GestureDetector(
//                             onTap: () => controller.selectTime(time),
//                             child: Container(
//                               margin: const EdgeInsets.symmetric(vertical: 8),
//                               width: 98,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 color: isSelected ? TextColors.action : Appcolors.natral25,
//                                 borderRadius: BorderRadius.circular(8),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Color(0xFF0000001A).withOpacity(0.10),
//                                     blurRadius: 4,
//                                     offset: const Offset(0, 3),
//                                     spreadRadius: 0,
//                                   ),
//                                 ],
//                               ),
//                               child: Center(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     if (isSelected)
//                                       const Icon(
//                                         Icons.check,
//                                         color: Appcolors.primary,
//                                         size: 16,
//                                       ),
//                                     if (isSelected) const SizedBox(width: 4),
//                                     Text(
//                                       time,
//                                       style: TextStyle(
//                                         fontFamily: AppConstants.FONT_FAMILY,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: isSelected ? Colors.white : Colors.black,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                       ),
//                   ],
//                 )),
//
//                 const SizedBox(height: 12),
//
//                 // Buttons
//                 Row(
//                   children: [
//                     Expanded(
//                       child: InkWell(
//                         onTap: onWaitlist,
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 24),
//                           height: 45,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Appcolors.primary,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: ShadowColor.shadowColors1.withOpacity(0.10),
//                                 blurRadius: 4,
//                                 spreadRadius: 0,
//                                 offset: Offset(0, 3),
//                                 blurStyle: BlurStyle.normal,
//                               ),
//                             ],
//                           ),
//                           alignment: Alignment.center,
//                           child: Row(
//                             children: [
//                               SvgPicture.asset(
//                                 AppIcons.alamclock1Icon,
//                                 color: Appcolors.action,
//                               ),
//                               SizedBox(width: 6),
//                               Text(
//                                 "Waitlist",
//                                 style: TextStyle(
//                                   fontFamily: AppConstants.FONT_FAMILY,
//                                   fontSize: 16,
//                                   color: TextColors.action,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//
//                     Expanded(
//                       child: InkWell(
//                         onTap: () {
//                           // Store the current context
//                           final currentContext = context;
//
//                           // Close the bottom sheet first
//                           Navigator.of(context).pop();
//
//                           // Navigate to book_report and handle return
//                           Get.toNamed('/book_report', id: NavIds.profile)?.whenComplete(() {
//                             // Use a post-frame callback to ensure the navigation is complete
//                             WidgetsBinding.instance.addPostFrameCallback((_) {
//                               if (currentContext.mounted) {
//                                 showDoctorBookingSheet(currentContext);
//                               }
//                             });
//                           });
//                         },
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 24),
//                           height: 45,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Appcolors.action,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: ShadowColor.shadowColors1.withOpacity(0.10),
//                                 blurRadius: 4,
//                                 spreadRadius: 0,
//                                 offset: Offset(0, 3),
//                                 blurStyle: BlurStyle.normal,
//                               ),
//                             ],
//                           ),
//                           alignment: Alignment.center,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 "Next",
//                                 style: TextStyle(
//                                   fontFamily: AppConstants.FONT_FAMILY,
//                                   fontSize: 14,
//                                   color: TextColors.neutral200,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
// // Function to show the doctor booking sheet
//   void showDoctorBookingSheet(BuildContext context) {
//     final DateTimePickerController dateTimeController = Get.find<DateTimePickerController>();
//
//     final List<String> timeSlots = [
//       "9:00 AM", "10:00 AM", "11:00 AM",
//       "2:00 PM", "3:00 PM", "4:00 PM"
//     ];
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       barrierColor: Colors.black.withOpacity(0.5),
//       enableDrag: true,
//       isDismissible: false,
//       builder: (_) {
//         return buildDoctorBookingSheet(
//           context,
//           doctorName: "Dr. Moule Marrk",
//           department: "Cardiology",
//           location: "Sylhet Health Center",
//           timeSlots: timeSlots,
//           selectedTime: dateTimeController.selectedTime,
//           onSelectTime: dateTimeController.selectTime,
//           onWaitlist: () => Get.back(),
//         );
//       },
//     );
//   }
//
//
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/screen/doctor/doctor_details.dart';

import '../../../controllers/datePicker/date_picker_controller.dart';
import '../../../controllers/doctor/doctor.dart';
import '../../../controllers/dotor_details.dart';
import '../../../controllers/tabcontroller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/nab_ids.dart';
import '../../base/custom_field.dart';
import '../../base/doctor_bottom_sheet/dotor_details_bottom_sheet.dart';
import '../doctro_message/doctor_message.dart';

class Doctor extends StatelessWidget {
  final void Function(String doctorId)? onDetailsTap;

  Doctor({super.key, this.onDetailsTap});

  final TabControllerX _controller = Get.put(TabControllerX());
  final TextEditingController searchcontroller = TextEditingController();
  final DoctorController doctorController = Get.put(DoctorController());
  final DateTimePickerController controller = Get.put(DateTimePickerController());
  final DateTimePickerController dateTimeController = Get.put(DateTimePickerController());
  final DoctorDetailsController doctor = Get.put(DoctorDetailsController());
  final List<String> tabs = ["All", "Favorite (4)"];

  final List<String> timeSlots = [
    "11:45 am", "2:15 pm", "4:30 am",
    "6:20 pm", "10:05 pm", "7:00 pm",
    "1:55 am"
  ];
  double _getTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.size.width +10;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Doctor",
          style: TextStyle(
            fontSize: 20,
            fontFamily: AppConstants.FONT_FAMILY,
            fontWeight: FontWeight.w500,
            color: HexColor("#3D3D3D"),
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
      body: Obx(() {
        if (doctorController.isLoading.value) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading_2.json',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomTextField(
                    maxLines: 1,
                    borderColor: TextColors.neutral500,
                    filColor: Colors.white,
                    controller: searchcontroller,
                    hintText: 'Search for a doctor by name or designation...',
                    prefixIcon: SvgPicture.asset(AppIcons.searchIcon),
                  ),
                  SizedBox(height: 16.h),
                  Stack(
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Row(
                          children: List.generate(tabs.length, (index) {
                            return Obx(() {
                              bool isSelected = _controller.selectedIndex.value == index;
                              final tabText = tabs[index]; // ✅ Use this in getTextWidth

                              return GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () => _controller.setTab(index),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  child: IntrinsicWidth(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          tabText,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: isSelected
                                                ? TextColors.action
                                                : TextColors.secondary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          //curve: Curves.easeIn,
                                         // duration: const Duration(milliseconds: 000),
                                          height: 2,
                                          width: isSelected
                                              ? _getTextWidth(tabText, const TextStyle(fontWeight: FontWeight.w500)) + 8
                                              : 30, // width for unselected tab
                                          color: isSelected ? TextColors.action : Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                          }),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                            left: 10,
                            right: 10,
                          ),
                          height: 1,
                          color: Appcolors.disabled.withOpacity(0.25),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Expanded(
                    child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 0.56,
                        ),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showDoctorBookingSheet(context);
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
                                    spreadRadius: 0,
                                    offset: Offset(0, 3),
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

                                     Obx(()=>Positioned(
                                       right: 0,
                                       child: GestureDetector(
                                         onTap: (){
                                           doctor.toggleFavorite();
                                         },
                                         child: Padding(
                                           padding: const EdgeInsets.all(5),
                                           child: doctor.isFavorite.value ?
                                           SvgPicture.asset(
                                             doctor.isFavorite.value
                                                 ? AppIcons.heart01Icon
                                                 : AppIcons.heartIcon,
                                           ):   SvgPicture.asset(
                                             doctor.isFavorite.value
                                                 ? AppIcons.heartSecondIcon
                                                 : AppIcons.heartIcon,
                                           ),
                                         ),
                                       ),
                                     ) )

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
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.hospitallocationIcon,
                                        width: 20,
                                        height: 20,
                                        colorFilter: ColorFilter.mode(
                                          Color(0xFF3D75E6),
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          "Sylhet Health Center",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic,
                                            color: TextColors.neutral900,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 14),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Text(
                                          "3 Time Available",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: TextColors.neutral900,
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.2,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      SvgPicture.asset(
                                        AppIcons.shearIcon,
                                        width: 20,
                                        height: 20,
                                        colorFilter: ColorFilter.mode(
                                          TextColors.neutral900,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        }
      }),
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

  // Function to show the doctor booking sheet
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
}