import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wellbyn/controllers/dotted_border/dotted_boder.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';

import '../../../../controllers/file_upload_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/nab_ids.dart';

class UploadDocumentScreen extends StatelessWidget {
  UploadDocumentScreen({super.key});

  final FileUploadController fileController = Get.put(FileUploadController());
  final List<String> tabs = ["X-Ray", "Lab Result", "Test Reports","X-Ray", "Lab Result", "Test Reports"];

  double _getTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12,),
              Container(
                height: 44,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Tabs Section - Takes 1 flex unit
                    Flexible(
                      flex: 1,
                      child: Obx(() {
                        print("Tab rebuild - selected index: ${fileController.selectedIndex.value}");
                        return SizedBox(
                          height: 44,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: tabs.length,
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            itemBuilder: (context, index) {
                              final isSelected = fileController.selectedIndex.value == index;
                              final text = tabs[index];
                              final textWidth = _getTextWidth(
                                text,
                                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                              );

                              return GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () => fileController.toggle(index),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AnimatedDefaultTextStyle(
                                        duration: const Duration(milliseconds: 200),
                                        style: TextStyle(
                                          color: isSelected
                                              ? TextColors.action
                                              : TextColors.neutral500,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                        child: Text(text),
                                      ),
                                      const SizedBox(height: 4),
                                      AnimatedContainer(
                                        curve: Curves.easeInOut,
                                        duration: const Duration(milliseconds: 200),
                                        height: 2,
                                        width: isSelected ? textWidth + 8 : 0,
                                        decoration: BoxDecoration(
                                          color: Appcolors.action,
                                          borderRadius: BorderRadius.circular(1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ),

                    const SizedBox(width: 10),

                    /// Add Button - Fixed size
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: TextColors.neutral100,
                        border: Border.all(
                          width: 0.44,
                          color: TextColors.neutral200,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 25,
                          color: Appcolors.action,
                          weight: 800, // Material 3 only
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12,),
              AppText("Document",fontSize: 16,fontWeight: FontWeight.w500,color:TextColors.neutral900,),
              SizedBox(height: 12,),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Get.toNamed("/edit_upload_documention",id: NavIds.profilenav);
                        
                      },
                        child: _documentCard(
                            title: "MRI Result ",
                            date: "6 June 2025"));

                  }),
              //==========>  Upload Dotted Container - Removed unnecessary Obx <==========
              GestureDetector(
                onTap: () => fileController.pickAndUploadFiles(
                  allowedExtensions: ['mov', 'jpg', 'pdf'],
                ),
                child: DottedBorderContainer(
                  child: Container(
                    color: Appcolors.actionPrimary100,
                    height: 210.h,
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.fileuploadtIcon,
                            width: 30,
                            height: 30,
                            color: Appcolors.action,
                          ),
                          SizedBox(height: 5),
                          AppText(
                            "Upload document",
                            fontSize: 16,
                            color: TextColors.neutral900,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),


              // // Uploaded File Preview with Progress
              // Obx(() {
              //   if (fileController.files.isEmpty) return SizedBox.shrink();
              //
              //   // ✅ Access inside Obx so it's reactive
              //   final file = fileController.files[0];
              //
              //   return Container(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 12,
              //       vertical: 10,
              //     ),
              //     margin: const EdgeInsets.only(bottom: 12),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(
              //           color: TextColors.neutral900.withOpacity(0.06),
              //           blurRadius: 6,
              //           offset: Offset(0, 2),
              //         ),
              //       ],
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: [
              //         Row(
              //           children: [
              //             Expanded(
              //               child: Text(
              //                 file['name'] ?? 'File',
              //                 style: const TextStyle(
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w500,
              //                   color: TextColors.neutral900,
              //                 ),
              //                 overflow: TextOverflow.ellipsis,
              //               ),
              //             ),
              //             GestureDetector(
              //               onTap: () => fileController.removeFile(0),
              //               child: const Icon(Icons.close, size: 18),
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 6),
              //         LinearProgressIndicator(
              //           value: file['progress'] ?? 0.0,
              //           backgroundColor: Colors.grey[300],
              //           valueColor: AlwaysStoppedAnimation<Color>(
              //             Appcolors.action,
              //           ),
              //           minHeight: 4,
              //         ),
              //         SizedBox(height: 6),
              //       ],
              //     ),
              //   );
              // }),
              //
              // SizedBox(height: 12),
              // AppText("Document", fontSize: 16, color: TextColors.neutral900),
              // SizedBox(height: 8),

              // Document List
              Obx(() {
                return Column(
                  children: fileController.files.map((file) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: TextColors.neutral900.withOpacity(0.06),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  file['name'] ?? 'File',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: TextColors.neutral900,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => fileController.removeFile(0),
                                child: const Icon(Icons.close, size: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          LinearProgressIndicator(
                            value: file['progress'] ?? 0.0,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Appcolors.action,
                            ),
                            minHeight: 4,
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }),

              SizedBox(height: 40),

            ]
        ),
      ),
      )
    );
  }

  Widget _documentCard({required String title, required String date}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ShadowColor.shadowColors1.withOpacity(0.10),
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(title, fontSize: 14.sp, color: TextColors.neutral900,fontWeight: FontWeight.w500,),
                SizedBox(height: 2),
                AppText(date, fontSize: 12.sp, color: TextColors.neutral500,fontWeight: FontWeight.w500,),
              ],
            ),
          ),
          SvgPicture.asset(AppIcons.arrorightIcon)
        ],
      ),
    );
  }
}

class _UploadingFileCard extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final double progress;
  final bool isUploading;
  final bool isUploaded;
  final bool hasError;
  final VoidCallback onCancel;

  const _UploadingFileCard({
    required this.fileName,
    required this.fileSize,
    required this.progress,
    required this.isUploading,
    required this.isUploaded,
    required this.hasError,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: TextColors.neutral200),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ShadowColor.shadowColors1.withOpacity(0.10),
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: TextColors.neutral900,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (fileSize.isNotEmpty)
                      Text(
                        fileSize,
                        style: TextStyle(
                          fontSize: 12,
                          color: TextColors.neutral500,
                        ),
                      ),
                  ],
                ),
              ),
              if (isUploading)
                GestureDetector(
                  onTap: onCancel,
                  child: const Icon(Icons.close, size: 18),
                ),
              if (isUploaded)
                Icon(Icons.check_circle, color: Colors.green, size: 18),
              if (hasError) Icon(Icons.error, color: Colors.red, size: 18),
            ],
          ),
          if (isUploading) ...[
            SizedBox(height: 6),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Appcolors.action),
              minHeight: 4,
            ),
            SizedBox(height: 4),
          ],
        ],
      ),
    );
  }
}

class _DocumentCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _DocumentCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: TextColors.neutral900.withOpacity(0.06),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.documentIcon,
            width: 24,
            height: 24,
            color: Appcolors.action,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(title, fontSize: 14.sp, color: TextColors.neutral900),
                SizedBox(height: 2),
                AppText(
                  subtitle,
                  fontSize: 12.sp,
                  color: TextColors.neutral500,
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: TextColors.neutral500),
        ],
      ),
    );
  }


}
