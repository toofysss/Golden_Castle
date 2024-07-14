import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:coldencastle/widget/dalilsetting/customview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// دليل التاجر

class Dalil extends StatefulWidget {
  const Dalil({super.key});

  @override
  State<Dalil> createState() => _DalilState();
}

class _DalilState extends State<Dalil> {
  check() {
    if (SettingDalilClass.isTactive == false &&
        SettingDalilClass.isTaddress == false &&
        SettingDalilClass.isTlocation == false &&
        SettingDalilClass.isTname == false &&
        SettingDalilClass.isTphone == false &&
        SettingDalilClass.isTtitle == false &&
        SettingDalilClass.isTwebsite == false) {
      setState(() {
        SettingDalilClass.checkview = true;
      });
    } else {
      setState(() {
        SettingDalilClass.checkview = false;
      });
    }
  }

  @override
  void initState() {
    check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(All.appbarheight),
              child:
                  // تصميم appbar
                  CustomAppBar(
                title: "17".tr,
                // hint
                actions: GestureDetector(
                  onTap: () {
                    AwesomeDialog(
                            context: context,
                            animType: AnimType.scale,
                            dialogType: DialogType.info,
                            body: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Center(
                                child: CustomText(
                                    color: Colors.black,
                                    data: "65".tr,
                                    size: All.textsize),
                              ),
                            ),
                            btnCancelColor: Colors.green,
                            btnCancelText: "105".tr,
                            btnCancelOnPress: () {})
                        .show();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.question_mark,
                      size: All.arrowsize,
                      color: Colors.white,
                    ),
                  ),
                ),
                // زر الرجوع
                leading: GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: All.arrowsize,
                      color: Colors.white,
                    )),
              )),
          body: FutureBuilder(
              future: SettingDalilClass.getInfo(context),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (SettingDalilClass.info.isEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      AwesomeDialog(
                          context: context,
                          animType: AnimType.scale,
                          dialogType: DialogType.warning,
                          body: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                // جلب البيانات
                if (snapshot.hasData) {
                  if (SettingDalilClass.info.isEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      AwesomeDialog(
                          context: context,
                          animType: AnimType.scale,
                          dialogType: DialogType.warning,
                          body: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                  // الخدمات
                  return Stack(
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
                        // تحقق من التطبيق عربي او انكليزي
                        textDirection: LanguageClass.lang.text == "English"
                            ? TextDirection.ltr
                            : TextDirection.rtl,

                        child: LanguageClass.lang.text == "English"
                            ? CustomView(
                                title:
                                    '${SettingDalilClass.info[0]['Value_E']}',
                                isTitle: '${SettingDalilClass.info[0]['Chk']}',
                                name: '${SettingDalilClass.info[1]['Value_E']}',
                                isname: '${SettingDalilClass.info[1]['Chk']}',
                                active:
                                    '${SettingDalilClass.info[2]['Value_E']}',
                                isactive: '${SettingDalilClass.info[2]['Chk']}',
                                phone:
                                    '${SettingDalilClass.info[3]['Value_E']}',
                                isphone: '${SettingDalilClass.info[3]['Chk']}',
                                address:
                                    '${SettingDalilClass.info[4]['Value_E']}',
                                isaddres: '${SettingDalilClass.info[4]['Chk']}',
                                location:
                                    '${SettingDalilClass.info[5]['Value_E']}',
                                islocation:
                                    '${SettingDalilClass.info[5]['Chk']}',
                                website:
                                    '${SettingDalilClass.info[6]['Value_E']}',
                                iswebsite:
                                    '${SettingDalilClass.info[6]['Chk']}',
                                desc: '${SettingDalilClass.info[7]['Value_E']}',
                                isdesc: '${SettingDalilClass.info[7]['Chk']}',
                              )
                            : CustomView(
                                title:
                                    '${SettingDalilClass.info[0]['Value_A']}',
                                isTitle: '${SettingDalilClass.info[0]['Chk']}',
                                name: '${SettingDalilClass.info[1]['Value_A']}',
                                isname: '${SettingDalilClass.info[1]['Chk']}',
                                active:
                                    '${SettingDalilClass.info[2]['Value_A']}',
                                isactive: '${SettingDalilClass.info[2]['Chk']}',
                                phone:
                                    '${SettingDalilClass.info[3]['Value_A']}',
                                isphone: '${SettingDalilClass.info[3]['Chk']}',
                                address:
                                    '${SettingDalilClass.info[4]['Value_A']}',
                                isaddres: '${SettingDalilClass.info[4]['Chk']}',
                                location:
                                    '${SettingDalilClass.info[5]['Value_A']}',
                                islocation:
                                    '${SettingDalilClass.info[5]['Chk']}',
                                website:
                                    '${SettingDalilClass.info[6]['Value_A']}',
                                iswebsite:
                                    '${SettingDalilClass.info[6]['Chk']}',
                                desc: '${SettingDalilClass.info[7]['Value_A']}',
                                isdesc: '${SettingDalilClass.info[7]['Chk']}',
                              ),
                      ),
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  //  واجهة الانتظار
                  return CustomLoading(
                    color: All.color2,
                  );
                }

                if (snapshot.hasError) {
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
                //  واجهة الانتظار

                return CustomLoading(
                  color: All.color2,
                );
              }),
        ));
  }
}
