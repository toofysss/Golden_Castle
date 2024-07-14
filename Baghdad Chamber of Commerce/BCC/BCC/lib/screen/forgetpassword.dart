import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/custombutton.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

// كلمة السر
class ForgetPasswrod extends StatefulWidget {
  const ForgetPasswrod({super.key});

  @override
  State<ForgetPasswrod> createState() => _ForgetPasswrodState();
}

class _ForgetPasswrodState extends State<ForgetPasswrod>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final formkey = GlobalKey<FormState>();
  final formkeycheck = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 5),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        //  رجوع
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: All.arrowsize,
              color: Colors.white,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Scaffold(
          backgroundColor: Colors.white,
          body: Directionality(
            // تحقق من التطبيق عربي او انكليزي
            textDirection: LanguageClass.lang.text == "English"
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      //  المتحركة
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, child) {
                          return ClipPath(
                            clipper: DrawClip(_controller.value),
                            child: Container(
                              height: Get.height * 0.5,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [All.color2, All.color1]),
                              ),
                            ),
                          );
                        },
                      ),
                      // صورة داخل المتحركة
                      Container(
                          padding: const EdgeInsets.only(bottom: 60),
                          child: CircleAvatar(
                            radius: 110,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(All.splashImage),
                          )),
                    ],
                  ),
                  // اعادة تعيين كلمة المرور
                  FadeInLeft(
                    duration: All.duration,
                    child: Container(
                      width: Get.width * 0.9,
                      margin: const EdgeInsets.only(top: 18),
                      child: Material(
                        elevation: 6,
                        shadowColor: All.color1,
                        borderRadius: BorderRadius.circular(30),
                        child: Form(
                          key: formkey,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "82".tr;
                              } else if (RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])')
                                      .hasMatch(value) &&
                                  ForgetPasswordClass.key1.text.length >= 8) {
                                return null;
                              }
                              return "81".tr;
                            },
                            //  التحكم
                            controller: ForgetPasswordClass.key1,
                            style: TextStyle(
                                fontSize: All.textfieldsize,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            cursorColor: All.color1,
                            decoration: InputDecoration(
                              labelText: "68".tr,
                              labelStyle: TextStyle(
                                  fontSize: All.textfieldsize,
                                  color: All.color1,
                                  fontWeight: FontWeight.bold),
                              hintText: "68".tr,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: All.color1,
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
                    duration: All.duration,
                    child: Container(
                      width: Get.width * 0.9,
                      margin: const EdgeInsets.only(top: 18),
                      child: Material(
                        elevation: 6,
                        shadowColor: All.color1,
                        borderRadius: BorderRadius.circular(30),
                        child: Form(
                          key: formkeycheck,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "82".tr;
                              } else if (ForgetPasswordClass.key1.text ==
                                  ForgetPasswordClass.key2.text) {
                                return null;
                              }
                              return "83".tr;
                            },
                            //  التحكم
                            controller: ForgetPasswordClass.key2,
                            style: TextStyle(
                                fontSize: All.textfieldsize,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            cursorColor: All.color1,
                            decoration: InputDecoration(
                              labelText: "69".tr,
                              labelStyle: TextStyle(
                                  fontSize: All.textfieldsize,
                                  color: All.color1,
                                  fontWeight: FontWeight.bold),
                              hintText: "69".tr,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: All.color1,
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
                      duration: All.duration,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child:
                            // تصميم زر
                            CustomButton(
                                data: "70".tr,
                                onTap: () {
                                  if (formkey.currentState!.validate() &&
                                      formkeycheck.currentState!.validate()) {
                                    ForgetPasswordClass.confirm.isEmpty
                                        ? ForgetPasswordClass.change(
                                            context, All.azbaranum.text)
                                        : ForgetPasswordClass.change(context,
                                            ForgetPasswordClass.azbaranum);

                                    AwesomeDialog(
                                            context: context,
                                            animType: AnimType.scale,
                                            dialogType: DialogType.success,
                                            body: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Center(
                                                child: CustomText(
                                                    color: Colors.black,
                                                    data: "95".tr,
                                                    size: All.textsize),
                                              ),
                                            ),
                                            btnCancelColor: Colors.green,
                                            btnCancelText: "105".tr,
                                            btnCancelOnPress: () {})
                                        .show();
                                  }
                                }),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// شكل المتحركة
class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
