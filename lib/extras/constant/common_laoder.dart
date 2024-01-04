import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  late BuildContext context;
  Utils(this.context);

  // this is where you would do your fullscreen loading
  Future<void> startLoading() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent, // can change this to your prefered color
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      },
    );
  }

  Future<void> stopLoading() async {
    //Navigator.pop(Get.overlayContext!, true);
    //Navigator.of(Get.overlayContext!).pop();
    // Get.back();
     Navigator.of(context).pop();
  }
  Future<void> showError(Object? error) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        backgroundColor: Colors.red,
        content: Text(''),
      ),
    );
  }
}


class CommonLoading {

  static Future<void> startloading(){
   return Get.defaultDialog(
      //title: Text('payment_method'.tr).data!,
      content: const SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent, // can change this to your prefered color
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        ),
    );

  }

  static Future<void> stopLoading() async {
     Get.back();
  }

}