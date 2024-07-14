import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/custombutton.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:coldencastle/widget/electronictranactions/customtextfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

// معلومات ٤
class NewInformation4 extends StatefulWidget {
  const NewInformation4({super.key});

  @override
  State<NewInformation4> createState() => _NewInformation4State();
}

class _NewInformation4State extends State<NewInformation4> {
  SignatureController controller = SignatureController();

  @override
  void initState() {
    controller = SignatureController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ElectronicTransactionsClass.addresswork.text = "بغداد";
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
                  //  معلومات العمل
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomText(
                          color: All.color1,
                          data: "139".tr,
                          size: All.textsize)),
                  //  العنوان
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.addresswork,
                          hints: '46'.tr,
                          textInputType: TextInputType.text,
                          readOnly: true,
                        ),
                      ),
                    ),
                  ),
                  // المنطقة
                  Center(
                    child: FadeInRight(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.citywork,
                          hints: '141'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  // اقرب نقطة دالة
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.nearwork,
                          hints: '142'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  // محلة
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.localitywork,
                          hints: '133'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  //  زقاق
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller: ElectronicTransactionsClass.alleywork,
                          hints: '134'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),
                  // دار
                  Center(
                    child: FadeInLeft(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        child:
                            // تصميم كتابة النص
                            CustomTextFields(
                          controller:
                              ElectronicTransactionsClass.housenumberwork,
                          hints: '135'.tr,
                          textInputType: TextInputType.text,
                          readOnly: false,
                        ),
                      ),
                    ),
                  ),

// تعهد
                  FadeInRight(
                      duration: All.duration,
                      child: ListTile(
                        title: CustomText(
                            color: All.color1,
                            data: All.pledge,
                            size: All.textsize),
                        leading: Checkbox(
                            shape: const CircleBorder(),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: ElectronicTransactionsClass.rigesters,
                            onChanged: (bool? value) {
                              setState(() {
                                ElectronicTransactionsClass.rigesters = value!;
                              });
                            }),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: CustomText(
                        color: All.color1, data: "104".tr, size: All.textsize),
                  ),
                  Center(
                      child: Container(
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          )
                        ]),
                    margin: const EdgeInsets.only(top: 10),
                    child: Signature(
                        backgroundColor: Colors.transparent,
                        height: 200,
                        width: Get.width * 0.9,
                        controller: controller),
                  )),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => controller.clear(),
                          child: Icon(
                            Icons.clear,
                            color: Colors.red,
                            size: All.arrowsize + 5,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Uint8List? imageBytes =
                                await controller.toPngBytes();

                            ElectronicTransactionsClass.signaturebyte =
                                base64Encode(imageBytes!);
                          },
                          child: Icon(
                            Icons.check,
                            color: Colors.green,
                            size: All.arrowsize + 10,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // رجوع
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
                                                .pageController
                                                .jumpToPage(2);
                                          }))),
                          //  التالي
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
                                          onTap: () async {
                                            if (ElectronicTransactionsClass
                                                        .addresswork.text ==
                                                    "" ||
                                                ElectronicTransactionsClass
                                                        .citywork.text ==
                                                    "" ||
                                                ElectronicTransactionsClass
                                                        .nearwork.text ==
                                                    "" ||
                                                ElectronicTransactionsClass
                                                        .localitywork.text ==
                                                    "" ||
                                                ElectronicTransactionsClass
                                                        .alleywork.text ==
                                                    "" ||
                                                ElectronicTransactionsClass
                                                        .housenumberwork.text ==
                                                    "" ||
                                                ElectronicTransactionsClass
                                                        .rigesters ==
                                                    false) {
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
                                              Uint8List? imageBytes =
                                                  await controller.toPngBytes();

                                              ElectronicTransactionsClass
                                                      .signaturebyte =
                                                  base64Encode(imageBytes!);
                                              ElectronicTransactionsClass
                                                  .pageController
                                                  .jumpToPage(4);
                                            }
                                          }))),
                        ],
                      ),
                    ),
                  )

                  // زر تغيير كلمة السر
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
