import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class FileUploadController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var files = <Map<String, dynamic>>[].obs;
  final itemx = <String>[].obs;

  var selectedIndex = 0.obs;

  void toggle(int index) {
    selectedIndex.value = index;
  }

  // Request required permissions
  Future<void> requestPermissions() async {
    await Permission.storage.request();
    if (Platform.isAndroid) {
      await Permission.manageExternalStorage.request();
    }
  }

  // Pick files and upload
  Future<void> pickAndUploadFiles({List<String>? allowedExtensions}) async {
    await requestPermissions();

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: allowedExtensions != null ? FileType.custom : FileType.any,
      allowedExtensions: allowedExtensions,
      allowMultiple: true,
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      for (var platformFile in result.files) {
        if (platformFile.path == null) continue;

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
  }

  // Upload file to backend
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
    } catch (_) {
      files[index]['isUploading'] = false;
      files[index]['error'] = true;
    }
    files.refresh();
  }

  // Remove file
  void removeFile(int index) => files.removeAt(index);

  // Format file size for UI
  String _formatFileSize(int bytes) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB"];
    int i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(2)} ${suffixes[i]}';
  }


  @override
  void onClose() {
    selectedIndex.close();
    // TODO: implement onClose
    super.onClose();
  }
}
