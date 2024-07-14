import 'package:animate_do/animate_do.dart';
import 'package:credit_card/constant/language.dart';
import 'package:credit_card/constant/root.dart';
import 'package:credit_card/constant/setting.dart';
import 'package:credit_card/widget/customButton.dart';
import 'package:credit_card/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 7,
          shadowColor: Root.primary,
          centerTitle: true,
          title: CustomText(
              colors: Root.primary,
              data: "13".tr,
              fontWeight: FontWeight.w700,
              size: Root.headertextsize),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: Root.iconSize,
                color: Root.primary,
              ),
            ),
          ),
        ),
        backgroundColor: Root.bgprimary,
        body: Directionality(
          // تحقق من التطبيق عربي او انكليزي
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    width: 250,
                    height: 250,
                    child: Center(
                      child: LottieBuilder.asset(
                        Root.lock,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                      FadeInLeft(
                  duration: Root.duration,
                  child: Container(
                    width: Get.width * 0.9,
                    margin: const EdgeInsets.only(top: 18),
                    child: Material(
                      elevation: 6,
                      shadowColor: Root.primary,
                      borderRadius: BorderRadius.circular(30),
                      child: TextFormField(
                         
                          //  التحكم
                          controller: ChangePasswordClass.key2,
                          style: TextStyle(
                              fontSize: Root.textsize,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          cursorColor: Root.primary,
                          decoration: InputDecoration(
                            labelText: "39".tr,
                            labelStyle: TextStyle(
                                fontSize: Root.textsize,
                                color: Root.primary,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Root.primary,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                          ),
                        ),
                      
                    ),
                  ),
                ),

                // اعادة تعيين كلمة المرور
                FadeInLeft(
                  duration: Root.duration,
                  child: Container(
                    width: Get.width * 0.9,
                    margin: const EdgeInsets.only(top: 18),
                    child: Material(
                      elevation: 6,
                      shadowColor: Root.primary,
                      borderRadius: BorderRadius.circular(30),
                      child: Form(
                        key: ChangePasswordClass.formkey,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "33".tr;
                            } else if (RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])')
                                    .hasMatch(value) &&
                                ChangePasswordClass.key1.text.length >= 8) {
                              return null;
                            }
                            return "32".tr;
                          },
                          //  التحكم
                          controller: ChangePasswordClass.key1,
                          style: TextStyle(
                              fontSize: Root.textsize,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          cursorColor: Root.primary,
                          decoration: InputDecoration(
                            labelText: "30".tr,
                            labelStyle: TextStyle(
                                fontSize: Root.textsize,
                                color: Root.primary,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Root.primary,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // تآكيد كلمة المرور
                FadeInLeft(
                  duration: Root.duration,
                  child: Container(
                    width: Get.width * 0.9,
                    margin: const EdgeInsets.only(top: 18),
                    child: Material(
                      elevation: 6,
                      shadowColor: Root.primary,
                      borderRadius: BorderRadius.circular(30),
                      child: Form(
                        key: ChangePasswordClass.formkeycheck,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "33".tr;
                            } else if (ChangePasswordClass.key1.text ==
                                ChangePasswordClass.key2.text) {
                              return null;
                            }
                            return "32".tr;
                          },
                          //  التحكم
                          controller: ChangePasswordClass.key2,
                          style: TextStyle(
                              fontSize: Root.textsize,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          cursorColor: Root.primary,
                          decoration: InputDecoration(
                            labelText: "31".tr,
                            labelStyle: TextStyle(
                                fontSize: Root.textsize,
                                color: Root.primary,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Root.primary,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // زر تغيير كلمة السر
                FadeInDown(
                    duration: Root.duration,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child:
                          // تصميم زر
                          CustomButton(
                        data: "35".tr,
                        onTap: () {
                          if (ChangePasswordClass.formkey.currentState!
                                  .validate() &&
                              ChangePasswordClass.formkeycheck.currentState!
                                  .validate()) {}
                        },
                        color: Root.primary,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
