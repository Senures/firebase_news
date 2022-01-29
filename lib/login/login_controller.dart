import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  control(String email, String password) {
    if (emailcontroller.text.contains("@") && password.length > 6) {
      Get.snackbar("Başarılı", "hoşgeldiniz");
    } else {
      Get.snackbar("Başarısız", "Tekrar deneyiniz");
    }
  }

  login(String email, String password) async {
    print("mailllllllllllllll  " + email.toString());
    print("passsssssseo   " + password.toString());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      print("******" + userCredential.user!.email.toString());
    } on FirebaseAuthException catch (e) {
      print("HATA KODUUUUUUUUUUUU   " + e.code);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
