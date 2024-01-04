
import 'package:flutter/material.dart';
import 'package:flutter_task/controller/splashController.dart';
import 'package:flutter_task/extras/constant/app_constant.dart';
import 'package:flutter_task/extras/constant/app_images.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  var controller = Get.put(SplashController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
             Container(
              decoration: BoxDecoration(
                image: DecorationImage(image:  AssetImage(ImageConstant.redBackground), fit: BoxFit.cover,),
              ),
            ),
             Center(
              child: Text(welcomeText,style: TextStyle(fontSize: textSizeXXLarge,color: Colors.white,fontWeight: FontWeight.w700),),
            )
          ],
        )
    );
  }
}
