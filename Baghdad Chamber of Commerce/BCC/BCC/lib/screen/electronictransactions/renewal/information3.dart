// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, duplicate_ignore

import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/custombutton.dart';
import 'package:coldencastle/widget/customlisttile.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:coldencastle/widget/electronictranactions/customtextfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

// المعلومات ٣
class Information3 extends StatefulWidget {
  const Information3({super.key});

  @override
  State<Information3> createState() => _Information3State();
}

class _Information3State extends State<Information3> {
  String? formattedDate;
  String? formattedDate1;
  String? formattedDate2;
  String? formattedDate3;
  void lastdate() {
    DateTime date =
        DateTime.parse("${DateTime.now().add(const Duration(days: -1 * 365))}");
    formattedDate = intl.DateFormat("yyyy").format(date);
    DateTime date2 =
        DateTime.parse("${DateTime.now().add(const Duration(days: -2 * 365))}");
    formattedDate1 = intl.DateFormat("yyyy").format(date2);
    DateTime date3 =
        DateTime.parse("${DateTime.now().add(const Duration(days: -3 * 365))}");
    formattedDate2 = intl.DateFormat("yyyy").format(date3);
    DateTime date4 =
        DateTime.parse("${DateTime.now().add(const Duration(days: -4 * 365))}");
    formattedDate3 = intl.DateFormat("yyyy").format(date4);
  }

  @override
  void initState() {
    lastdate();
    super.initState();
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
                          data: "198".tr,
                          size: All.textsize)),
                  // البطاقة الوطنية
                  FadeInLeft(
                    child: RadioListTile(
                        title: CustomText(
                            color: All.color1,
                            data: "196".tr,
                            size: All.textsize),
                        activeColor: All.color1,

                        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                        value: "196".tr,
                        groupValue: ElectronicTransactionsClass.types.text,
                        onChanged: (Value) {
                          ElectronicTransactionsClass.types.text = "$Value";
                          ElectronicTransactionsClass.typesid = '';
                          ElectronicTransactionsClass.typesid = '2';
                        }),
                  ),

                  // هوية الاحوال
                  FadeInLeft(
                    child: RadioListTile(
                        title: CustomText(
                            color: All.color1,
                            data: "197".tr,
                            size: All.textsize),
                        activeColor: All.color1,

                        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                        value: "197".tr,
                        groupValue: ElectronicTransactionsClass.types.text,
                        onChanged: (Value) {
                          ElectronicTransactionsClass.types.text = "$Value";
                          ElectronicTransactionsClass.typesid = '';
                          ElectronicTransactionsClass.typesid = '1';
                        }),
                  ),

                  // معلومات هوية التجارة
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomText(
                          color: All.color1,
                          data: "152".tr,
                          size: All.textsize)),
                  // اختر الصنف
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
                            child: Material(
                              elevation: 6,
                              shadowColor: All.color1,
                              borderRadius: BorderRadius.circular(30),
                              child: CustomListTile(
                                  title: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      iconEnabledColor: All.color1,
                                      iconDisabledColor: All.color1,
                                      borderRadius: BorderRadius.circular(25),
                                      hint: CustomText(
                                          color: All.color1,
                                          data: ElectronicTransactionsClass
                                              .chooseTheCategor,
                                          size: All.textsize),
                                      onChanged: (value) {
                                        setState(() {
                                          ElectronicTransactionsClass
                                              .chooseTheCategor = value!;
                                        });
                                      },
                                      items: ElectronicTransactionsClass
                                          .dropdownItems
                                          .map<DropdownMenuItem<String>>(
                                              (value) =>
                                                  DropdownMenuItem<String>(
                                                      onTap: () {
                                                        ElectronicTransactionsClass
                                                            .chooseTheCategorid = '';
                                                        ElectronicTransactionsClass
                                                                .chooseTheCategorid =
                                                            value.value;
                                                      },
                                                      value: value.label,
                                                      child: CustomText(
                                                          color: All.color1,
                                                          data: value.label,
                                                          size: All.textsize)))
                                          .toList(),
                                    ),
                                  ),
                                  leading: const SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                                  onTap: () {}),
                            ),
                          ))),

                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomText(
                          color: All.color1,
                          data: "41".tr,
                          size: All.textsize)),
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
                        child: Material(
                          elevation: 6,
                          shadowColor: All.color1,
                          borderRadius: BorderRadius.circular(30),
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
                                      data: ElectronicTransactionsClass.search,
                                      size: All.textsize),
                                  onChanged: (value) {
                                    setState(() {
                                      ElectronicTransactionsClass.search =
                                          value!;
                                    });
                                  },
                                  items: [
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
                              controller: ElectronicTransactionsClass.azbaranum,
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
                  ),
                  // تاريخ صلاحية هوية
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
                            child: Material(
                              elevation: 6,
                              shadowColor: All.color1,
                              borderRadius: BorderRadius.circular(30),
                              child: CustomListTile(
                                  title: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      iconEnabledColor: All.color1,
                                      iconDisabledColor: All.color1,
                                      borderRadius: BorderRadius.circular(25),
                                      hint: CustomText(
                                          color: All.color1,
                                          data: ElectronicTransactionsClass
                                              .dateid,
                                          size: All.textsize),
                                      onChanged: (value) {
                                        setState(() {
                                          ElectronicTransactionsClass.dateid =
                                              value!;
                                        });
                                      },
                                      items: [
                                        "$formattedDate",
                                        "$formattedDate1",
                                        "$formattedDate2",
                                        "$formattedDate3",
                                        "189".tr
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
                                  leading: const SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                                  onTap: () {}),
                            ),
                          ))),

// رسوم الهوية
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.price,
                          hints: '155'.tr,
                          textInputType: TextInputType.text,
                          readOnly: true,
                        ),
                      ),
                    ),
                  ),
                  // االسم التجاري
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
                        child: Material(
                          elevation: 6,
                          shadowColor: All.color1,
                          borderRadius: BorderRadius.circular(30),
                          child: CustomListTile(
                            leading: SizedBox(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  iconEnabledColor: All.color1,
                                  iconDisabledColor: All.color1,
                                  borderRadius: BorderRadius.circular(25),
                                  hint: CustomText(
                                      color: All.color1,
                                      data: ElectronicTransactionsClass.type,
                                      size: All.textsize),
                                  onChanged: (value) {
                                    setState(() {
                                      ElectronicTransactionsClass.type = value!;
                                    });
                                  },
                                  items: ElectronicTransactionsClass.dropdownItemsTradeName
                                          .map<DropdownMenuItem<String>>(
                                              ( value) =>
                                                  DropdownMenuItem<String>(
                                                    onTap: () {
                                                       ElectronicTransactionsClass
                                              .tradeNameid=value.value;
                                  
                                                    },
                                                      value: value.label,
                                                      child: CustomText(
                                                          color: All.color1,
                                                          data: value.label,
                                                          size: All.textsize)))
                                          .toList(),
                                ),
                              ),
                            ),
                            title: TextFormField(
                              //   //  التحكم
                              controller: ElectronicTransactionsClass.tradeName,
                              style: TextStyle(
                                  fontSize: All.textfieldsize,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              cursorColor: All.color1,
                              decoration: InputDecoration(
                                labelText: "38".tr,
                                labelStyle: TextStyle(
                                    fontSize: All.textfieldsize,
                                    color: All.color1,
                                    fontWeight: FontWeight.bold),
                                hintText: "38".tr,
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
                  ),

                  // النشاط
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.activity,
                          hints: '39'.tr,
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
                                                .jumpToPage(1);
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
                                                        .chooseTheCategor ==
                                                    "" ||
                                                ElectronicTransactionsClass.dateid ==
                                                    "" ||
                                                ElectronicTransactionsClass
                                                        .price.text ==
                                                    "" ||
                                                ElectronicTransactionsClass
                                                        .activity.text ==
                                                    "" ||
                                                ElectronicTransactionsClass
                                                        .tradeName.text ==
                                                    "" ||
                                                ElectronicTransactionsClass
                                                        .selectid.text ==
                                                    "" ||
                                                ElectronicTransactionsClass
                                                        .azbaranum.text ==
                                                    "" ||
                                                ElectronicTransactionsClass
                                                        .search ==
                                                    "98".tr) {
                                              AwesomeDialog(
                                                      context: context,
                                                      animType: AnimType.scale,
                                                      dialogType:
                                                          DialogType.error,
                                                      body: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 8.0),
                                                        child: Center(
                                                          child: CustomText(
                                                              color:
                                                                  Colors.black,
                                                              data: "123".tr,
                                                              size:
                                                                  All.textsize),
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
                                                  .jumpToPage(3);
                                            }
                                          }))),
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
