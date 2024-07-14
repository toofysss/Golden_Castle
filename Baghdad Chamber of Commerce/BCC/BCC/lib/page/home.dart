import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/customgridview.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

// الصفحة الرئيسية
class Home extends StatelessWidget {
  const Home({super.key});

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
              title: "4".tr,
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // صورة الشعار
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                height: Get.height / 5,
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.asset(All.splashImage),
                ),
              ),

              //  العناوين
              CarouselSlider(
                  options: CarouselOptions(
                      reverse:
                          LanguageClass.lang.text == "English" ? false : true,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                      height: All.carouselsliderheight),
                  items: [
                    GestureDetector(
                      onTap: () => HomescreenClass.chamberNews(),
                      child: Container(
                        width: Get.width,
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [All.color2, All.color1]),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.newspaper,
                                color: Colors.white,
                                size: 75,
                              ),
                            ),
                            // Image.asset(All.splashImage,width: 100,height: 100,fit: BoxFit.fill,),

                            Expanded(
                                child: CustomText(
                                    color: Colors.white,
                                    data: "5".tr,
                                    size: All.textsize)),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => HomescreenClass.tradersGuide(),
                      child: Container(
                        width: Get.width,
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [All.color2, All.color1]),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.library_books_sharp,
                                color: Colors.white,
                                size: 75,
                              ),
                            ),
                            // Image.asset(All.splashImage,width: 100,height: 100,fit: BoxFit.fill,),

                            Expanded(
                                child: CustomText(
                                    color: Colors.white,
                                    data: "6".tr,
                                    size: All.textsize)),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => HomescreenClass.conferences(),
                      child: Container(
                        width: Get.width,
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [All.color2, All.color1]),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.personal_video_sharp,
                                color: Colors.white,
                                size: 75,
                              ),
                            ),
                            // Image.asset(All.splashImage,width: 100,height: 100,fit: BoxFit.fill,),

                            Expanded(
                                child: CustomText(
                                    color: Colors.white,
                                    data: "7".tr,
                                    size: All.textsize)),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => HomescreenClass.opposed(),
                      child: Container(
                        width: Get.width,
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [All.color2, All.color1]),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.browse_gallery,
                                color: Colors.white,
                                size: 75,
                              ),
                            ),
                            // Image.asset(All.splashImage,width: 100,height: 100,fit: BoxFit.fill,),

                            Expanded(
                                child: CustomText(
                                    color: Colors.white,
                                    data: "8".tr,
                                    size: All.textsize)),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => HomescreenClass.iraqStockExchange(),
                      child: Container(
                        width: Get.width,
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [All.color2, All.color1]),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              All.exchangerate,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                            Expanded(
                                child: CustomText(
                                    color: Colors.white,
                                    data: "167".tr,
                                    size: All.textsize)),
                          ],
                        ),
                      ),
                    ),
                  ]),
              //  العنوان
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: CustomText(
                      color: Colors.black, data: "9".tr, size: All.titletext),
                ),
              ),
              //  الخدمات
              FutureBuilder(
                  future: Allgetdata.getServices(context),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {  

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
                      // الخدمات
                      return Customview(
                          itemCount: Allgetdata.services.length,
                          data: Allgetdata.services,
                          check: "mainhome");
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
            ],
          ),
        ),
      ),
    );
  }
}
