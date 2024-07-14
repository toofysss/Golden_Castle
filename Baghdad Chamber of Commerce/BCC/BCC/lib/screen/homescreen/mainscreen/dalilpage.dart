// ignore_for_file: deprecated_member_use
import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/customdalilpage.dart';
import 'package:coldencastle/widget/customlisttile.dart';
import 'package:coldencastle/widget/customloading.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DalilPage extends StatefulWidget {
  const DalilPage({super.key});

  @override
  State<DalilPage> createState() => _DalilPageState();
}

// دليل التاجر
class _DalilPageState extends State<DalilPage> {
// فلترة
  filter() async {
    if (DlailPageClass.fetchedCompanies.isEmpty) {
      setState(() {
                DlailPageClass.fetchedCompanies.clear();

        DlailPageClass.name.clear();
                    DlailPageClass.url='';

        DlailPageClass.url = "0";
        DlailPageClass.getdata(context, DlailPageClass.url);
      });
  
    }else if (DlailPageClass.name.text.isEmpty) {
      setState(() {
        DlailPageClass.fetchedCompanies.clear();
                    DlailPageClass.url='';

        DlailPageClass.url = "0";
        DlailPageClass.getdata(context, DlailPageClass.url);
      });

      return;
    }else if (DlailPageClass.search.isNull) {
      setState(() {
        DlailPageClass.fetchedCompanies.clear();
        DlailPageClass.url =
            DlailPageClass.name.text;
        DlailPageClass.getdata(context, DlailPageClass.url);
      });
      Future.delayed(const Duration(seconds: 1), () {
        if (DlailPageClass.fetchedCompanies.isEmpty) {
          setState(() {
                    DlailPageClass.fetchedCompanies.clear();

            DlailPageClass.name.clear();
            DlailPageClass.url='';
     DlailPageClass.url =
            DlailPageClass.name.text;            DlailPageClass.getdata(context, DlailPageClass.url);
          });
          // ignore: use_build_context_synchronously
        
        }
      });
    }

    else  {
      setState(() {
        DlailPageClass.fetchedCompanies = [];
                    DlailPageClass.url='';

        DlailPageClass.url =
          DlailPageClass.name.text;
                      DlailPageClass.getdata(context, DlailPageClass.url);

      });
      Future.delayed(const Duration(seconds: 1), () {
        if (DlailPageClass.fetchedCompanies.isEmpty) {
          setState(() {
            DlailPageClass.name.clear();
                        DlailPageClass.url='';

            DlailPageClass.url = "0";
            DlailPageClass.getdata(context, DlailPageClass.url);
          });
 
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      maxScale: 10,
      child: Directionality(
        textDirection: LanguageClass.lang.text == "English"
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(All.appbarheight),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child:
                    // تصميم AppBar
                    CustomAppBar(
                  title: "6".tr, actions: Container(),
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
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [All.color2, All.color1]),
                ),
              ),
              Directionality(
                // تحقق اذا كان الزر عربي او انكليزي
                textDirection: LanguageClass.lang.text == "English"
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: SafeArea(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // filter
                        Center(
                          child: FadeInRight(
                            duration: All.duration,
                            child: Container(
                              width: Get.width * 0.9,
                              margin: const EdgeInsets.only(top: 18),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: All.color1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: CustomListTile(
                                  title: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: Icon(
                                        Icons.filter_alt_outlined,
                                        size: All.arrowsize + 2,
                                        color: Colors.red,
                                      ),
                                      iconEnabledColor: All.color1,
                                      iconDisabledColor: All.color1,
                                      borderRadius: BorderRadius.circular(25),
                                      hint: CustomText(
                                          color: All.color1,
                                          data: DlailPageClass.search,
                                          size: All.textsize),
                                      onChanged: (value) {
                                        setState(() {
                                          DlailPageClass.search = value!;
                                        });
                                      },
                                      items: [
                                        "38".tr, "39".tr,
                                      ]
                                          .map<DropdownMenuItem<String>>(
                                              (String value) =>
                                                  DropdownMenuItem<String>(
                                                      value: value,
                                                      child: CustomText(
                                                          color: All.color1,
                                                          data: value,
                                                          size: All.textsize)))
                                          .toList(),
                                    ),
                                  ),
                                  leading: const SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                                  onTap: () {}),
                            ),
                            // ),
                          ),
                        ),

                        // نص البحث
                        Center(
                          child: FadeInRight(
                            duration: All.duration,
                            child: Container(
                              width: Get.width * 0.9,
                              margin: const EdgeInsets.only(top: 18),
                              child: Material(
                                  elevation: 6,
                                  shadowColor: All.color1,
                                  borderRadius: BorderRadius.circular(30),
                                  child: ListTile(
                                    title: TextField(
                                      //  التحكم
                                      controller: DlailPageClass.name,
                                      style: TextStyle(
                                          fontSize: All.textfieldsize,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      keyboardType: TextInputType.name,
                                      cursorColor: All.color1,
                                      decoration: InputDecoration(
                                        labelText: "50".tr,
                                        labelStyle: TextStyle(
                                            fontSize: All.textfieldsize,
                                            color: All.color1,
                                            fontWeight: FontWeight.bold),
                                        hintText: "50".tr,
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 5),
                                      ),
                                    ),
                                    trailing: GestureDetector(
                                      onTap: () => filter(),
                                      child: Icon(
                                        Icons.search,
                                        size: All.arrowsize,
                                        color: All.color1,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                        // دليل التاجر

                             FutureBuilder(
                            future: DlailPageClass.getdata(
                                context, DlailPageClass.url),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                        if (DlailPageClass.fetchedCompanies.isEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            AwesomeDialog(
                                context: context,
                                animType: AnimType.scale,
                                dialogType: DialogType.warning,
                                body: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Center(
                                    child: CustomText(
                                        color: Colors.black,
                                        data: "85".tr,
                                        size: All.textsize),
                                  ),
                                ),
                                btnCancelColor: Colors.green,
                                btnCancelText: "105".tr,
                                btnCancelOnPress: () {
                                  Get.back();
                                }).show();
                          });

                          return Container();
                        }
                      }
                         
                    if (snapshot.hasError) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        AwesomeDialog(
                                context: context,
                                animType: AnimType.scale,
                                dialogType: DialogType.warning,
                                body: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Center(
                                    child: CustomText(
                                        color: Colors.black,
                                        data: "52".tr,
                                        size: All.textsize),
                                  ),
                                ),
                                btnCancelColor: Colors.green,
                                btnCancelText: "105".tr,
                                btnCancelOnPress: () {})
                            .show();
                      });
                    }
                              if (snapshot.hasData) {
                               
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: DlailPageClass
                                          .fetchedCompanies.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                       
                                       if(DlailPageClass.fetchedCompanies.isEmpty){
                                                                           // صورة الانتظار
         return  const CustomLoading(
                                                color: Colors.black,
                                              );
                                       }
                                            // دليل التاجر
                                         return   CustomDalilPage(
                                                company: DlailPageClass
                                                    .fetchedCompanies[index],
                                              );
                                      }),
                                );
                              }
                             
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // صورة الانتظار

                                return const CustomLoading(color: Colors.green);
                              }
                              // صورة الانتظار

                              return const CustomLoading(color: Colors.orange);
                            })
                 ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
