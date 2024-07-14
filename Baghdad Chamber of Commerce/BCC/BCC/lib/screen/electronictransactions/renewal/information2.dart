// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, duplicate_ignore

import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/custombutton.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:coldencastle/widget/electronictranactions/customtextfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

// المعلومات ٢
class Information2 extends StatefulWidget {
  const Information2({super.key});

  @override
  State<Information2> createState() => _Information2State();
}

class _Information2State extends State<Information2> {
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
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // نوع بطاقة التعريف
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomText(
                          color: All.color1,
                          data: "138".tr,
                          size: All.textsize)),
                  // البطاقة الوطنية
                  FadeInLeft(
                    child: RadioListTile(
                        title: CustomText(
                            color: All.color1,
                            data: "156".tr,
                            size: All.textsize),
                        activeColor: All.color1,

                        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                        value: "156".tr,
                        groupValue: ElectronicTransactionsClass.selectid.text,
                        onChanged: (Value) {
                          setState(() {
                            ElectronicTransactionsClass.selectid.text =
                                "$Value";
                          });
                        }),
                  ),

                  // هوية الاحوال
                  FadeInLeft(
                    child: RadioListTile(
                        title: CustomText(
                            color: All.color1,
                            data: "157".tr,
                            size: All.textsize),
                        activeColor: All.color1,

                        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                        value: "157".tr,
                        groupValue: ElectronicTransactionsClass.selectid.text,
                        onChanged: (Value) {
                          setState(() {
                            ElectronicTransactionsClass.selectid.text =
                                "$Value";
                          });
                        }),
                  ),

                  // تاريخ اصدار البطاقة الشخصية

                  Center(
                    child: FadeInRight(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child: Material(
                            elevation: 6,
                            shadowColor: All.color1,
                            borderRadius: BorderRadius.circular(30),
                            child: ListTile(
                              title: TextField(
                                   onTap: () async {
                                  DateTime? newdate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100));
                                  if (newdate == null) return;
                                  DateTime date = DateTime.parse("$newdate");
                                  String formattedDate =
                                      intl.DateFormat("yyyy/MM/dd")
                                          .format(date);
                                  setState(() {
                                    ElectronicTransactionsClass
                                        .dateoIDcard.text = formattedDate;
                                  });
                                },readOnly: true,
                                //  التحكم
                                controller:
                                    ElectronicTransactionsClass.dateoIDcard,
                                style: TextStyle(
                                    fontSize: All.textfieldsize,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.text,
                                cursorColor: All.color1,
                                decoration: InputDecoration(
                                  labelText: "149".tr,
                                  labelStyle: TextStyle(
                                      fontSize: All.textfieldsize,
                                      color: All.color1,
                                      fontWeight: FontWeight.bold),
                                  hintText: "149".tr,
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () async {
                                  DateTime? newdate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100));
                                  if (newdate == null) return;
                                  DateTime date = DateTime.parse("$newdate");
                                  String formattedDate =
                                      intl.DateFormat("yyyy/MM/dd")
                                          .format(date);
                                  setState(() {
                                    ElectronicTransactionsClass
                                        .dateoIDcard.text = formattedDate;
                                  });
                                },
                                child: Icon(
                                  Icons.date_range,
                                  size: All.arrowsize,
                                  color: All.color1,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                  // تاريخ نفاذ البطاقة الشخصية

                  Center(
                    child: FadeInRight(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child: Material(
                            elevation: 6,
                            shadowColor: All.color1,
                            borderRadius: BorderRadius.circular(30),
                            child: ListTile(
                              title: TextField(
                                readOnly: true,
                                  onTap: () async {
                                  DateTime? newdate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100));
                                  if (newdate == null) return;
                                  DateTime date = DateTime.parse("$newdate");
                                  String formattedDate =
                                      intl.DateFormat("yyyy/MM/dd")
                                          .format(date);
                                  setState(() {
                                    ElectronicTransactionsClass
                                        .dateoIDcardExpire.text = formattedDate;
                                  });
                                },
                                //  التحكم
                                controller: ElectronicTransactionsClass
                                    .dateoIDcardExpire,
                                style: TextStyle(
                                    fontSize: All.textfieldsize,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.text,
                                cursorColor: All.color1,
                                decoration: InputDecoration(
                                  labelText: "168".tr,
                                  labelStyle: TextStyle(
                                      fontSize: All.textfieldsize,
                                      color: All.color1,
                                      fontWeight: FontWeight.bold),
                                  hintText: "168".tr,
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () async {
                                  DateTime? newdate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100));
                                  if (newdate == null) return;
                                  DateTime date = DateTime.parse("$newdate");
                                  String formattedDate =
                                      intl.DateFormat("yyyy/MM/dd")
                                          .format(date);
                                  setState(() {
                                    ElectronicTransactionsClass
                                        .dateoIDcardExpire.text = formattedDate;
                                  });
                                },
                                child: Icon(
                                  Icons.date_range,
                                  size: All.arrowsize,
                                  color: All.color1,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),

                  // رقم بطاقة التعريف

                  Center(
                    child: FadeInRight(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.iD,
                          hints: '150'.tr,
                          textInputType: TextInputType.number,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  // جهة الاصدار
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.issuer,
                          hints: '151'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //  رجوع
                          FadeInDown(
                              duration: All.duration,
                              child: Container(
                                  width: Get.width / 2.5,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child:
                                      // تصميم زر
                                      CustomButton(
                                          data: "120".tr,
                                          onTap: () {
                                            ElectronicTransactionsClass
                                                .pageControllers
                                                .jumpToPage(0);
                                          }))),
                          // التالي
                          FadeInDown(
                              duration: All.duration,
                              child: Container(
                                width: Get.width / 2.5,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                child:
                                    // تصميم زر
                                    CustomButton(
                                        data: "116".tr,
                                        onTap: () {
                                          if (ElectronicTransactionsClass
                                                      .dateoIDcard.text ==
                                                  "" ||
                                              ElectronicTransactionsClass
                                                      .iD.text ==
                                                  "" ||
                                              ElectronicTransactionsClass
                                                      .issuer.text ==
                                                  "" ||
                                              ElectronicTransactionsClass
                                                      .dateoIDcardExpire.text ==
                                                  "") {
                                            AwesomeDialog(
                                                    context: context,
                                                    animType: AnimType.scale,
                                                    dialogType:
                                                        DialogType.error,
                                                    body: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 8.0),
                                                      child: Center(
                                                        child: CustomText(
                                                            color: Colors.black,
                                                            data: "123".tr,
                                                            size: All.textsize),
                                                      ),
                                                    ),
                                                    btnCancelColor:
                                                        Colors.green,
                                                    btnCancelText: "105".tr,
                                                    btnCancelOnPress: () {})
                                                .show();
                                          } else {
                                            ElectronicTransactionsClass
                                                .pageControllers
                                                .jumpToPage(2);
                                          }
                                        }),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
