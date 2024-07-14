// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gcc/Pages/forgetPassword/sendemail.dart';
import 'package:gcc/constant/forgetpassord.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import '../Pages/homescreen.dart';
import '../Pages/login/login.dart';
import '../Pages/rigester/rigester.dart';
import '../services/services.dart';
import '../widget/customtext.dart';
import 'all.dart';
import 'api.dart';

class LoginClass {
  static TextEditingController username = TextEditingController();
  static TextEditingController password = TextEditingController();
  static TextEditingController fullname = TextEditingController();
  static TextEditingController pass = TextEditingController();
  static TextEditingController email = TextEditingController();
  static TextEditingController phone = TextEditingController();

  static Future rigester() async {
    fullname.clear();
    email.clear();
    pass.clear();
    phone.clear();
    Get.to(() => const Rigester(), transition: Transition.fadeIn);
  }

  static Future login() async {
    username.clear();
    password.clear();
    Get.offAll(() => const Login(), transition: Transition.fadeIn);
  }

  static Future request(BuildContext context) async {
    if (fullname.text == "" ||
        pass.text == "" ||
        email.text == "" ||
        phone.text == "") {
      AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                    colors: Colors.black,
                    data: "77".tr,
                    size: All.textsize,
                    fontWeight: FontWeight.bold,
                    maxLines: 1,
                  ),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "75".tr,
              btnCancelOnPress: () {})
          .show();
    } else {
      String objecttext = '''{
        "results":
        [{
                  "UserName": "${fullname.text}",
                  "email": "${email.text}",
                  "password":"${pass.text}",
                  "phone": "${phone.text}",
                  "address":"",
          }]
      }''';
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><NewCustomerRegstration  xmlns="http://microsoft.com/webservices/"><json>$objecttext</json><Qi>${ApiClass.apiPass}</Qi></NewCustomerRegstration ></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(ApiClass.webapi),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction":
                "http://microsoft.com/webservices/NewCustomerRegstration ",
          },
          body: envelope);

      var rawXmlResponse = response.body;
      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      if (xmlprint == 'تمت الاضافة بنجاح') {
        AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.success,
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: CustomText(
                      colors: Colors.black,
                      data: "74".tr,
                      size: All.textsize,
                      fontWeight: FontWeight.bold,
                      maxLines: 1,
                    ),
                  ),
                ),
                btnCancelColor: Colors.green,
                btnOkText: "75".tr,
                btnOkOnPress: () {})
            .show();
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAll(() => const Login(), transition: Transition.fadeIn);
          fullname.clear();
          email.clear();
          pass.clear();
          phone.clear();
        });
      } else if (xmlprint == 'البريد الالكتروني غير متوفر') {
        AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.success,
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: CustomText(
                      colors: Colors.black,
                      data: "76".tr,
                      size: All.textsize,
                      fontWeight: FontWeight.bold,
                      maxLines: 1,
                    ),
                  ),
                ),
                btnCancelColor: Colors.green,
                btnCancelText: "75".tr,
                btnCancelOnPress: () {})
            .show();
      }
    }
  }

  static Future forgetpassword(BuildContext context) async {
    ForgetPasswordClass.reset.text = "";
    Get.to(() => const SendEmail(), transition: Transition.fadeIn);
  }

  static Future checklogin(BuildContext context) async {
    var envelope =
        '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><GetCustomerInfo  xmlns="http://microsoft.com/webservices/"><CustomerMail>${username.text}</CustomerMail><Password_>${password.text}</Password_><Qi>${ApiClass.apiPass}</Qi></GetCustomerInfo ></soap:Body></soap:Envelope>';

    http.Response response = await http.post(Uri.parse(ApiClass.webapi),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://microsoft.com/webservices/GetCustomerInfo ",
        },
        body: envelope);

    var rawXmlResponse = response.body;
    final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
    if (xmlprint == '[]') {
      AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                    colors: Colors.black,
                    data: "76".tr,
                    size: All.textsize,
                    fontWeight: FontWeight.bold,
                    maxLines: 1,
                  ),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "75".tr,
              btnCancelOnPress: () {})
          .show();
    } else {
      List data = jsonDecode(xmlprint);
      MyServices myServices = Get.find();
      myServices.sharedPreferences.setString("login", "1");
      myServices.sharedPreferences.setString("id", "${data[0]['id']}");
      myServices.sharedPreferences.setString("ImgURL", "${data[0]['ImgURL']}");
      // Get.offAll(() => const Homescreen(), transition: Transition.fadeIn);
    }
  }
}
