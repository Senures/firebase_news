import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:news_app/entity/onboard_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardController extends GetxController {
  List<OnboardModel> pages = [
    OnboardModel(
        url:
            "https://cdn-icons.flaticon.com/png/512/1330/premium/1330443.png?token=exp=1643398411~hmac=6cbd66c58f6f4dac03b88790fc7f387d",
        description: " description",
        title: "title"),
    OnboardModel(
        url: "https://cdn-icons-png.flaticon.com/512/6652/6652878.png",
        description: " description2",
        title: "title2"),
  ];

  PageController pagecontroller = PageController(initialPage: 0);
  int? currentIndex;
  bool isShowBoard = true; //başta değer true verdik
  SharedPreferences? preferences;

  veriKaydetme() async {
    //kaydedilen fonksiyon basınca true olucak
    preferences = await SharedPreferences.getInstance();
    preferences!.setBool("savedBoard", isShowBoard);
  }

  /* veriGosterme(){//true değer gösterilicek deger e atıcak
      bool? deger=preferences!.getBool("savedBoard");
    }*/

  sayfadegis(int sayfa) {
    currentIndex = sayfa;
    update();
  }
}
