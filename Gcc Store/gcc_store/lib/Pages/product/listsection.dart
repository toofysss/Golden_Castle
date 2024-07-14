import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gcc/UI/customloading.dart';
import 'package:gcc/UI/notfound.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Moudle/sectionmoudle.dart';
import '../../constant/api.dart';

class ListSectionController extends GetxController {
  RxBool isloading = true.obs, startAnimation = false.obs;
  List<SectionData> section = <SectionData>[].obs;
  Future getblog() async {
    var response = await http.get(Uri.parse(ApiClass.api));
    List<dynamic> listdata = jsonDecode(response.body);
    final List<SectionData> data =
        listdata.map((json) => SectionData.fromJson(json)).toList();
    section.assignAll(data);
    isloading.toggle();
    animation();
    update();
  }

  animation() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startAnimation.toggle();
      update();
    });
  }

  @override
  void onInit() {
    getblog();
    super.onInit();
  }
}

class ListSection extends StatelessWidget {
  const ListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ListSectionController(),
        builder: (controller) => Obx(() {
              if (controller.isloading.value && controller.section.isEmpty) {
                return const Loading();
              } else if (controller.isloading.value &&
                  controller.section.isEmpty) {
                return const NotFound();
              } else {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.section.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      return AnimatedContainer(
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(milliseconds: 300 + (index * 200)),
                        transform: Matrix4.translationValues(
                            controller.startAnimation.value
                                ? 0
                                : (index * 100.0),
                            0,
                            0),
                        width: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 8,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(item.image!),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            // Text
                            Text(
                              "${item.title}",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                );
              }
            }));
  }
}
