import 'package:coldencastle/Api/connect.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:coldencastle/widget/customtable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// هوية التاجر
class CustomCardID extends StatelessWidget {
  final String textDirection;
  final String name;
  final String tradename;
  final String activity;
  final String grade;
  final String gradeno;
  final String affiliation;
  final String expiredate;
  const CustomCardID(
      {required this.name,
      required this.tradename,
      required this.grade,
      required this.gradeno,
      required this.activity,
      required this.affiliation,
      required this.expiredate,
      required this.textDirection,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // تحقق من التطبيق عربي او انكليزي
      textDirection:
          textDirection == "en" ? TextDirection.ltr : TextDirection.rtl,
      child: Allgetdata.info.isEmpty
          ?
          // صورة الانتظار
          const CustomLoading(
              color: Colors.white,
            )
          :
          // تصميم اطار الهوية
          Column(
              children: [
                // صورة التاجر

                    SizedBox(
                      height: Get.height * 0.15,
                      width: Get.width * 0.35,
                      child:
                      CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.black38,
                        backgroundImage: NetworkImage(
                            "${Apis.apiwebserviceimage}${All.profileimage.text}"),
                      ),
                    ),
                  
                
//  تصميم اطار
                Container(
                  width: Get.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: Colors.white)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      border: const TableBorder(
                          verticalInside: BorderSide(color: Colors.red)),
                      columnWidths: const {
                        0: FractionColumnWidth(0.10),
                        1: FractionColumnWidth(0.4),
                      },
                      children: [
                        buildrow(name, "${"37".tr} ", true),
                        buildrow(tradename, "${"33".tr} ", true),
                        buildrow(activity, "${"39".tr} ", true),
                        buildrow(grade, " ${"40".tr} ", true),
                        buildrow(gradeno, "${"41".tr} ", true),
                        buildrow(affiliation, "${"42".tr} ", true),
                        buildrow("$expiredate/12/31", "${"43".tr} ", true)
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
