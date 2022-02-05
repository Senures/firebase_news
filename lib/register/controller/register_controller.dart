import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/emailverifiy/email_verify.dart';
import 'package:news_app/login/view/login_view.dart';

class RegisterController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  bool isRegister = true;
  bool obscure = true;
  bool obscureconfirm = true;

  User? user;
  Timer? timer;

  onTapSuffix() {
    obscure = !obscure;
    update();
  }

  onTapConfirmSuffix() {
    obscureconfirm = !obscureconfirm;
    update();
  }

  mailAktivasyonuYapildiMi() {
    user = FirebaseAuth.instance.currentUser;
    if (user != null && !user!.emailVerified) {
      Get.to(() => EmailVerify());
    }
  }

  userMailAktiveEtti() {
    if (user != null && !user!.emailVerified) {
      user!.sendEmailVerification();
      timer = Timer.periodic(Duration(seconds: 2), (timer) async {
        user = FirebaseAuth.instance.currentUser;
        await user!.reload();
        if (user!.emailVerified) {
          timer.cancel();
          Get.to(() => LoginView());
        }

        update();
      });
    }
  }

  register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailcontroller.text, password: passwordcontroller.text);

      if (userCredential != null) {
        mailAktivasyonuYapildiMi();
        //user null değilse

        //Get.back();
      }
    } on FirebaseAuthException catch (e) {
      print("onnnnnnnnnn  " + e.code);
      if (e.code == 'weak-password') {
        Get.snackbar("weak-password", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xfff44336));
        //print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("email-already-in-use", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xfff44336));
      } else if (e.code == 'invalid-email') {
        Get.snackbar("invalid-email", "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xfff44336));
      }
    } catch (e) {
      print("********************  " + e.toString());
    }
  }
}
