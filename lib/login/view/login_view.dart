import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:news_app/login/login_controller.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool sari = true;
  bool yesil = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (lc) {
          return Scaffold(
              body: Center(
            child: Container(
              width: 350.0,
              height: 450.0,
              decoration: BoxDecoration(
                  color: const Color(0xffffebee),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 280.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: sari == true ? Colors.orange : Colors.white,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              sari = true;
                              print(sari);
                              yesil = false;
                              print(yesil);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 140.0,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color:
                                    sari == true ? Colors.orange : Colors.white,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Text("LOGIN"),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              sari = false;
                              yesil = true;
                              print(sari);
                              //yesil=false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 140.0,
                            decoration: BoxDecoration(
                                color: yesil == true
                                    ? Colors.orange
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Text("SIGN UP"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 280,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: TextFormField(
                      controller: lc.emailcontroller,
                      decoration: const InputDecoration(
                          hintText: "e-mail giriniz",
                          border: InputBorder.none,
                          icon: Icon(Icons.mail)),
                    ),
                  ),
                  Container(
                    width: 280,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: TextFormField(
                      controller: lc.passwordcontroller,
                     
                      decoration: const InputDecoration(
                          hintText: "şifre giriniz",
                          border: InputBorder.none,
                          icon: Icon(Icons.password_sharp)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      lc.login(
                          lc.emailcontroller.text, lc.passwordcontroller.text);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Text("GİRİŞ"),
                    ),
                  )
                ],
              ),
            ),
          ));
        });
  }
}
