// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, duplicate_ignore

import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/localization/changelocal.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// اللغة

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(All.appbarheight),
              child:
                  // تصميم appbar
                  CustomAppBar(
                title: "20".tr, actions: Container(),
                // زر الرجوع
                leading: GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: All.arrowsize,
                      color: Colors.white,
                    )),
              )),
          body: Directionality(
              textDirection:
                  // تحققق اذا التطبيق عربي او انكليزي
                  LanguageClass.lang.text == "English"
                      ? TextDirection.ltr
                      : TextDirection.rtl,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [All.color2, All.color1]),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // ar radio button
                      SizedBox(
                        width: Get.width,
                        child: RadioListTile(
                            title: Text(
                              "22".tr,
                              style: TextStyle(
                                  fontSize: All.textsize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            activeColor: LanguageClass.radiobuttoncolor,
                            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                            value: "Arabic",
                            groupValue: LanguageClass.lang.text,
                            onChanged: (Value) {
                              setState(() {
                                LocalController myServices = Get.find();
                                myServices.changeLang("ar");
                                LanguageClass.lang.text = "$Value";
                                    ElectronicTransactionsClass.dropdownItemscity.clear();
            ElectronicTransactionsClass.citylist(context);                        ElectronicTransactionsClass.getitem();

                              });
                            }),
                      ),
                      // en radio
                      SizedBox(
                        width: Get.width,
                        child: RadioListTile(
                            title: Text(
                              "23".tr,
                              style: TextStyle(
                                  fontSize: All.textsize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            activeColor: LanguageClass.radiobuttoncolor,
                            // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                            value: "English",
                            groupValue: LanguageClass.lang.text,
                            onChanged: (Value) {
                              setState(() {
                                LocalController myServices = Get.find();
                                myServices.changeLang("en");
                                LanguageClass.lang.text = "$Value";
                                    ElectronicTransactionsClass.dropdownItemscity.clear();
            ElectronicTransactionsClass.citylist(context);                        ElectronicTransactionsClass.getitem();

                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
