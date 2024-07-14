import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenControllerImp extends GetxController {
  int i = 0;
  static PageController pageController = PageController();

  List<Widget> pages = [];
  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.grid_view,
    Icons.favorite_outline_rounded,
    Icons.more_horiz,
  ];
  changepage(int currentPage) {
    i = currentPage;
    pageController.jumpToPage(i);
    update();
  }
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        init: HomeScreenControllerImp(),
        builder: (controller) {
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: Container(
              margin: const EdgeInsets.all(20),
              height: Get.width * .120,
              decoration: BoxDecoration(
                // color: ColorsClass.bottomNavigationBarbg,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: Get.width * .024),
                itemBuilder: (context, index) => InkWell(
                  onTap: () => controller.changepage(index),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: EdgeInsets.only(
                          bottom: index == controller.i ? 0 : Get.width * .029,
                          right: Get.width * .0422,
                          left: Get.width * .0422,
                        ),
                        width: Get.width * .128,
                        height: index == controller.i ? Get.width * .014 : 0,
                        decoration: BoxDecoration(
                          // color: ColorsClass.bottomNavigationBarselected,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(50),
                          ),
                        ),
                      ),
                      Icon(
                        controller.listOfIcons[index],
                        size: Get.width * .060,
                        // color: index == controller.i
                        //     ? ColorsClass.bottomNavigationBarselected
                        //     : Colors.white,
                      ),
                      SizedBox(height: Get.width * .03),
                    ],
                  ),
                ),
              ),
            ),
            body: PageView(
              controller: HomeScreenControllerImp.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                  controller.pages.length, (index) => controller.pages[index]),
            ),
          );
        });
  }
}
