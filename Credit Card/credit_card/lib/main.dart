import 'package:credit_card/Pages/homescreen.dart';
import 'package:credit_card/constant/root.dart';
import 'package:credit_card/localization/Transition.dart';
import 'package:credit_card/localization/changelocal.dart';
import 'package:credit_card/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
      fallbackLocale: controller.language,
      translations: MyTransition(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSplashScreen(
        duration: 100,
        nextScreen: const Homescreen(),
        //  splash size
        splashIconSize: Get.width,
        // background color
        backgroundColor: Colors.white,
        // transition
        splashTransition: SplashTransition.fadeTransition,
        // splash image
        splash: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Root.creditcardlogo), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
