import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewServices extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String facebook;
  final String phone;
  final String email;
  final String website;
  const ViewServices(
      {required this.title,
      required this.image,
      required this.description,
      required this.facebook,
      required this.phone,
      required this.email,
      required this.website,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(All.appbarheight),
              child:
                  // تصميم appbar
                  CustomAppBar(
                title: title, actions: Container(),
                // زر الرجوع
                leading: GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: All.arrowsize,
                      color: Colors.white,
                    )),
              )),
          body: Container(
            color: Colors.white,
            child: InteractiveViewer(
              maxScale: 10,
              child: Directionality(
                textDirection: LanguageClass.lang.text == "English"
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // صورة التاجر
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SizedBox(
                            height: Get.height * 0.15,
                            width: Get.width * 0.35,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(image),
                                      fit: BoxFit.fill)),
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      ),
                      //  تصميم اطار
                      Container(
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2, color: Colors.white)),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8),
                                  child: CustomText(
                                      color: const Color(0xffAF9C9E),
                                      data: description,
                                      size: 14),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 30.0),
                                child: Divider(
                                  indent: 30,
                                  endIndent: 30,
                                  color: Colors.grey,
                                  thickness: 2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      // عند ظغط
                                      onTap: () =>
                                          DataServicesClass.urllauncher(
                                              facebook, context),

                                      child: Center(
                                          child: Icon(
                                        Icons.facebook,
                                        size: 40,
                                        color: All.color1,
                                      )),
                                    ),
                                    GestureDetector(
                                      // عند ظغط
                                      onTap: () =>
                                          DataServicesClass.urllauncher(
                                              "tel:+964$phone", context),

                                      child: Center(
                                          child: Icon(
                                        Icons.phone,
                                        size: 40,
                                        color: All.color1,
                                      )),
                                    ),
                                    GestureDetector(
                                      // عند ظغط
                                      onTap: () =>
                                          DataServicesClass.urllauncher(
                                              "mailto:$email", context),

                                      child: Center(
                                          child: Icon(
                                        Icons.email,
                                        size: 40,
                                        color: All.color1,
                                      )),
                                    ),
                                    GestureDetector(
                                      // عند ظغط
                                      onTap: () =>
                                          DataServicesClass.urllauncher(
                                              website, context),

                                      child: Center(
                                          child: Icon(
                                        Icons.language,
                                        size: 40,
                                        color: All.color1,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
