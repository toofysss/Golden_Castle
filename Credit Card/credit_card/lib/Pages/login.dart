import 'package:animate_do/animate_do.dart';
import 'package:credit_card/constant/login.dart';
import 'package:credit_card/constant/root.dart';
import 'package:credit_card/widget/customButton.dart';
import 'package:credit_card/widget/customtext.dart';
import 'package:credit_card/widget/customtextfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Root.bgprimary,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        width: Get.width,
        height: Get.height,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            width: Get.width * .9,
            height: Get.height * .8,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white.withOpacity(.13)),
                      color: Root.bgprimary,
                      boxShadow: [
                        BoxShadow(
                            color: Root.primary,
                            offset: const Offset(0, 0),
                            blurRadius: 5,
                            spreadRadius: 1)
                      ]),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 300,
                        width: Get.width / 2,
                        child: Center(
                          child: LottieBuilder.asset(
                            Root.login,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomText(
                            data: "16".tr,
                            size: Root.headertextsize,
                            colors: Root.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      FlipInY(
                          duration: Root.duration,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: CustomTextField(
                              controller: LoginClass.email,
                              hint: "24".tr,
                              textInputType: TextInputType.emailAddress,
                              obscureText: false,
                              readOnly: false,
                            ),
                          )),
                      FlipInY(
                          duration: Root.duration,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: CustomTextField(
                                readOnly: false,
                                controller: LoginClass.password,
                                hint: "25".tr,
                                textInputType: TextInputType.emailAddress,
                                obscureText: true),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              // onTap: () => LoginClass.forgetpassword(context),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 7),
                                  child: CustomText(
                                      colors: Root.primary,
                                      fontWeight: FontWeight.bold,
                                      data: "26".tr,
                                      size: Get.width / 22)),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: CustomButton(
                            color: Root.primary, data: "16".tr, onTap: () {}),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
