import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_task/core/authManager.dart';
import 'package:flutter_task/extras/constant/common_laoder.dart';
import 'package:flutter_task/screen/homeScreen.dart';
import 'package:flutter_task/services/repo/common_repo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  var emailError = false.obs;
  var passwordError = false.obs;
  AuthenticationManager  authenticationManager = Get.put(AuthenticationManager());
  final formKey = GlobalKey<FormState>();
  var clientIdCont = TextEditingController().obs;
  var passwordCont = TextEditingController().obs;
  final storage = GetStorage();
  var hidePassword = true.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // clientIdCont.value.text = "testing.test3215@gmail.com";
    // passwordCont.value.text = "12345678";
  }

  onChange(){
    hidePassword.value = ! hidePassword.value;
    update();
  }
  bool isEmailValid(String email) {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }


  loginFunction({String username='',String password='',})async {
    Utils(Get.context!).startLoading();
    var loginResponse = await ApiController().loginUser(username,password);
    print("status");
    print("response ${jsonEncode(loginResponse.data)}");
    if(loginResponse.code.toString()=="000"){
      Utils(Get.context!).stopLoading();
      authenticationManager.login(jsonEncode(loginResponse));
      Get.offAll(()=>  HomeScreen());

    }else if(loginResponse.code!="000"){
      Utils(Get.context!).stopLoading();
      Get.showSnackbar(
        GetSnackBar(
          title: '',
          message: loginResponse.message??"",
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }










  ///validation(BuildContext context) {
  validation() {
      if (formKey.currentState!.validate()) {
        loginFunction(username: clientIdCont.value.text, password: passwordCont.value.text);
      }

  }



}