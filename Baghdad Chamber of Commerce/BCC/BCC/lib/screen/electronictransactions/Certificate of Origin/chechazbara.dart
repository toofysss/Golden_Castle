// كلمة السر
import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/custombutton.dart';
import 'package:coldencastle/widget/customlisttile.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';


// تحقق من الالضبارة
class CheckAzbara extends StatefulWidget {
  const CheckAzbara({super.key});

  @override
  State<CheckAzbara> createState() => _CheckAzbaraState();
}

class _CheckAzbaraState extends State<CheckAzbara> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final formkey = GlobalKey<FormState>();
  final formkeycheck = GlobalKey<FormState>();

clean(){
  setState(() {
    ElectronicCertificateOfOriginClass.clean();
  });
}

  @override
  void initState() {
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 5),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
    clean();
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomText(
                        color: Colors.black,
                        data: "114".tr,
                        size: All.textsize),
                  ),
                  Center(
                    child: FadeInRight(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: All.color1,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: CustomListTile(
                          leading: SizedBox(
                            width: 100,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                iconEnabledColor: All.color1,
                                iconDisabledColor: All.color1,
                                borderRadius: BorderRadius.circular(25),
                                hint: CustomText(
                                    color: All.color1,
                                    data: ElectronicCertificateOfOriginClass.search,
                                    size: All.textsize),
                                onChanged: (value) {
                                  setState(() {
                                    ElectronicCertificateOfOriginClass.search = value!;
                                  });
                                },
                                items: [
                                  "98".tr,
                                  "أ",
                                  "ب",
                                  "ت",
                                  "ث",
                                  "ج",
                                  "ح",
                                  "خ",
                                  "د",
                                  "ذ",
                                  "ر",
                                  "ز",
                                  "س",
                                  "ش",
                                  "ص",
                                  "ض",
                                  "ط",
                                  "ظ",
                                  "ع",
                                  "غ",
                                  "ف",
                                  "ق",
                                  "ك",
                                  "ل",
                                  "م",
                                  "ن",
                                  "ه",
                                  "و",
                                  "ي"
                                ]
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                                value: value,
                                                child: CustomText(
                                                    color: All.color1,
                                                    data: value,
                                                    size: All.textsize)))
                                    .toList(),
                              ),
                            ),
                          ),
                          title: TextFormField(
                            //   //  التحكم
                            controller: ElectronicCertificateOfOriginClass.azbaranum,
                            style: TextStyle(
                                fontSize: All.textfieldsize,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            cursorColor: All.color1,
                            decoration: InputDecoration(
                              labelText: "97".tr,
                              labelStyle: TextStyle(
                                  fontSize: All.textfieldsize,
                                  color: All.color1,
                                  fontWeight: FontWeight.bold),
                              hintText: "97".tr,
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  // زر تغيير كلمة السر
                  Center(
                    child: FadeInDown(
                        duration: All.duration,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child:
                              // تصميم زر
                              CustomButton(
                                  data: "99".tr,
                                  onTap: () {
                                    if (ElectronicCertificateOfOriginClass.search == "" ||
                                        ElectronicCertificateOfOriginClass.azbaranum.text == "") {
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
                                                      data: "101".tr,
                                                      size: All.textsize),
                                                ),
                                              ),
                                              btnCancelColor: Colors.green,
                                              btnCancelText: "105".tr,
                                              btnCancelOnPress: () {})
                                          .show();
                                    } else {                                 ElectronicCertificateOfOriginClass.         azbaranums = ElectronicCertificateOfOriginClass.search +ElectronicCertificateOfOriginClass. azbaranum.text;

                                      ElectronicCertificateOfOriginClass.check(context);
                                
                                      setState(() {
                                        ElectronicCertificateOfOriginClass.search = "98".tr;
                                        ElectronicCertificateOfOriginClass.azbaranum.clear();
                                      });
                                    }
                                  }),
                        )),
                  ),
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

