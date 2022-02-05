import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:news_app/home/view/home_view.dart';
import 'package:news_app/login/controller/login_controller.dart';
import 'package:news_app/register/view/register_view.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkeylo = GlobalKey<FormState>();
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (lc) {
          return Scaffold(
              backgroundColor: const Color(0xffe57373),
              body: Center(
                child: Container(
                  child: Form(
                    key: formkeylo,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Already have an account ?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 17.0),
                          ),
                        ),
                        const Text("LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0)),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black12,
                          ),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            controller: lc.emailcontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Lütfen e-mail giriniz";
                              } else if (!value.contains("@")) //! değili
                              {
                                return "Geçersiz mail adresi";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "E-mail",
                              hintStyle: TextStyle(color: Colors.white),
                              icon: Icon(
                                Icons.mail,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black12,
                          ),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            obscureText: lc.obscure,
                            obscuringCharacter: "*",
                            cursorColor: Colors.white,
                            controller: lc.passwordcontroller,
                            validator: (value) {
                              if (value == null) {
                                return "şifre gir";
                              } else if (value.length < 6) {
                                return "şifre en az 6 karakter";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    lc.onTapSuffix();
                                  },
                                  icon: const Icon(Icons.remove_red_eye),
                                  color: lc.obscure == true
                                      ? Colors.black38
                                      : Colors.white),
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: const TextStyle(color: Colors.white),
                              icon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            // color: Colors.blue,
                            width: Get.size.width,
                            child: TextButton(
                              style: const ButtonStyle(
                                alignment: Alignment.centerRight,
                              ),
                              onPressed: () {
                                Get.to(RegisterView());
                              },
                              child: const Text(
                                "Create a new account",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black12)),
                          onPressed: () {
                            if (formkeylo.currentState!.validate()) {
                              //burda herşey null gelmişse yani hepsi dogruysa hatasızsa,yan, hata yoksa
                              lc.login();
                             
                            }
                          },
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  width: 300.0,
                  //height: 450.0,
                  //color: Color(0xffe57373),
                ).asGlass(
                  clipBorderRadius: BorderRadius.circular(15.0),
                ),
              ));
        });
  }
}
