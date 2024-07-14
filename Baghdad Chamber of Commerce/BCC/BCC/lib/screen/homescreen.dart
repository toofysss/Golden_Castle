import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/screen/homescreen/mainscreen.dart';
import 'package:coldencastle/screen/homescreen/menuscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

// الشاشة الرئيسية

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: ZoomDrawer(
            angle: 0,
            mainScreenTapClose: true,
            menuBackgroundColor: All.color1,
            showShadow: true,
            borderRadius: 40,
            slideWidth: Get.size.width * 0.85,
            menuScreenTapClose: true,
            isRtl: LanguageClass.lang.text == "English" ? false : true,
// صفحة ثانوية
            menuScreen: const MenuScreen(),
            // صفحة رئيسية
            mainScreen: const Mainscreen()));
  }
}
