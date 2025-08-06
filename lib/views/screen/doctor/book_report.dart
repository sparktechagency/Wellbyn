import 'dart:developer' hide log;
import 'dart:ffi';
import 'dart:io';
import 'dart:math' show log, pow;
import 'package:dotted_line/dotted_line.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:wellbyn/controllers/book_report_controller.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/base/AppButton/app_button.dart';
import 'package:wellbyn/views/base/Apptext/app_text.dart';
import 'package:wellbyn/views/base/iconsTextbutton/icon_text_button.dart';
import 'package:wellbyn/views/screen/doctor/book_overview.dart';
import 'package:wellbyn/views/screen/doctor/widget/animationwave.dart';

import '../../../controllers/TextField/textfield_Controller.dart';
import '../../../controllers/file_upload_controller.dart';
import '../../../controllers/speech_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/nab_ids.dart';
import 'package:file_picker/file_picker.dart';

import '../../base/LabelTextField/labelTextField.dart';
import '../../base/LableDropDownFielded/lableDropDownFielded.dart';
import '../../base/custom_field.dart';

class BookReport extends StatefulWidget {
  BookReport({super.key});

  @override
  State<BookReport> createState() => _BookReportState();
}

class _BookReportState extends State<BookReport> {
  final BookReportController controller = Get.put(BookReportController());
  final SpeechToText _speechToText = SpeechToText();
  TextEditingController problem = TextEditingController();
  TextEditingController optional = TextEditingController();
  final FileUploadController fileController = Get.put(FileUploadController());
  final DropdownController  dropdownController = Get.put(DropdownController());


  late SpeechController speechController;
  List<Map<String, dynamic>> files = [];
  bool isUploading = false;

  @override
  void initState() {
    super.initState();
    speechController = Get.put(SpeechController(speech: _speechToText));
    _initSpeech();
    fileController.requestPermissions();

  }
  void _initSpeech() async {
    bool available = await _speechToText.initialize(
      onStatus: (status) => print('Speech status: $status'),
      onError: (error) => print('Speech error: $error'),
    );
    if (!available) {
      Get.snackbar("Speech Error", "Speech recognition not available");
    }
  }

  void _deleteFile(int index) {
    setState(() {
      files.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Appointment Details",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 0.2,
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            color: TextColors.neutral900,
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LabeledTextFielded(
                  borderColor: TextColors.neutral900,
                  label: "Visit Reason",
                  controller: problem,
                  maxline: 1,
                  hintText: "I need a cleaning",
                ),
              ),
              SizedBox(height: 24,),

              //========> drop down visit type here <================//

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LabeledDropdownFielded(
                  label: "Visit Type",
                  titile: "City",
                  items: ["Health check.", "Blood test.", "Headache check.","Check-up.","Skin exam.","Allergy care.","Back exam.","Digestive check.","Med review.","other"],
                  selectedValue: dropdownController.selectedValue,
                  onChanged: (value) {
                    // Optional additional logic
                    print("Selected: $value");
                  },
                ),
              ),

              SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LabeledDropdownFielded(
                  label: "Select Insurance",
                  titile: "City",
                  items: ["Blusky.", "Blood test.", "Headache check.","Check-up.","Skin exam.","Allergy care.","Back exam.","Digestive check.","Med review.","other"],
                  selectedValue: dropdownController.selectedValue,
                  onChanged: (value) {
                    // Optional additional logic
                    print("Selected: $value");
                  },
                ),
              ),
              SizedBox(height: 24),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Appcolors.primary,
                        boxShadow: [
                          BoxShadow(
                            color: ShadowColor.shadowColors1.withOpacity(0.10),
                            offset: Offset(0, 2),
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What happened and how? Tell us! ",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8),

                            //<=============here spech ot talk <=============

                            Obx(() => speech_to_talk(),),
                            SizedBox(height: 8),
                            //<================summary problem with ai <==============
                            LabeledTextFielded(
                              borderColor: TextColors.neutral900,
                              label: "Summary",
                              controller: problem,
                              maxline: 4,
                              hintText: "Hello",
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),


                    Text(
                      'Documentation',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                      Obx(() => Column(
                        children: [
                          ...fileController.files.map((file) =>
                              _buildFileItem(file, fileController.files.indexOf(file))
                          ).toList(),
                        ],
                      )),
                      IconTextButton(
                            onTap: ()async {
                              await fileController.pickAndUploadFiles(allowedExtensions: ['mov', 'jpg', 'pdf'],);
                            },
                            svgAsset: AppIcons.addIcon,
                            text: "Add File",
                            fontsize: 15,
                            backgroundColor: Appcolors.primary,
                            bordercolor: Colors.transparent,
                            textColor: TextColors.action,
                            width: 110,
                            height: 40,
                          ),




                      SizedBox(height: 12),

                    SizedBox(height: 20),
                    Text(
                      'Current Medication',
                      style: TextStyle(
                        fontSize: 16,
                        color: TextColors.neutral900,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 8),


                    IconTextButton(onTap: (){},
                      svgAsset: AppIcons.shearIcon,
                      text: "Share",
                      fontsize: 15,
                      backgroundColor: Appcolors.primary,
                      bordercolor: Colors.transparent,
                      textColor: TextColors.action,
                      width: 96,
                      height: 40,

                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Prior Diagnoses",
                          style: TextStyle(
                            fontFamily: "Inter",
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
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    CustomTextFielded(controller: problem,readOnly: true,maxLines: 7,hintText: "hello bro how are you ",),
                    SizedBox(height: 30),
                  ],
                ),

              ),

              doctor_overview(),
            ],
          ),
        ),
    );
  }

  Container doctor_overview() {
    return Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Appcolors.page,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF1A4060).withOpacity(0.20),
                    offset: Offset(0, -4),
                    blurRadius: 12,
                    spreadRadius: -1,
                  ),
                ],

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                      height: 4,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.black26.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(50),

                      ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/image/doctor_image.png'), // your local image path
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Dr. Moule Marrk",
                                style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 0.2,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,

                                )
                            ),
                            Text(
                                "Cardiology ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color:  TextColors.neutral500,
                                  fontFamily: "Inter",
                                  letterSpacing: 0.2,
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(AppIcons.hospitallocationIcon),
                                SizedBox(width: 5,),
                                Text(
                                    "Sylhet Health Center",
                               style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.2,
                                fontStyle: FontStyle.italic,
                                color: TextColors.neutral900,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                                )
                              ),

                              ],
                            )

                          ],
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: 15,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                            "Date & time",
                            style: TextStyle(
                              fontSize: 14,
                              color:  TextColors.neutral500,
                              fontWeight: FontWeight.w500,
                            )
                        ),
                    const SizedBox(width: 8), // optional space between text and line
                    Expanded(
                      child: DottedLine(
                        dashLength: 4,
                        dashGapLength: 4,
                        lineThickness: 1,
                        dashColor: Colors.black26,
                      ),
                    ),

                      ],
                    ),
                  ),

                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          color: TextColors.primary2,
                          AppIcons.calenderIcon,
                          width: 16,
                          height: 16,),
                        SizedBox(width: 5,),
                        Text("16 May 2025",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,letterSpacing: 0.2),),
                        Spacer(),
                        Text("10:25pm",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,letterSpacing: 0.2),),
                      ],
                    ),
                  ),
                  SizedBox(height: 18,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AppButton(
                        text: "View Overview",
                        onPressed: (){
                          Get.toNamed("/book_overview",id: NavIds.profile);
                    }),
                  ),


                ],
              ),
            );
  }

  Container speech_to_talk() {
    return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                  color: ShadowColor.shadowColors1.withOpacity(0.10), // Shadow color
                                  blurRadius: 4, // Softness
                                  spreadRadius: 0,
                                  offset: Offset(0, 3), // Position of shadow
                                  blurStyle: BlurStyle.normal
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: speechController.textController,
                            maxLines: 1,
                            style: const TextStyle(
                              color: TextColors.neutral900,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "Talk to us or write it!",
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: TextColors.neutral500,
                              ),
                              filled: true,
                              fillColor: Appcolors.primary,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 12.w,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (speechController.isListening.value)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: AnimatedWaveform(),
                                      ),
                                    ),
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      AppIcons.micIcon,
                                      color: speechController.isListening.value
                                          ? Appcolors.action
                                          : Appcolors.primaryInverted,
                                    ),
                                    onPressed: () {
                                      speechController.toggleListening();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
  }

  Widget _buildFileItem(Map<String, dynamic> file, int index) {
    final fileController = Get.find<FileUploadController>();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.only(top: 3, left: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Appcolors.primary,
            boxShadow: [
              BoxShadow(
                color: ShadowColor.shadowColors1.withOpacity(0.10),
                offset: const Offset(0, 3),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      file['name'] ?? '',
                      style: const TextStyle(
                        color: TextColors.neutral900,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: "Inter",
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      file['size'] ?? '',
                      style: const TextStyle(
                        fontSize: 10,
                        color: TextColors.neutral900,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ),
              if (file['isUploading'] != true)
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: SvgPicture.asset(
                    AppIcons.deleteIcon,
                    color: TextColors.neutral900,
                    height: 16,
                    width: 16,
                  ),
                  onPressed: () => fileController.removeFile(index),
                ),
            ],
          ),
        ),

        if (file['isUploading'] == true || file['error'] == true)
          _buildUploadStatus(file),
      ],
    );
  }

  Widget _buildUploadStatus(Map<String, dynamic> file) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color:ShadowColor.shadowColors1.withOpacity(0.10),
            offset: const Offset(0, 3),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    file['name'] ?? 'file.pdf',
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.close, size: 16, color: TextColors.neutral500),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: LinearProgressIndicator(
              value: file['progress'] ?? 0.0,
              minHeight: 4,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                getProgressColor(file['progress'] ?? 0.0, file['error'] == true),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getProgressColor(double progress, bool hasError) {
    if (hasError) return Colors.red;
    if (progress < 0.3) return Colors.blue;
    if (progress < 0.7) return Colors.orange;
    return Colors.green;
  }

}

