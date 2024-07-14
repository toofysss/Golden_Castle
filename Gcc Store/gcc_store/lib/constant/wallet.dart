// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gcc/Pages/Wallet/addpayment.dart';
import 'package:gcc/Pages/Wallet/transformwallet.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/api.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'dart:convert';

class WalletClass {
  static TextEditingController fromnum = TextEditingController();
  static TextEditingController tonum = TextEditingController();
  static TextEditingController walletPay = TextEditingController();
  static TextEditingController walletgroup = TextEditingController();
  static List wallet = [];
  static List history = [];

  static addWallet() {
    Get.to(() => const AddPayment(), transition: Transition.fadeIn);
  }

  static transformWallet() {
    Get.to(() => const TransformWallet(), transition: Transition.fadeIn);
  }

  static Future payment(BuildContext context) async {
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
        wallet = jsonDecode(xmlprint);

        return wallet;
      }
    } catch (error) {
      debugPrint("$error");
    }
  }

  static Future transData(BuildContext context) async {
    // try {
    //   String objecttext = '''
    //  {
    //     "results":
    //       [
    //         {
    //           "id": "${All.id.text}",
    //           "tonum": "${tonum.text}",
    //           "walletPay":"${walletPay.text}",
    //         }
    //       ]
    // }
    //             ''';

    //   var envelope =
    //       '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><transwallet xmlns="http://microsoft.com/webservices/"><json>$objecttext</json><Qi>${ApiClass.apiPass}</Qi></transwallet></soap:Body></soap:Envelope>';

    //   http.Response response = await http.post(Uri.parse(ApiClass.api),
    //       headers: {
    //         "Content-Type": "text/xml; charset=utf-8",
    //         "SOAPAction": "http://microsoft.com/webservices/transwallet",
    //       },
    //       body: envelope);
    //   var rawXmlResponse = response.body;
    //   final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
    //   if (xmlprint == '"تمت العملية بنجاح"') {
    //     AwesomeDialog(
    //             context: context,
    //             animType: AnimType.scale,
    //             dialogType: DialogType.success,
    //             body: Padding(
    //               padding: const EdgeInsets.symmetric(vertical: 8.0),
    //               child: Center(
    //                 child: CustomText(
    //                   colors: Colors.black,
    //                   data: "49".tr,
    //                   size: All.textsize,
    //                   fontWeight: FontWeight.bold, maxLines: 1,
    //                 ),
    //               ),
    //             ),
    //             btnCancelColor: Colors.green,
    //             btnCancelText: "48".tr,
    //             btnCancelOnPress: () {})
    //         .show();
    //     Get.back();
    //   }
    // } catch (e) {
    //   debugPrint("$e");
    // }
  }

  static Future getdata(BuildContext context) async {
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
        wallet = jsonDecode(xmlprint);

        return wallet;
      }
    } catch (error) {
      debugPrint("$error");
    }
  }

  static Future gethistory(BuildContext context) async {
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
        history = jsonDecode(xmlprint);

        return history;
      }
    } catch (error) {
      debugPrint("$error");
    }
  }
}
