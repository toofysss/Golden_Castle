import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/constant/root.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialservices() async {
  await Get.putAsync(() => MyServices().init());
}

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();
  // get lang
  getlang() {
    String? lang = myServices.sharedPreferences.getString("lang") ??
        Get.deviceLocale!.languageCode;
    language = Locale(lang);
    Root.lang = lang;
  }

  // عند تشغيل التطبيق
  @override
  void onInit() {
    getlang();
    super.onInit();
  }
}
