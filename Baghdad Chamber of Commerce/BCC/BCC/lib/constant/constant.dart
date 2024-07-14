// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/Api/connect.dart';
import 'package:coldencastle/model/dalil.dart';
import 'package:coldencastle/screen/confirmemail.dart';
import 'package:coldencastle/screen/enteringthegovernmentagencyhomemain.dart';
import 'package:coldencastle/screen/homescreen/menuscreen/electroniccertificateoforigin.dart';
import 'package:coldencastle/screen/homescreen/menuscreen/newelectronic.dart';
import 'package:coldencastle/screen/forgetpassword.dart';
import 'package:coldencastle/screen/homescreen.dart';
import 'package:coldencastle/screen/homescreen/mainscreen/conferences.dart';
import 'package:coldencastle/screen/homescreen/mainscreen/dalilpage.dart';
import 'package:coldencastle/screen/homescreen/mainscreen/dataservices.dart';
import 'package:coldencastle/screen/homescreen/mainscreen/webview.dart';
import 'package:coldencastle/screen/homescreen/menuscreen/book.dart';
import 'package:coldencastle/screen/homescreen/menuscreen/electronictransactions.dart';
import 'package:coldencastle/screen/homescreen/menuscreen/merchantcertificate.dart';
import 'package:coldencastle/screen/homescreen/menuscreen/merhantpage.dart';
import 'package:coldencastle/screen/rigester.dart';
import 'package:coldencastle/screen/setting/language.dart';
import 'package:coldencastle/screen/login.dart';
import 'package:coldencastle/screen/setting/dalil.dart';
import 'package:coldencastle/screen/viewservices.dart';
import 'package:coldencastle/services/services.dart';
import 'package:coldencastle/screen/homescreen/menuscreen/certificateofrigin.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xml/xml.dart';

// الجميع
class All {
  // مسار الصور
  static String rootImage = "asset";
  // all
  static Color color1 = const Color(0xff325B90);
  static Color color2 = const Color(0xff201D24);
  static double arrowsize = 25;
  static double appbartextsize = 25;
  static double appbarheight = 60;
  static double textsize = 18;
  static double carouselsliderheight = 150.0;
  static double titletext = 25;
  static double textfieldsize = 18;
  static Color dropdowncolor = Colors.tealAccent;
  static Duration duration = const Duration(seconds: 1);
// رابط بعد الدفع
  static String link = "https://google.com";
  // اسم مستخدم الدفع
  static String username = "api_chamber";
  // كلمة مرور الدفع
  static String password = "123456789";
  static String pass = "Afcdgh512Qkc";

  // HomeScreen
  static String menuimage = "${All.rootImage}/menu.png";
  static String exchangerate = "${All.rootImage}/exchangerate.png";
  // homescreen
  // رقم الاضبارة الحفظ
  static TextEditingController azbaranum = TextEditingController();
  // الرقم التعريفي للمستخدم
  static TextEditingController id = TextEditingController();
  // صورة
  static TextEditingController profileimage = TextEditingController();

  // splashScreen
  // صورة البدايةf
  static String splashImage = "${All.rootImage}/logo.png";
  // حجم الصورة
  static double splashIconSize = Get.width;
  // لون الخلفية
  static Color backgroundSplashcolor = Colors.white;
  // splashScreen

  static String pledge =
      "اني الموقع ادناه اتعهد بأني لست موظفا في دوائر الدولة او احدى مؤسساتها وبعكسه اتحمل المسؤولية وعليه وقعت";
// DataServices
  static String loadingdataservices = "${All.rootImage}/loadingdataservice.gif";
}

// جلب جميع البيانات
class Allgetdata {
// المعلومات
  static List<dynamic> info = [];
// البيانات
  static List services = [];

// جلب الخدمات
  static Future getServices(BuildContext context) async {
    try {
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><GetServises xmlns="http://microsoft.com/webservices/"><Qi>${All.pass}</Qi></GetServises></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "http://microsoft.com/webservices/GetServises",
          },
          body: envelope);

      var rawXmlResponse = response.body;

      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      Allgetdata.services = jsonDecode(xmlprint);

      return Allgetdata.services;
    } catch (e) {
      debugPrint("$e");
    }
  }

// جلب المعلومات
  static Future getInfo(BuildContext context) async {
    try {
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><GetIdentifireinfo  xmlns="http://microsoft.com/webservices/"><Azbaranum>${All.azbaranum.text}</Azbaranum><Qi>${All.pass}</Qi></GetIdentifireinfo ></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "http://microsoft.com/webservices/GetIdentifireinfo",
          },
          body: envelope);

      var rawXmlResponse = response.body;

      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      Allgetdata.info = jsonDecode(xmlprint);
      return Allgetdata.info;
    } catch (e) {
      debugPrint("$e");
    }
  }
}

// تسجيل الدخول
class LoginClass {
  // اظهار كلمة المرور
  static bool viewpass = true;
//   الايميل
  static TextEditingController email = TextEditingController();
// كلمة المرور
  static TextEditingController password = TextEditingController();
  // الفلترة
  static String search = "51".tr;
// دخول التاجر
  static traderentry(BuildContext context) async {
    try {
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><CheckAuthorizations xmlns="http://microsoft.com/webservices/"><username>${LoginClass.email.text.trim()}</username><password>${LoginClass.password.text.trim()}</password><Qi>${All.pass}</Qi></CheckAuthorizations></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction":
                "http://microsoft.com/webservices/CheckAuthorizations",
          },
          body: envelope);

      var rawXmlResponse = response.body;

      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      if (xmlprint == "الصلاحية غير متوفرة") {
        AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.warning,
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: CustomText(
                        color: Colors.black, data: "53".tr, size: All.textsize),
                  ),
                ),
                btnCancelColor: Colors.green,
                btnCancelText: "105".tr,
                btnCancelOnPress: () {})
            .show();
      } else {
        MyServices myServices = Get.find();
        List data = jsonDecode(xmlprint);
        myServices.sharedPreferences.setString("login", "1");
        myServices.sharedPreferences
            .setString('azbaranum', data[0]['AzbaraNum']);
        myServices.sharedPreferences.setString('id', "${data[0]['id']}");
        myServices.sharedPreferences
            .setString('image', "${data[0]['Personalimg']}");
        All.azbaranum.text =
            myServices.sharedPreferences.getString('azbaranum')!;
        All.id.text = myServices.sharedPreferences.getString('id')!;
        All.profileimage.text =
            myServices.sharedPreferences.getString('image')!;
        Get.offAll(() => const Homescreen(), transition: Transition.fadeIn);
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

// دخول الجهة الحكومية
  static enteringthegovernmentagency() {
    Get.offAll(() => const EnteringthegovernmentagencyHome(),
        transition: Transition.fadeIn);
  }

// تخطي
  static skip() {
    Get.offAll(() => const Homescreen(), transition: Transition.fadeIn);
  }
}

// الصفحة الرئيسية
class HomescreenClass {
// هوية التاجر
  static merchantID(BuildContext context) {
    MyServices myServices = Get.find();
    if (myServices.sharedPreferences.getString("login") != "1") {
      AwesomeDialog(
        context: context,
        btnOkText: "111".tr,
        btnCancelText: "112".tr,
        animType: AnimType.scale,
        dialogType: DialogType.info,
        btnCancelOnPress: () {},
        body: Center(
          child: Text(
            "111".tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        title: "111".tr,
        desc: "111".tr,
        btnOkOnPress: () {
          Get.to(() => const LogIn(), transition: Transition.fadeIn);
        },
      ).show();
    } else {
      Get.to(() => const MerhantPage(), transition: Transition.fadeIn);
    }
  }

// شهادة التاجر
  static merchantCertificate(BuildContext context) {
    MyServices myServices = Get.find();
    if (myServices.sharedPreferences.getString("login") != "1") {
      AwesomeDialog(
        context: context,
        btnOkText: "111".tr,
        btnCancelText: "112".tr,
        animType: AnimType.scale,
        dialogType: DialogType.info,
        btnCancelOnPress: () {},
        body: Center(
          child: Text(
            "111".tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        title: "111".tr,
        desc: "111".tr,
        btnOkOnPress: () {
          Get.to(() => const LogIn(), transition: Transition.fadeIn);
        },
      ).show();
    } else {
      Get.to(() => const Merchantcertificatepage(),
          transition: Transition.fadeIn);
    }
  }

// شهادة المنشا
  static certificateOfRigin(BuildContext context) {
    MyServices myServices = Get.find();
    if (myServices.sharedPreferences.getString("login") != "1") {
      AwesomeDialog(
        context: context,
        btnOkText: "111".tr,
        btnCancelText: "112".tr,
        animType: AnimType.scale,
        dialogType: DialogType.info,
        btnCancelOnPress: () {},
        body: Center(
          child: Text(
            "111".tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        title: "111".tr,
        desc: "111".tr,
        btnOkOnPress: () {
          Get.to(() => const LogIn(), transition: Transition.fadeIn);
        },
      ).show();
    } else {
      Get.to(() => const CertificateOfRigin(), transition: Transition.fadeIn);
    }
  }

// الكتب الصادرة
  static issuedBooks(BuildContext context) {
    MyServices myServices = Get.find();
    if (myServices.sharedPreferences.getString("login") != "1") {
      AwesomeDialog(
        context: context,
        btnOkText: "111".tr,
        btnCancelText: "112".tr,
        animType: AnimType.scale,
        dialogType: DialogType.info,
        btnCancelOnPress: () {},
        body: Center(
          child: Text(
            "111".tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        title: "111".tr,
        desc: "111".tr,
        btnOkOnPress: () {
          Get.to(() => const LogIn(), transition: Transition.fadeIn);
        },
      ).show();
    } else {
      Get.to(() => const Books(), transition: Transition.fadeIn);
    }
  }

// المنفيس
  static vent() {}
// فواتير الاستيراد
  static importInvoices() {}
// التصريحات الكمركية
  static cryptocurrencyStatements() {}
// رسوم الكمارك
  static customsFees() {}

//  ضرائب الدخل
  static incometax() {}
// ضرائب الشركات
  static corporatetax() {}

// هوية الهوية
  static newidentity(BuildContext context) {
    Get.to(() => const Newelectronic(), transition: Transition.fadeIn);
  }

// تجديد الهوية
  static identityRenewal(BuildContext context) {
    Get.to(() => const ElectronicTransactions(), transition: Transition.fadeIn);
  }

// تتبع المعاملة
  static trackTransaction() {}
// شهادة منشأ
  static requestForACertificateOfOrigin(BuildContext context) {
    MyServices myServices = Get.find();
    if (myServices.sharedPreferences.getString("login") != "1") {
      AwesomeDialog(
        context: context,
        btnOkText: "111".tr,
        btnCancelText: "112".tr,
        animType: AnimType.scale,
        dialogType: DialogType.info,
        btnCancelOnPress: () {},
        body: Center(
          child: Text(
            "111".tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        title: "111".tr,
        desc: "111".tr,
        btnOkOnPress: () {
          Get.to(() => const LogIn(), transition: Transition.fadeIn);
        },
      ).show();
    } else {
      ElectronicCertificateOfOriginClass.check(context);
      Get.to(() => const ElectronicCertificateOfOrigin(),
          transition: Transition.fadeIn);
    }
  }

// المتجر
  static theShop() {}

// جلب معلومات الخدمة
  static getitemdata(String id, String title) {
    Get.to(() => DataServices(id: id, title: title),
        transition: Transition.fadeIn);
  }

// اتصل بنا
  static contactUs() {}
  // تسجيل الخروج
  static logOut(BuildContext context) {
    MyServices myServices = Get.find();
    myServices.sharedPreferences.getString("login") == "1"
        ? AwesomeDialog(
            btnOkOnPress: () {
              MyServices myServices = Get.find();
              myServices.sharedPreferences.remove("login");

              myServices.sharedPreferences.remove('azbaranum');

              myServices.sharedPreferences.remove('image');
              myServices.sharedPreferences.remove('id');
              Get.to(() => const LogIn(), transition: Transition.fadeIn);
            },
            btnCancelOnPress: () {},
            btnCancelText: "77".tr,
            btnOkText: "78".tr,
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.warning,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: CustomText(
                    color: Colors.black, data: "79".tr, size: All.textsize),
              ),
            )).show()
        : Get.to(() => const LogIn(), transition: Transition.fadeIn);
  }

// اخبار الغرفة
  static chamberNews() {
    Get.to(() => Webviews(title: "4".tr), transition: Transition.fadeIn);
  }

// دليل التاجر
  static tradersGuide() {
    Get.to(() => const DalilPage(), transition: Transition.fadeIn);
  }

// موتمزات
  static conferences() {}
// معارض
  static opposed() {
    Get.to(() => Conferences(title: "7".tr), transition: Transition.fadeIn);
  }

// بورصة العراق
  static iraqStockExchange() {}
// الاشعازات
  static notification() {}
}

// اللغة
class LanguageClass {
  // active color
  static Color radiobuttoncolor = Colors.white;
  // lang select
  static TextEditingController lang = TextEditingController();
}

// دليل التاجر في الاعدادات
class SettingDalilClass {
  // الاسم التجاري
  static bool isTtitle = true;
// المدير المفوض
  static bool isTname = true;
// النشاط
  static bool isTactive = true;
//  الموقع
  static bool isTlocation = true;
// العنوان
  static bool isTaddress = true;
//  الموقع الالكتروني
  static bool isTwebsite = true;
//  رقم الهاتف
  static bool isTphone = true;
  //  رقم الهاتف
  static bool isTdescription = true;
  static TextEditingController description = TextEditingController();
// الاسم التجاري
  static TextEditingController title = TextEditingController();
//  مدير المفوض
  static TextEditingController name = TextEditingController();
// النشاط
  static TextEditingController active = TextEditingController();
// الموقع
  static TextEditingController location = TextEditingController();
// العنوان
  static TextEditingController address = TextEditingController();
// رقم الهاتف
  static TextEditingController phone = TextEditingController();
// الموقع اللالكتروني
  static TextEditingController website = TextEditingController();
// id tajer
  static String? id = "";
// المعلومات
  static List<dynamic> info = [];
  static bool? checkview;
// جلب البيانات
  static Future getInfo(BuildContext context) async {
    try {
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><GetMerchentGide xmlns="http://microsoft.com/webservices/"><AzbaraNum>${All.azbaranum.text}</AzbaraNum><Qi>${All.pass}</Qi></GetMerchentGide></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "http://microsoft.com/webservices/GetMerchentGide ",
          },
          body: envelope);

      var rawXmlResponse = response.body;

      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      SettingDalilClass.info = jsonDecode(xmlprint);

      return SettingDalilClass.info;
    } catch (e) {
      debugPrint("$e");
    }
  }

// اخفاء الكل
  static hideall(BuildContext context) async {
    String objecttext = ''' 
 
 {
  "results":
  [
  {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "الأسم التجاري",
      "Value_A": "${SettingDalilClass.title.text}",
      "Value_E":"${SettingDalilClass.title.text}",
      "Chk":"false"
    },
     {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "المدير المفوض",
      "Value_A": "${SettingDalilClass.name.text}",
      "Value_E":"${SettingDalilClass.name.text}",
      "Chk":"false"
    },
         {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "النشاط",
      "Value_A": "${SettingDalilClass.active.text}",
      "Value_E":"${SettingDalilClass.active.text}",
      "Chk":"false"
    },
     {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "رقم الهاتف",
      "Value_A": "${SettingDalilClass.phone.text}",
      "Value_E":"${SettingDalilClass.phone.text}",
      "Chk":"false"
    },
     {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "العنوان",
      "Value_A": "${SettingDalilClass.address.text}",
      "Value_E":"${SettingDalilClass.address.text}",
      "Chk":"false"
    },
         {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "الموقع",
      "Value_A": "${SettingDalilClass.location.text}",
      "Value_E":"${SettingDalilClass.location.text}",
      "Chk":"false"
    },
          {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "الموقع الاكتروني",
      "Value_A": "${SettingDalilClass.website.text}",
      "Value_E":"${SettingDalilClass.website.text}",
      "Chk":"false"
    },
         {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "نبذة عن الشركة",
      "Value_A": "${SettingDalilClass.description.text}",
      "Value_E":"${SettingDalilClass.description.text}",
      "Chk":"false"
    }
   ]
  }
 
  

''';
    var envelope =
        '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><SetMerchentGuid  xmlns="http://microsoft.com/webservices/"><json>$objecttext</json><Qi>${All.pass}</Qi></SetMerchentGuid ></soap:Body></soap:Envelope>';

    http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://microsoft.com/webservices/SetMerchentGuid ",
        },
        body: envelope);

    var rawXmlResponse = response.body;
    final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
    if (xmlprint == "تمت العملية بنجاح") {
      AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                      color: Colors.black, data: "76".tr, size: All.textsize),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "105".tr,
              btnCancelOnPress: () {})
          .show();
    }
  }

// اظهار الكل
  static showall(BuildContext context) async {
    String objecttext = ''' 
 
 {
  "results":
  [
  {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "الأسم التجاري",
      "Value_A": "${SettingDalilClass.title.text}",
      "Value_E":"${SettingDalilClass.title.text}",
      "Chk":"true"
    },
     {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "المدير المفوض",
      "Value_A": "${SettingDalilClass.name.text}",
      "Value_E":"${SettingDalilClass.name.text}",
      "Chk":"true"
    },
         {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "النشاط",
      "Value_A": "${SettingDalilClass.active.text}",
      "Value_E":"${SettingDalilClass.active.text}",
      "Chk":"true"
    },
     {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "رقم الهاتف",
      "Value_A": "${SettingDalilClass.phone.text}",
      "Value_E":"${SettingDalilClass.phone.text}",
      "Chk":"true"
    },
     {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "العنوان",
      "Value_A": "${SettingDalilClass.address.text}",
      "Value_E":"${SettingDalilClass.address.text}",
      "Chk":"true"
    },
         {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "الموقع",
      "Value_A": "${SettingDalilClass.location.text}",
      "Value_E":"${SettingDalilClass.location.text}",
      "Chk":"true"
    },
          {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "الموقع الاكتروني",
      "Value_A": "${SettingDalilClass.website.text}",
      "Value_E":"${SettingDalilClass.website.text}",
      "Chk":"true"
    },
         {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "نبذة عن الشركة",
      "Value_A": "${SettingDalilClass.description.text}",
      "Value_E":"${SettingDalilClass.description.text}",
      "Chk":"true"
    }
   ]
  }
 
  

''';

    var envelope =
        '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><SetMerchentGuid  xmlns="http://microsoft.com/webservices/"><json>$objecttext</json><Qi>${All.pass}</Qi></SetMerchentGuid ></soap:Body></soap:Envelope>';

    http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://microsoft.com/webservices/SetMerchentGuid ",
        },
        body: envelope);

    var rawXmlResponse = response.body;
    final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
    if (xmlprint == "تمت العملية بنجاح") {
      AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                      color: Colors.black, data: "64".tr, size: All.textsize),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "105".tr,
              btnCancelOnPress: () {})
          .show();
    }
  }

// حفظ دليل التاجر
  static traderGuidesave(BuildContext context) async {
    String objecttext = ''' 
 
 {
  "results":
  [
  {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "الأسم التجاري",
      "Value_A": "${SettingDalilClass.title.text}",
      "Value_E":"${SettingDalilClass.info[0]['Value_E']}",
      "Chk":"$isTtitle"
    },
     {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "المدير المفوض",
      "Value_A": "${SettingDalilClass.name.text}",
      "Value_E":"${SettingDalilClass.info[1]['Value_E']}",
      "Chk":"$isTname"
    },
         {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "النشاط",
      "Value_A": "${SettingDalilClass.active.text}",
      "Value_E":"${SettingDalilClass.info[2]['Value_E']}",
      "Chk":"$isTactive"
    },
     {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "رقم الهاتف",
      "Value_A": "${SettingDalilClass.phone.text}",
      "Value_E":"${SettingDalilClass.phone.text}",
      "Chk":"$isTphone"
    },
     {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "العنوان",
      "Value_A": "${SettingDalilClass.address.text}",
      "Value_E":"${SettingDalilClass.address.text}",
      "Chk":"$isTaddress"
    },
         {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "الموقع",
      "Value_A": "${SettingDalilClass.location.text}",
      "Value_E":"${SettingDalilClass.location.text}",
      "Chk":"$isTlocation"
    },
          {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "الموقع الاكتروني",
      "Value_A": "${SettingDalilClass.website.text}",
      "Value_E":"${SettingDalilClass.website.text}",
      "Chk":"$isTwebsite"
    },
         {
      "AzbaraNum": "${All.azbaranum.text}",
      "Dscrp": "نبذة عن الشركة",
      "Value_A": "${SettingDalilClass.description.text}",
      "Value_E":"${SettingDalilClass.description.text}",
  "Chk":"$isTdescription"
    }
   ]
  }
 
  

''';

    var envelope =
        '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><SetMerchentGuid  xmlns="http://microsoft.com/webservices/"><json>$objecttext</json><Qi>${All.pass}</Qi></SetMerchentGuid ></soap:Body></soap:Envelope>';

    http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://microsoft.com/webservices/SetMerchentGuid ",
        },
        body: envelope);

    var rawXmlResponse = response.body;
    final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
    if (xmlprint == "تمت العملية بنجاح") {
      AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                      color: Colors.black, data: "64".tr, size: All.textsize),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "105".tr,
              btnCancelOnPress: () {})
          .show();
    }
  }

// جلب الموقع
  static Future getlocation(BuildContext context) async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.warning,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                      color: Colors.black, data: "52".tr, size: All.textsize),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "105".tr,
              btnCancelOnPress: () {})
          .show();
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      per = await Geolocator.requestPermission();
    }
    if (per == LocationPermission.always ||
        per == LocationPermission.whileInUse) {
      return await Geolocator.getCurrentPosition().then((value) {
        SettingDalilClass.location.clear();
        SettingDalilClass.location.text =
            "https://www.google.com/maps/place/${value.latitude}+${value.longitude}";
      });
    }
  }
}

// الاعدادات
class SettingClass {
  // اللغة
  static language() {
    Get.to(() => const Language(), transition: Transition.fadeIn);
  }

// الملف الشخصي
  static profilePersonly() {}
// دليل التاجر
  static tradersGuide(BuildContext context) {
    MyServices myServices = Get.find();
    if (myServices.sharedPreferences.getString("login") != "1") {
      AwesomeDialog(
        context: context,
        btnOkText: "111".tr,
        btnCancelText: "112".tr,
        animType: AnimType.scale,
        dialogType: DialogType.info,
        btnCancelOnPress: () {},
        body: Center(
          child: Text(
            "111".tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        title: "111".tr,
        desc: "111".tr,
        btnOkOnPress: () {
          Get.to(() => const LogIn(), transition: Transition.fadeIn);
        },
      ).show();
    } else {
      Get.to(() => const Dalil(), transition: Transition.fadeIn);
    }
  }
}

// الخدمات
class DataServicesClass {
// الخدمات
  static List comps = [];

// اظهار معلومات الخدمة
  static showdataservices(
      BuildContext context,
      String name,
      String image,
      String description,
      String facebook,
      String phone,
      String email,
      String website) {
    Get.to(() => ViewServices(
          title: name,
          image: image,
          description: description,
          facebook: facebook,
          phone: phone,
          email: email,
          website: website,
        ));
  }

// فتح البيانات
  static urllauncher(String url, BuildContext context) async {
    try {
      final uri = Uri.parse(url);

      await launchUrl(uri, mode: LaunchMode.externalNonBrowserApplication);
    } catch (e) {
      AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                      color: Colors.black, data: "106".tr, size: All.textsize),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "105".tr,
              btnCancelOnPress: () {})
          .show();
    }
  }
}

// اظهار الموقع
class WebViewClass {
  static WebViewController controller = WebViewController();
  static bool loading = true;
}

// دليل التاجر
class DlailPageClass {
  // الفلترة
  static String search = "51".tr;
  // البحث
  static TextEditingController name = TextEditingController();
  // القائمة
  static List<Company> fetchedCompanies = [];
// البيانات
  static List<dynamic> data = [];
  static String url = "0";
// جلب التجار
  static Future getdata(BuildContext context, String url) async {
    try {
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><getAllMerchentGuids xmlns="http://microsoft.com/webservices/"> <info>$url</info><Qi>${All.pass}</Qi></getAllMerchentGuids></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction":
                "http://microsoft.com/webservices/getAllMerchentGuids",
          },
          body: envelope);
      if (response.statusCode == 200) {
        var rawXmlResponse = response.body;

        final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;

        //  data =
        DlailPageClass.data = jsonDecode(xmlprint);
        fetchedCompanies = data
            .map((companyData) => Company(
                  nameA: companyData['TradeNameA'],
                  nameE: companyData['TradeNameE'],
                  arTitle: companyData['ManagerA'],
                  title: companyData['ManagerE'],
                  activityA: companyData['ActivityA'],
                  activityE: companyData['ActivityE'],
                  location: companyData['Location'],
                  address: companyData['Adress'],
                  description: companyData['Aboutus'],
                  phone: companyData['Phone'],
                  website: companyData['Website'],
                  isTitle: companyData['TradeNamechk'] == '1' ? true : false,
                  isTName: companyData['Managerchk'] == '1' ? true : false,
                  isTActive: companyData['Activitychk'] == '1' ? true : false,
                  isTLocation: companyData['Locationchk'] == '1' ? true : false,
                  isTAddress: companyData['Adresschk'] == '1' ? true : false,
                  isTPhone: companyData['Phonechk'] == '1' ? true : false,
                  isTWebSite: companyData['Websitechk'] == '1' ? true : false,
                  isTdescription:
                      companyData['Aboutuschk'] == '1' ? true : false,
                ))
            .toList();

        return DlailPageClass.fetchedCompanies;
      }
    } catch (error) {
      debugPrint("$error");
    }
  }
}

// كلمات المرور
class ForgetPasswordClass {
  // رمز تأكيد
  static String confirm = "";
  // رمز تأكيد
  static String azbaranum = "";
// تححق
  static TextEditingController key1 = TextEditingController();
  // تحقق
  static TextEditingController key2 = TextEditingController();
  // رمز التأكيد
  static TextEditingController confirmemail = TextEditingController();
  // بيانات
  static Map<String, dynamic>? data;
// ملف التأكيد
  static List confirms = [];
// تغيير كلمة المرور
  static Future changepass(BuildContext context, String id) async {
    MyServices myServices = Get.find();
    if (myServices.sharedPreferences.getString("login") != "1") {
      AwesomeDialog(
        context: context,
        btnOkText: "111".tr,
        btnCancelText: "112".tr,
        animType: AnimType.scale,
        dialogType: DialogType.info,
        btnCancelOnPress: () {},
        body: Center(
          child: Text(
            "111".tr,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        title: "111".tr,
        desc: "111".tr,
        btnOkOnPress: () {
          Get.to(() => const LogIn(), transition: Transition.fadeIn);
        },
      ).show();
    } else {
      Get.to(() => const ForgetPasswrod(), transition: Transition.fadeIn);
    }
  }

// تغيير
  static Future change(BuildContext context, String azbaraNumber) async {
    var envelope =
        '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><SetUpdatepassword xmlns="http://microsoft.com/webservices/"><AzbaraNum>$azbaraNumber</AzbaraNum> <newpassword>${ForgetPasswordClass.key1.text}</newpassword><Qi>${All.pass}</Qi></SetUpdatepassword></soap:Body></soap:Envelope>';

    http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://microsoft.com/webservices/SetUpdatepassword",
        },
        body: envelope);
    if (response.statusCode == 200) {
      var rawXmlResponse = response.body;

      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      if (xmlprint == '"تمت العملية بنجاح"') {
        AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.success,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: CustomText(
                    color: Colors.black, data: "84".tr, size: All.textsize),
              ),
            ),
            btnCancelColor: Colors.green,
            btnCancelText: "105".tr,
            btnCancelOnPress: () {
              Get.offAll(() => const LogIn(), transition: Transition.fadeIn);
            }).show();
      }
    }
  }

// نسيت كلمة السر
  static Future forgetpassword(BuildContext context) async {
    if (LoginClass.email.text == "") {
      AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.error,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                      color: Colors.black, data: "164".tr, size: All.textsize),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "105".tr,
              btnCancelOnPress: () {})
          .show();
    } else {
      Get.to(() => const ConfirmEmail(), transition: Transition.fadeIn);
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><SentNotifactionForgotenPassword xmlns="http://microsoft.com/webservices/"><E_mail>${LoginClass.email.text}</E_mail><Qi>${All.pass}</Qi></SentNotifactionForgotenPassword></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction":
                "http://microsoft.com/webservices/SentNotifactionForgotenPassword",
          },
          body: envelope);
      if (response.statusCode == 200) {
        var rawXmlResponse = response.body;

        final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
        if (xmlprint == "المستخدم لا يمتلك حساب") {
          AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                      color: Colors.black, data: "163".tr, size: All.textsize),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "105".tr,
              btnCancelOnPress: () {
                Get.offAll(() => const LogIn(), transition: Transition.fadeIn);
              }).show();
        } else {
          confirms = jsonDecode(xmlprint);
          ForgetPasswordClass.confirm = confirms[0]['RandomNum'].toString();
          ForgetPasswordClass.azbaranum = confirms[0]['Azbaranum'].toString();
        }
      }
    }
  }
}

// الكتب
class BooksClass {
  // البيانات
  static List data = [];

// جلب الكتب
  static Future getInfo(BuildContext context) async {
    try {
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><GetWrites xmlns="http://microsoft.com/webservices/"><TagirId>${All.id.text}</TagirId><Qi>${All.pass}</Qi></GetWrites></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "http://microsoft.com/webservices/GetWrites",
          },
          body: envelope);
      if (response.statusCode == 200) {
        var rawXmlResponse = response.body;

        final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
        if (xmlprint == "") {
          AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                      color: Colors.black, data: "84".tr, size: All.textsize),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "105".tr,
              btnCancelOnPress: () {
                Get.offAll(() => const LogIn(), transition: Transition.fadeIn);
              }).show();
        }
        data = jsonDecode(xmlprint);

        return data;
      }
    } catch (e) {
      AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.warning,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                      color: Colors.black, data: "52".tr, size: All.textsize),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "105".tr,
              btnCancelOnPress: () {})
          .show();
    }
  }
}

// جلب شهادة المنشأ
class CertificateOfRiginClass {
  // البيانات
  static List data = [];
// جلب البيانات
  static Future getInfo(BuildContext context) async {
    try {
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><GetSertificates xmlns="http://microsoft.com/webservices/"><AzbaraNum>${All.azbaranum.text}</AzbaraNum><Qi>${All.pass}</Qi></GetSertificates></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "http://microsoft.com/webservices/GetSertificates",
          },
          body: envelope);

      var rawXmlResponse = response.body;

      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      CertificateOfRiginClass.data = jsonDecode(xmlprint);
      return CertificateOfRiginClass.data;
    } catch (e) {
      debugPrint("$e");
    }
  }
}

// انشاء حساب
class RigesterClass {
// رقم اضبارة
  static TextEditingController azbaranum = TextEditingController();
  // البحث
  static String search = "98".tr;
  // صورة شخصية
  static File? image;
  // صورة هوية امامية
  static File? front;
  // صورة هوية خلفية
  static File? back;
  // صورة خلفية بايت
  static String backbyte = "";
  // صورة شخصية بايت
  static String imagebyte = "";
  // صورة امامية بايت
  static String frontbyte = "";
  // التوقيع
  static String signaturebyte = "";
// التعهد
  static bool rigesters = false;
// رقم الاضبارة
  static String azbaranums = "";
// رقم الهاتف
  static TextEditingController phone = TextEditingController();
  // البريد الالكتروني
  static TextEditingController email = TextEditingController();
  // اسم المستخدم
  static TextEditingController username = TextEditingController();
  // صفحة انشاء طلب
  static rigester() {
    azbaranum.clear();
    Get.to(() => const Check(), transition: Transition.fadeIn);
  }

  // تحقق من رقم الاضبارة
  static Future check(BuildContext context) async {
    try {
      RigesterClass.azbaranums =
          RigesterClass.search + RigesterClass.azbaranum.text;
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><CheckDublicates xmlns="http://microsoft.com/webservices/"><azbaranum>$azbaranums</azbaranum><Qi>${All.pass}</Qi></CheckDublicates></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "http://microsoft.com/webservices/CheckDublicates",
          },
          body: envelope);

      var rawXmlResponse = response.body;
      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      if (xmlprint == "0") {
        Get.to(() => const RigesterForm(), transition: Transition.fadeIn);
      } else {
        AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.warning,
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: CustomText(
                        color: Colors.black, data: "53".tr, size: All.textsize),
                  ),
                ),
                btnCancelColor: Colors.green,
                btnCancelText: "105".tr,
                btnCancelOnPress: () {})
            .show();

        search = "98".tr;
        azbaranum.clear();
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

// ارسال طلب
  static Future request(BuildContext context) async {
    try {
      AwesomeDialog(
              context: context,
              animType: AnimType.scale,
              dialogType: DialogType.success,
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: CustomText(
                      color: Colors.black, data: "164".tr, size: All.textsize),
                ),
              ),
              btnCancelColor: Colors.green,
              btnCancelText: "105".tr,
              btnCancelOnPress: () {})
          .show();
      String objecttext = ''' 
     {
  "results":
  [
    {
      "AzbaraNum": "$azbaranums",
      "UserName": "${email.text}",
      "PhoneNum":"${phone.text}",
    }
  ]
}
''';
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><SetMarchentInfo xmlns="http://microsoft.com/webservices/"><json>$objecttext</json><img1>$imagebyte</img1><img2>$frontbyte</img2><img3>$backbyte</img3><img4>$signaturebyte</img4><Qi>${All.pass}</Qi></SetMarchentInfo></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "http://microsoft.com/webservices/SetMarchentInfo",
          },
          body: envelope);

      var rawXmlResponse = response.body;
      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      if (xmlprint == '"تمت العملية بنجاح"') {
        AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.success,
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: CustomText(
                        color: Colors.black,
                        data: "124".tr,
                        size: All.textsize),
                  ),
                ),
                btnCancelColor: Colors.green,
                btnCancelText: "105".tr,
                btnCancelOnPress: () {})
            .show();
        Get.offAll(() => const LogIn(), transition: Transition.fadeIn);
      } else if (xmlprint == '"يرجى التاكد من البريد الالكتروني"') {
        AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.success,
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: CustomText(
                        color: Colors.black,
                        data: "163".tr,
                        size: All.textsize),
                  ),
                ),
                btnCancelColor: Colors.green,
                btnCancelText: "105".tr,
                btnCancelOnPress: () {})
            .show();
      } else if (xmlprint == '"عذرا..الحساب محجوز"') {
        AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.success,
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: CustomText(
                        color: Colors.black,
                        data: "225".tr,
                        size: All.textsize),
                  ),
                ),
                btnCancelColor: Colors.green,
                btnCancelText: "105".tr,
                btnCancelOnPress: () {})
            .show();
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  static clean() {
    // رقم اضبارة
    azbaranum.clear();
    // البحث
    search = "98".tr;
    // صورة شخصية
    image = null;
    // صورة هوية امامية
    front = null;
    // صورة هوية خلفية
    back = null;
    // صورة خلفية بايت
    backbyte = "";
    // صورة شخصية بايت
    imagebyte = "";
    // صورة امامية بايت
    frontbyte = "";
    // التوقيع
    signaturebyte = "";
// التعهد
    rigesters = false;

// رقم الهاتف
    phone.clear();
    // البريد الالكتروني
    email.clear();
    // اسم المستخدم
    username.clear();
  }
}

class DropdownItem {
  final String value;
  final String label;

  DropdownItem(this.value, this.label);
}

class DropdownItemcity {
  final String value;
  final String label;

  DropdownItemcity(this.value, this.label);
}

class DropdownItemClass {
  final String value;
  final String label;

  DropdownItemClass(this.value, this.label);
}

class DropdownItemTradeName {
  final String value;
  final String label;

  DropdownItemTradeName(this.value, this.label);
}

// المعاملات الالكترونية
class ElectronicTransactionsClass {
  static List<DropdownItemcity> dropdownItemscity = [];
  static List<DropdownItemClass> dropdownItemClass = [];
  static List<DropdownItem> dropdownItems = [];
  static List<DropdownItemTradeName> dropdownItemsTradeName = [];

  static PageController pageController = PageController();

  static PageController pageControllers = PageController();
  // تنقل بين الصفحات
  static int page = 0;
  static int current = 0;
  // information1
  // الاسم
  static TextEditingController name = TextEditingController();
  // اسم الاب
  static TextEditingController fathername = TextEditingController();
  // اسم الاخير
  static TextEditingController lastname = TextEditingController();
  // اسم الام
  static TextEditingController mothername = TextEditingController();
  // الجنس
  static String gender = "129".tr;
  // تاريخ الولادة
  static TextEditingController date = TextEditingController();
  // رقم الهاتف
  static TextEditingController phonenumber = TextEditingController();
  // البريد الالكتروني
  static TextEditingController email = TextEditingController();
  // المحافظة
  static String city = "131".tr;
  static String cityid = '';
  // محلة
  static TextEditingController locality = TextEditingController();
  // زقاق
  static TextEditingController alley = TextEditingController();
  // رقم الدار
  static TextEditingController housenumber = TextEditingController();

// information2
// تاريخ اصدار البطاقة الشخصية
  static TextEditingController dateoIDcard = TextEditingController();
// تاريخ نفاذ البطاقة الشخصية
  static TextEditingController dateoIDcardExpire = TextEditingController();
// رقم بطاقة التعريف
  static TextEditingController iD = TextEditingController();
// جهة الاصدار
  static TextEditingController issuer = TextEditingController();

// information3
// الجهة
  static TextEditingController types = TextEditingController();
  static String typesid = '';

// اختر الصنف
  static String chooseTheCategor = "153".tr;
  static String chooseTheCategorid = "153".tr;

  // تاريخ صلاحية الهوية
  static String dateid = "154".tr;
// رسوم الهوية
  static TextEditingController price = TextEditingController();
// النشاط
  static TextEditingController activity = TextEditingController();
// الاسم التجاري
  static TextEditingController tradeName = TextEditingController();
  static String tradeNameid = '';

// نوع الصنف
  static String type = "178".tr;
// نوع بطاقة التعريف
  static TextEditingController selectid = TextEditingController();

// رقم اضبارة
  static TextEditingController azbaranum = TextEditingController();
  // البحث
  static String search = "98".tr;

// information4
// العنوان
  static TextEditingController addresswork = TextEditingController();
  // المحافظة
  static TextEditingController citywork = TextEditingController();
  // اقرب نقطة دالة
  static TextEditingController nearwork = TextEditingController();
  // محلة
  static TextEditingController localitywork = TextEditingController();
  // زقاق
  static TextEditingController alleywork = TextEditingController();
  // دار
  static TextEditingController housenumberwork = TextEditingController();
  // تعهد
  static bool rigesters = false;
  // رقم الطلب
  static String orderid = "";
// توقيع
  static String signaturebyte = "";

  // infromation5
// صورة بطاقة سكن خلفية
  static File? backResidenceCard;
  // صورة بطاقة سكن امامية
  static File? frontResidenceCard;
  // صورة بطاقة وطنية خلفية
  static File? backNationalCard;
  // صورة بطاقة وطنية امامية
  static File? frontNationalCard;
  // صورة عقد الايجار
  static File? rentcontract;
// صورة هوية تجارة امامية
  static File? frontbusinesscard;
// صورة هوية تجارة خلفية
  static File? backbusinesscard;

  // صورة شخصية
  static File? profileimage;
// الصور
  static List<String> list = [
    "${All.rootImage}/zaincash.png",
    "${All.rootImage}/visa.png",
  ];

  static Future tadernamelist(BuildContext context) async {
    try {
      ElectronicTransactionsClass.dropdownItems.clear();

      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><getClasses   xmlns="http://microsoft.com/webservices/"><Qi>${All.pass}</Qi></getClasses  ></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "http://microsoft.com/webservices/getClasses ",
          },
          body: envelope);

      var rawXmlResponse = response.body;

      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;

      List<dynamic> jsonData = json.decode(xmlprint);
      LanguageClass.lang.text == "English"
          ? dropdownItemsTradeName = jsonData.map((item) {
              return DropdownItemTradeName(
                  '${item['id']}', "${item['TradeName_en']}");
            }).toList()
          : dropdownItemsTradeName = jsonData.map((item) {
              return DropdownItemTradeName(
                  '${item['id']}', "${item['TradeName_ar']}");
            }).toList();

      return dropdownItemsTradeName;
    } catch (e) {
      debugPrint("$e");
    }
  }

  static Future citylist(BuildContext context) async {
    ElectronicTransactionsClass.dropdownItemscity.clear();

    var envelope =
        '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><getgovernorates  xmlns="http://microsoft.com/webservices/"><Qi>${All.pass}</Qi></getgovernorates ></soap:Body></soap:Envelope>';

    http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://microsoft.com/webservices/getgovernorates",
        },
        body: envelope);

    var rawXmlResponse = response.body;

    final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;

    List<dynamic> jsonData = json.decode(xmlprint);
    LanguageClass.lang.text == "English"
        ? dropdownItemscity = jsonData.map((item) {
            return DropdownItemcity('${item['id']}', "${item['DscrpE']}");
          }).toList()
        : dropdownItemscity = jsonData.map((item) {
            return DropdownItemcity('${item['id']}', "${item['Dscrp']}");
          }).toList();
    return dropdownItems;
  }

  static Future https2(BuildContext context, bool check) async {
    var url2 = Uri.parse(
        "https://uat-proxy.aps.iq:5443/payment/rest/getOrderStatus.do");
    Map body2 = ({
      "orderId": orderid,
      "password": All.password,
      "userName": All.username,
    });
    var response = await http.post(url2, body: body2);
    if (response.statusCode == 200) {
      var responsea = jsonDecode(response.body);
      if (check) {
        if (responsea['ErrorMessage'] == 'Success') {
          // certificateRequest(context, '${responsea['Pan']}',
          //     '${responsea['amountpaid']}', '${responsea['OrderNumber']}');
        } else if (responsea['ErrorMessage'] == 'Payment is declined') {
          AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.warning,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: CustomText(
                          color: Colors.black,
                          data: "174".tr,
                          size: All.textsize),
                    ),
                  ),
                  btnCancelColor: Colors.green,
                  btnCancelText: "105".tr,
                  btnCancelOnPress: () {})
              .show();
        }
      } else {
        AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.warning,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: CustomText(
                    color: Colors.black, data: "164".tr, size: All.textsize),
              ),
            ),
            btnCancelColor: Colors.green,
            btnCancelText: "105".tr,
            btnCancelOnPress: () {
              Get.back();
            }).show();
      }
    }
  }

// ارسال طلب
  static Future https(BuildContext context, String lang) async {
    var url = Uri.parse("https://uat-proxy.aps.iq:5443/rest/register.do");
    Map body = ({
      "userName": All.username,
      "password": All.password,
      "orderNumber": orderid,
      "amount": "${price.text}000",
      "currency": "368",
      "returnUrl": All.link,
      "language": lang,
      "sessionTimeoutSecs": "90"
    });

    var response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      var responsea = jsonDecode(response.body);

      if (responsea['errorCode'] == 0) {
        orderid = "${responsea['orderId']}";
        // ignore: deprecated_member_use
        launch(responsea['formUrl'],
            forceSafariVC: false, forceWebView: false, enableJavaScript: true);

        await https2(context, false);
        Future.delayed(const Duration(seconds: 95),
            () async => await https2(context, true));
      }
    }
  }

  static getitem() async {
    ElectronicTransactionsClass.dropdownItems.clear();

    var envelope =
        '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><getClasses   xmlns="http://microsoft.com/webservices/"><Qi>${All.pass}</Qi></getClasses  ></soap:Body></soap:Envelope>';

    http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://microsoft.com/webservices/getClasses ",
        },
        body: envelope);

    var rawXmlResponse = response.body;

    final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;

    List<dynamic> jsonData = json.decode(xmlprint);

    // Convert the parsed data into a list of DropdownItem objects
    LanguageClass.lang.text == "English"
        ? dropdownItems = jsonData.map((item) {
            return DropdownItem('${item['id']}', "${item['DscrpE']}");
          }).toList()
        : dropdownItems = jsonData.map((item) {
            return DropdownItem('${item['id']}', "${item['Dscrp']}");
          }).toList();
    return dropdownItems;
  }

  static getorder() async {
    var envelope =
        '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><getRenewInvoiceNum  xmlns="http://microsoft.com/webservices/"><Qi>${All.pass}</Qi></getRenewInvoiceNum></soap:Body></soap:Envelope>';

    http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction": "http://microsoft.com/webservices/getRenewInvoiceNum ",
        },
        body: envelope);

    var rawXmlResponse = response.body;

    final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
    ElectronicTransactionsClass.orderid = xmlprint;
    return ElectronicTransactionsClass.orderid;
  }

// دفع من خلال الماستر
  static Future master(BuildContext context, String lang) async {
    getorder();
    await https(context, lang);
  }

// دفع من خلال زين كاش
  static Future zaincash(BuildContext context) async {
    getorder();
  }

  static clean() {
    // information1
    // الاسم
    name.clear();
    // اسم الاب
    fathername.clear();
    // اسم الاخير
    lastname.clear();
    // اسم الام
    mothername.clear();
    // الجنس
    gender = "129".tr;
    // تاريخ الولادة
    date.clear();
    // رقم الهاتف
    phonenumber.clear();
    // البريد الالكتروني
    email.clear();
    // المحافظة
    city = "131".tr;
    // محلة
    locality.clear();
    // زقاق
    alley.clear();
    // رقم الدار
    housenumber.clear();

// information2
// تاريخ اصدار البطاقة الشخصية
    dateoIDcard.clear();
// تاريخ نفاذ البطاقة الشخصية
    dateoIDcardExpire.clear();
// رقم بطاقة التعريف
    iD.clear();
// جهة الاصدار
    issuer.clear();

// information3
// الجهة
    types.clear();
// اختر الصنف
    chooseTheCategor = "153".tr;
    // تاريخ صلاحية الهوية
    dateid = "154".tr;
// رسوم الهوية
    price.clear();
// النشاط
    activity.clear();
// الاسم التجاري
    tradeName.clear();
// نوع الصنف
    type = "178".tr;
// نوع بطاقة التعريف
    selectid.clear();
// رقم اضبارة
    azbaranum.clear();
    // البحث
    search = "98".tr;

// information4
// العنوان
    addresswork.clear();
    // المحافظة
    citywork.clear();
    // اقرب نقطة دالة
    nearwork.clear();
    // محلة
    localitywork.clear();
    // زقاق
    alleywork.clear();
    // دار
    housenumberwork.clear();
    // تعهد
    rigesters = false;
// توقيع
    signaturebyte = "";

    // infromation5
// صورة بطاقة سكن خلفية
    backResidenceCard = null;
    // صورة بطاقة سكن امامية
    frontResidenceCard = null;
    // صورة بطاقة وطنية خلفية
    backNationalCard = null;
    // صورة بطاقة وطنية امامية
    frontNationalCard = null;
    // صورة عقد الايجار
    rentcontract = null;
// صورة هوية تجارة امامية
    frontbusinesscard = null;
// صورة هوية تجارة خلفية
    backbusinesscard = null;
    // صورة شخصية
    profileimage = null;

// تنقل بين الصفحات
    page = 0;
    current = 0;
// رقم الطلب
    orderid = "";
  }
}

class ElectronicCertificateOfOriginClass {
// رقم اضبارة
  static TextEditingController azbaranum = TextEditingController();
  // البحث
  static String search = "98".tr;
// رقم الاضبارة
  static String azbaranums = "";
  // الاسم
  static TextEditingController name = TextEditingController();
  // النشاط
  static TextEditingController activity = TextEditingController();
  // الاسم التجاري
  static TextEditingController title = TextEditingController();
//  رسوم شهادة المنشأ
  static TextEditingController price = TextEditingController();
  // رقم الاجازة
  static TextEditingController vacationNo = TextEditingController();
  // تاريخ الاجازة
  static TextEditingController vacationDate = TextEditingController();
  // رقم الفاتورة
  static TextEditingController invoiceNo = TextEditingController();
  // تاريخ الفاتورة
  static TextEditingController invoiceDate = TextEditingController();
// صورة هوية تجارة امامية
  static File? frontbusinesscard;
  // صورة هوية غرفة تجارة امامية بايت
  static String frontbusinesscardbyte = "";
// صورة هوية تجارة خلفية
  static File? backbusinesscard;
  // صورة هوية غرفة تجارة خلفية بايت
  static String backbusinesscardbyte = "";
  // صورة الاجازة
  static File? vactionimage;
  // صورة الاجازة بايت
  static String vactionimagebyte = "";

// صورة الفاتورة
  static File? invoiceimage;
  // صورة الفاتورة بايت
  static String invoiceimagebyte = "";

  // تحقق البيانات
  static List info = [];
  static String orderid = "";

  static requestCertificate(BuildContext context) async {
    AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.success,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: CustomText(
                    color: Colors.black, data: '164'.tr, size: All.textsize),
              ),
            ),
            btnCancelColor: Colors.green,
            btnCancelText: "105".tr,
            btnCancelOnPress: () {})
        .show();
    var envelope =
        '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><getCertificateInvoiceNum  xmlns="http://microsoft.com/webservices/"><Qi>${All.pass}</Qi></getCertificateInvoiceNum></soap:Body></soap:Envelope>';

    http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction":
              "http://microsoft.com/webservices/getCertificateInvoiceNum ",
        },
        body: envelope);
    if (response.statusCode == 200) {
      var rawXmlResponse = response.body;

      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      ElectronicCertificateOfOriginClass.orderid = xmlprint;
      updateElectronicCertificateOfOriginClass(
          context,
          All.azbaranum.text,
          name.text,
          title.text,
          activity.text,
          '0',
          vacationNo.text,
          vacationDate.text,
          invoiceNo.text,
          invoiceDate.text,
          '0',
          ElectronicCertificateOfOriginClass.orderid,
          "229".tr);
    }
  }

  static Future updateElectronicCertificateOfOriginClass(
      BuildContext context,
      String azbaranum,
      String name,
      String title,
      String activity,
      String pricedepost,
      String vacationNo,
      String vacationDate,
      String invoiceNo,
      String invoiceDate,
      String pan,
      String orderids,
      String data) async {
    try {
      String objecttext = ''' 
     {
  "results":
  [
    {
      "AzbaraNum": "$azbaranum",
      "name": "$name",
      "title":"$title",
      "activity": "$activity",
      "pricedepost":"$pricedepost",
      "vacationNo": "$vacationNo",
      "vacationDate":"$vacationDate",
      "invoiceNo": "$invoiceNo",
      "invoiceDate":"$invoiceDate",
      "pan":"$pan",
    }
  ]
}
''';
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><SetSrtificateOrder xmlns="http://microsoft.com/webservices/"><json>$objecttext</json><VoucherNo>$orderids</VoucherNo><img1>$frontbusinesscardbyte</img1><img2>$backbusinesscardbyte</img2><img3>$vactionimagebyte</img3><img4>$invoiceimagebyte</img4><Qi>${All.pass}</Qi></SetSrtificateOrder></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "http://microsoft.com/webservices/SetSrtificateOrder",
          },
          body: envelope);

      var rawXmlResponse = response.body;
      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      if (xmlprint == '"تم تعديل البيانات"') {
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: CustomText(
                    color: Colors.black, data: data, size: All.textsize),
              ),
            ),
          ),
          btnCancelColor: Colors.green,
          btnCancelText: "105".tr,
          btnCancelOnPress: () {
            Get.offAll(() => const Homescreen(), transition: Transition.fadeIn);
            clean();
          },
        ).show();
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  static ar() {
    ElectronicCertificateOfOriginClass.name.text = info[0]['NameA'];
    ElectronicCertificateOfOriginClass.title.text = info[0]['ArTitle'];
    ElectronicCertificateOfOriginClass.activity.text = info[0]['ActivityA'];
  }

  static en() {
    ElectronicCertificateOfOriginClass.name.text = info[0]['NameE'];
    ElectronicCertificateOfOriginClass.title.text = info[0]['Title'];
    ElectronicCertificateOfOriginClass.activity.text = info[0]['ActivityE'];
  }

  static clean() {
    // رقم اضبارة
    azbaranum.clear();
    // البحث
    search = "98".tr;
// رقم الاضبارة
    azbaranums = "";
    // الاسم
    name.clear();
    // النشاط
    activity.clear();
    // الاسم التجاري
    title.clear();
//  رسوم شهادة المنشأ
    price.clear();
    // رقم الاجازة
    vacationNo.clear();
    // تاريخ الاجازة
    vacationDate.clear();
    // رقم الفاتورة
    invoiceNo.clear();
    // تاريخ الفاتورة
    invoiceDate.clear();
// صورة هوية تجارة امامية
    frontbusinesscard = null;
// صورة هوية تجارة خلفية
    backbusinesscard = null;

    // صورة الاجازة
    vactionimage = null;
// صورة الفاتورة
    invoiceimage = null;
  }

// تحقق من توافق الاضبارة
  static Future check(BuildContext context) async {
    try {
      var envelope =
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><GetIdentifireinfo  xmlns="http://microsoft.com/webservices/"><Azbaranum>${All.azbaranum.text}</Azbaranum><Qi>${All.pass}</Qi></GetIdentifireinfo ></soap:Body></soap:Envelope>';

      http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
          headers: {
            "Content-Type": "text/xml; charset=utf-8",
            "SOAPAction": "http://microsoft.com/webservices/GetIdentifireinfo",
          },
          body: envelope);

      var rawXmlResponse = response.body;

      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      info = jsonDecode(xmlprint);
      LanguageClass.lang.text == "English" ? en() : ar();
      return info;
    } catch (e) {
      debugPrint("$e");
    }
  }

  static getprice() async {
    var envelope =
        '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><getCertificateOrderAmounts  xmlns="http://microsoft.com/webservices/"><Qi>${All.pass}</Qi></getCertificateOrderAmounts></soap:Body></soap:Envelope>';

    http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction":
              "http://microsoft.com/webservices/getCertificateOrderAmounts ",
        },
        body: envelope);

    var rawXmlResponse = response.body;

    final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
    ElectronicCertificateOfOriginClass.price.text =
        '${jsonDecode(xmlprint)[0]['Amount']}';
    return ElectronicCertificateOfOriginClass.price.text;
  }

  // دفع من خلال الماستر
  static Future master(BuildContext context, String lang) async {
    await https(context, lang);
  }

// دفع من خلال زين كاش
  static Future zaincash(BuildContext context) async {}

// التاكد من الطلب
  static Future https2(BuildContext context, bool check) async {
    var url2 = Uri.parse(
        "https://uat-proxy.aps.iq:5443/payment/rest/getOrderStatus.do");
    Map body2 = ({
      "orderId": ElectronicCertificateOfOriginClass.orderid,
      "password": All.password,
      "userName": All.username,
    });
    var responses = await http.post(url2, body: body2);
    if (responses.statusCode == 200) {
      var responsea = jsonDecode(responses.body);
      if (check) {
        if (responsea['ErrorMessage'] == 'Success') {
        } else if (responsea['ErrorMessage'] == 'Payment is declined') {
          AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.warning,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: CustomText(
                          color: Colors.black,
                          data: "174".tr,
                          size: All.textsize),
                    ),
                  ),
                  btnCancelColor: Colors.green,
                  btnCancelText: "105".tr,
                  btnCancelOnPress: () {})
              .show();
        }
      } else {
        AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.warning,
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: CustomText(
                        color: Colors.black,
                        data: "164".tr,
                        size: All.textsize),
                  ),
                ),
                btnCancelColor: Colors.green,
                btnCancelText: "105".tr,
                btnCancelOnPress: () {})
            .show();
      }
    }
  }

// ارسال طلب
  static Future https(BuildContext context, String lang) async {
    var envelope =
        '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Body><getCertificateInvoiceNum  xmlns="http://microsoft.com/webservices/"><Qi>${All.pass}</Qi></getCertificateInvoiceNum></soap:Body></soap:Envelope>';

    http.Response response = await http.post(Uri.parse(Apis.apiwebservice),
        headers: {
          "Content-Type": "text/xml; charset=utf-8",
          "SOAPAction":
              "http://microsoft.com/webservices/getCertificateInvoiceNum ",
        },
        body: envelope);
    if (response.statusCode == 200) {
      var rawXmlResponse = response.body;

      final xmlprint = XmlDocument.parse(rawXmlResponse).innerText;
      ElectronicCertificateOfOriginClass.orderid = xmlprint;
      var url = Uri.parse("https://uat-proxy.aps.iq:5443/rest/register.do");
      Map body = ({
        "userName": All.username,
        "password": All.password,
        "orderNumber": ElectronicCertificateOfOriginClass.orderid,
        "amount": "${price.text}000",
        "currency": "368",
        "returnUrl": All.link,
        "language": lang,
        "sessionTimeoutSecs": "90"
      });

      var responses = await http.post(url, body: body);
      if (responses.statusCode == 200) {
        var responsea = jsonDecode(responses.body);

        if (responsea['errorCode'] == 0) {
          orderid = "${responsea['orderId']}";
          // ignore: deprecated_member_use
          launch(responsea['formUrl'],
              forceSafariVC: false,
              forceWebView: false,
              enableJavaScript: true);

          await https2(context, false);
          Future.delayed(const Duration(seconds: 95),
              () async => await https2(context, true));
        }
      }
    }
  }
}
