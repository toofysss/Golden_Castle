import 'package:flutter/material.dart';
import 'package:gcc/Pages/Homescreen/favourite.dart';
import 'package:gcc/Pages/Wallet/viewwallet.dart';
import 'package:gcc/Pages/account/account.dart';
import 'package:gcc/Pages/login/login.dart';
import 'package:gcc/constant/login.dart';
import 'package:gcc/services/services.dart';
import 'package:get/get.dart';

class MoreClass {
  static wallet(BuildContext context) {
    Get.to(() => const ViewWallet(), transition: Transition.fadeIn);
  }

  static accountInformation(BuildContext context) {
    Get.to(() => const AccountInformation(), transition: Transition.fadeIn);
  }

  static favourite(BuildContext context) {
    Get.to(() => const Favourite(), transition: Transition.fadeIn);
  }

  static accountStatment(BuildContext context) {}
  static contactus(BuildContext context) {}
  static notifications(BuildContext context) {}

  static helpCenter(BuildContext context) {}
  static customerService(BuildContext context) {}

  static aboutCompany(BuildContext context) {}

  static invoice(BuildContext context) {}

  static login(BuildContext context) {
    Get.offAll(() => const Login(), transition: Transition.fadeIn);
  }

  static logout(BuildContext context) {
    LoginClass.username.clear();
    LoginClass.password.clear();
    MyServices myServices = Get.find();
    myServices.sharedPreferences.remove("login");
    Get.offAll(() => const Login(), transition: Transition.fadeIn);
  }
}
