import 'dart:convert';
import 'package:flutter_task/core/cacheManager.dart';
import 'package:flutter_task/model/loginResponse.dart';
import 'package:flutter_task/screen/homeScreen.dart';
import 'package:flutter_task/screen/loginScreen.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';




class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  LoginResponse response = LoginResponse();

  void logOut() {
    isLogged.value = false;
    Get.offAll(()=> LoginDesign());
    removeLoginResponse();
  }

  void login(String? token) async {
    await saveLoginResponse(token);
  }


  //  getLoginDataResponse() {
  //   var loginResponse = getLoginResponse();
  //   if (loginResponse != null) {
  //      print("check login userData" + json.decode(json.encode(getLoginResponse())));
  //     var responseData = json.decode(json.encode(getLoginResponse()));
  //     return  LoginResponse.fromJson(jsonDecode(responseData));
  //   }
  // }

  void checkLoginStatus() {
    var loginResponse = getLoginResponse();
    if (loginResponse != null) {
       var responseData = json.decode(json.encode(getLoginResponse()));
       response = LoginResponse.fromJson(jsonDecode(responseData));
       Get.offAll(()=> HomeScreen());
    }else{
      Get.offAll(()=> LoginDesign());
    }
  }


  getDataStatus() {
    var token = getLoginResponse();
    if (token != null) {
      var responseData = json.decode(json.encode(getLoginResponse()));
      response = LoginResponse.fromJson(jsonDecode(responseData));
    }
    return response;
  }



}