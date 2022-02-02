import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/entity/anamodel.dart';
import 'package:news_app/entity/category_model.dart';
import 'package:news_app/home/service/home_service.dart';

class HomeController extends GetxController {
  bool isloading = true;
  List<Result>? liste;
  NewsModel? value;
  NewsModel? categoryValue;
  NewsModel? searchValue;
  String? language;
  NewsModel? languagevalue;
  int bottomindex = 0;
  bool isSwitch = false;

  String? kelime;

  List<CategoryModel> categorylist = [
    CategoryModel(categories: "business", active: true),
    CategoryModel(categories: "entertainment", active: true),
    CategoryModel(categories: "environment", active: true),
    CategoryModel(categories: "food", active: true),
    CategoryModel(categories: "health", active: true),
    CategoryModel(categories: "politics", active: true),
    CategoryModel(categories: "science", active: true),
    CategoryModel(categories: "sports", active: true),
    CategoryModel(categories: "technology", active: true),
    CategoryModel(categories: "top", active: true),
    CategoryModel(categories: "world", active: true),
  ];
  TextEditingController controller = TextEditingController();

  @override
  void onInit() {
    languageSet("en"); //ilk açıldıgın otomatik en gelmesi
    homeApiGet(); //içinde zaten value bekleniyor başına await gerek yok

    super.onInit();
  }

  bottomSelect(int val) {
    bottomindex = val;
    update();
  }

  languageSet(String lg) {
    language = lg;
    update();
  }

  setIsLoading(bool b) {
    isloading = b;
    update();
  }

  homeApiGet() async {
    setIsLoading(true);
    value = await HomeService().homeApi(language!);
    liste = value!.results; //içndeki results dosyası
    setIsLoading(false);
  }

  kelimeAta(int index) async {
    kelime = categorylist[index].categories;
    update();
    setIsLoading(true);
    categoryValue = await HomeService().categoryApi(kelime!, language!);
    liste = categoryValue!.results;
    setIsLoading(false);
  }

  languageChanged() async {
    setIsLoading(true);
    languagevalue = await HomeService().changeLanguage(language!);
    liste = languagevalue!.results;
    setIsLoading(false);
  }

  categorySelect(int index) {
    for (int i = 0; i < categorylist.length; i++) {
      if (categorylist[i] == categorylist[index]) {
        categorylist[index].active = !categorylist[index].active;
      } else {
        categorylist[i].active = true;
      }
    }
  }

  searchApi() async {
    setIsLoading(true);
    searchValue = await HomeService().searchApi(controller.text, language!);
    liste = searchValue!.results;
    setIsLoading(false);
  }

  switchTap() {
    isSwitch = !isSwitch;
    print("**********" + isSwitch.toString());
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    update();
  }
}
