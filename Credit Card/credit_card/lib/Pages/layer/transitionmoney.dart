import 'package:animate_do/animate_do.dart';
import 'package:credit_card/constant/language.dart';
import 'package:credit_card/constant/layer.dart';
import 'package:credit_card/constant/root.dart';
import 'package:credit_card/widget/customButton.dart';
import 'package:credit_card/widget/customtext.dart';
import 'package:credit_card/widget/customtextfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TransitionMoney extends StatefulWidget {
  const TransitionMoney({super.key});

  @override
  State<TransitionMoney> createState() => _TransitionMoneyState();
}

class _TransitionMoneyState extends State<TransitionMoney> {
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
              data: "17".tr,
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
        backgroundColor: Colors.white,
        body: Directionality(
          // تحقق من التطبيق عربي او انكليزي
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    width: 250,
                    height: 250,
                    child: Center(
                      child: LottieBuilder.asset(
                        Root.moneytransfer,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                FlipInY(
                    duration: Root.duration,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextField(
                        readOnly: false,
                        controller: TransitionMoneyClass.mycreditNo,
                        hint: "37".tr,
                        textInputType: TextInputType.number,
                        obscureText: false,
                      ),
                    )),

                FlipInY(
                    duration: Root.duration,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextField(
                        readOnly: false,
                        controller: TransitionMoneyClass.creditNo,
                        hint: "48".tr,
                        textInputType: TextInputType.number,
                        obscureText: false,
                      ),
                    )),
                FlipInY(
                    duration: Root.duration,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomTextField(
                        readOnly: false,
                        controller: TransitionMoneyClass.money,
                        hint: "36".tr,
                        textInputType: TextInputType.number,
                        obscureText: false,
                      ),
                    )),
                // زر تغيير كلمة السر
                FadeInUp(
                    duration: Root.duration,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child:
                          // تصميم زر
                          CustomButton(
                        data: "38".tr,
                        onTap: () {},
                        color: Root.primary,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
