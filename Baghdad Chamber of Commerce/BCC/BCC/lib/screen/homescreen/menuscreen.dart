import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/services/services.dart';
import 'package:coldencastle/widget/customlisttile.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// الصفحة الثانوية

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          // اتجاه النص
          child: Directionality(
        textDirection: LanguageClass.lang.text == "English"
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // الصورة
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(bottom: 5),
                height: 120,
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.asset(All.splashImage),
                ),
              ),
              // بيانات التاجر
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ExpansionTile(
                  trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: All.arrowsize,
                  ),
                  title: Row(children: [
                    const Icon(
                      Icons.featured_play_list,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                        child: CustomText(
                            color: Colors.white, data: "11".tr, size: 16)),
                  ]),
                  children: <Widget>[
                    // هوية التاجر
                    CustomListTile(
                      onTap: () => HomescreenClass.merchantID(context),
                      leading: Icon(
                        Icons.image_aspect_ratio,
                        color: All.dropdowncolor,
                        size: All.arrowsize,
                      ),
                      title: CustomText(
                          color: All.dropdowncolor,
                          data: "12".tr,
                          size: All.textsize),
                    ),
                    //  شهادة التاجر
                    CustomListTile(
                      onTap: () => HomescreenClass.merchantCertificate(context),
                      leading: Icon(
                        Icons.image_aspect_ratio,
                        color: All.dropdowncolor,
                        size: All.arrowsize,
                      ),
                      title: CustomText(
                          color: All.dropdowncolor,
                          data: "13".tr,
                          size: All.textsize),
                    ),
                    // شهادة المنشا
                    CustomListTile(
                      onTap: () => HomescreenClass.certificateOfRigin(context),
                      leading: Icon(
                        Icons.image_aspect_ratio,
                        color: All.dropdowncolor,
                        size: All.arrowsize,
                      ),
                      title: CustomText(
                          color: All.dropdowncolor,
                          data: "14".tr,
                          size: All.textsize),
                    ),
                    // الكتب الصادرة
                    CustomListTile(
                      onTap: () => HomescreenClass.issuedBooks(context),
                      leading: Icon(
                        Icons.image_aspect_ratio,
                        color: All.dropdowncolor,
                        size: All.arrowsize,
                      ),
                      title: CustomText(
                          color: All.dropdowncolor,
                          data: "15".tr,
                          size: All.textsize),
                    ),
                  ],
                ),
              ),
              // الضرائب
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ExpansionTile(
                  trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: All.arrowsize,
                  ),
                  title: Row(children: [
                    const Icon(
                      Icons.library_books_sharp,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                        child: CustomText(
                            color: Colors.white, data: "25".tr, size: 16)),
                  ]),
                  children: <Widget>[
                    //  ضريبة دخل
                    CustomListTile(
                      onTap: () => HomescreenClass.incometax(),
                      leading: Icon(
                        Icons.library_books_sharp,
                        color: All.dropdowncolor,
                        size: All.arrowsize,
                      ),
                      title: CustomText(
                          color: All.dropdowncolor,
                          data: "54".tr,
                          size: All.textsize),
                    ),
                    //   ضريبة الشركات
                    CustomListTile(
                      onTap: () => HomescreenClass.corporatetax(),
                      leading: Icon(
                        Icons.library_books_sharp,
                        color: All.dropdowncolor,
                        size: All.arrowsize,
                      ),
                      title: CustomText(
                          color: All.dropdowncolor,
                          data: "55".tr,
                          size: All.textsize),
                    ),
                  ],
                ),
              ),

// الكمارك

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ExpansionTile(
                  trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: All.arrowsize,
                  ),
                  title: Row(children: [
                    const Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                        child: CustomText(
                            color: Colors.white, data: "26".tr, size: 16)),
                  ]),
                  children: <Widget>[
                    //   منفيس
                    CustomListTile(
                      onTap: () => HomescreenClass.vent(),
                      leading: Icon(
                        Icons.book,
                        color: All.dropdowncolor,
                        size: All.arrowsize,
                      ),
                      title: CustomText(
                          color: All.dropdowncolor,
                          data: "56".tr,
                          size: All.textsize),
                    ),
                    //    فواتير الاستيراد
                    CustomListTile(
                      onTap: () => HomescreenClass.importInvoices(),
                      leading: Icon(
                        Icons.book,
                        color: All.dropdowncolor,
                        size: All.arrowsize,
                      ),
                      title: CustomText(
                          color: All.dropdowncolor,
                          data: "57".tr,
                          size: All.textsize),
                    ),
                    //   التصريحات الكمركية
                    CustomListTile(
                      onTap: () => HomescreenClass.cryptocurrencyStatements(),
                      leading: Icon(
                        Icons.book,
                        color: All.dropdowncolor,
                        size: All.arrowsize,
                      ),
                      title: CustomText(
                          color: All.dropdowncolor,
                          data: "58".tr,
                          size: All.textsize),
                    ),
                    //   رسوم الكمارك
                    CustomListTile(
                      onTap: () => HomescreenClass.customsFees(),
                      leading: Icon(
                        Icons.book,
                        color: All.dropdowncolor,
                        size: All.arrowsize,
                      ),
                      title: CustomText(
                          color: All.dropdowncolor,
                          data: "59".tr,
                          size: All.textsize),
                    ),
                  ],
                ),
              ),
              // المعاملات الالكترونية
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ExpansionTile(
                  trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: All.arrowsize,
                  ),
                  title: Row(children: [
                    const Icon(
                      Icons.library_books_sharp,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                        child: CustomText(
                            color: Colors.white, data: "60".tr, size: 16)),
                  ]),
                  children: <Widget>[
                    ExpansionTile(
                      trailing: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: All.arrowsize,
                        ),
                      ),
                      title: Row(children: [
                        const Icon(
                          Icons.library_books_sharp,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                            child: CustomText(
                                color: Colors.white,
                                data: "61".tr,
                                size: All.textsize)),
                      ]),
                      children: [
                        //  تجديد  الهوية
                        CustomListTile(
                          onTap: () => HomescreenClass.newidentity(context),
                          leading: Icon(
                            Icons.library_books_sharp,
                            color: All.dropdowncolor,
                            size: All.arrowsize,
                          ),
                          title: CustomText(
                              color: All.dropdowncolor,
                              data: "165".tr,
                              size: All.textsize),
                        ),
                        //  تجديد  الهوية
                        CustomListTile(
                          onTap: () => HomescreenClass.identityRenewal(context),
                          leading: Icon(
                            Icons.library_books_sharp,
                            color: All.dropdowncolor,
                            size: All.arrowsize,
                          ),
                          title: CustomText(
                              color: All.dropdowncolor,
                              data: "166".tr,
                              size: All.textsize),
                        ),

                        //    طلب شهادة المنشأ
                        CustomListTile(
                          onTap: () =>
                              HomescreenClass.requestForACertificateOfOrigin(context),
                          leading: Icon(
                            Icons.library_books_sharp,
                            color: All.dropdowncolor,
                            size: All.arrowsize,
                          ),
                          title: CustomText(
                              color: All.dropdowncolor,
                              data: "14".tr,
                              size: All.textsize),
                        ),
                      ],
                    ),
                    // تتبع المعاملة
                    CustomListTile(
                      onTap: () => HomescreenClass.trackTransaction(),
                      leading: Icon(
                        Icons.library_books_sharp,
                        color: All.dropdowncolor,
                        size: All.arrowsize,
                      ),
                      title: CustomText(
                          color: All.dropdowncolor,
                          data: "62".tr,
                          size: All.textsize),
                    ),
                  ],
                ),
              ),

              // المتجر
              CustomListTile(
                onTap: () => HomescreenClass.theShop(),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: All.arrowsize,
                ),
                title: CustomText(
                    color: Colors.white, data: "24".tr, size: All.textsize),
              ),

              //  اتصل بنا
              CustomListTile(
                onTap: () => HomescreenClass.contactUs(),
                leading: Icon(
                  Icons.email,
                  color: Colors.white,
                  size: All.arrowsize,
                ),
                title: CustomText(
                    color: Colors.white, data: "19".tr, size: All.textsize),
              ),

              //  تسجيل الخروج
              CustomListTile(
                onTap: () => HomescreenClass.logOut(context),
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: All.arrowsize,
                ),
                title: CustomText(
                    color: Colors.white,
                    data: myServices.sharedPreferences.getString("login") == "1"
                        ? "21".tr
                        : "63".tr,
                    size: All.textsize),
              )
            ],
          ),
        ),
      )),
    );
  }
}
