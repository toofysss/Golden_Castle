import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';

class CustomCertificateOfRigin extends StatelessWidget {
  final String refernceno;
  final String referncedate;
  final String ar;
  final String id;
  const CustomCertificateOfRigin(
      {required this.referncedate,
      required this.refernceno,
      required this.ar,
      required this.id,
      super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(referncedate);
    String formattedDate = intl.DateFormat("yyyy/MM/dd").format(date);

    return GestureDetector(
      onTap: () async {
        if (ar == "A") {
          await launchUrl(
              Uri.parse(
                  'http://baghdadchamber.bcc.iq/CertificateOfOrigin$ar/$id'),
              mode: LaunchMode.externalApplication);
        } else {
          await launchUrl(
              Uri.parse('http://baghdadchamber.bcc.iq/CertificateOfOrigin/$id'),
              mode: LaunchMode.externalApplication);
        }
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
                      data: "${"88".tr} ",
                      size: All.textsize),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                      color: Colors.black,
                      data: refernceno,
                      size: All.textsize),
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
                      data: "${"89".tr} ",
                      size: All.textsize),
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
