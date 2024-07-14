import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/book/custombook.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// الكتب
class Books extends StatelessWidget {
  const Books({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(All.appbarheight),
            child:
                // تصميم appbar
                CustomAppBar(
              title: "15".tr, actions: Container(),
              // زر الرجوع
              leading: GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: All.arrowsize,
                    color: Colors.white,
                  )),
            )),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [All.color2, All.color1]),
              ),
            ),
            Directionality(
                textDirection: LanguageClass.lang.text == "English"
                    ? TextDirection.ltr
                    : TextDirection.rtl,
// جلب الكتب
                child: FutureBuilder(
                    future: BooksClass.getInfo(context),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                         if (BooksClass.data.isEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            AwesomeDialog(
                                context: context,
                                animType: AnimType.scale,
                                dialogType: DialogType.warning,
                                body: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Center(
                                    child: CustomText(
                                        color: Colors.black,
                                        data: "85".tr,
                                        size: All.textsize),
                                  ),
                                ),
                                btnCancelColor: Colors.green,
                                btnCancelText: "105".tr,
                                btnCancelOnPress: () {
                                  Get.back();
                                }).show();
                          });

                          return Container();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: BooksClass.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomBook(
                                  id: BooksClass.data[index]['BookId'],
                                  bookno: BooksClass.data[index]['BookNo'],
                                  datebook: BooksClass.data[index]
                                      ['IssueDate'],
                                );

                                // دليل التاجر
                              }),
                        );
                      }

                      if (snapshot.hasError) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          AwesomeDialog(
                                  context: context,
                                  animType: AnimType.scale,
                                  dialogType: DialogType.warning,
                                  body: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Center(
                                      child: CustomText(
                                          color: Colors.black,
                                          data: "52".tr,
                                          size: All.textsize),
                                    ),
                                  ),
                                  btnCancelColor: Colors.green,
                                  btnCancelText: "105".tr,
                                  btnCancelOnPress: () {})
                              .show();
                        });
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (BooksClass.data.isEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            AwesomeDialog(
                                context: context,
                                animType: AnimType.scale,
                                dialogType: DialogType.warning,
                                body: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Center(
                                    child: CustomText(
                                        color: Colors.black,
                                        data: "85".tr,
                                        size: All.textsize),
                                  ),
                                ),
                                btnCancelColor: Colors.green,
                                btnCancelText: "105".tr,
                                btnCancelOnPress: () {
                                  Get.back();
                                }).show();
                          });

                          return Container();
                        }
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // صورة الانتظار

                        return const CustomLoading(color: Colors.white);
                      }
                      // صورة الانتظار

                      return const CustomLoading(color: Colors.white);
                    }))
          ],
        ),
      ),
    );
  }
}
