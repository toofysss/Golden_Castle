import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:coldencastle/widget/merchantcertificatepage/customcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

// صفحة شهادة التاجر

class Merchantcertificatepage extends StatelessWidget {
  const Merchantcertificatepage({super.key});

  @override
  Widget build(BuildContext context) {

    return
        // اتجاه التطبيق
        Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(All.appbarheight),
                  child:
                      // تصميم Appbar
                      CustomAppBar(
                    title: "13".tr, actions: Container(),
                    // زر الرجوع
                    leading: GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: All.arrowsize,
                          color: Colors.white,
                        )),
                  )),
              body: Directionality(
                textDirection:
// تحقق اذا التطبيق عربي او انكليزي
                    LanguageClass.lang.text == "English"
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                child: FutureBuilder(
                    future: Allgetdata.getInfo(context),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      // جلب البيانات
                      if (snapshot.hasData) { if (Allgetdata.info.isEmpty) {
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
                            DateTime date = DateTime.parse(Allgetdata.info[0]['CreatedDate']);
    String formattedDate = intl.DateFormat("yyyy/MM/dd").format(date);
                        return Container(
                            height: Get.height,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [All.color2, All.color1]),
                            ),
                            child: SafeArea(
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child:
                                        // تحقق اذا التطبيق عربي او انكليزي

                                        LanguageClass.lang.text == "English"
                                            ?
                                            //  شهادة التاجر الانكليزية
                                            CustomCard(
                                                title:
                                                    ' ${Allgetdata.info[0]['NameE']}',
                                                textDecorations: 'en',
                                                owner:
                                                    ' ${Allgetdata.info[0]['Title']}',
                                                join:
                                                    ' $formattedDate ${"35".tr} ${Allgetdata.info[0]['CategoryidE']}',
                                                footer: "36".tr,
                                              )
                                            :
                                            // شهادة التاجر العربية
                                            CustomCard(
                                                title:
                                                    ' ${Allgetdata.info[0]['NameA']}',
                                                textDecorations: 'ar',
                                                owner:
                                                    ' ${Allgetdata.info[0]['ArTitle']}',
                                                join:
                                                    ' $formattedDate  ${"35".tr}${Allgetdata.info[0]['CategoryidA']}',
                                                footer: "36".tr,
                                              ))));
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
                        if (Allgetdata.info.isEmpty) {
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
                        //  واجهة الانتظار

                        return CustomLoading(
                          color: All.color2,
                        );
                      }
                      //  واجهة الانتظار

                      return CustomLoading(
                        color: All.color2,
                      );
                    }),
              ),
            ));
  }
}
