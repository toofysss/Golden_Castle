import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/certificateOfRigin/customcertificateofrigin.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// شهادة المنشأ
class CertificateOfRigin extends StatelessWidget {
  const CertificateOfRigin({super.key});

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
              title: "14".tr, actions: Container(),
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
                child: FutureBuilder(
                    future: CertificateOfRiginClass.getInfo(context),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                                if (CertificateOfRiginClass.data.isEmpty) {
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
                              itemCount: CertificateOfRiginClass.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return LanguageClass.lang.text == "English"
                                    ? CustomCertificateOfRigin(
                                        referncedate: CertificateOfRiginClass
                                            .data[index]['CertificateDate'],
                                        refernceno: CertificateOfRiginClass
                                            .data[index]['CertificateNo'],
                                        ar: CertificateOfRiginClass.data[index]
                                            ['Lang'],
                                        id: CertificateOfRiginClass.data[index]
                                                ['id']
                                            .toString())
                                    : CustomCertificateOfRigin(
                                        referncedate: CertificateOfRiginClass
                                            .data[index]['CertificateDate'],
                                        refernceno: CertificateOfRiginClass
                                            .data[index]['CertificateNo'],
                                        ar: CertificateOfRiginClass.data[index]
                                            ['Lang'],
                                        id: CertificateOfRiginClass.data[index]
                                                ['id']
                                            .toString());

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
                         if (CertificateOfRiginClass.data.isEmpty) {
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
                      // صورة الانتظار
//    AwesomeDialog(
//                                 context: context,
//                                 animType: AnimType.scale,
//                                 dialogType: DialogType.warning,
//                                 body: Padding(
// padding: const EdgeInsets.symmetric(vertical: 8.0),                                  child: Center(child: CustomText(color: Colors.black, data: "106".tr, size: All.textsize),),
//                                 )
//                                  ,
//                              btnCancelColor: Colors.green,
//                              btnCancelText: "105".tr,
//                              btnCancelOnPress: (){
//                               Get.back();
//                              }
//                               ).show();
                      return const CustomLoading(color: Colors.white);
                    }))
          ],
        ),
      ),
    );
  }
}
