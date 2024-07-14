// ignore_for_file: non_constant_identifier_names, duplicate_ignore, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/forgetpassord.dart';
import 'package:gcc/constant/language.dart';
import 'package:gcc/constant/section.dart';
import 'package:gcc/widget/customButton.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:gcc/widget/customtextfiled.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({super.key});

  @override
  State<SendEmail> createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(All.bglogin),
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            width: Get.width * .9,
            height: Get.height * .8,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white.withOpacity(.13)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(.15),
                        Colors.white.withOpacity(.05),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 300,
                        width: Get.width / 2,
                        child: Center(
                          child: LottieBuilder.asset(
                            All.forget,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomText(
                            maxLines: 1,
                            data: "66".tr,
                            size: All.header,
                            colors: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Directionality(
                        textDirection:
                            // تحققق اذا التطبيق عربي او انكليزي
                            LanguageClass.lang.text == "English"
                                ? TextDirection.ltr
                                : TextDirection.rtl,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: RadioListTile(
                                  title: Text(
                                    "64".tr,
                                    style: TextStyle(
                                        fontSize: All.textsize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  activeColor: Colors.white,
                                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                                  value: "email",
                                  groupValue: ForgetPasswordClass.reset.text,
                                  onChanged: (Value) {
                                    setState(() {
                                      ForgetPasswordClass.reset.text = "$Value";
                                    });
                                  }),
                            ),
                            // en radio
                            SizedBox(
                              width: Get.width,
                              child: RadioListTile(
                                  title: Text(
                                    "65".tr,
                                    style: TextStyle(
                                        fontSize: All.textsize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  activeColor: Colors.white,
                                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                                  value: "whatsapp",
                                  groupValue: ForgetPasswordClass.reset.text,
                                  onChanged: (Value) {
                                    setState(() {
                                      ForgetPasswordClass.reset.text = "$Value";
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                      ForgetPasswordClass.reset.text != ""
                          ? Column(
                              children: [
                                FlipInY(
                                    duration: SectionClass.duration,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: CustomTextField(
                                          controller:
                                              ForgetPasswordClass.selectreset,
                                          hint:
                                              ForgetPasswordClass.reset.text ==
                                                      "email"
                                                  ? "62".tr
                                                  : "63".tr,
                                          textInputType:
                                              TextInputType.name,
                                                 
                                          obscureText: false),
                                    )),
                                Center(
                                  child: CustomButton(color: ColorsClass.buttoncolor,
                                      data: "63".tr,
                                      onTap: () =>
                                          ForgetPasswordClass.checkdata(
                                              context)),
                                )
                              ],
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
