import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gcc/UI/customloading.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import '../../Moudle/blogmoudle.dart';
import '../../UI/notfound.dart';
import '../../constant/api.dart';

class BlogController extends GetxController {
  RxBool isloading = true.obs;
  double heightCarousel = Get.height / 4.5;
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  List<BlogData> blogs = <BlogData>[].obs;
  Future getblog() async {
    var response = await http.get(Uri.parse(ApiClass.api));
    List<dynamic> listdata = jsonDecode(response.body);
    final List<BlogData> data =
        listdata.map((json) => BlogData.fromJson(json)).toList();
    blogs.assignAll(data);
    isloading.toggle();
    update();
  }

  changeindex(int i) {
    currentIndex = i;
    update();
  }

  @override
  void onInit() {
    getblog();
    super.onInit();
  }
}

class GetBlog extends StatelessWidget {
  const GetBlog({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BlogController(),
      builder: (controller) => Obx(() {
        if (controller.isloading.value && controller.blogs.isEmpty) {
          return SizedBox(
            height: controller.heightCarousel,
            child: const Center(child: Loading()),
          );
        } else if (controller.isloading.value == false &&
            controller.blogs.isEmpty) {
          return const NotFound();
        } else {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: controller.heightCarousel + 30,
            child: Column(
              children: List.generate(1, (index) {
                return Column(
                  children: [
                    CarouselSlider(
                      items: controller.blogs
                          .map<Widget>(
                            (item) => Image.network(
                              item.image!,
                              fit: BoxFit.fill,
                              width: Get.width,
                              height: Get.height,
                            ),
                          )
                          .toList(),
                      carouselController: controller.carouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        height: controller.heightCarousel,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 1,
                        onPageChanged: (index, reason) =>
                            controller.changeindex(index),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: controller.blogs
                            .asMap()
                            .entries
                            .map<Widget>((entry) {
                          return Container(
                            width:
                                controller.currentIndex == entry.key ? 17 : 7,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(horizontal: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: controller.currentIndex == entry.key
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              }),
            ),
          );
        }
      }),
    );
  }
}
