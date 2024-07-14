import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:coldencastle/widget/merhantpage/customcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
// صفحة هوية التاجر
class MerhantPage extends StatelessWidget {
  const MerhantPage({super.key});

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
                    title: "12".tr, actions: Container(),
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
                    // الالوان

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [All.color2, All.color1]),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: FutureBuilder(
                        future: Allgetdata.getInfo(context),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          // جلب البيانات
                          if (snapshot.hasData) {
                                if (Allgetdata.info.isEmpty) {
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
     DateTime date2 = DateTime.parse(Allgetdata.info[0]['CreatedDate']);
    String formattedDate2 = intl.DateFormat("yyyy").format(date2);

                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // تحقق اذا التطبيق عربي او انكليزي

                                LanguageClass.lang.text == "English"
                                    ?
                                    //  هوية التاجر الانكليزية
                                    CustomCardID(
                                        textDirection: 'en',
                                        name: " ${Allgetdata.info[0]['NameE']}",
                                        tradename:
                                            " ${Allgetdata.info[0]['Title']}",
                                        activity:
                                            ' ${Allgetdata.info[0]['ActivityE']}',
                                        grade:
                                            ' ${Allgetdata.info[0]['CategoryidE']}',
                                        gradeno:
                                            All.azbaranum.text,
                                        affiliation:
                                            ' $formattedDate',
                                        expiredate: ' $formattedDate2',
                                      )
                                    :

                                    // هوية التاجر العربية
                                    CustomCardID(
                                        textDirection: 'ar',
                                        name: "${Allgetdata.info[0]['NameA']}",
                                        tradename:
                                            " ${Allgetdata.info[0]['ArTitle']}",
                                        activity:
                                            '${Allgetdata.info[0]['ActivityA']}',
                                        grade:
                                            '${Allgetdata.info[0]['CategoryidA']}',
                                        gradeno:
                                            All.azbaranum.text,
                                      affiliation:
                                            ' $formattedDate',
                                        expiredate: ' $formattedDate2',
                                      ),
                              ],
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
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (Allgetdata.info.isEmpty) {
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
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                ],
              ),
            ));
  }
}
