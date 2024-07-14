import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';

class CustomBook extends StatelessWidget {
  final String id;
  final String bookno;
  final String datebook;
  const CustomBook(
      {required this.id,
      required this.bookno,
      required this.datebook,
      super.key});
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(datebook);
    String formattedDate = intl.DateFormat("yyyy/MM/dd").format(date);

    return GestureDetector(
      onTap: () async {
        await launchUrl(
            Uri.parse('https://baghdadchamber.bcc.iq/FormalDocuments/$id'),
            mode: LaunchMode.externalApplication);
      },
      child: Container(
        width: Get.width,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2, color: Colors.white)),
        child: ListTile(
          title: Table(
            border: const TableBorder(
                verticalInside: BorderSide(color: Colors.red)),
            columnWidths: const {
              0: FractionColumnWidth(0.4),
              1: FractionColumnWidth(0.6),
            },
            children: [
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: CustomText(
                      color: All.color1,
                      data: "${"86".tr} ",
                      size: All.textsize),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                      color: Colors.black, data: bookno, size: All.textsize),
                ),
              ])
            ],
          ),
          subtitle: Table(
            border: const TableBorder(
                verticalInside: BorderSide(color: Colors.red)),
            columnWidths: const {
              0: FractionColumnWidth(0.4),
              1: FractionColumnWidth(0.6),
            },
            children: [
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: CustomText(
                      color: All.color1,
                      data: "${"87".tr} ",
                      size: Get.width / 22),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                      color: Colors.black,
                      data: formattedDate,
                      size: All.textsize),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
