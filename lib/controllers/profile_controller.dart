import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';


class ProfileController extends GetxController{
  RxString base64CompressedImage = ''.obs;
  RxString studentAddPath = ''.obs;

  Future<File?> pickAddImage(ImageSource source)async{
    final XFile? pickedFile = await ImagePicker().pickImage(source: source);
    if(pickedFile==null)return null;
    final extension = pickedFile.path.split('.').last.toLowerCase();
    if(!['jpg','jpeg','png'].contains(extension)){
      Get.snackbar("Invalid Format","Only JPG, JPEG , PNG files are allowed.");
      return null;
    }
    File originalfile= File(pickedFile.path);
    File compressedFile = await compressImage(originalfile);
    final bytes = await compressedFile.readAsBytes();
    base64CompressedImage.value = base64Encode(bytes);
    studentAddPath.value = compressedFile.path;


    return compressedFile;
  }
  
  
  Future<File> compressImage(File file)async{
    final targetPath = file.path.replaceFirst(RegExp(r'\.(jpg|jpeg|png|webp|heic)$'), '_compressed.jpg');
    final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path, 
      targetPath,
      quality: 70,
      format: CompressFormat.jpeg,
    );
    if(result == null){
      print("⚠️ Compression failed. Using original image.");
      return file;
    }
    return File(result.path);
  }
}