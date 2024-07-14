import 'dart:io';

import 'package:credit_card/Pages/login.dart';
import 'package:credit_card/Pages/setting/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingClass {
  static logout() {
    Get.to(() => const Login(), transition: Transition.fadeIn);
  }

  static account(BuildContext context) {
    Get.to(() => const Account(), transition: Transition.fadeIn);
  }
}

class AccountClass {
  File? profileimage;
  static TextEditingController email = TextEditingController();
  static TextEditingController name = TextEditingController();
  static TextEditingController cardno = TextEditingController();
  static TextEditingController cvv = TextEditingController();
  static TextEditingController exp = TextEditingController();
}

class ChangePasswordClass {
  static final formkey = GlobalKey<FormState>();
  static final formkeycheck = GlobalKey<FormState>();
  static TextEditingController olapss = TextEditingController();

  // تححق
  static TextEditingController key1 = TextEditingController();
  // تحقق
  static TextEditingController key2 = TextEditingController();
}
