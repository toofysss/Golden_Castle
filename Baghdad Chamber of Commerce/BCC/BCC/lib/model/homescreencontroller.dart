import 'package:coldencastle/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// تغيير صفحات
abstract class HomeScreenController extends GetxController {
  changepage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int i = 0;
  static PageController pageController = PageController();

  @override
  changepage(int currentPage) {
    i = currentPage;
    pageController.jumpToPage(i);
    DlailPageClass.name.clear();
    update();
  }
}
