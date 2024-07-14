import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gcc/constant/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SectionClass {
  // البحث
  static TextEditingController name = TextEditingController();
  // الفلترة
  static String search = "23".tr;
  static Duration duration = const Duration(seconds: 1);
  static String url = "";

  static Future getdata(BuildContext context, String url) async {
    try {
      var response = await http.get(
        Uri.parse(ApiClass.api),
      );
      var responseData = jsonDecode(response.body);
      return responseData;
    } catch (e) {
      debugPrint("Exception: $e");
    }
  }

  static Future viewData() async {}
}
