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

// المعلومات ١
class NewInformation extends StatefulWidget {
  const NewInformation({super.key});

  @override
  State<NewInformation> createState() => _NewInformationState();
}

class _NewInformationState extends State<NewInformation> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
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
                  //  الاسم الاول
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.name,
                          hints: '125'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  // اسم الاب
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.fathername,
                          hints: '126'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  // اسم الجد
                  Center(
                    child: FadeInRight(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.lastname,
                          hints: '127'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  // اسم الام
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.mothername,
                          hints: '128'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
// الجنس

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
                                              .gender,
                                          size: All.textsize),
                                      onChanged: (value) {
                                        setState(() {
                                          ElectronicTransactionsClass.gender =
                                              "$value";
                                        });
                                      },
                                      items: [
                                        "136".tr,
                                        "137".tr,
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
                  // تاريخ الولادة
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
                                      firstDate: DateTime(1800),
                                      lastDate: DateTime(2100));
                                  if (newdate == null) return;
                                  DateTime date = DateTime.parse("$newdate");
                                  String formattedDate =
                                      intl.DateFormat("yyyy/MM/dd")
                                          .format(date);
                                  setState(() {
                                    ElectronicTransactionsClass.date.text =
                                        formattedDate;
                                  });
                                },
                                //  التحكم
                                controller: ElectronicTransactionsClass.date,
                                style: TextStyle(
                                    fontSize: All.textfieldsize,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.text,
                                cursorColor: All.color1,
                                decoration: InputDecoration(
                                  labelText: "130".tr,
                                  labelStyle: TextStyle(
                                      fontSize: All.textfieldsize,
                                      color: All.color1,
                                      fontWeight: FontWeight.bold),
                                  hintText: "130".tr,
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
                                      firstDate: DateTime(1800),
                                      lastDate: DateTime(2100));
                                  if (newdate == null) return;
                                  DateTime date = DateTime.parse("$newdate");
                                  String formattedDate =
                                      intl.DateFormat("yyyy/MM/dd")
                                          .format(date);
                                  setState(() {
                                    ElectronicTransactionsClass.date.text =
                                        formattedDate;
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

// رقم الهاتف
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.phonenumber,
                          hints: '47'.tr,
                          textInputType: TextInputType.phone,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  // البريد الاكتروني
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.email,
                          hints: '73'.tr,
                          textInputType: TextInputType.emailAddress,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
// المحافظة
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
                                          data: ElectronicTransactionsClass.city,
                                          size: All.textsize),
                                      onChanged: (value) {
                                        setState(() {
                                        ElectronicTransactionsClass.city =
                                              value!;
                                        });
                                      },
                                      items: ElectronicTransactionsClass.dropdownItemscity
                                          .map<DropdownMenuItem<String>>(
                                              ( value) =>
                                                  DropdownMenuItem<String>(
                                                    onTap: () {
                                                       ElectronicTransactionsClass
                                              .cityid=value.value;
                                  
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
         
                  //  محلة
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.locality,
                          hints: '133'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  // زقاق
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.alley,
                          hints: '134'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  //  دار
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.housenumber,
                          hints: '172'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  //  التالي

                  Center(
                    child: FadeInDown(
                        duration: All.duration,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child:
                              // تصميم زر
                              CustomButton(
                                  data: "116".tr,
                                  onTap: () {
                                    if (ElectronicTransactionsClass.alley.text == "" ||
                                        ElectronicTransactionsClass.city ==
                                            "" ||
                                        ElectronicTransactionsClass.date.text ==
                                            "" ||
                                        ElectronicTransactionsClass.email.text ==
                                            "" ||
                                        ElectronicTransactionsClass.fathername.text ==
                                            "" ||
                                        ElectronicTransactionsClass.gender ==
                                            "" ||
                                        ElectronicTransactionsClass
                                                .housenumber.text ==
                                            "" ||
                                        ElectronicTransactionsClass
                                                .lastname.text ==
                                            "" ||
                                        ElectronicTransactionsClass
                                                .locality.text ==
                                            "" ||
                                        ElectronicTransactionsClass.mothername.text ==
                                            "" ||
                                        ElectronicTransactionsClass.name.text ==
                                            "" ||
                                        ElectronicTransactionsClass
                                                .phonenumber.text ==
                                            "") {
                                      AwesomeDialog(
                                              context: context,
                                              animType: AnimType.scale,
                                              dialogType: DialogType.error,
                                              body: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Center(
                                                  child: CustomText(
                                                      color: Colors.black,
                                                      data: "123".tr,
                                                      size: All.textsize),
                                                ),
                                              ),
                                              btnCancelColor: Colors.green,
                                              btnCancelText: "105".tr,
                                              btnCancelOnPress: () {})
                                          .show();
                                    } else {
                                      ElectronicTransactionsClass.pageController
                                          .jumpToPage(1);
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
