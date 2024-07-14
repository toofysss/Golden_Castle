import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/screen/electronictransactions/Certificate%20of%20Origin/information2.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/custombutton.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:coldencastle/widget/electronictranactions/customtextfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

// المعلومات ١
class CertificateOfRiginInformation extends StatefulWidget {
  const CertificateOfRiginInformation({super.key});

  @override
  State<CertificateOfRiginInformation> createState() =>
      _CertificateOfRiginInformationState();
}

class _CertificateOfRiginInformationState
    extends State<CertificateOfRiginInformation> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(All.appbarheight),
            child:
                // تصميم appbar
                CustomAppBar(
              title: "140".tr,
              // hint
              actions: Container(),
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
          // تحقق من التطبيق عربي او انكليزي
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //  الاسم 
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicCertificateOfOriginClass.name,
                          hints: '37'.tr,
                          textInputType: TextInputType.text,
                          readOnly: true,
                        ),
                      ),
                    ),
                  ),
                  // الاسم التجاري

                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicCertificateOfOriginClass.title,
                          hints: '38'.tr,
                          textInputType: TextInputType.text,
                          readOnly: true,
                        ),
                      ),
                    ),
                  ),
                                 //  النشاط

                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicCertificateOfOriginClass.name,
                          hints: '39'.tr,
                          textInputType: TextInputType.text,
                          readOnly: true,
                        ),
                      ),
                    ),
                  ),
                  //  رسوم الهوية

                  Center(
                    child: FadeInRight(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicCertificateOfOriginClass.price,
                          hints: '226'.tr,
                          textInputType: TextInputType.text,
                          readOnly: true,
                        ),
                      ),
                    ),
                  ),
// رقم الاجازة
                  Center(
                    child: FadeInRight(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller:
                              ElectronicCertificateOfOriginClass.vacationNo,
                          hints: '219'.tr,
                          textInputType: TextInputType.number,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  // تاريخ الاجازة
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
                                    ElectronicCertificateOfOriginClass
                                        .vacationDate.text = formattedDate;
                                  });
                                },
                                //  التحكم
                                controller: ElectronicCertificateOfOriginClass
                                    .vacationDate,
                                style: TextStyle(
                                    fontSize: All.textfieldsize,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.text,
                                cursorColor: All.color1,
                                decoration: InputDecoration(
                                  labelText: "220".tr,
                                  labelStyle: TextStyle(
                                      fontSize: All.textfieldsize,
                                      color: All.color1,
                                      fontWeight: FontWeight.bold),
                                  hintText: "220".tr,
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
                                    ElectronicCertificateOfOriginClass
                                        .vacationDate.text = formattedDate;
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
// رقم الفاتورة
                  Center(
                    child: FadeInRight(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller:
                              ElectronicCertificateOfOriginClass.invoiceNo,
                          hints: '221'.tr,
                          textInputType: TextInputType.number,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  // تاريخ الفاتورة
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
                                    ElectronicCertificateOfOriginClass
                                        .invoiceDate.text = formattedDate;
                                  });
                                },
                                //  التحكم
                                controller: ElectronicCertificateOfOriginClass
                                    .invoiceDate,
                                style: TextStyle(
                                    fontSize: All.textfieldsize,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.text,
                                cursorColor: All.color1,
                                decoration: InputDecoration(
                                  labelText: "222".tr,
                                  labelStyle: TextStyle(
                                      fontSize: All.textfieldsize,
                                      color: All.color1,
                                      fontWeight: FontWeight.bold),
                                  hintText: "222".tr,
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
                                    ElectronicCertificateOfOriginClass
                                        .invoiceDate.text = formattedDate;
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
                                    if (ElectronicCertificateOfOriginClass
                                                .invoiceDate.text ==
                                            "" ||
                                        ElectronicCertificateOfOriginClass
                                                .invoiceNo.text ==
                                            "" ||
                                        ElectronicCertificateOfOriginClass
                                                .vacationDate.text ==
                                            "" ||
                                        ElectronicCertificateOfOriginClass
                                                .vacationNo.text ==
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
                                      Get.to(
                                          () =>
                                              const CertificateOfRiginInformation2(),
                                          transition: Transition.fadeIn);
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
