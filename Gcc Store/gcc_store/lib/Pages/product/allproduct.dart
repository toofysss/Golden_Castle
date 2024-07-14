import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/language.dart';
import 'package:gcc/constant/product.dart';
import 'package:gcc/constant/section.dart';
import 'package:gcc/widget/customloading.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:gcc/widget/errorMessage.dart';
import 'package:get/get.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  // فلترة
  filter() async {}

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsClass.appbarbg,
            elevation: 0,
            centerTitle: true,
            title: CustomText(
              maxLines: 1,
              data: "2".tr,
              size: All.textsize,
              colors: ColorsClass.textcolorsSecondry,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: Directionality(
              // تحقق اذا كان الزر عربي او انكليزي
              textDirection: LanguageClass.lang.text == "English"
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: SafeArea(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // نص البحث
                            Center(
                              child: FadeInRight(
                                duration: SectionClass.duration,
                                child: Container(
                                  width: Get.width * 0.9,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  child: Material(
                                      elevation: 6,
                                      shadowColor: ColorsClass.iconcolor,
                                      borderRadius: BorderRadius.circular(30),
                                      child: ListTile(
                                        title: TextField(
                                          //  التحكم
                                          controller: SectionClass.name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                          keyboardType: TextInputType.name,
                                          cursorColor: ColorsClass.iconcolor,
                                          decoration: InputDecoration(
                                            labelText: "20".tr,
                                            labelStyle: TextStyle(
                                                fontSize: 20,
                                                color: ColorsClass.iconcolor,
                                                fontWeight: FontWeight.bold),
                                            hintText: "20".tr,
                                            border: InputBorder.none,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20),
                                          ),
                                        ),
                                        trailing: GestureDetector(
                                          onTap: () => filter(),
                                          child: Icon(
                                            Icons.search,
                                            size: All.iconSize,
                                            color: ColorsClass.iconcolor,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ),

                            FutureBuilder(
                                future: ProductClass.getProduct(context),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasError) {
                                    return ErrorMessage(
                                      subtitle: "25".tr,
                                      title: "24".tr,
                                    );
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.data.length == 0) {
                                      return SizedBox(
                                          width: Get.width,
                                          height: 250,
                                          child: const CustomLoading());
                                    }
                                  }

                                  if (snapshot.hasData) {
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisExtent: 320,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5,
                                      ),
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        final item = snapshot.data[index];

                                        return FlipInY(
                                          duration: SectionClass.duration,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 190,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                  color: ColorsClass
                                                      .containercolor,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: Get.width,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              7),
                                                      height: 170,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              item['image']),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          5,
                                                                      vertical:
                                                                          2.5),
                                                              child: Text(
                                                                "${item['price']}",
                                                                maxLines: 1,
                                                                style: TextStyle(
                                                                    fontSize: All
                                                                        .textsize,
                                                                    shadows: const [
                                                                      Shadow(
                                                                          color: Colors
                                                                              .black,
                                                                          blurRadius:
                                                                              4)
                                                                    ],
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis),
                                                              )),
                                                          Visibility(
                                                            visible:
                                                                item['price'] !=
                                                                    null,
                                                            child: Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        5,
                                                                    vertical:
                                                                        2.5),
                                                                child: Text(
                                                                  "${item['price']}",
                                                                  maxLines: 1,
                                                                  style: TextStyle(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                      decorationThickness:
                                                                          2,
                                                                      decorationColor:
                                                                          Colors
                                                                              .red,
                                                                      fontSize: All
                                                                          .textsize,
                                                                      color: const Color
                                                                          .fromRGBO(
                                                                          228,
                                                                          228,
                                                                          228,
                                                                          1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis),
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // Text
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5,
                                                          vertical: 2.5),
                                                      child: CustomText(
                                                        data:
                                                            "${item['title']}",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        colors: Colors.white,
                                                        size: All.textsize,
                                                        maxLines: 1,
                                                      ),
                                                    ),

                                                    // Text
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5,
                                                          vertical: 2.5),
                                                      child: CustomText(
                                                        data:
                                                            "${item['price']}",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        colors: Colors.yellow,
                                                        size: All.textsize - 2,
                                                        maxLines: 1,
                                                      ),
                                                    ),

                                                    // Text
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5,
                                                          vertical: 2.5),
                                                      child: CustomText(
                                                        data:
                                                            "${item['description']}",
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(5),
                                                      topRight:
                                                          Radius.circular(5),
                                                    ),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        Colors.white
                                                            .withOpacity(.15),
                                                        Colors.white
                                                            .withOpacity(.05),
                                                      ],
                                                    ),
                                                  ),
                                                  child: GestureDetector(
                                                    child: const Icon(
                                                      Icons
                                                          .favorite_border_sharp,
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
                                    );
                                  }
                                  return SizedBox(
                                      width: Get.width,
                                      height: 250,
                                      child: const CustomLoading());
                                })
                          ]))))),
    );
  }
}
