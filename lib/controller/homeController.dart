

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task/core/authManager.dart';
import 'package:flutter_task/extras/constant/common_laoder.dart';
import 'package:flutter_task/model/dashboadModel.dart';
import 'package:flutter_task/services/repo/common_repo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AuthenticationManager manager = Get.put(AuthenticationManager());
  final scrollController = ScrollController();
  int i=0;
  int j=10;
  List dataList =[].obs;
  List tenDataList =[].obs;
  var isLoading = false.obs;
  var response;
  var firstLoading = false.obs;





  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loginFunction();
    scrollController.addListener(_loadMore);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }




  loginFunction() async {
    firstLoading.value = true;
   //Utils(Get.context!).startLoading();
    var loginResponse = await ApiController().listingData();
    print("json "+jsonEncode(loginResponse));
    if (loginResponse.toString() != null) {
     // Utils(Get.context!).stopLoading();
      dataList.addAll(loginResponse);

      tenDataList.addAll(dataList.sublist(i,j));
      print("length   ${dataList.length}");
      firstLoading.value = false;
    } else {
     // Utils(Get.context!).stopLoading();
    }

    update();
  }



  void _loadMore() {
    isLoading.value = true;
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if(j < dataList.length){
        i=j;
        j=j+10;
        tenDataList.addAll(dataList.sublist(i,j));
        //tenDataList =  dataList.sublist(i,j);
        isLoading.value = false;
      }

    }
    update();
  }


}