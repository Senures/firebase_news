import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_app/home/controller/home_controller.dart';
import 'package:news_app/splash_screen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xffe57373), // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //firebase baslattık
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // HomeController myController = Get.put(HomeController());
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (my) {
          return GetMaterialApp(
            //themeMode: my.isSwitch == true ? ThemeMode.light : ThemeMode.dark,
            //themeMode: ThemeMode.dark,

            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),

            home: SplashScreen(),
          );
        });
  }
}
