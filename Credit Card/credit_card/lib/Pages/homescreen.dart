import 'package:credit_card/Pages/CreditCard/creditcard.dart';
import 'package:credit_card/Pages/layer.dart';
import 'package:credit_card/Pages/setting.dart';
import 'package:credit_card/Pages/transition.dart';
import 'package:credit_card/constant/root.dart';
import 'package:credit_card/controller/homescreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        init: HomeScreenControllerImp(),
        builder: (controller) {
          return Scaffold(
            extendBody: true,
            body: PageView(
              
              physics: const NeverScrollableScrollPhysics(),
              controller: HomeScreenControllerImp.pageController,
              children: const [CreditCard(), Transfers(), Layer(), Setting()],
            ),
            bottomNavigationBar: SlidingClippedNavBar(
              backgroundColor: Root.primary,
              onButtonPressed: (index) => controller.changepage(index),
              iconSize: 25,
              inactiveColor: Colors.white,
              activeColor: Root.secondary,
              selectedIndex: controller.i,
              barItems: [
                BarItem(
                  icon: Icons.credit_card,
                  title: '1'.tr,
                ),
                BarItem(
                  icon: Icons.compare_arrows_rounded,
                  title: '2'.tr,
                ),
                BarItem(
                  icon: Icons.layers_outlined,
                  title: '3'.tr,
                ),
                BarItem(
                  icon: Icons.settings,
                  title: '4'.tr,
                ),
              ],
            ),
          );
        });
  }
}
