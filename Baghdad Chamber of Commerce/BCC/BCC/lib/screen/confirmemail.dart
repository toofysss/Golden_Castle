// ignore_for_file: library_private_types_in_public_api

import 'package:animate_do/animate_do.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/screen/forgetpassword.dart';
import 'package:coldencastle/widget/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

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

// صفحة تسجيل الدخول
class ConfirmEmail extends StatefulWidget {
  const ConfirmEmail({super.key});

  @override
  _ConfirmEmailState createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final formkey = GlobalKey<FormState>();

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
                    // // صورة داخل المتحركة
                    Container(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: CircleAvatar(
                          radius: 110,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(All.splashImage),
                        )),
                  ],
                ),

                //  التأكد من الايميل
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
                              return "91".tr;
                            } else if (ForgetPasswordClass.confirmemail.text ==
                                ForgetPasswordClass.confirm) {
                              return null;
                            } else if (ForgetPasswordClass
                                    .confirmemail.text.length <=
                                5) {
                              return "93".tr;
                            }
                            return "93".tr;
                          },
                          //  التحكم
                          controller: ForgetPasswordClass.confirmemail,
                          style: TextStyle(
                              fontSize: All.textfieldsize,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          cursorColor: All.color1,
                          decoration: InputDecoration(
                            labelText: "109".tr,
                            labelStyle: TextStyle(
                                fontSize: All.textfieldsize,
                                color: All.color1,
                                fontWeight: FontWeight.bold),
                            hintText: "109".tr,
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

                // زر تغيير كلمة السر
                FadeInDown(
                    duration: All.duration,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child:
                          // تصميم زر
                          CustomButton(
                              data: "110".tr,
                              onTap: () async {
                                if (formkey.currentState!.validate()) {
                                  if(ForgetPasswordClass.confirmemail.text ==
                                ForgetPasswordClass.confirm){
  Get.to(() => const ForgetPasswrod(),
                                      transition: Transition.fadeIn);
                                }
                         
                                }
                              }),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
