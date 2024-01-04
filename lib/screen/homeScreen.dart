import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_task/controller/homeController.dart';
import 'package:flutter_task/extras/constant/app_constant.dart';
import 'package:flutter_task/extras/constant/app_images.dart';
import 'package:flutter_task/themes/colors/color_dark.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   var homeController = Get.put(HomeController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(()=> Column(
          children: [
            Container(

              height: 120,
              padding: EdgeInsets.only(left: 20,right: 20,top: 20),
              decoration: BoxDecoration(
                color: ColorDark.activeColor,
              ),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: Container(
                      ),
                    ),
                    Spacer(),

                    /// Heigth remove in container

                    Container(
                      height: 30,
                      margin: EdgeInsets.only(left: 20),
                      child: Text("HomeScreen",textAlign: TextAlign.center,style: TextStyle(color: ColorDark.white,fontSize: textSizeNormal,fontWeight: FontWeight.w700),),
                    ),

                    Spacer(),



                    InkWell(
                      onTap: (){
                        showAlertDialog(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          ImageConstant.imgLogout,color: Colors.white,
                          height: 30,
                          width: 30, fit: BoxFit.fill,

                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Visibility(
              visible: homeController.firstLoading.value,
              child: Container(
                   margin: EdgeInsets.only(top: Get.height*0.4),
                   child: Text("loading...",style: TextStyle(fontSize: textSizeLarge),),
                 ),
            ),

            homeController.tenDataList!=null?
            Container(
                  child: Column(
                    children: [
                      Container(
                        height: Get.height*0.8,
                        width: double.infinity,
                        child:
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          controller: homeController.scrollController,
                          itemCount: homeController.tenDataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              /// margin: EdgeInsets.all(10),
                             // margin: EdgeInsets.only(left: 5,right: 5),
                              child: Card(
                                color: ColorDark.cardColor,
                                child: Container(
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
                                                child: Text('${index+1} ${homeController.dataList[index]['symbol']}',
                                                  maxLines: 3,
                                                  style: TextStyle(color: ColorDark.collegeText,fontWeight: FontWeight.w500,fontSize: 15),),
                                              ),

                                              // Container(
                                              //   //width: 200,
                                              //   padding: EdgeInsets.all(5),
                                              //   decoration: BoxDecoration(
                                              //     color: ColorDark.LatestThemeColor,
                                              //   ),
                                              //   child: Row(
                                              //     crossAxisAlignment: CrossAxisAlignment.center,
                                              //     //mainAxisAlignment: MainAxisAlignment.center,
                                              //     children: [
                                              //       Image.asset(ImageConstant.greyIconCollege,height:15,width: 15,fit: BoxFit.fill,color: ColorDark.colorWhite,),
                                              //       SizedBox(width: 10,),
                                              //       Text('Mcquaire University',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.colorWhite,fontSize:textSizeSmallest ),),
                                              //     ],
                                              //   ),
                                              // ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5,bottom: 5),
                                                child: Text("${homeController.dataList[index]['name']}",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.collegeText,fontSize: textSizeSmallest)),
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
                                                      child: Text('${homeController.dataList[index]['price']}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: sizeSmall)),
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
                                                      child: Text('${homeController.dataList[index]['exchange']}',style: TextStyle(fontWeight: FontWeight.w500,color: ColorDark.black,fontSize: sizeSmall)),
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
                            );
                          },
                        ),

                      ),
                      Visibility(
                        visible: homeController.isLoading.value,
                        child: Container(child: CircularProgressIndicator(),
                        ),
                      )
                    ],
                  ),
                ):SizedBox()

          ],
        ),),
      ),
    );
  }



   showAlertDialog(BuildContext context) {
     Widget okButton = TextButton(
       child: Text("Yes"),
       onPressed: () {
         homeController.manager.logOut();
       },
     );
     Widget noButton = TextButton(
       child: Text("No"),
       onPressed: () {
         Get.back();
         // dashboardData.manager.logOut();
       },
     );
     // set up the AlertDialog
     AlertDialog alert = AlertDialog(
       content: Text("Are you sure you want to logout?"),
       actions: [
         okButton,
         noButton,

       ],
     );


     showDialog(
       context: context,
       builder: (BuildContext context) {
         return alert;
       },
     );
   }
}
