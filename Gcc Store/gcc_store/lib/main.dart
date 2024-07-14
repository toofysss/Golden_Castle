import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Pages/homescreen.dart';
import 'constant/all.dart';
import 'Transition/Transition.dart';
import 'services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTransition(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            bodyLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            bodyMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xff2b3467),
        colorScheme: ColorScheme.light(
            primary: Colors.black, secondary: Color(0xffa70103)),
        appBarTheme: AppBarTheme(
            backgroundColor: const Color(0xff2b3467),
            elevation: 0,
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 16),
            centerTitle: true),
      ),
      home: AnimatedSplashScreen(
        duration: 100,
        nextScreen: const HomeScreen(),
        splashIconSize: 300,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.fadeTransition,
        splash: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(All.splashImage), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
