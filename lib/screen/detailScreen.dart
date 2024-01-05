import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_task/controller/homeController.dart';
import 'package:flutter_task/extras/constant/app_constant.dart';
import 'package:flutter_task/themes/colors/color_dark.dart';
import 'package:get/get.dart';
int id = 0;


class DetailScreen extends StatelessWidget {
  var controller = Get.find<HomeController>();


var data;
  DetailScreen({super.key,this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorDark.activeColor,
        centerTitle: true,

        title:  Text("Detail Screen",textAlign: TextAlign.center,style: TextStyle(color: ColorDark.white,fontSize: textSizeNormal,fontWeight: FontWeight.w700),),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () async {
             await controller.showNotification(title: data['name'],body: data['exchange']);
           },
            child: Card(
              child:Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    // SizedBox(width: 20),

                    Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // width: 230,
                              margin: EdgeInsets.only(top: 5,bottom: 5),
                              child: Text(' ${data['symbol']}',
                                maxLines: 3,
                                style: TextStyle(color: ColorDark.collegeText,fontWeight: FontWeight.w500,fontSize: textSizeLargeMedium),),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 5,bottom: 5),
                              child: Text("${data['name']}",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.collegeText,fontSize: textSizeSmallest)),
                            ),
                            SizedBox(height: 5,),

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text("Price -",style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: sizeSmall)),
                                  ),
                                  SizedBox(width: 20,),
                                  Container(
                                    child: Text('${data['price']}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: sizeSmall)),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text('Exchange -',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: sizeSmall)),
                                  ),
                                  SizedBox(width: 20,),
                                  Container(
                                    child: Text('${data['exchange']}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: sizeSmall)),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                    ),

                    Spacer(),

                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}

//
//
//final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
//
// @override
// void initState() {
//   super.initState();
//   _isAndroidPermissionGranted();
//   _requestPermissions();
//
// }
//
//
//
//
// Future<void> _showNotification({String? title,String? body}) async {
//   const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//       'your channel id', 'your channel name',
//       channelDescription: 'your channel description',
//       icon: '@mipmap/ic_launcher',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker');
//   const NotificationDetails notificationDetails =
//   NotificationDetails(android: androidNotificationDetails );
//   await flutterLocalNotificationsPlugin.show(0, '${title}', '${body}', notificationDetails, payload: 'item x');
// }
//
//
//
//
//
// Future<void> _isAndroidPermissionGranted() async {
//   if (Platform.isAndroid) {
//     final bool granted = await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//         ?.areNotificationsEnabled() ??
//         false;
//
//
//   }
// }
//
// Future<void> _requestPermissions() async {
//   if (Platform.isIOS || Platform.isMacOS) {
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   } else if (Platform.isAndroid) {
//     final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
//
//     final bool? grantedNotificationPermission =
//     await androidImplementation?.requestNotificationsPermission();
//
//   }
// }