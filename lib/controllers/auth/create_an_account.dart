import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class CreateAnAccount extends GetxController {

  TextEditingController emailCtlr = TextEditingController();
  TextEditingController passWordCtlr = TextEditingController();
  TextEditingController confirmPassCtlr = TextEditingController();

  RxBool isLoading =false.obs;



  //>=================> register the user all code and api cal <======================//
  Future<void> registerUser(String email,String password) async{
    final String url = 'https://nimur3000.sobhoy.com/api/v1/auth/register';
    isLoading.value = true;

    //>============> body pass herer all text and information <======================//
    var body = {'email':emailCtlr.text.trim(),'password':passWordCtlr.text};
    Map<String ,String> headers ={
      'Content-Type': 'application/json',
    };
    try{

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body)
      );

      if(response.statusCode ==200){
        //print("body:${response.body}");
        Get.snackbar("Success", "Accoun created sucessfully!");

      }else{
        //print("Error:${response.body}");
      }

    }catch(e){
      //=======> when user not the register progress indecator off<===========//
      isLoading.value = false;
      //print("Error during register:$e");
      Get.snackbar("Error", "An unexpected error occurred");

    }//============> here progress indecator is false <=======================//
    finally{
      isLoading.value = false;
    }


  }
  //=================> google sign in <=====================//



}