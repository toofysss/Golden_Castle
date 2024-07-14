// ignore_for_file: library_private_types_in_public_api
import 'package:animate_do/animate_do.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/custombutton.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:coldencastle/widget/customtextfield.dart';
import 'package:coldencastle/widget/customtextfieldpass.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

// صفحة تسجيل الدخول
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
     _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 5),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat(); 
    LoginClass.email.text='';
    LoginClass.password.text='';
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
                // الايميل
                FadeInLeft(
                  duration: All.duration,
                  child: Container(
                    width: Get.width * 0.9,
                    margin: const EdgeInsets.only(top: 18),
                    child:
                        // تصميم كتابة النص
                        CustomTextField(
                      controller: LoginClass.email,
                      hints: '1'.tr,
                      iconData: Icons.person,
                      textInputType: TextInputType.emailAddress,
                      readonly: false,
                    ),
                  ),
                ),
                // كلمة المرور
                FadeInRight(
                  duration: All.duration,
                  child: Container(
                    width: Get.width * 0.9,
                    margin: const EdgeInsets.only(top: 18),
                    child:
                        //  تصميم نص الكتابة
                        Customtextfieldpass(
                            controller: LoginClass.password,
                            hints: '2'.tr,
                            iconData: Icons.email),
                  ),
                ),
                // زر انشاء حساب جديد
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => RigesterClass.rigester(),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: CustomText(
                              color: All.color1,
                              data: "96".tr,
                              size: Get.width / 22)),
                    ),
                    GestureDetector(
                      onTap: () => ForgetPasswordClass.forgetpassword(context),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: CustomText(
                              color: All.color1,
                              data: "3".tr,
                              size: Get.width / 22)),
                    ),
                  ],
                ),
                // زر دخول التاجر
                FadeInDown(
                    duration: All.duration,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child:
                          // تصميم زر
                          CustomButton(
                        data: "28".tr,
                        onTap: () => LoginClass.traderentry(context),
                      ),
                    )),
                //  زر دخول الجهة الحكومية
                FadeInDown(
                    duration: All.duration,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child:
                          // تصميم زر
                          CustomButton(
                        data: "29".tr,
                        onTap: () => LoginClass.enteringthegovernmentagency(),
                      ),
                    )),
                //  زر التخطي
                Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GestureDetector(
                      onTap: () => LoginClass.skip(),
                      child:
                          // تصميم نص
                          CustomText(
                              color: All.color1,
                              data: "30".tr,
                              size: All.textsize),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// // شكل المتحركة

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
