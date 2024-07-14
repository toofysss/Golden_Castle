import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

// صفحة الموقع

class Conferences extends StatefulWidget {
  final String title;
  const Conferences({required this.title, super.key});
  @override
  State<Conferences> createState() => _ConferencessState();
}

class _ConferencessState extends State<Conferences> {
  @override
  void initState() {
    WebViewClass.controller = WebViewClass.controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          setState(() {
            WebViewClass.loading = false;
          });
        },
      ))
      ..loadRequest(Uri.parse('https://bcc.iq/events'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(All.appbarheight),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child:
                  // تصميم AppBar
                  CustomAppBar(
                title: widget.title, actions: Container(),
                // زر الرجوع
                leading: GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: All.arrowsize,
                      color: Colors.white,
                    )),
              ),
            )),
// فتح الموقع
        body: WebViewClass.loading == true
            ? const CustomLoading(color: Colors.black)
            : WebViewWidget(controller: WebViewClass.controller));
  }
}
