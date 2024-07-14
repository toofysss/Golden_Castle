import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/Api/connect.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

// الخدمات
class DataServices extends StatefulWidget {
  final String id;
  final String title;
  const DataServices({required this.id, required this.title, super.key});

  @override
  State<DataServices> createState() => _DataServicesState();
}

class _DataServicesState extends State<DataServices> {
  // جلب الخدمات
  Future getdataServices(String id) async {
    try {
      DataServicesClass.comps.clear();

      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><GetCompanies xmlns="http://microsoft.com/webservices/"><serviseid>$id</serviseid><Qi>${All.pass}</Qi></GetCompanies></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "http://microsoft.com/webservices/GetCompanies",
          },
          body: envelope);

      var rawXmlResponse = response.body;

      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      DataServicesClass.comps = jsonDecode(xmlprint);
      setState(() {
        DataServicesClass.comps = DataServicesClass.comps;
      });
      if (DataServicesClass.comps.isEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.warning,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                      color: Colors.black, data: "188".tr, size: All.textsize),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "105".tr,
              btnCancelOnPress: () {
                Get.back();
              }).show();
        });
      }
      return DataServicesClass.comps;
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  void initState() {
    setState(() {
      getdataServices(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // اتجاه التطبيق
        Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
                backgroundColor: Colors.white,
                extendBodyBehindAppBar: true,
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(All.appbarheight),
                    child:
                        //  تصميم Appbar
                        CustomAppBar(
                      title: widget.title, actions: Container(),
                      // ايقونة الرجوع

                      leading: GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: All.arrowsize,
                            color: Colors.white,
                          )),
                    )),
                body: Directionality(
                    textDirection: TextDirection.rtl,
                    child: SafeArea(
                        child:
                            // اذا لا توجد خدمة
                            DataServicesClass.comps.isEmpty
                                ?
                                // شاشة انتظار
                                CustomLoading(
                                    color: All.color2,
                                  )
                                :
                                // صفحة الخدمات
                                Container(
                                    margin: const EdgeInsets.all(8),
                                    child: ListView.builder(
                                        itemCount:
                                            DataServicesClass.comps.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          final item =
                                              DataServicesClass.comps[index];
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () => setState(() {
                                                  DataServicesClass
                                                      .showdataservices(
                                                    context,
                                                    DataServicesClass
                                                        .comps[index]['Dscrp'],
                                                    Apis.apiwebserviceimage +
                                                        item['imgurl'],
                                                    "${DataServicesClass.comps[index]['About']}",
                                                    "${DataServicesClass.comps[index]['FacrBook']}",
                                                    "${DataServicesClass.comps[index]['Phone']}",
                                                    "${DataServicesClass.comps[index]['E_Mail']}",
                                                    "${DataServicesClass.comps[index]['WebSite']}",
                                                  );
                                                }),
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 3,
                                                            blurRadius: 10,
                                                            offset:
                                                                const Offset(
                                                                    0, 3))
                                                      ]),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 8),
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    Apis.apiwebserviceimage +
                                                                        item[
                                                                            'imgurl']),
                                                                fit: BoxFit
                                                                    .contain)),
                                                        width: 100,
                                                        height: 100,
                                                      ),
                                                      Expanded(
                                                          child: CustomText(
                                                              color: All.color2,
                                                              data:
                                                                  "${item['Dscrp']}",
                                                              size: All
                                                                  .textsize)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }))))));
  }
}
