import 'dart:developer' hide log;
import 'dart:io';
import 'dart:math' show log, pow;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:wellbyn/controllers/book_report_controller.dart';
import 'package:wellbyn/utils/app_icons.dart';
import 'package:wellbyn/views/screen/doctor/widget/animationwave.dart';

import '../../../controllers/speed_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/nab_ids.dart';
import 'package:file_picker/file_picker.dart';

class BookReport extends StatefulWidget {
  BookReport({super.key});

  @override
  State<BookReport> createState() => _BookReportState();
}

class _BookReportState extends State<BookReport> {
  final BookReportController controller = Get.put(BookReportController());
  final SpeechToText _speechToText = SpeechToText();
  TextEditingController problem = TextEditingController();

  late SpeechController speechController;
  List<Map<String, dynamic>> files = [];
  bool isUploading = false;

  @override
  void initState() {
    super.initState();
    speechController = Get.put(SpeechController(speech: _speechToText));
    _requestMicPermission();
  }

  void _requestMicPermission() async {
    final micStatus = await Permission.microphone.request();
    final storageStatus = await Permission.storage.request();

    if (!micStatus.isGranted) {
      print("Mic permission not granted.");
    }
    if (!storageStatus.isGranted) {
      print("Storage permission not granted.");
    }
  }


  Future<void> pickAndUploadPDF() async {
    try {
      if (Platform.isAndroid) {
        // Request Storage permission
        bool storageGranted = await Permission.storage.request().isGranted;

        // For Android 11+, request Manage External Storage permission
        bool manageGranted = true;
        if (await Permission.manageExternalStorage.isDenied) {
          manageGranted = await Permission.manageExternalStorage.request().isGranted;
        }

        if (!storageGranted || !manageGranted) {
          // Show snackbar with message and optionally open settings if permanently denied
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Storage permission is required to select files'),
              action: SnackBarAction(
                label: 'Settings',
                onPressed: () => openAppSettings(),
              ),
            ),
          );
          return;
        }
      }

      // Proceed to pick file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowCompression: true,
        withData: true,
      );

      if (result != null && result.files.isNotEmpty) {
        PlatformFile platformFile = result.files.first;
        if (platformFile.path == null) return;

        File file = File(platformFile.path!);
        String fileName = platformFile.name;
        int fileSize = platformFile.size;

        setState(() {
          files.add({
            'name': fileName,
            'size': _formatFileSize(fileSize),
            'file': file,
            'isUploading': true,
            'progress': 0.0,
          });
        });

        await _uploadFile(file, fileName, files.length - 1);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking file: ${e.toString()}')),
      );
    }
  }



  Future<void> _uploadFile(File file, String fileName, int index) async {
    try {
      String uploadUrl = 'YOUR_UPLOAD_ENDPOINT'; // Replace with your API

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
      });

      Dio dio = Dio();

      setState(() {
        files[index]['isUploading'] = true;
      });

      await dio.post(
        uploadUrl,
        data: formData,
        onSendProgress: (int sent, int total) {
          setState(() {
            files[index]['progress'] = sent / total;
          });
        },
      );

      setState(() {
        files[index]['isUploading'] = false;
        files[index]['uploaded'] = true;
      });
    } catch (e) {
      setState(() {
        files[index]['isUploading'] = false;
        files[index]['error'] = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload failed: ${e.toString()}')),
      );
    }
  }

  void _deleteFile(int index) {
    setState(() {
      files.removeAt(index);
    });
    // Call your API to delete from server if needed
  }

  String _formatFileSize(int bytes) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB"];
    int i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(2)} ${suffixes[i]}';
  }

  Widget _buildFileItem(Map<String, dynamic> file, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      file['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Satoshi",
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      file['size'],
                      style: TextStyle(
                        fontFamily: "Satoshi",
                      ),
                    ),
                  ],
                ),
              ),
              if (file['isUploading'] != true)
                IconButton(
                  icon: SvgPicture.asset(
                    AppIcons.deleteIcon,
                    color: Colors.red,
                  ),
                  onPressed: () => _deleteFile(index),
                ),
            ],
          ),
          if (file['isUploading'] == true) ...[
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: file['progress'],
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 4),
            Text(
              '${(file['progress'] * 100).toStringAsFixed(1)}%',
              style: TextStyle(
                fontSize: 12,
                fontFamily: "Satoshi",
              ),
            ),
          ],
          if (file['error'] == true)
            Text(
              'Upload failed',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontFamily: "Satoshi",
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Additional Report",
          style: TextStyle(
            fontSize: 22,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => CustomDropdownDialog(
                items: controller.items,
                selectedValue: controller.selectedValue.value,
                onChanged: (newValue) {
                  controller.setSelected(newValue);
                },
              )),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Appcolors.primary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        offset: Offset(0, 0.03),
                        blurRadius: 20,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          )),
                      SizedBox(height: 8),
                      Obx(() => TextField(
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
                              horizontal: 16, vertical: 12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Appcolors.disabled),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: TextColors.neutral900, width: 1),
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
                      )),
                      SizedBox(height: 8),
                      Text("Summary ",
                          style: TextStyle(
                            fontFamily: "Satoshi",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
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
                                horizontal: 16, vertical: 12),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Appcolors.disabled),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  color: TextColors.neutral900, width: 1),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Documentation',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  ...files.map((file) => _buildFileItem(file, files.indexOf(file))).toList(),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: pickAndUploadPDF,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            'Add File',
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: "Satoshi",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
          backgroundColor: Appcolors.warning,
          title: Text('Select state'),
          content: Container(
            width: 150,
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
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      fontSize: 15,
                      color: isSelected ? Colors.blue : Colors.black,
                    ),
                  ),
                  trailing: isSelected
                      ? Icon(Icons.check, color: Colors.blue, size: 20)
                      : null,
                  tileColor: isSelected ? Colors.blue.withOpacity(0.1) : null,
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
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              AppIcons.arrowdwonIcon,
              color: Colors.black,
            ),
          ),
        ),
        child: Text(
          _selectedValue ?? 'Select state',
          style: TextStyle(
            color: _selectedValue == null ? Colors.grey[600] : Colors.black,
            fontWeight: _selectedValue == null ? FontWeight.normal : FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}