

import 'package:flutter/material.dart';
import 'package:flutter_task/controller/loginController.dart';
import 'package:flutter_task/extras/constant/app_constant.dart';
import 'package:flutter_task/extras/constant/app_images.dart';
import 'package:flutter_task/themes/colors/color_dark.dart';
import 'package:get/get.dart';

class LoginDesign extends StatelessWidget {
  var loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.redBackground),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Form(
                  key: loginController.formKey,
                  child: Container(
                    margin: EdgeInsets.only(top: 200),
                    height: Get.height*0.8,
                    child: Card(
                      elevation: 16,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top:30,left: 20,right: 20),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10,top: 20),
                              alignment: Alignment.centerLeft,
                              child: Text(emailText,style: TextStyle(color: ColorDark.ThemeColor,fontWeight: FontWeight.w600,),),
                            ),

                            Obx(() =>
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: loginController.clientIdCont.value,
                                  onSaved: (input) => loginController.clientIdCont.value.text = input!,
                                  validator: (value) {
                                    if (!loginController.isEmailValid(value!)) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusColor: Colors.white,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    hintText: emailText,
                                    hintStyle: const TextStyle(color: Colors.grey),
                                  ),
                                ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              margin: EdgeInsets.only(left: 10,),
                              alignment: Alignment.centerLeft,
                              child: Text(passwordText,style: TextStyle(color: ColorDark.ThemeColor,fontWeight: FontWeight.w600,),),
                            ),

                            Obx(() =>
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: loginController.passwordCont.value,
                                  onSaved: (input) => loginController.passwordCont.value.text = input!,
                                  validator: (input) => input!.length < 3 ? 'please enter password' : null,


                                  obscureText: loginController.hidePassword.value,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusColor: Colors.white,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        loginController.hidePassword.value
                                            ? Icons.visibility_off:Icons.visibility,
                                        color: Theme.of(context).primaryColorDark,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        loginController.onChange();
                                      },
                                    ),

                                    //InfixI: loginController.hidePassword.value?Icon(Icons.visibility_off):Icon(Icons.visibility),
                                    hintText: passwordText,
                                    hintStyle: const TextStyle(color: Colors.grey),
                                  ),

                                ),
                            ),



                            SizedBox(height: 20,),

                            Container(
                              margin: EdgeInsets.only(right:10),
                              alignment: Alignment.centerRight,
                              child: Text('Forgot Password?',style: TextStyle(fontWeight: FontWeight.w600),),
                            ),

                            SizedBox(height: 40,),

                            InkWell(
                              onTap: (){
                                loginController.validation();
                                //loginController.validation(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 25,right: 25,),
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: ColorDark.activeColor,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                alignment: Alignment.center,
                                child: Text('Login',style: TextStyle(fontSize: 18,color: ColorDark.white,fontWeight: FontWeight.w700),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),



              ],
            )

          ],
        ),
      ),
    );
  }




}