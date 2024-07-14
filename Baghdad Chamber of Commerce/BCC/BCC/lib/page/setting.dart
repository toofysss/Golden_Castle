import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/customlisttile.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

// الاعدادات
class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LanguageClass.lang.text == "English"
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(All.appbarheight),
            child:
                // تصميم Appbar
                CustomAppBar(
              title: "16".tr,
              // زر الاشعارات
              actions: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8),
                child: GestureDetector(
                  onTap: () => HomescreenClass.notification,
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: All.arrowsize,
                  ),
                ),
              ),
              leading:
                  // زر القائمة الرئيسية
                  Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                    onTap: () => ZoomDrawer.of(context)!.toggle(),
                    child: Image.asset(All.menuimage)),
              ),
            )),
        extendBodyBehindAppBar: true,
        body: Directionality(
          // تحقق اذا كان الزر عربي او انكليزي
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Stack(
            children: [
              // color
              Container(
                height: Get.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [All.color2, All.color1]),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //  دليل التاجر
                      CustomListTile(
                        title: CustomText(
                            color: Colors.white,
                            data: "17".tr,
                            size: All.textsize),
                        onTap: () => SettingClass.tradersGuide(context),
                        leading: Icon(
                          Icons.star_sharp,
                          color: Colors.white,
                          size: All.arrowsize,
                        ),
                      ),
                      //  الملف الشخصي
                      CustomListTile(
                        title: CustomText(
                            color: Colors.white,
                            data: "18".tr,
                            size: All.textsize),
                        onTap: () => SettingClass.profilePersonly(),
                        leading: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: All.arrowsize,
                        ),
                      ),
                      // اللغة
                      CustomListTile(
                        onTap: () => SettingClass.language(),
                        leading: Icon(
                          Icons.language,
                          color: Colors.white,
                          size: All.arrowsize,
                        ),
                        title: CustomText(
                            color: Colors.white,
                            data: "20".tr,
                            size: All.textsize),
                      ),
                      // اعادة تعيين كلمة المرور
                      CustomListTile(
                        onTap: () => ForgetPasswordClass.changepass(
                            context, All.azbaranum.text),
                        leading: Icon(
                          Icons.key_rounded,
                          color: Colors.white,
                          size: All.arrowsize,
                        ),
                        title: CustomText(
                            color: Colors.white,
                            data: "67".tr,
                            size: All.textsize),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
