// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'api.dart';

class AccountClass {
  static TextEditingController fullname = TextEditingController();
  static TextEditingController address = TextEditingController();
  static File? personalimage;
  static String personalimagebyte = "";
  static TextEditingController password = TextEditingController();
  static TextEditingController phone = TextEditingController();
  static TextEditingController email = TextEditingController();
  static List account = [];

  static editdata(BuildContext context) async {
    // try {
    //   String objecttext = '''
    //  {
    //     "results":
    //       [
    //         {
    //           "id": "${All.id.text}",
    //           "fullname": "${fullname.text}",
    //           "email":"${email.text}",
    //           "phone": "${phone.text}",
    //           "address": "${address.text}",
    //           "password":"${password.text}",
    //         }
    //       ]
    // }
    //             ''';
    //   if (personalimage == null) {
    //     var envelope =
    //         '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><updateAccount xmlns="http://microsoft.com/webservices/"><json>$objecttext</json><Qi>${ApiClass.apiPass}</Qi></updateAccount></soap:Body></soap:Envelope>';

    //     http.Response response = await http.post(Uri.parse(ApiClass.api),
    //         headers: {
    //           "Content-Type": "text/xml; charset=utf-8",
    //           "SOAPAction": "http://microsoft.com/webservices/updateAccount",
    //         },
    //         body: envelope);
    //     var rawXmlResponse = response.body;
    //     final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
    //     if (xmlprint == '"تمت العملية بنجاح"') {
    //       AwesomeDialog(
    //               context: context,
    //               animType: AnimType.scale,
    //               dialogType: DialogType.success,
    //               body: Padding(
    //                 padding: const EdgeInsets.symmetric(vertical: 8.0),
    //                 child: Center(
    //                   child: CustomText(
    //                     colors: Colors.black,
    //                     data: "49".tr,
    //                     size: All.textsize,
    //                     fontWeight: FontWeight.bold,
    //                     maxLines: 1,
    //                   ),
    //                 ),
    //               ),
    //               btnCancelColor: Colors.green,
    //               btnCancelText: "48".tr,
    //               btnCancelOnPress: () {})
    //           .show();
    //     }
    //   } else {
    //     var envelope =
    //         '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><updateAccountwithImage xmlns="http://microsoft.com/webservices/"><json>$objecttext</json><img1>$personalimagebyte</img1><Qi>${ApiClass.apiPass}</Qi></updateAccountwithImage></soap:Body></soap:Envelope>';

    //     http.Response response = await http.post(Uri.parse(ApiClass.api),
    //         headers: {
    //           "Content-Type": "text/xml; charset=utf-8",
    //           "SOAPAction":
    //               "http://microsoft.com/webservices/updateAccountwithImage",
    //         },
    //         body: envelope);
    //     var rawXmlResponse = response.body;
    //     final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
    //     if (xmlprint == '"تمت العملية بنجاح"') {
    //       AwesomeDialog(
    //               context: context,
    //               animType: AnimType.scale,
    //               dialogType: DialogType.success,
    //               body: Padding(
    //                 padding: const EdgeInsets.symmetric(vertical: 8.0),
    //                 child: Center(
    //                   child: CustomText(
    //                     colors: Colors.black,
    //                     data: "49".tr,
    //                     size: All.textsize,
    //                     fontWeight: FontWeight.bold,
    //                     maxLines: 1,
    //                   ),
    //                 ),
    //               ),
    //               btnCancelColor: Colors.green,
    //               btnCancelText: "48".tr,
    //               btnCancelOnPress: () {})
    //           .show();
    //     }
    //   }
    // } catch (e) {
    //   debugPrint("$e");
    // }
  }

  static Future viewdata(BuildContext context) async {
    try {
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><GetServises xmlns="http://microsoft.com/webservices/"><Qi>${ApiClass.apiPass}</Qi></GetServises></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(ApiClass.api),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "http://microsoft.com/webservices/GetServises",
          },
          body: envelope);
      if (response.statusCode == 200) {
        var rawXmlResponse = response.body;

        final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;

        //  data =
        account = jsonDecode(xmlprint);

        return account;
      }
    } catch (error) {
      debugPrint("$error");
    }
  }
}
