import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/login/view/login_view.dart';

class RegisterController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  bool isRegister = true;
  bool obscure = true;
  bool obscureconfirm = true;
  var formkey = GlobalKey<FormState>();

  onTapSuffix() {
    obscure = !obscure;
    update();
  }

  onTapConfirmSuffix() {
    obscureconfirm = !obscureconfirm;
    update();
  }

  register() async {
    try {
      print("sdddddddd");
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailcontroller.text, password: passwordcontroller.text);
      print("awaaaaaaaaaaaaaaiy");
      if (userCredential != null) {
        //user null değilse
        Get.snackbar("kaydoldu", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xfff44336));
        Get.to(LoginView());
      }
    } on FirebaseAuthException catch (e) {
      print("onnnnnnnnnn  " + e.code);
      if (e.code == 'weak-password') {
        Get.snackbar("weak-password", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xfff44336));
        //print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("email-already-in-use", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xfff44336));
      } else if (e.code == 'invalid-email') {
        Get.snackbar("invalid-email", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color(0xfff44336));
      }
    } catch (e) {
      print("********************  " + e.toString());
    }
  }
}
