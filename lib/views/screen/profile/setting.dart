import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/views/screen/auth/login_screen.dart';
import 'package:wellbyn/views/screen/profile/account_switch.dart';
import 'package:wellbyn/views/screen/profile/personalinfo/personal_info.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/nab_ids.dart';
import '../../base/custom_field.dart';
import 'base/logout.dart';
import 'base/profile_list_tile.dart';
class Setting extends StatelessWidget {
   Setting({super.key});

   TextEditingController textEditingController = TextEditingController();

   void _handleLogout(BuildContext context) {
     // TODO: logout logic, then:
     Get.offAll(LoginScreen());// Go to login
   }

   void _showCustomLogoutDialog(BuildContext context) {
     showDialog(
       context: context,
       builder: (context) => CustomConfirmationDialog (
         onConfirm: () => _handleLogout(context),
         onCancel: () => Navigator.pop(context),
         iconAsset: AppIcons.alertIcon,
         title: 'Logout? ',
         description: 'Are you sure you want to log out of your account?',
       ),
     );
   }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 0.2,
            fontFamily: AppConstants.FONT_FAMILY,
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
           // Get.back(id: NavIds.profilenav);
            //Get.offAll(LoginScreen());
          },
          icon: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
             width: 30.w,
             height: 30.h,
            color: TextColors.neutral900,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
         child: ScrollConfiguration(
           behavior: const CupertinoScrollBehavior(),
             child: SingleChildScrollView(
                 physics: const BouncingScrollPhysics(),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
               
                   CustomTextField(
                     borderColor: TextColors.neutral900 ,
                     maxLines: 1,
                     hintText: 'Search for a doctor by name or designation...',
                       controller: textEditingController,
                       filColor: Appcolors.primary,
                       prefixIcon: SvgPicture.asset(AppIcons.searchIcon),
               
                   ),
               
                   SizedBox(height: 24,),



                   GestureDetector(
                 onTap: (){
                   Get.toNamed(
                     '/personal_info',
                     id: NavIds.profilenav,
                   );
                 },
                 child: Container(
                   height: 60,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                       color: Appcolors.primary,
                       boxShadow: [
                         BoxShadow(
                           color:ShadowColor.shadowColors1.withOpacity(0.10) , // softer effect
                           blurRadius: 4, // reasonable softness
                           spreadRadius: 0,
                           offset: Offset(0, 3), // downward shadow
                         ),
                       ]
                   ),
                   padding: const EdgeInsets.all(8),
                   margin: EdgeInsets.symmetric(horizontal: 2),
                   child: Row(
                     children: [
                       SvgPicture.asset(AppIcons.settingIcon),
                       const SizedBox(width: 12),
                       Text(
                         "Personal Information",
                         style: const TextStyle(
                           letterSpacing: 0.2,
                           fontFamily: 'Inter',
                           color: TextColors.neutral900,
                           fontWeight:  FontWeight.w500,
                           fontSize: 16,
                         ),
                       ),
                       const Spacer(),
                       SvgPicture.asset(AppIcons.arrorightIcon, color: TextColors.neutral900,),
                     ],
                   ),
                 ),
               ),
                   GestureDetector(
                     onTap: (){
                       Get.toNamed("/medical_info",id: NavIds.profilenav);
                     },
                     child: Container(
                       height: 60,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(0.0),
                           color: Appcolors.primary,
                           boxShadow: [
                             BoxShadow(
                               color:ShadowColor.shadowColors1.withOpacity(0.10) , // softer effect
                               blurRadius: 4, // reasonable softness
                               spreadRadius: 0,
                               offset: Offset(0, 3), // downward shadow
                             ),
                           ]
                       ),
                       padding: const EdgeInsets.all(8),
                       margin: EdgeInsets.symmetric(horizontal: 2,vertical: 1),
                       child: Row(
                         children: [
                           SvgPicture.asset(AppIcons.medicalfileIcon),
                           const SizedBox(width: 12),
                           Text(
                             "Medical Information",
                             style: const TextStyle(
                               letterSpacing: 0.2,
                               fontFamily: 'Inter',
                               color: TextColors.neutral900,
                               fontWeight:  FontWeight.w500,
                               fontSize: 16,
                             ),
                           ),
                           const Spacer(),
                           SvgPicture.asset(AppIcons.arrorightIcon, color: TextColors.neutral900,),
                         ],
                       ),
                     ),
                   ),
                   GestureDetector(
                     onTap: (){
                       Get.toNamed("/insurance_info",id: NavIds.profilenav);
                     },
                     child: Container(
                       height: 60,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
                           color: Appcolors.primary,
                           boxShadow: [
                             BoxShadow(
                               color:ShadowColor.shadowColors1.withOpacity(0.10) , // softer effect
                               blurRadius: 4, // reasonable softness
                               spreadRadius: 0,
                               offset: Offset(0, 3), // downward shadow
                             ),
                           ]
                       ),
                       padding: const EdgeInsets.all(8),
                       margin: EdgeInsets.symmetric(horizontal: 2,vertical: 1),
                       child: Row(
                         children: [
                           SvgPicture.asset(AppIcons.shieduserIcon,),
                           const SizedBox(width: 12),
                           Text(
                             "Insurance Information",
                             style: const TextStyle(
                               letterSpacing: 0.2,
                               fontFamily: 'Inter',
                               color: TextColors.neutral900,
                               fontWeight:  FontWeight.w500,
                               fontSize: 16,
                             ),
                           ),
                           const Spacer(),
                           SvgPicture.asset(AppIcons.arrorightIcon, color: TextColors.neutral900,),
                         ],
                       ),
                     ),
                   ),

                   SizedBox(height: 8,),

               
                   ProfileListTile(
                     leadingIconPath: AppIcons.fileuploadtIcon,
                     title: ' Upload document',
                     trailingIconPath: AppIcons.arrorightIcon,
                     onTap: () {
                       // Navigate or do something
                       Get.toNamed("/upload_document_screen",id: NavIds.profilenav);
               
                     },
                   ),
                   SizedBox(height: 8,),
                   ProfileListTile(
                     leadingIconPath: AppIcons.alamclock1Icon,
                     title: " Waitlist",
                     trailingIconPath: AppIcons.arrorightIcon,
                     onTap: () {
                       // Navigate or do something
                       Get.toNamed("/waitlist_screen",id: NavIds.profilenav);
               
                     },
                   ),
                   SizedBox(height: 8,),
                   ProfileListTile(
                     leadingIconPath: AppIcons.givepillIcon,
                     title: " Medications",
                     trailingIconPath: AppIcons.arrorightIcon,
                         onTap: () {
                                  // Navigate or do something
                           Get.toNamed('/medicationsetting',id: NavIds.profilenav);
                           print("helo");
                           },
                          ),
                   SizedBox(height: 8,),
                   ProfileListTile(
                     leadingIconPath: AppIcons.userswitchIcon,
                     title: " Switch account",
                     trailingIconPath: AppIcons.arrorightIcon,
                     onTap: () {
                       showModalBottomSheet(
                         context: context,
                         isScrollControlled: true,
                         backgroundColor: Colors.transparent,
                         builder: (_) => const AccountBottomSheet(),
                       );
                     },
                   ),
                   SizedBox(height: 8,),
                   ProfileListTile(
                     leadingIconPath: AppIcons.userswitchIcon,
                     title: " Caregiver",
                     trailingIconPath: AppIcons.arrorightIcon,
                     onTap: () {
                       // Navigate or do something
                     },
                   ),
                   SizedBox(height: 8,),
                   ProfileListTile(
                     leadingIconPath: AppIcons.documentIcon,
                     title: " HIPAA Consent",
                     trailingIconPath: AppIcons.arrorightIcon,
                     onTap: () {
                       // Navigate or do something
                     },
                   ),
                   SizedBox(height: 8,),
                   ProfileListTile(
                     leadingIconPath: AppIcons.helpIcon,
                     title: " Support",
                     trailingIconPath: AppIcons.arrorightIcon,
                     onTap: () {
                       Get.toNamed('/support',id: NavIds.profilenav);

                     },
                   ),
                   SizedBox(height: 24,),
               
                   GestureDetector(
                     onTap: (){
                       _showCustomLogoutDialog(context);
               
                     },
                     child: Container(
                       height: 45,
                       padding: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8),
                         border: Border.all(
                           width: 1,
                           color: BorderColors.error700,
                         ),
                       ),child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SvgPicture.asset(AppIcons.logoutIcon),
                         SizedBox(width: 8,),
                         Text(
                             "Logout",
                             style: TextStyle(
                               fontFamily: "Inter",
                               letterSpacing: 0.2,
                               color: BorderColors.error700,
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                             )
                         )
                       ],
                     ),
                     ),
                   ),
                   SizedBox(height: 25,),
               
               
                 ],
               ),
             ),
           ),
         ),
        ),
    );
  }

   Text buildText(String name ) {
      return Text(
          name,
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
               )
           );
  }

}
