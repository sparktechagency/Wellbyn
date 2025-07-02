import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class FileUploadController extends GetxController {
  var files = <Map<String, dynamic>>[].obs;

  void removeFile(int index) {
    files.removeAt(index);
  }

  Future<void> requestPermissions() async {
    await Permission.microphone.request();
    await Permission.storage.request();
    if (Platform.isAndroid) {
      await Permission.manageExternalStorage.request();
    }
  }

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


  Future<void> pickAndUploadPDF() async {
    await requestPermissions();

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

      files.add({
        'name': fileName,
        'size': _formatFileSize(fileSize),
        'file': file,
        'isUploading': true,
        'progress': 0.0,
        'uploadedAt': DateFormat('MMM d, yyyy – HH:mm').format(DateTime.now()),
      });

      int index = files.length - 1;
      await _uploadFile(file, fileName, index);

    }
  }

  Future<void> _uploadFile(File file, String fileName, int index) async {
    try {
      String uploadUrl = 'YOUR_UPLOAD_ENDPOINT';
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
      });

      Dio dio = Dio();

      await dio.post(
        uploadUrl,
        data: formData,
        onSendProgress: (int sent, int total) {
          files[index]['progress'] = sent / total;
          files.refresh();
        },
      );

      files[index]['isUploading'] = false;
      files[index]['uploaded'] = true;
      files.refresh();
    } catch (e) {
      files[index]['isUploading'] = false;
      files[index]['error'] = true;
      files.refresh();
    }
  }

  void deleteFile(int index) {
    files.removeAt(index);
  }

  String _formatFileSize(int bytes) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB"];
    int i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(2)} ${suffixes[i]}';
  }
}
