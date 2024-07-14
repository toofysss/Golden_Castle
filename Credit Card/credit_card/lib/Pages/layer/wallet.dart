import 'package:credit_card/constant/language.dart';
import 'package:credit_card/constant/root.dart';
import 'package:credit_card/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 7,
          shadowColor: Root.primary,
          centerTitle: true,
          title: CustomText(
              colors: Root.primary,
              data: "42".tr,
              fontWeight: FontWeight.w700,
              size: Root.headertextsize),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: Root.iconSize,
                color: Root.primary,
              ),
            ),
          ),
        ),
        backgroundColor: Root.bgprimary,
        body: Directionality(
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
                  child: CustomText(
                      colors: Root.primary,
                      data: "5".tr,
                      fontWeight: FontWeight.bold,
                      size: Root.headertextsize),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: Get.width * .9,
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 2, color: Root.primary)),
                    child: Center(
                      child: CustomText(
                          colors: Root.primary,
                          data: "160,000 د.ع",
                          fontWeight: FontWeight.w700,
                          size: Root.textsize),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
