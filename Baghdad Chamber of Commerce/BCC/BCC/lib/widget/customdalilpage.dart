import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/model/dalil.dart';
import 'package:coldencastle/widget/customtable.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDalilPage extends StatelessWidget {
  final  Company company;
  const CustomDalilPage({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return // تصميم اطار دليل التاجر
        Container(
      width: Get.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Colors.white)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LanguageClass.lang.text == "English"
                ? Table(
                    border: const TableBorder(
                        verticalInside: BorderSide(color: Colors.red)),
                    columnWidths: const {
                      0: FractionColumnWidth(0.4),
                      1: FractionColumnWidth(0.6),
                    },
                    children: [
                      //   الاسم التجاري
                      buildrow(
                          "${company.nameE}  ", "${'38'.tr} ", company.isTName),
                      // المدير المفوض

                      buildrow(
                          "${company.title}  ", "${'44'.tr} ", company.isTitle),
                      //  النشاط

                      buildrow("${company.activityE}  ", "${'39'.tr} ",
                          company.isTActive),
                      //  العنوان

                      buildrow("${company.address}  ", "${'46'.tr} ",
                          company.isTAddress),
                      // الهاتف

                      dalilrows(
                          CustomText(
                              color: All.color1,
                              data: "${company.phone}  ",
                              size: All.textsize),
                          "${'47'.tr} ",
                          '${company.phone} ',
                          company.isTPhone,
                          context),
                      // الموقع

                      dalilrows(
                          Icon(
                            Icons.location_on_rounded,
                            size: All.arrowsize,
                            color: All.color1,
                          ),
                          "${'45'.tr} ",
                          "${company.location} ",
                          company.isTLocation,
                          context),
                      // الموقع الالكتروني
                      dalilrows(
                          Icon(
                            Icons.language,
                            size: All.arrowsize,
                            color: All.color1,
                          ),
                          "${'48'.tr} ",
                          "${company.website} ",
                          company.isTWebSite,
                          context),
                    ],
                  )
                : Table(
                    border: const TableBorder(
                        verticalInside: BorderSide(color: Colors.red)),
                    columnWidths: const {
                      0: FractionColumnWidth(0.4),
                      1: FractionColumnWidth(0.6),
                    },
                    children: [
                      //   الاسم التجاري
                      buildrow("${company.nameA}  ", "${'38'.tr} ",
                          company.isTName),
                      // المدير المفوض

                      buildrow(
                          "${company.arTitle}  ", "${'44'.tr} ", company.isTitle),
                      //  النشاط

                      buildrow("${company.activityA}  ", "${'39'.tr} ",
                          company.isTActive),
                      //  العنوان

                      buildrow("${company.address}  ", "${'46'.tr} ",
                          company.isTAddress),
                      // الهاتف
                      // الهاتف

                      dalilrows(
                          CustomText(
                              color: All.color1,
                              data: "${company.phone}  ",
                              size: All.textsize),
                          "${'47'.tr} ",
                          "${company.phone} ",
                          company.isTPhone,
                          context),
                      // الموقع

                      dalilrows(
                          Icon(
                            Icons.location_on_rounded,
                            size: 40,
                            color: All.color1,
                          ),
                          "${'45'.tr} ",
                          "${company.location} ",
                          company.isTLocation,
                          context),
                      // الموقع الالكتروني
                      dalilrows(
                          Icon(
                            Icons.language,
                            size: 40,
                            color: All.color1,
                          ),
                          "${'48'.tr} ",
                          "${company.website} ",
                          company.isTWebSite,
                          context),
                    ],
                  ),
         company.isTdescription==true?Column(mainAxisAlignment: MainAxisAlignment.start,children: [
             Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: CustomText(
                    color: All.color1, data: "108".tr, size: All.textsize),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: CustomText(
                    color: const Color(0xffAF9C9E),
                    data: '${company.description} ',
                    size: 16),
              ),
            ),
         ],):Container()
          ],
        ),
      ),
    );
  }
}
