import 'package:credit_card/constant/language.dart';
import 'package:credit_card/services/services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

// تغيير اللغة
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

// get lang
  getlang() {
    String? sharedPreferences = myServices.sharedPreferences.getString("lang");
    if (sharedPreferences == "ar") {
      language = const Locale("ar");
      LanguageClass.lang.text = "Arabic";
    } else if (sharedPreferences == "en") {
      language = const Locale("en");
      LanguageClass.lang.text = "English";
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      if (language!.languageCode == "en") {
        language = const Locale("en");
        LanguageClass.lang.text = "English";
      } else {
        language = const Locale("ar");
        LanguageClass.lang.text = "Arabic";
      }
    }
  }

// عند تشغيل التطبيق
  @override
  void onInit() {
    getlang();
    super.onInit();
  }
}
