import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/views/screen/profile/base/account_switch.dart';

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
     Navigator.pop(context); // Close dialog
     Navigator.pushReplacementNamed(context, '/login'); // Go to login
   }

   void _showCustomLogoutDialog(BuildContext context) {
     showDialog(
       context: context,
       builder: (context) => CustomConfirmationDialog (
         onConfirm: () => _handleLogout(context),
         onCancel: () => Navigator.pop(context),
         iconAsset: AppIcons.alertIcon,
         title: 'Log out? ',
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
            fontFamily: "Satoshi",
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
           // Get.back(id: NavIds.profilenav);
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
         child: SingleChildScrollView(
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

                 SizedBox(height: 20,),
                 buildText("Information"),
                 SizedBox(height: 8,),
             
             
                 ProfileListTile(
                   leadingIconPath: AppIcons.settingIcon,
                   title: ' Personal Information',
                   trailingIconPath: AppIcons.arrorightIcon,
                   onTap: () {
                     // Navigate or do something
                     Get.toNamed(
                       '/personal_info',
                       id: NavIds.profilenav,
                     );


                   },
                 ),
                 SizedBox(height: 8,),
                 ProfileListTile(
                   leadingIconPath: AppIcons.medicalfileIcon,
                   title: ' Medical Information',
                   trailingIconPath: AppIcons.arrorightIcon,
                   onTap: () {
                     // Navigate or do something
                     Get.toNamed("/medical_info",id: NavIds.profilenav);
                   },
                 ),
                 SizedBox(height: 8,),
             
                 ProfileListTile(
                   leadingIconPath: AppIcons.shieduserIcon,
                   title: " Insurance Information ",
                   trailingIconPath: AppIcons.arrorightIcon,
                   onTap: () {
                     // Navigate or do something
                   },
                 ),
                 SizedBox(height: 8,),
             
                 ProfileListTile(
                   leadingIconPath: AppIcons.fileuploadtIcon,
                   title: ' Upload document',
                   trailingIconPath: AppIcons.arrorightIcon,
                   onTap: () {
                     // Navigate or do something
                   },
                 ),
                 SizedBox(height: 20,),
                 buildText("Quick"),
                 SizedBox(height: 8,),
                 ProfileListTile(
                   leadingIconPath: AppIcons.alamclock1Icon,
                   title: " Waitlist",
                   trailingIconPath: AppIcons.arrorightIcon,
                   onTap: () {
                     // Navigate or do something
                   },
                 ),
                 SizedBox(height: 8,),
                 ProfileListTile(
                   leadingIconPath: AppIcons.givepillIcon,
                   title: " Medications",
                   trailingIconPath: AppIcons.arrorightIcon,
                       onTap: () {
                                // Navigate or do something
                         },
                        ),
                      SizedBox(height: 20,),
                 buildText("Account"),
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
                   title: " Medications",
                   trailingIconPath: AppIcons.arrorightIcon,
                   onTap: () {
                     // Navigate or do something
                   },
                 ),
                 SizedBox(height: 20,),

                 buildText("Other"),
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
                 SizedBox(height: 25,),

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
                           "Log out",
                           style: TextStyle(
                             fontFamily: "Satoshi",
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
