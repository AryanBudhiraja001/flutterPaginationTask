

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_task/core/authManager.dart';
import 'package:flutter_task/extras/constant/common_laoder.dart';
import 'package:flutter_task/model/dashboadModel.dart';
import 'package:flutter_task/services/repo/common_repo.dart';
import 'package:get/get.dart';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

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
    _isAndroidPermissionGranted();
    _requestPermissions();
    loginFunction();
    scrollController.addListener(_loadMore);
  }

  Future<void> showNotification({String? title,String? body}) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription: 'your channel description',
        icon: '@mipmap/ic_launcher',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails );
    await flutterLocalNotificationsPlugin.show(0, '${title}', '${body}', notificationDetails, payload: 'item x');
  }


  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.areNotificationsEnabled() ??
          false;
    }
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

      final bool? grantedNotificationPermission =
      await androidImplementation?.requestNotificationsPermission();

    }
  }



  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }




  loginFunction() async {
    firstLoading.value = true;

    var loginResponse = await ApiController().listingData();
    print("json "+jsonEncode(loginResponse));
    if (loginResponse.toString() != null) {
      dataList.addAll(loginResponse);
      tenDataList.addAll(dataList.sublist(i,j));
      print("length   ${dataList.length}");
      firstLoading.value = false;
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
        isLoading.value = false;
      }

    }
    update();
  }


}