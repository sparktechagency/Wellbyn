import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wellbyn/utils/app_constants.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/screen/auth/login_screen.dart';
import 'package:wellbyn/views/screen/profile/account_switch/account_switch.dart';
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

                   SizedBox(height: 16,),

               
                   ProfileListTile(
                     leadingIconPath: AppIcons.fileuploadtIcon,
                     title: ' Upload document',
                     trailingIconPath: AppIcons.arrorightIcon,
                     onTap: () {
                       // Navigate or do something
                       Get.toNamed("/upload_document_screen",id: NavIds.profilenav);
               
                     },
                   ),
                   SizedBox(height: 16,),
                   ProfileListTile(
                     leadingIconPath: AppIcons.alamclock1Icon,
                     title: " Waitlist",
                     trailingIconPath: AppIcons.arrorightIcon,
                     onTap: () {
                       // Navigate or do something
                       Get.toNamed("/waitlist_screen",id: NavIds.profilenav);
               
                     },
                   ),
                   SizedBox(height: 16,),
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
                   SizedBox(height: 16,),
                   ProfileListTile(
                     leadingIconPath: AppIcons.userswitchIcon,
                     title: " Switch account",
                     trailingIconPath: AppIcons.arrorightIcon,
                     onTap: () async {
                        // Close the bottom sheet
                       // Reopen bottom sheet when returning
                       showAccountBottomSheet(context);
                       //Navigator.of(context).pop();
                       //await Get.toNamed("/caregiver_mode", id: NavIds.profilenav);
                     },

                   ),
                   SizedBox(height: 16,),
                   ProfileListTile(
                     leadingIconPath: AppIcons.userswitchIcon,
                     title: " Caregiver",
                     trailingIconPath: AppIcons.arrorightIcon,
                     onTap: () {
                       // Navigate or do something
                     },
                   ),
                   SizedBox(height: 16,),
                   ProfileListTile(
                     leadingIconPath: AppIcons.documentIcon,
                     title: " HIPAA Consent",
                     trailingIconPath: AppIcons.arrorightIcon,
                     onTap: () {
                       // Navigate or do something
                     },
                   ),
                   SizedBox(height: 16,),
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

   Widget buildAccountBottomSheet(BuildContext context) {
     final List<Map<String, dynamic>> caregivers = [
       {
         "name": "Sakib",
         "label": "Caregiver",
         "avatar": "Sa",
         "avatarColor": Colors.white,
         "labelColor": BorderColors.warning50,
       },
       {
         "name": "Kamal",
         "label": "Caregiver",
         "avatar": "Ka",
         "avatarColor": Colors.white,
         "labelColor": BorderColors.warning50,
       },
       {
         "name": "Kamal",
         "label": "Caregiver",
         "avatar": "Ka",
         "avatarColor": Colors.white,
         "labelColor": BorderColors.warning50,
       },
     ];

     return Container(
       padding: EdgeInsets.all(16),
       decoration: BoxDecoration(
         color: Appcolors.primary,
         boxShadow: [
           BoxShadow(
             color: ShadowColor.shadowColors1.withOpacity(0.10),
             blurRadius: 4,
             offset: Offset(0, 3),
           ),
         ],
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(25),
           topRight: Radius.circular(25),
         ),
       ),
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           Container(
             width: 50,
             height: 5,
             margin: const EdgeInsets.only(bottom: 16),
             decoration: BoxDecoration(
               color: Colors.grey[300],
               borderRadius: BorderRadius.circular(10),
             ),
           ),
           Text(
             "Switch account",
             style: TextStyle(
               fontWeight: FontWeight.w500,
               fontSize: 20,
               fontFamily: "Inter",
               color: TextColors.neutral900,
             ),
           ),
           const SizedBox(height: 16),
           const Align(
             alignment: Alignment.centerLeft,
             child: Text(
               'Personal account',
               style: TextStyle(
                 fontWeight: FontWeight.w500,
                 fontSize: 20,
                 fontFamily: "Inter",
                 color: TextColors.neutral900,
               ),
             ),
           ),
           const SizedBox(height: 8),
            Container(
           padding: const EdgeInsets.all(12),
           decoration: BoxDecoration(
             color: Appcolors.primary50,
             borderRadius: BorderRadius.circular(8),
           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 children: [
                   CircleAvatar(
                     backgroundColor: Colors.white,
                     child: Text(
                       "M",
                       style: const TextStyle(color: Appcolors.action),
                     ),
                   ),
                   const SizedBox(width: 8),
                   AppText("Mahmud",fontSize: 16,color: Appcolors.action,),
                 ],
               ),
               Container(
                 padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                 ),
                 child: Text(
                   "Personal",
                   style: TextStyle(
                     color: Appcolors.action,
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
             ],
           ),
         ),
           const SizedBox(height: 16),
           const Align(
             alignment: Alignment.centerLeft,
             child: Text(
               'As a caregiver',
               style: TextStyle(
                 fontWeight: FontWeight.w500,
                 fontSize: 20,
                 fontFamily: "Inter",
                 color: TextColors.neutral900,
               ),
             ),
           ),
           const SizedBox(height: 8),
           SizedBox(
             height: 140,
             child: ListView.builder(
               physics: const BouncingScrollPhysics(),
               shrinkWrap: true,
               itemCount: caregivers.length,
               itemBuilder: (context, index) {
                 final caregiver = caregivers[index];
                 return buildAccountTile(
                   name: caregiver['name'],
                   label: caregiver['label'],
                   avatar: caregiver['avatar'],
                   avatarColor: caregiver['avatarColor'],
                   labelColor: caregiver['labelColor'],
                 );
               },
             ),
           ),
           const SizedBox(height: 12),
           GestureDetector(
             onTap: () {
               final currentContext = context;

               // Close the bottom sheet first
               Navigator.of(context).pop();

               // Navigate to caregiver mode
               Get.toNamed("/caregiver_mode", id: NavIds.profilenav)?.whenComplete(() {
                 // Use a post-frame callback to ensure the navigation is complete
                 WidgetsBinding.instance.addPostFrameCallback((_) {
                   if (currentContext.mounted) {
                     showAccountBottomSheet(currentContext);
                   }
                 });
               });

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
                     offset: Offset(0, 3),
                     blurRadius: 4,
                   )
                 ],
               ),
               child: Center(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.add, color: Appcolors.action),
                     SizedBox(width: 8),
                     Text(
                       "Add Caregiver",
                       style: TextStyle(
                         color: Appcolors.action,
                         fontSize: 16,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
           const SizedBox(height: 12),
         ],
       ),
     );
   }

   Widget buildAccountTile({
     required String name,
     required String label,
     required String avatar,
     required Color avatarColor,
     required Color labelColor,
   }) {
     return Container(
       margin: const EdgeInsets.symmetric(vertical: 4),
       padding: const EdgeInsets.all(12),
       decoration: BoxDecoration(
         color: BorderColors.warning50,
         borderRadius: BorderRadius.circular(8),
       ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Row(
             children: [
               CircleAvatar(
                 backgroundColor: avatarColor,
                 child: AppText(
                   avatar,
                     fontSize: 16,
                     fontWeight: FontWeight.w500,
                       color:TextColors.warning600),
               ),
               const SizedBox(width: 8),
       AppText(
           name,
           fontSize: 16,
           fontWeight: FontWeight.w500,
           color:TextColors.warning600),
             ],
           ),
           Container(
             padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
             decoration: BoxDecoration(
               // border: Border.all(color: avatarColor),
               borderRadius: BorderRadius.circular(20),
             ),
             child: Text(
               label,
               style: TextStyle(
                 color: TextColors.warning600,
                 fontWeight: FontWeight.w600,
               ),
             ),
           ),
         ],
       ),
     );
   }

// Usage example:
  void showAccountBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => buildAccountBottomSheet(context),
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
