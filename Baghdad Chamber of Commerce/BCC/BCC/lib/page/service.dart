import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/Api/connect.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

// الخدمات

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LanguageClass.lang.text == "English"
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(All.appbarheight),
            child:
                // تصميم Appbar
                CustomAppBar(
              title: "9".tr,
              // زر الاشعارات
              actions: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8),
                child: GestureDetector(
                  onTap: () => HomescreenClass.notification,
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: All.arrowsize,
                  ),
                ),
              ),
              leading:
                  // زر القائمة الرئيسية
                  Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                    onTap: () => ZoomDrawer.of(context)!.toggle(),
                    child: Image.asset(All.menuimage)),
              ),
            )),
        body: FutureBuilder(
            future: Allgetdata.getServices(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
             
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
            if (snapshot.connectionState == ConnectionState.done) {
                        if (Allgetdata.services.isEmpty) {
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
              // جلب البيانات
              if (snapshot.hasData) {
                
         
                // الخدمات
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: Allgetdata.services.length,
                  itemBuilder: (context, index) {
                    final item = Allgetdata.services[index];
                    return GestureDetector(
                        onTap: () =>
                            //                   // جلب الخدمات
                            HomescreenClass.getitemdata(item['id'].toString(),
                                item['Dscrp'].toString()),
                        child: Center(
                            child:
                                // تصميم اطار
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    width: 250,
                                    height: 220,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 10,
                                              offset: const Offset(0, 3))
                                        ]),
                                    child: Column(children: [
                                      // صورة
                                      Container(
                                        width: Get.width,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    Apis.apiwebserviceimage +
                                                        item['Imgurl']),
                                                fit: BoxFit.fill)),
                                      ),
                                      // النص
                                      Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CustomText(
                                            color: Colors.black,
                                            data: "${item['Dscrp']}",
                                            size: All.titletext),
                                      ))
                                    ]))));
                  },
                );
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
    );
  }
}
