// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, duplicate_ignore

import 'package:animate_do/animate_do.dart';
import 'package:credit_card/Pages/login.dart';
import 'package:credit_card/Pages/setting/changepassword.dart';
import 'package:credit_card/constant/language.dart';
import 'package:credit_card/constant/root.dart';
import 'package:credit_card/constant/setting.dart';
import 'package:credit_card/controller/languagecontroller.dart';
import 'package:credit_card/widget/customlisttile.dart';
import 'package:credit_card/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 7,
        shadowColor: Root.primary,
        centerTitle: true,
        title: CustomText(
            colors: Root.primary,
            data: "4".tr,
            fontWeight: FontWeight.w700,
            size: Root.headertextsize),
      ),
      backgroundColor: Root.bgprimary,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Root.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // المعلومات الشخصية
                    FadeInDown(
                      duration: Root.duration,
                      child: CustomListTile(
                        color: Root.primary,
                        data: "12".tr,
                        iconData: Icons.person,
                        ontap: () => SettingClass.account(context),
                        trailing: LanguageClass.lang.text == "English"
                            ? Icons.arrow_forward_ios_rounded
                            : Icons.arrow_back_ios_new,
                      ),
                    ),
                    const Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    // تغيير كلمة المرور
                    FadeInLeft(
                      duration: Root.duration,
                      child: CustomListTile(
                        color: Root.primary,
                        data: "13".tr,
                        iconData: FontAwesomeIcons.lock,
                        ontap: () => Get.to(() => const ChangePassword(),
                            transition: Transition.fadeIn),
                        trailing: LanguageClass.lang.text == "English"
                            ? Icons.arrow_forward_ios_rounded
                            : Icons.arrow_back_ios_new,
                      ),
                    ),
                    const Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    // اللغة
                    FadeInRight(
                      duration: Root.duration,
                      child: CustomListTile(
                        color: Root.primary,
                        data: "14".tr,
                        iconData: FontAwesomeIcons.globe,
                        ontap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              backgroundColor: Colors.transparent,
                              child: Stack(
                                children: [
                                  Container(
                                    width: Get.width,
                                    margin: const EdgeInsets.all(15),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Root.bgprimary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Directionality(
                                      textDirection:
                                          // تحققق اذا التطبيق عربي او انكليزي
                                          LanguageClass.lang.text == "English"
                                              ? TextDirection.ltr
                                              : TextDirection.rtl,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 20),
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        Root.creditcardlogo))),
                                          ),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 20),
                                              child: CustomText(
                                                  data: "14".tr,
                                                  size: Root.textsize,
                                                  colors: Root.textcolor,
                                                  fontWeight: FontWeight.bold)),
                                          // ar radio button
                                          SizedBox(
                                            width: Get.width,
                                            child: RadioListTile(
                                                title: Text(
                                                  "21".tr,
                                                  style: TextStyle(
                                                      fontSize: Root.textsize,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Root.textcolor),
                                                ),
                                                activeColor: Root.textcolor,
                                                // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                                                value: "Arabic",
                                                groupValue:
                                                    LanguageClass.lang.text,
                                                onChanged: (Value) {
                                                  LanguageControllerImp()
                                                      .changepage(
                                                          "ar", "$Value");
                                                }),
                                          ),
                                          // en radio
                                          SizedBox(
                                            width: Get.width,
                                            child: RadioListTile(
                                                title: Text(
                                                  "22".tr,
                                                  style: TextStyle(
                                                      fontSize: Root.textsize,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Root.textcolor),
                                                ),
                                                activeColor: Root.textcolor,
                                                // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                                                value: "English",
                                                groupValue:
                                                    LanguageClass.lang.text,
                                                onChanged: (Value) {
                                                  LanguageControllerImp()
                                                      .changepage(
                                                          "en", "$Value");
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 5,
                                      right: 5,
                                      child: GestureDetector(
                                        onTap: () => Get.back(),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.red),
                                          child: Center(
                                              child: Icon(
                                            Icons.close,
                                            size: Root.iconSize,
                                            color: Colors.white,
                                          )),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                        trailing: LanguageClass.lang.text == "English"
                            ? Icons.arrow_forward_ios_rounded
                            : Icons.arrow_back_ios_new,
                      ),
                    ),
                    const Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    // الاشعارات
                    FadeInUp(
                      duration: Root.duration,
                      child: CustomListTile(
                        color: Root.primary,
                        data: "18".tr,
                        iconData: FontAwesomeIcons.bell,
                        ontap: () {},
                        trailing: LanguageClass.lang.text == "English"
                            ? Icons.arrow_forward_ios_rounded
                            : Icons.arrow_back_ios_new,
                      ),
                    ),
                    const Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    Root.id.text == "1"
                        ?
                        // تسجيل الخروج
                        BounceInUp(
                            duration: Root.duration,
                            child: ListTile(
                              onTap: () => SettingClass.logout(),
                              title: CustomText(
                                  colors: Colors.red,
                                  data: "15".tr,
                                  fontWeight: FontWeight.w700,
                                  size: Root.textsize),
                            ),
                          )
                        :
                        // تسجيل الدخول
                        BounceInUp(
                            duration: Root.duration,
                            child: ListTile(
                              onTap: () => Get.to(() => const Login(),
                                  transition: Transition.fadeIn),
                              title: CustomText(
                                  colors: Root.primary,
                                  data: "16".tr,
                                  fontWeight: FontWeight.w700,
                                  size: Root.textsize),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
