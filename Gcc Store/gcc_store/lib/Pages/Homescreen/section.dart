import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';

import '../../constant/all.dart';
import '../../constant/color.dart';
import '../../constant/language.dart';
import '../../constant/section.dart';
import '../../widget/customloading.dart';
import '../../widget/customtext.dart';
import '../../widget/errorMessage.dart';
import '../section/customSection.dart';

class Section extends StatefulWidget {
  const Section({super.key});

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  // فلترة
  filter() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsClass.appbarbg,
          elevation: 0,
          centerTitle: true,
          title: CustomText(
            maxLines: 1,
            data: "19".tr,
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
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // filter
                      Center(
                        child: FadeInRight(
                          duration: SectionClass.duration,
                          child: Container(
                            width: Get.width * 0.9,
                            margin: const EdgeInsets.only(top: 18),
                            child: Material(
                                elevation: 6,
                                shadowColor: ColorsClass.iconcolor,
                                borderRadius: BorderRadius.circular(30),
                                child: ListTile(
                                  title: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: Icon(
                                        Icons.filter_list_rounded,
                                        size: All.iconSize + 2,
                                        color: ColorsClass.iconcolor,
                                      ),
                                      iconEnabledColor: ColorsClass.iconcolor,
                                      iconDisabledColor: ColorsClass.iconcolor,
                                      borderRadius: BorderRadius.circular(25),
                                      hint: CustomText(
                                        maxLines: 1,
                                        colors: ColorsClass.iconcolor,
                                        data: SectionClass.search,
                                        size: All.textsize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          SectionClass.search = value!;
                                        });
                                      },
                                      items: [
                                        "21".tr,
                                        "22".tr,
                                      ]
                                          .map<DropdownMenuItem<String>>(
                                              (String value) =>
                                                  DropdownMenuItem<String>(
                                                      value: value,
                                                      child: CustomText(
                                                        maxLines: 1,
                                                        colors: ColorsClass
                                                            .iconcolor,
                                                        data: value,
                                                        size: All.textsize,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )))
                                          .toList(),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),

                      // نص البحث
                      Center(
                        child: FadeInRight(
                          duration: SectionClass.duration,
                          child: Container(
                            width: Get.width * 0.9,
                            margin: const EdgeInsets.only(top: 18),
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
                          future:
                              SectionClass.getdata(context, SectionClass.url),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.data.length == 0) {
                                return const CustomLoading();
                              }
                            }

                            if (snapshot.hasError) {
                              return ErrorMessage(
                                subtitle: "25".tr,
                                title: "24".tr,
                              );
                            }
                            if (snapshot.hasData) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (snapshot.data.length == 0) {
                                        // صورة الانتظار
                                        return const CustomLoading();
                                      }
                                      return LanguageClass.lang.text ==
                                              "English"
                                          ? CustomSection(
                                              subtitle: snapshot.data[index]
                                                  ['description'],
                                              title: snapshot.data[index]
                                                  ['title'],
                                              image: snapshot.data[index]
                                                  ['image'],
                                            )
                                          : CustomSection(
                                              subtitle: snapshot.data[index]
                                                  ['description'],
                                              title: snapshot.data[index]
                                                  ['title'],
                                              image: snapshot.data[index]
                                                  ['image'],
                                            );
                                    }),
                              );
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // صورة الانتظار

                              return const CustomLoading();
                            }
                            // صورة الانتظار

                            return const CustomLoading();
                          })
                    ]))));
  }
}
