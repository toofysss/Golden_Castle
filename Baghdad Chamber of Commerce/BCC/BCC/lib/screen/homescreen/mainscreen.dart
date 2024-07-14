import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/model/homescreencontroller.dart';
import 'package:coldencastle/page/home.dart';
import 'package:coldencastle/page/service.dart';
import 'package:coldencastle/page/setting.dart';
import 'package:coldencastle/page/dalil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

// الصفحة الرئيسية

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp);
    Get.put(HomeScreenControllerImp());
    return Directionality(
      textDirection: LanguageClass.lang.text == "English"
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: GetBuilder<HomeScreenControllerImp>(
          builder: (controller) => Scaffold(
                resizeToAvoidBottomInset: false,
                extendBody: true,
                //  زر عائم
                floatingActionButton: FloatingActionButton(
                  onPressed: () => ZoomDrawer.of(context)!.toggle(),
                  child: CircleAvatar(
                    backgroundColor: All.color1,
                    radius: 75,
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                // ازرار سفلى
                bottomNavigationBar: AnimatedBottomNavigationBar(
                  height: 50,
                  activeColor: Colors.white,
                  inactiveColor: All.dropdowncolor,
                  iconSize: 30,
                  backgroundColor: All.color1,
                  icons: const [
                    Icons.home,
                    Icons.list,
                    Icons.book,
                    Icons.settings
                  ],
                  activeIndex: controller.i,
                  gapLocation: GapLocation.center,
                  notchSmoothness: NotchSmoothness.softEdge,
                  leftCornerRadius: 32,
                  rightCornerRadius: 32,
                  onTap: (index) => controller.changepage(index),
                ),

                //  صفحات
                body: PageView(
                  controller: HomeScreenControllerImp.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
// صفحة رئيسية
                    Home(),
// صفحة خدمات
                    Service(),
// صفحة دليل التاجر
                    Dalil(),
// صفحة الاعدادات
                    Settings()
                  ],
                ),
              )),
    );
  }
}
