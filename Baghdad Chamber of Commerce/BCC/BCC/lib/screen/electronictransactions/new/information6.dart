import 'package:animate_do/animate_do.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/custombutton.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// المعلومات ١
class NewInformation6 extends StatefulWidget {
  const NewInformation6({super.key});

  @override
  State<NewInformation6> createState() => _NewInformation6State();
}

class _NewInformation6State extends State<NewInformation6> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// CUSTOM TABBAR
                  // صورة عقد ايجار
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomText(
                          color: All.color1,
                          data: "171".tr,
                          size: All.textsize)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                ElectronicTransactionsClass.current = 0;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: ElectronicTransactionsClass.current == 0
                                    ? Border.all(color: All.color1, width: 2)
                                    : null,
                              ),
                              child: SizedBox(
                              width: 70,
                                height: 70,
                                child: Image.asset(
                                    ElectronicTransactionsClass.list[1]),
                              ),
                            ),
                          ),
                          Visibility(
                              visible: ElectronicTransactionsClass.current == 0,
                              child: Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: All.color1, shape: BoxShape.circle),
                              ))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                ElectronicTransactionsClass.current = 1;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: ElectronicTransactionsClass.current == 1
                                    ? Border.all(color: All.color1, width: 2)
                                    : null,
                              ),
                              child: SizedBox(
                               width: 70,
                                height: 70,
                                child: Image.asset(
                                    ElectronicTransactionsClass.list[0]),
                              ),
                            ),
                          ),
                          Visibility(
                              visible: ElectronicTransactionsClass.current == 1,
                              child: Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: All.color1, shape: BoxShape.circle),
                              ))
                        ],
                      )
                    ],
                  ),

                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomText(
                          color: All.color1,
                          data:
                              "${"176".tr} ${ElectronicTransactionsClass.price.text} ${'177'.tr}",
                          size: All.textsize)),

                  FadeInDown(
                      duration: All.duration,
                      child: Center(
                        child: Container(
                            width: Get.width / 2.5,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child:
                                // تصميم زر
                                CustomButton(
                                    data: "173".tr,
                                    onTap: () async {
                                      if (ElectronicTransactionsClass.current ==
                                          0) {
                                        ElectronicTransactionsClass.master(
                                            context,LanguageClass.lang.text == "English"?'en':'ar');
                                      } else {
                                        ElectronicTransactionsClass.zaincash(
                                            context);
                                      }
                                    })),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
