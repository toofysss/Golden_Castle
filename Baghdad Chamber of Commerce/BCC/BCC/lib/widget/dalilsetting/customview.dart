import 'package:animate_do/animate_do.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customdalilsetting.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomView extends StatefulWidget {
  final String title;
  final String name;
  final String active;
  final String address;
  final String website;
  final String location;
  final String desc;
  final String phone;
  final String isTitle;
  final String isname;
  final String isactive;
  final String isaddres;
  final String iswebsite;
  final String islocation;
  final String isdesc;
  final String isphone;
  const CustomView(
      {required this.title,
      required this.name,
      required this.active,
      required this.phone,
      required this.address,
      required this.website,
      required this.location,
      required this.desc,
      required this.isTitle,
      required this.isname,
      required this.isactive,
      required this.isphone,
      required this.isaddres,
      required this.iswebsite,
      required this.islocation,
      required this.isdesc,
      super.key});

  @override
  State<CustomView> createState() => _CustomViewState();
}

class _CustomViewState extends State<CustomView> {
  getdata() {
    SettingDalilClass.title.text = widget.title;
    SettingDalilClass.isTtitle = widget.isTitle == '1' ? true : false;
    SettingDalilClass.name.text = widget.name;
    SettingDalilClass.isTname = widget.isname == '1' ? true : false;
    SettingDalilClass.active.text = widget.active;
    SettingDalilClass.isTactive = widget.isactive == '1' ? true : false;

    SettingDalilClass.address.text = widget.address;
    SettingDalilClass.isTaddress = widget.isaddres == '1' ? true : false;

    SettingDalilClass.website.text = widget.website;
    SettingDalilClass.isTwebsite = widget.iswebsite == '1' ? true : false;

    SettingDalilClass.location.text = widget.location;
    SettingDalilClass.isTlocation = widget.islocation == '1' ? true : false;

    SettingDalilClass.phone.text = widget.phone;
    SettingDalilClass.isTphone = widget.isphone == '1' ? true : false;

    SettingDalilClass.description.text = widget.desc;
    SettingDalilClass.isTdescription = widget.isdesc == '1' ? true : false;
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            // الاسم التجاري
          FadeInLeft(
              duration: All.duration,
              child: CustomDalilSetting(
                traill: const SizedBox(
                  width: 0,
                  height: 0,
                ),
                controller: SettingDalilClass.title,
                hints: "38".tr,
                textInputType: TextInputType.name,
                trailling: Checkbox(
                    shape: const CircleBorder(),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: SettingDalilClass.isTtitle,
                    onChanged: (bool? value) {
                      setState(() {
                        SettingDalilClass.isTtitle = value!;
                      });
                    }),
                readOnly: true,
                maxLines: 1,
              )),
// المدير المفوض
          FadeInRight(
              duration: All.duration,
              child: CustomDalilSetting(
                traill: const SizedBox(
                  width: 0,
                  height: 0,
                ),
                controller: SettingDalilClass.name,
                hints: "44".tr,
                textInputType: TextInputType.name,
                trailling: Checkbox(
                    shape: const CircleBorder(),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: SettingDalilClass.isTname,
                    onChanged: (bool? value) {
                      setState(() {
                        SettingDalilClass.isTname = value!;
                      });
                    }),
                readOnly: true,
                maxLines: 2,
              )),
// النشاط
          FadeInLeft(
              duration: All.duration,
              child: CustomDalilSetting(
                traill: const SizedBox(
                  width: 0,
                  height: 0,
                ),
                controller: SettingDalilClass.active,
                hints: "39".tr,
                textInputType: TextInputType.name,
                trailling: Checkbox(
                    shape: const CircleBorder(),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: SettingDalilClass.isTactive,
                    onChanged: (bool? value) {
                      setState(() {
                        SettingDalilClass.isTactive = value!;
                      });
                    }),
                readOnly: true,
                maxLines: 1,
              )),
// الموقع
          FadeInRight(
              duration: All.duration,
              child: CustomDalilSetting(
                controller: SettingDalilClass.location,
                hints: "45".tr,
                textInputType: TextInputType.name,
                trailling: Checkbox(
                    shape: const CircleBorder(),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: SettingDalilClass.isTlocation,
                    onChanged: (bool? value) {
                      setState(() {
                        SettingDalilClass.isTlocation = value!;
                      });
                    }),
                traill: GestureDetector(
                  onTap: () async =>
                      await SettingDalilClass.getlocation(context),
                  child: Icon(
                    Icons.location_pin,
                    color: All.color1,
                    size: All.arrowsize,
                  ),
                ),
                readOnly: false,
                maxLines: 1,
              )),
// العنوان
          FadeInLeft(
              duration: All.duration,
              child: CustomDalilSetting(
                controller: SettingDalilClass.address,
                hints: "46".tr,
                textInputType: TextInputType.streetAddress,
                trailling: Checkbox(
                    shape: const CircleBorder(),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: SettingDalilClass.isTaddress,
                    onChanged: (bool? value) {
                      setState(() {
                        SettingDalilClass.isTaddress = value!;
                      });
                    }),
                traill: const SizedBox(
                  width: 0,
                  height: 0,
                ),
                readOnly: false,
                maxLines: 1,
              )),
// رقم الهاتف
          FadeInRight(
              duration: All.duration,
              child: CustomDalilSetting(
                traill: const SizedBox(
                  width: 0,
                  height: 0,
                ),
                trailling: Checkbox(
                    shape: const CircleBorder(),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: SettingDalilClass.isTphone,
                    onChanged: (bool? value) {
                      setState(() {
                        SettingDalilClass.isTphone = value!;
                      });
                    }),
                controller: SettingDalilClass.phone,
                hints: "47".tr,
                textInputType: TextInputType.phone,
                readOnly: false,
                maxLines: 1,
              )),
// الموقع الالكتروني
          FadeInLeft(
              duration: All.duration,
              child: CustomDalilSetting(
                traill: const SizedBox(
                  width: 0,
                  height: 0,
                ),
                trailling: Checkbox(
                    shape: const CircleBorder(),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: SettingDalilClass.isTwebsite,
                    onChanged: (bool? value) {
                      setState(() {
                        SettingDalilClass.isTwebsite = value!;
                      });
                    }),
                controller: SettingDalilClass.website,
                hints: "48".tr,
                textInputType: TextInputType.url,
                readOnly: false,
                maxLines: 1,
              )),
          FadeInLeft(
              duration: All.duration,
              child: CustomDalilSetting(
                traill: const SizedBox(
                  width: 0,
                  height: 0,
                ),
                controller: SettingDalilClass.description,
                hints: "107".tr,
                textInputType: TextInputType.name,
                trailling: Checkbox(
                    shape: const CircleBorder(),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: SettingDalilClass.isTdescription,
                    onChanged: (bool? value) {
                      setState(() {
                        SettingDalilClass.isTdescription = value!;
                      });
                    }),
                readOnly: false,
                maxLines: 7,
              )),

          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // زر الحفظ

                  FadeInDown(
                    duration: All.duration,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        // عند ظغط
                        onTap: () => SettingDalilClass.traderGuidesave(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child:
                                  // تصميم نص
                                  CustomText(
                                      color: Colors.white,
                                      data: "49".tr,
                                      size: All.textsize)),
                        ),
                      ),
                    ),
                  ),

                  // زر الاخفاء

                  FadeInDown(
                    duration: All.duration,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        // عند ظغط
                        onTap: () {
                          if (SettingDalilClass.checkview == true) {
                            setState(() {
                              SettingDalilClass.showall(context);

                              SettingDalilClass.isTactive = true;
                              SettingDalilClass.isTaddress = true;
                              SettingDalilClass.isTlocation = true;
                              SettingDalilClass.isTname = true;
                              SettingDalilClass.isTphone = true;
                              SettingDalilClass.isTtitle = true;
                              SettingDalilClass.isTwebsite = true;
                              SettingDalilClass.checkview = false;
                              SettingDalilClass.isTdescription = true;
                            });
                          } else {
                            setState(() {
                              SettingDalilClass.hideall(context);

                              SettingDalilClass.isTactive = false;
                              SettingDalilClass.isTaddress = false;
                              SettingDalilClass.isTlocation = false;
                              SettingDalilClass.isTname = false;
                              SettingDalilClass.isTphone = false;
                              SettingDalilClass.isTtitle = false;
                              SettingDalilClass.isTwebsite = false;
                              SettingDalilClass.checkview = true;
                              SettingDalilClass.isTdescription = false;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child:
                                  // تصميم نص
                                  CustomText(
                                      color: Colors.white,
                                      data: SettingDalilClass.checkview == true
                                          ? "80".tr
                                          : "75".tr,
                                      size: All.textsize)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
