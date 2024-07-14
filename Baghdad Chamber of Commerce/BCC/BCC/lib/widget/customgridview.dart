import 'package:carousel_slider/carousel_slider.dart';
import 'package:coldencastle/Api/connect.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// تصميم شاشات
class Customview extends StatelessWidget {
  final int itemCount;
  final List data;
  final String check;
  const Customview(
      {required this.itemCount,
      required this.data,
      required this.check,
      super.key});

  @override
  Widget build(BuildContext context) {
    return itemCount == 0
        ? CustomLoading(
            color: All.color2,
          )
        : CarouselSlider.builder(
            itemCount: itemCount,
            itemBuilder: ((context, index, realIndex) {
              final item = data[index];

              return GestureDetector(
                  onTap: () => check == "mainhome"
                      ?
                      //                   // جلب الخدمات
                      HomescreenClass.getitemdata(
                          item['id'].toString(), item['Dscrp'].toString())
                      :
                      //               //  اظهار الخدمات
                      DataServicesClass.showdataservices(
                          context,
                          DataServicesClass.comps[index]['Dscrp'],
                          Apis.apiwebserviceimage + item['imgurl'],
                          "${DataServicesClass.comps[index]['About']}",
                          "${DataServicesClass.comps[index]['FacrBook']}",
                          "${DataServicesClass.comps[index]['Phone']}",
                          "${DataServicesClass.comps[index]['E_Mail']}",
                          "${DataServicesClass.comps[index]['WebSite']}",
                        ),
                  child: Center(
                      child: Container(
                          width: 250,
                          height: 220,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3))
                              ]),
                          child: Column(children: [
                            Container(
                              width: Get.width,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${Apis.apiwebserviceimage}${item['Imgurl']}"),
                                      fit: BoxFit.fill)),
                            ),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                  color: Colors.black,
                                  data: "${item['Dscrp']}",
                                  size: All.titletext),
                            ))
                          ]))));
            }),
            options: CarouselOptions(
                reverse: LanguageClass.lang.text == "English" ? false : true,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
                height: 300),
          );
  }
}
