import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// تصميم شهادة التاجر

class CustomCard extends StatelessWidget {
  final String textDecorations;
  final String title;
  final String owner;
  final String join;
  final String footer;
  const CustomCard(
      {required this.textDecorations,
      required this.title,
      required this.owner,
      required this.join,
      required this.footer,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // تحقق اذا كان التطبيق عربي او انكليزي
      textDirection:
          textDecorations == "en" ? TextDirection.ltr : TextDirection.rtl,
      child: Allgetdata.info.isEmpty
          ?
          // صورة الانتظار
          const CustomLoading(
              color: Colors.white,
            )
          :
          //  تصميم اطار الشهادة
          Column(
              children: [
                // صورة الشعار
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  height: 120,
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset(All.splashImage),
                  ),
                ),
                // تصميم اطار
                Container(
                  width: Get.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: Colors.white)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  العنوان
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: Wrap(
                            children: [
                              CustomText(
                                  color: All.color1,
                                  data: " ${"32".tr} : ",
                                  size: All.textsize),
                              CustomText(
                                  color: Colors.black,
                                  data: title,
                                  size: All.textsize),
                            ],
                          ),
                        ),

                        //  صاحب
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: Wrap(
                            children: [
                              CustomText(
                                  color: All.color1,
                                  data: " ${"33".tr} : ",
                                  size: All.textsize),
                              CustomText(
                                  color: Colors.black,
                                  data: owner,
                                  size: All.textsize),
                            ],
                          ),
                        ),

                        // انتسب بتاريخ

                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: Wrap(
                            children: [
                              CustomText(
                                  color: All.color1,
                                  data: " ${"34".tr} : ",
                                  size: All.textsize),
                              CustomText(
                                  color: Colors.black,
                                  data: join,
                                  size: All.textsize),
                            ],
                          ),
                        ),
                        // مع تمنياتنا
                        SizedBox(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                              child: Center(
                                  child:
                                      // تصميم نص
                                      CustomText(
                                          color: All.color1,
                                          data: "36".tr,
                                          size: All.textsize))),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
