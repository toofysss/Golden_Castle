import 'package:animate_do/animate_do.dart';
import 'package:credit_card/constant/language.dart';
import 'package:credit_card/constant/root.dart';
import 'package:credit_card/constant/setting.dart';
import 'package:credit_card/widget/customtext.dart';
import 'package:credit_card/widget/customtextfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  const Account({super.key});

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
              data: "12".tr,
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
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlipInY(
                        duration: Root.duration,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomTextField(
                            readOnly: true,
                            controller: AccountClass.name,
                            hint: "27".tr,
                            textInputType: TextInputType.emailAddress,
                            obscureText: false,
                          ),
                        )),
                    FlipInY(
                        duration: Root.duration,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomTextField(
                            controller: AccountClass.email,
                            hint: "24".tr,
                            readOnly: true,
                            textInputType: TextInputType.emailAddress,
                            obscureText: false,
                          ),
                        )),
                    FlipInY(
                        duration: Root.duration,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomTextField(
                            readOnly: true,
                            controller: AccountClass.cardno,
                            hint: "28".tr,
                            textInputType: TextInputType.phone,
                            obscureText: false,
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FlipInY(
                            duration: Root.duration,
                            child: Center(
                              child: Container(
                                width: Get.width * 0.8 / 2,
                                margin: const EdgeInsets.only(top: 18),
                                child: Material(
                                    elevation: 6,
                                    shadowColor: Root.primary,
                                    borderRadius: BorderRadius.circular(10),
                                    child: ListTile(
                                      title: TextField(
                                        readOnly: true,
                                        //  التحكم
                                        controller: AccountClass.cvv,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                        keyboardType: TextInputType.phone,
                                        cursorColor: Root.primary,
                                        decoration: InputDecoration(
                                          labelText: "CVV",
                                          labelStyle: TextStyle(
                                              fontSize: 20,
                                              color: Root.primary,
                                              fontWeight: FontWeight.bold),
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20),
                                        ),
                                      ),
                                    )),
                              ),
                            )),
                        FlipInY(
                            duration: Root.duration,
                            child: Center(
                              child: Container(
                                width: Get.width * 0.8 / 2,
                                margin: const EdgeInsets.only(top: 18),
                                child: Material(
                                    elevation: 6,
                                    shadowColor: Root.primary,
                                    borderRadius: BorderRadius.circular(10),
                                    child: ListTile(
                                      title: TextField(
                                        readOnly: true,
                                        //  التحكم
                                        controller: AccountClass.exp,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                        keyboardType: TextInputType.phone,
                                        cursorColor: Root.primary,
                                        decoration: InputDecoration(
                                          labelText: "Exp",
                                          labelStyle: TextStyle(
                                              fontSize: 20,
                                              color: Root.primary,
                                              fontWeight: FontWeight.bold),
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20),
                                        ),
                                      ),
                                    )),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
