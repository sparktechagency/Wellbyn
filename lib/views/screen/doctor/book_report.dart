import 'dart:developer' hide log;
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
import 'package:wellbyn/views/base/app_button.dart';
import 'package:wellbyn/views/base/app_text.dart';
import 'package:wellbyn/views/screen/doctor/book_overview.dart';
import 'package:wellbyn/views/screen/doctor/widget/animationwave.dart';

import '../../../controllers/file_upload_controller.dart';
import '../../../controllers/speed_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/nab_ids.dart';
import 'package:file_picker/file_picker.dart';

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

  late SpeechController speechController;
  List<Map<String, dynamic>> files = [];
  bool isUploading = false;


  @override
  void initState() {
    super.initState();
    speechController = Get.put(SpeechController(speech: _speechToText));
    fileController.requestPermissions();

  }

  // void _requestMicPermission() async {
  //   final micStatus = await Permission.microphone.request();
  //   final storageStatus = await Permission.storage.request();
  //
  //   if (!micStatus.isGranted) {
  //     print("Mic permission not granted.");
  //   }
  //   if (!storageStatus.isGranted) {
  //     print("Storage permission not granted.");
  //   }
  // }
  //
  // Future<void> pickAndUploadPDF() async {
  //   try {
  //     if (Platform.isAndroid) {
  //       // Request Storage permission
  //       bool storageGranted = await Permission.storage.request().isGranted;
  //
  //       // For Android 11+, request Manage External Storage permission
  //       bool manageGranted = true;
  //       if (await Permission.manageExternalStorage.isDenied) {
  //         manageGranted = await Permission.manageExternalStorage
  //             .request()
  //             .isGranted;
  //       }
  //
  //       if (!storageGranted || !manageGranted) {
  //         // Show snackbar with message and optionally open settings if permanently denied
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text('Storage permission is required to select files'),
  //             action: SnackBarAction(
  //               label: 'Settings',
  //               onPressed: () => openAppSettings(),
  //             ),
  //           ),
  //         );
  //         return;
  //       }
  //     }
  //
  //     // Proceed to pick file
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.any,
  //       allowCompression: true,
  //       withData: true,
  //     );
  //
  //     if (result != null && result.files.isNotEmpty) {
  //       PlatformFile platformFile = result.files.first;
  //       if (platformFile.path == null) return;
  //
  //       File file = File(platformFile.path!);
  //       String fileName = platformFile.name;
  //       int fileSize = platformFile.size;
  //
  //       setState(() {
  //         files.add({
  //           'name': fileName,
  //           'size': _formatFileSize(fileSize),
  //           'file': file,
  //           'isUploading': true,
  //           'progress': 0.0,
  //         });
  //       });
  //
  //       await _uploadFile(file, fileName, files.length - 1);
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error picking file: ${e.toString()}')),
  //     );
  //   }
  // }
  //
  // Future<void> _uploadFile(File file, String fileName, int index) async {
  //   try {
  //     String uploadUrl = 'YOUR_UPLOAD_ENDPOINT'; // Replace with your API
  //
  //     FormData formData = FormData.fromMap({
  //       "file": await MultipartFile.fromFile(file.path, filename: fileName),
  //     });
  //
  //     Dio dio = Dio();
  //
  //     setState(() {
  //       files[index]['isUploading'] = true;
  //     });
  //
  //     await dio.post(
  //       uploadUrl,
  //       data: formData,
  //       onSendProgress: (int sent, int total) {
  //         setState(() {
  //           files[index]['progress'] = sent / total;
  //         });
  //       },
  //     );
  //
  //     setState(() {
  //       files[index]['isUploading'] = false;
  //       files[index]['uploaded'] = true;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       files[index]['isUploading'] = false;
  //       files[index]['error'] = true;
  //     });
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('Upload failed: ${e.toString()}')));
  //   }
  // }

  void _deleteFile(int index) {
    setState(() {
      files.removeAt(index);
    });
    // Call your API to delete from server if needed
  }

  // String _formatFileSize(int bytes) {
  //   if (bytes <= 0) return "0 B";
  //   const suffixes = ["B", "KB", "MB", "GB"];
  //   int i = (log(bytes) / log(1024)).floor();
  //   return '${(bytes / pow(1024, i)).toStringAsFixed(2)} ${suffixes[i]}';
  // }

  Widget _buildFileItem(Map<String, dynamic> file, int index) {
    final fileController = Get.find<FileUploadController>();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.only(top: 3,left: 8,),
          // reduced padding
          decoration: BoxDecoration(
            border: Border.all(color: TextColors.neutral900.withOpacity(0.14)),
            borderRadius: BorderRadius.circular(8),
            color: Appcolors.primary,
            boxShadow: [
              BoxShadow(
                color: TextColors.neutral900.withOpacity(0.10),
                offset: Offset(0.2, 0.3),
                blurRadius: 20,
              ),
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start, // tighter layout
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          file['name'],
                          style: const TextStyle(
                            color: TextColors.neutral900,
                            fontWeight: FontWeight.w500,
                            fontSize: 14, // smaller font
                            fontFamily: "Satoshi",
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),

                        Text(
                          file['size'],
                          style: const TextStyle(
                            fontSize: 10,
                            color: TextColors.neutral900,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Satoshi",
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (file['isUploading'] != true)
                    IconButton(
                      padding: EdgeInsets.zero, // remove padding around icon
                      constraints: const BoxConstraints(),
                      icon: SvgPicture.asset(
                        AppIcons.deleteIcon,
                        color: TextColors.neutral900,
                        height: 16, // reduce icon size
                        width: 16,
                      ),
                      onPressed: () => fileController.deleteFile(index),
                    ),
                ],
              ),

            ],
          ),
        ),

// Usage inside your widget:
    if (file['isUploading'] == true || file['error'] == true) ...[
    const SizedBox(height: 4),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: TextColors.neutral900.withOpacity(0.14)),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white, // <-- Set to white here
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  GestureDetector(
                    onTap: () {
                      // Handle file remove
                    },
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: TextColors.neutral500,
                    ),
                  ),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
      ),

    ]


    ],
    );
  }
  Color getProgressColor(double progress, bool hasError) {
    if (hasError) return Colors.red;
    if (progress < 0.3) return Colors.blue;
    if (progress < 0.7) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.page,
      appBar: AppBar(
        backgroundColor: Appcolors.page,
        title: Text(
          "Additional Report",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppText("Visit Reason",fontSize: 16,color: TextColors.neutral900,),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () => CustomDropdownDialog(
                  items: controller.items,
                  selectedValue: controller.selectedValue.value,
                  onChanged: (newValue) {
                    controller.setSelected(newValue);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Appcolors.primary,
                  boxShadow: [
                    BoxShadow(
                      color: TextColors.neutral900.withOpacity(0.10),
                      offset: Offset(0.2, 0.3),
                      blurRadius: 20,
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
                          fontFamily: "Satoshi",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Obx(
                        () => TextField(
                          controller: speechController.textController,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: "Satoshi",
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Talk to us or write it!',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: "Satoshi",
                            ),
                            filled: true,
                            fillColor: Appcolors.primary,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Appcolors.disabled),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: TextColors.neutral900,
                                width: 1,
                              ),
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
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Summary ",
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: problem,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: "Satoshi",
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Problem',
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontFamily: "Satoshi",
                          ),
                          filled: true,
                          fillColor: Appcolors.primary,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Appcolors.disabled),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: TextColors.neutral900,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Documentation',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Satoshi",
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

                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: () async {
                      await fileController.pickAndUploadPDF();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: TextColors.action,),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: TextColors.action),
                          SizedBox(width: 5),
                          Text(
                            'Add File',
                            style: TextStyle(
                              color: TextColors.action,
                              fontFamily: "Satoshi",

                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Current Medication',
                  style: TextStyle(
                    fontSize: 16,
                    color: TextColors.neutral900,
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: fileController.pickAndUploadPDF,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          width: 10,
                          height: 16,
                          AppIcons.shearIcon,
                          color: Appcolors.action,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Share',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                            fontFamily: "Satoshi",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Prior Diagnoses",
                    style: TextStyle(
                      fontFamily: "Satoshi",
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
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                maxLines: 6,
                borderColor: TextColors.neutral500,
                hintText: 'Search for a doctor by name or designation...',
                controller: optional,
                filColor: Appcolors.primary,
              ),
            ),
            SizedBox(height: 30),

            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Appcolors.page,
                boxShadow: [
               BoxShadow(
              color: TextColors.neutral900.withOpacity(0.25),
              offset: Offset(0.3, 0.3),
              blurRadius: 80,
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
                                  fontSize: 18,
                                  fontFamily: "Satoshi",
                                  fontWeight: FontWeight.w500,

                                )
                            ),
                            Text(
                                "Cardiology ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color:  TextColors.neutral500,
                                  fontFamily: "Satoshi",
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
                                fontSize: 14,
                                color: TextColors.neutral900,
                                fontFamily: "Satoshi",
                                fontWeight: FontWeight.w500,
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
                          color: TextColors.neutral900,
                          AppIcons.calenderIcon,
                          width: 16,
                          height: 16,),
                        SizedBox(width: 5,),
                        Text("16 May 2025"),
                        Spacer(),
                        Text("10:25pm"),
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
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdownDialog extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String> onChanged;

  const CustomDropdownDialog({
    Key? key,
    required this.items,
    this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownDialogState createState() => _CustomDropdownDialogState();
}

class _CustomDropdownDialogState extends State<CustomDropdownDialog> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  void _openDialog() async {
    final selected = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
        backgroundColor: Appcolors.page,
          title: Text('Select state',style: TextStyle(fontFamily:"Satoshi" ),),
          content: Container(
            width: 70,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = item == _selectedValue;
                return ListTile(
                  title: Text(
                    item,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      fontSize: 15,
                      color: isSelected ? Appcolors.action : Colors.black,
                    ),
                  ),
                  trailing: isSelected
                      ? Icon(Icons.check, color: Appcolors.action, size: 20)
                      : null,
                  tileColor: isSelected ? Appcolors.action.withOpacity(0.1) : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onTap: () {
                    Navigator.pop(context, item);
                  },
                );
              },
            ),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        _selectedValue = selected;
      });
      widget.onChanged(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openDialog,
      borderRadius: BorderRadius.circular(8),
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: Appcolors.primary,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Appcolors.disabled),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.redAccent, width: 2),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              AppIcons.arrowdwonIcon,
              color: TextColors.neutral900,
            ),
          ),
        ),
        child: Text(
          _selectedValue ?? 'Select state',
          style: TextStyle(
            color: _selectedValue == null ? Colors.grey[600] : Colors.black,
            fontWeight: _selectedValue == null
                ? FontWeight.normal
                : FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
