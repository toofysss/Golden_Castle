import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/login.dart';
import 'package:gcc/constant/section.dart';
import 'package:gcc/widget/customButton.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:gcc/widget/customtextfiled.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Rigester extends StatelessWidget {
  const Rigester({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(All.bglogin),
          ),
        ),
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
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(.15),
                        Colors.white.withOpacity(.05),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 300,
                          width: Get.width / 2,
                          child: Center(
                            child: LottieBuilder.asset(
                              All.rigester,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomText(
                              maxLines: 1,
                          data: "61".tr,
                              size: All.header,
                              colors: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      FlipInY(
                          duration: SectionClass.duration,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: CustomTextField(
                                controller: LoginClass.fullname,
                                hint: "35".tr,
                                textInputType: TextInputType.emailAddress,
                                obscureText: false),
                          )),
                             FlipInY(
                          duration: SectionClass.duration,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: CustomTextField(
                                controller: LoginClass.email,
                                hint: "36".tr,
                                textInputType: TextInputType.emailAddress,
                                obscureText: false),
                          )),
                             FlipInY(
                          duration: SectionClass.duration,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: CustomTextField(
                                controller: LoginClass.phone,
                                hint: "38".tr,
                                textInputType: TextInputType.number,
                                obscureText: false),
                          )),
                      FlipInY(
                          duration: SectionClass.duration,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: CustomTextField(
                                controller: LoginClass.pass,
                                hint: "37".tr,
                                textInputType: TextInputType.name,
                                obscureText: true),
                          )),
                 
                            GestureDetector(
                              onTap: () => LoginClass.login(),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 7,horizontal: 15),
                                  child: CustomText(
                                maxLines: 1,
                                      colors: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      data: "59".tr,
                                      size: Get.width / 22)),
                            ),
                          
                        
                      
                      Center(
                        child: CustomButton(
                            data: "61".tr,
                            onTap: () => LoginClass.request(context), color: ColorsClass.buttoncolor,),
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