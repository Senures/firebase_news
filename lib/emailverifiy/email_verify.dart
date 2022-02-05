import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/register/controller/register_controller.dart';

class EmailVerify extends StatefulWidget {
  EmailVerify({Key? key}) : super(key: key);

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {

   final registercontroller=Get.put(RegisterController());

   @override
  void initState() {
   registercontroller.userMailAktiveEtti();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RegisterController>(
        init:RegisterController(),
        builder: (context) {
          return Center(
            child: Text("lütfen maili onaylayınız"),
          );
        }
      ),
    );
  }
}
