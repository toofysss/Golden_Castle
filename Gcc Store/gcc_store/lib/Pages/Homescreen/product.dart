import 'package:flutter/material.dart';
import 'package:gcc/Moudle/blogmoudle.dart';
import 'package:gcc/constant/api.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

import '../../constant/all.dart';
import '../../constant/color.dart';
import '../../constant/product.dart';
import '../../widget/customtext.dart';
import '../product/bestseller.dart';
import '../product/blog.dart';
import '../product/lastproduct.dart';
import '../product/listsection.dart';
import '../product/product.dart';

class ProductController extends GetxController {
  RxBool isloading = true.obs;
  List<BlogData> blogs = <BlogData>[].obs;
  Future getblog() async {
    var response = await http.get(Uri.parse(ApiClass.api));
    var responseData = jsonDecode(response.body);
    final List<BlogData> data =
        responseData.map((json) => BlogData.fromJson(json)).toList();
    blogs.assignAll(data);
    isloading.toggle();
    update();
  }

  @override
  void onInit() {
    getblog();
    super.onInit();
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(title: Text("1".tr)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const GetBlog(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       margin: const EdgeInsets.all(10),
          //       child: CustomText(
          //           maxLines: 1,
          //           data: "50".tr,
          //           size: All.header,
          //           colors: ColorsClass.textcolor,
          //           fontWeight: FontWeight.bold),
          //     ),
          //     GestureDetector(
          //       onTap: () => ProductClass.viewsection(),
          //       child: Container(
          //           margin: const EdgeInsets.all(10),
          //           child: Row(
          //             children: [
          //               CustomText(
          //                   maxLines: 1,
          //                   data: "51".tr,
          //                   size: All.header - 5,
          //                   colors: ColorsClass.textcolor,
          //                   fontWeight: FontWeight.bold),
          //               Icon(
          //                 Icons.arrow_forward_ios_rounded,
          //                 size: All.iconSize - 10,
          //                 color: ColorsClass.iconcolor,
          //               ),
          //             ],
          //           )),
          //     )
          //   ],
          // ),
          // const ListSection(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       margin: const EdgeInsets.all(10),
          //       child: CustomText(
          //           maxLines: 1,
          //           data: "52".tr,
          //           size: All.header,
          //           colors: ColorsClass.textcolor,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
          // const LastProduct(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       margin: const EdgeInsets.all(10),
          //       child: CustomText(
          //           maxLines: 1,
          //           data: "53".tr,
          //           size: All.header,
          //           colors: ColorsClass.textcolor,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
          // const BestSeller(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       margin: const EdgeInsets.all(10),
          //       child: CustomText(
          //           maxLines: 1,
          //           data: "2".tr,
          //           size: All.header,
          //           colors: ColorsClass.textcolor,
          //           fontWeight: FontWeight.bold),
          //     ),
          //     GestureDetector(
          //       onTap: () => ProductClass.viewproduct(),
          //       child: Container(
          //           margin: const EdgeInsets.all(10),
          //           child: Row(
          //             children: [
          //               CustomText(
          //                   maxLines: 1,
          //                   data: "51".tr,
          //                   size: All.header - 5,
          //                   colors: ColorsClass.textcolor,
          //                   fontWeight: FontWeight.bold),
          //               Icon(
          //                 Icons.arrow_forward_ios_rounded,
          //                 size: All.iconSize - 10,
          //                 color: ColorsClass.iconcolor,
          //               ),
          //             ],
          //           )),
          //     )
          //   ],
          // ),
          // const GetProduct()
        ]),
      ),
    );
  }
}
