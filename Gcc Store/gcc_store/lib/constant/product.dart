import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gcc/Pages/product/allproduct.dart';
import 'package:gcc/Pages/product/allsection.dart';
import 'package:gcc/constant/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductClass {
  static List productData = [];
  static List lastProductData = [];
  static List listSectionData = [];
  static List bestsellerData = [];

  static Future viewsection() async {
    Get.to(() => const AllSection(), transition: Transition.fadeIn);
  }

  static Future viewproduct() async {
    Get.to(() => const AllProduct(), transition: Transition.fadeIn);
  }

  static Future viewditalsproduct() async {
    Get.to(() => const AllProduct(), transition: Transition.fadeIn);
  }

  static Future viewlastproduct() async {}
  static Future getbestProduct(BuildContext context) async {
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

  static Future getlastProduct(BuildContext context) async {
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

  static Future getsection(BuildContext context) async {
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

  static Future getProduct(BuildContext context) async {
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
}
