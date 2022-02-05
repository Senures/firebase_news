import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/home/view/home_view.dart';

class LoginController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  //TextEditingController confirmpasswordcontroller = TextEditingController();
  bool isRegister = true;
  bool obscure = true;

  // bool obscureconfirm = true;

  onTapSuffix() {
    obscure = !obscure;
    update();
  }

  login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailcontroller.text, password: passwordcontroller.text);
      if (userCredential != null) {
        Get.to(()=>HomeView());
        emailcontroller.clear();
        passwordcontroller.clear();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("user-not-found", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xfff44336));
      } else if (e.code == 'wrong-password') {
        Get.snackbar("wrong-password", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xfff44336));
      } else {}
    }
  }
}
