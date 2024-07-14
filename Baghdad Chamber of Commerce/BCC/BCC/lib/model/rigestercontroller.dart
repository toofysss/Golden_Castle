import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

//  تغيير صفحات  انشاء حساب
abstract class RigesterController extends GetxController {
  changepage(int currentPage);
}

class RigesterControllerImp extends RigesterController {
  int i = 0;
  static PageController pageController = PageController();

  @override
  changepage(int currentPage) {
    i = currentPage;
    pageController.jumpToPage(i);
    update();
  }
}
