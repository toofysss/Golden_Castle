import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/product.dart';
import 'package:gcc/constant/section.dart';
import 'package:gcc/widget/customloading.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:gcc/widget/errorMessage.dart';
import 'package:get/get.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductClass.getbestProduct(context),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return ErrorMessage(
            subtitle: "25".tr,
            title: "24".tr,
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length == 0) {
            return SizedBox(
                width: Get.width, height: 230, child: const CustomLoading());
          }
        }

        // جلب البيانات
        if (snapshot.hasData) {
          return SizedBox(
            height: 320,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final item = snapshot.data[index];

                return FlipInY(
                  duration: SectionClass.duration,
                  child: Stack(
                    children: [
                      Container(
                        width: 190,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: ColorsClass.containercolor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width,
                              margin: const EdgeInsets.all(7),
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(item['image']),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2.5),
                                      child: Text(
                                        "${item['price']}",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: All.textsize,
                                            shadows: const [
                                              Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 4)
                                            ],
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      )),
                                  Visibility(
                                    visible: item['price'] != null,
                                    child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 2.5),
                                        child: Text(
                                          "${item['price']}",
                                          maxLines: 1,
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationThickness: 2,
                                              decorationColor: Colors.red,
                                              fontSize: All.textsize,
                                              color: const Color.fromRGBO(
                                                  228, 228, 228, 1),
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            // Text
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2.5),
                              child: CustomText(
                                data: "${item['title']}",
                                fontWeight: FontWeight.bold,
                                colors: Colors.white,
                                size: All.textsize,
                                maxLines: 1,
                              ),
                            ),

                            // Text
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2.5),
                              child: CustomText(
                                data: "${item['price']}",
                                fontWeight: FontWeight.bold,
                                colors: Colors.yellow,
                                size: All.textsize - 2,
                                maxLines: 1,
                              ),
                            ),

                            // Text
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2.5),
                              child: CustomText(
                                data: "${item['description']}",
                                fontWeight: FontWeight.bold,
                                colors: Colors.white,
                                size: All.textsize - 4,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 7.2,
                        right: 7,
                        child: Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(.15),
                                Colors.white.withOpacity(.05),
                              ],
                            ),
                          ),
                          child: GestureDetector(
                            child: const Icon(
                              Icons.favorite_border_sharp,
                              size: 25,
                              color: Colors.red,
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          //  واجهة الانتظار
          return SizedBox(
              width: Get.width, height: 230, child: const CustomLoading());
        }

        //  واجهة الانتظار
        return SizedBox(
            width: Get.width, height: 230, child: const CustomLoading());
      },
    );
  }
}
