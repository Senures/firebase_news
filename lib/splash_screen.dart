import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/home/view/home_view.dart';
import 'package:news_app/login/view/login_view.dart';
import 'package:news_app/onboarding/onboardingscreen_one.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    SharedPreferences pref;
    Future.delayed(Duration(seconds: 3), () async {
      pref = await SharedPreferences
          .getInstance(); //başlatıp oluşturdugumuz nesneye atadık
      bool? isShowBoard =
          pref.getBool("savedBoard"); //daha önce kaydedilen değeri getir
      if (isShowBoard == null || isShowBoard == false) {
        Get.to(() => OnboardingScreenOne());
      } else if (user != null) {
        Get.to(() => HomeView());
      } else {
        Get.to(() => LoginView());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffebee),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(20.0),
            width: 200.0,
            height: 200.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              //color: Color(0xffede7f6)
            ),
            child: Image.network(
              "https://cdn-icons-png.flaticon.com/512/6697/6697024.png",
              width: 150.0,
            )),
      ),
    );
  }
}
