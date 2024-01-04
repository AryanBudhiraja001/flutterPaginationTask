

import 'package:flutter_task/core/authManager.dart';
import 'package:flutter_task/screen/loginScreen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  AuthenticationManager  authenticationManager = Get.put(AuthenticationManager());
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      authenticationManager.checkLoginStatus();
    });
  }


}