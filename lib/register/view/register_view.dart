import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/src/GlassWidget.dart';
import 'package:news_app/register/controller/register_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (rc) {
          return Scaffold(
              backgroundColor: const Color(0xffe57373),
              body: Center(
                child: Container(
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Create a New Account",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 17.0),
                          ),
                        ),
                        const Text("REGISTER",
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
                            controller: rc.emailcontroller,
                            validator: (value) {
                              //hata döndürüyor ondan null en son döndü
                              if (value == null || value.isEmpty) {
                                return 'Please enter mail';
                              } else if (!value.contains("@")) //! değili
                              {
                                return "Geçersiz mail adresi";
                              }
                              return null; //burda problem yok ,hata boş demek
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
                            obscureText: rc.obscure,
                            obscuringCharacter: "*",
                            cursorColor: Colors.white,
                            controller: rc.passwordcontroller,
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
                                    rc.onTapSuffix();
                                  },
                                  icon: const Icon(Icons.remove_red_eye),
                                  color: rc.obscure == true
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
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black12,
                          ),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            obscureText: rc.obscureconfirm,
                            obscuringCharacter: "*",
                            cursorColor: Colors.white,
                            controller: rc.confirmpasswordcontroller,
                            validator: (value) {
                              if (value == null) {
                                return "şifre gir";
                              } else if (value.length < 6) {
                                return "şifre en az 6 karakter";
                              } else if (value != rc.passwordcontroller.text) {
                                return "şifreler uyuşmuyor";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    rc.onTapConfirmSuffix();
                                  },
                                  icon: const Icon(Icons.remove_red_eye),
                                  color: rc.obscureconfirm == true
                                      ? Colors.black38
                                      : Colors.white),
                              border: InputBorder.none,
                              hintText: "Confirm Password",
                              hintStyle: const TextStyle(color: Colors.white),
                              icon: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black12)),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              //burda herşey null gelmişse yani hepsi dogruysa hatasızsa,yan, hata yoksa
                              rc.register();
                            }
                          },
                          child:const  Text(
                            "REGISTER",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  width: 300.0,
                  //color: Colors.amber,
                ).asGlass(
                  clipBorderRadius: BorderRadius.circular(15.0),
                ),
              ));
        });
  }
}
