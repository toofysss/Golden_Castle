import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gcc/Moudle/blogmoudle.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class BlogClass {
  static final CarouselController carouselController = CarouselController();
  static int currentIndex = 0;
  static double heightCarousel = Get.height / 4.5;
  List<BlogData> blogs = <BlogData>[].obs;
  Future getblog() async {
    try {
      var response = await http.get(Uri.parse(ApiClass.api));
      var responseData = jsonDecode(response.body);
      final List<BlogData> data =
          responseData.map((json) => BlogData.fromJson(json)).toList();
      blogs.assignAll(data);
      return responseData;
    } catch (e) {
      debugPrint("Exception: $e");
    }
  }
}
