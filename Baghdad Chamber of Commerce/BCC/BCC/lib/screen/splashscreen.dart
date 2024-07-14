import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/screen/homescreen.dart';
import 'package:coldencastle/screen/login.dart';
import 'package:coldencastle/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// SplashScreen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MyServices myServices = Get.find();

  getdata() {
    if (myServices.sharedPreferences.getString("login") == "1") {
      All.azbaranum.text = myServices.sharedPreferences.getString("azbaranum")!;
      All.id.text = myServices.sharedPreferences.getString("id")!;
      All.profileimage.text = myServices.sharedPreferences.getString("image")!;
    }
  }

  @override
  void initState() {
    getdata();
    ElectronicTransactionsClass.dropdownItemscity.clear();
    ElectronicTransactionsClass.citylist(context);
    ElectronicTransactionsClass.getitem();
    ElectronicCertificateOfOriginClass.getprice();
                                      ElectronicCertificateOfOriginClass.check(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return Center(
      child: AnimatedSplashScreen(
        duration: 100,
        nextScreen: myServices.sharedPreferences.getString("login") == "1"
            ?
            // home screen
            const Homescreen()
            :
            //  صفحة الارشادات
            const LogIn(),
        //  splash size
        splashIconSize: All.splashIconSize,
        // background color
        backgroundColor: All.backgroundSplashcolor,
        // transition
        splashTransition: SplashTransition.fadeTransition,
        // splash image
        splash: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(All.splashImage), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
