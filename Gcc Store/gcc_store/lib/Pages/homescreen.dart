import 'package:flutter/material.dart';
import 'package:gcc/UI/button.dart';
import 'package:gcc/UI/hometitle.dart';
import 'package:get/get.dart';
import 'product/bestseller.dart';
import 'product/blog.dart';
import 'product/lastproduct.dart';
import 'product/listsection.dart';
import 'product/product.dart';

class HomeScreenController extends GetxController {
  viewsection() {}

  viewproduct() {}
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeScreenController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("1".tr,
                              style: Theme.of(context).textTheme.bodyLarge),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ButtonIconDesign(
                                    iconData: Icons.notifications,
                                    onTap: () {}),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ButtonIconDesign(
                                    iconData: Icons.settings, onTap: () {}),
                              ),
                            ],
                          )
                        ],
                      ),

                      // Blog Card
                      const GetBlog(),

                      // Section
                      HomeTitleUI(
                          onTap: () => controller.viewsection(),
                          title: "50".tr),
                      const ListSection(),

                      // Last Product
                      HomeTitleUI(title: "52".tr),
                      const LastProduct(),

                      // Best Seller
                      HomeTitleUI(title: "53".tr),
                      const BestSeller(),

                      // Product
                      HomeTitleUI(
                          onTap: () => controller.viewproduct(), title: "2".tr),
                      const GetProduct()
                    ]),
              ),
            ),
          );
        });
  }
}
