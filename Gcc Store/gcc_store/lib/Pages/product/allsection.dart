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

class AllSection extends StatefulWidget {
  const AllSection({super.key});

  @override
  State<AllSection> createState() => _AllSectionState();
}

class _AllSectionState extends State<AllSection> {
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
              data: "3".tr,
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
                                future: ProductClass.getsection(context),
                                builder: (context, snapshot) {
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
                                          height: 130,
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
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5,
                                      ),
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        final item = snapshot.data[index];

                                        return FlipInY(
                                          duration: SectionClass.duration,
                                          child: Container(
                                            width: 100,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        ColorsClass.bordercolor,
                                                  ),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                    ),
                                                    child: Container(
                                                      height: 125,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              item['image']),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ), // Text
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  child: CustomText(
                                                    maxLines: 1,
                                                    data: "${item['title']}",
                                                    fontWeight: FontWeight.bold,
                                                    colors: Colors.black,
                                                    size: All.textsize,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                  return SizedBox(
                                      width: Get.width,
                                      height: 130,
                                      child: const CustomLoading());
                                })
                          ]))))),
    );
  }
}
