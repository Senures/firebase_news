import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/detay/detay.dart';
import 'package:news_app/home/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (hc) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                primary: true,
                child: Column(
                  children: [
                    Container(
                      width: Get.size.width,
                      height: 130.0,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Color(0xffffcdd2),
                                  minRadius: 25.0,
                                ),
                                Text(
                                  "Welcome",
                                  style: TextStyle(color: Colors.black54),
                                ),
                                Text(
                                  "Grace Shelby",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 40.0),
                            alignment: Alignment.topRight,
                            width: 200.0,
                            // color: Colors.red,
                            child: Column(
                              children: [
                                PopupMenuButton(
                                    icon: const Icon(
                                      Icons.language,
                                      color: Colors.black54,
                                    ),
                                    itemBuilder: (context) => [
                                          PopupMenuItem(
                                            child: Text(
                                              "England",
                                              style: TextStyle(
                                                  color: hc.language == "en"
                                                      ? const Color(0xffffcdd2)
                                                      : Colors.black54,
                                                  fontWeight:
                                                      hc.language == "en"
                                                          ? FontWeight.bold
                                                          : FontWeight.normal),
                                            ),
                                            onTap: () {
                                              hc.languageSet("en");
                                              hc.languageChanged();
                                            },
                                            value: 1,
                                          ),
                                          PopupMenuItem(
                                              child: Text(
                                                "France",
                                                style: TextStyle(
                                                    color: hc.language == "fr"
                                                        ? const Color(
                                                            0xffffcdd2)
                                                        : Colors.black54,
                                                    fontWeight: hc.language ==
                                                            "fr"
                                                        ? FontWeight.bold
                                                        : FontWeight.normal),
                                              ),
                                              value: 2,
                                              onTap: () {
                                                hc.languageSet("fr");
                                                hc.languageChanged();
                                              }),
                                          PopupMenuItem(
                                              child: Text("Germany",
                                                  style: TextStyle(
                                                      color: hc.language == "de"
                                                          ? const Color(
                                                              0xffffcdd2)
                                                          : Colors.black54,
                                                      fontWeight: hc.language ==
                                                              "de"
                                                          ? FontWeight.bold
                                                          : FontWeight.normal)),
                                              value: 2,
                                              onTap: () {
                                                hc.languageSet("de");
                                                hc.languageChanged();
                                              }),
                                          PopupMenuItem(
                                              child: Text(
                                                "Japanese",
                                                style: TextStyle(
                                                    color: hc.language == "jp"
                                                        ? const Color(
                                                            0xffffcdd2)
                                                        : Colors.black54,
                                                    fontWeight: hc.language ==
                                                            "jp"
                                                        ? FontWeight.bold
                                                        : FontWeight.normal),
                                              ),
                                              value: 2,
                                              onTap: () {
                                                hc.languageSet("jp");
                                                hc.languageChanged();
                                              }),
                                        ]),
                                Switch(
                                    inactiveThumbColor: Colors.grey,
                                    inactiveTrackColor: Colors.grey.shade400,
                                    activeColor: Colors.pink.shade100,
                                    value: hc.isSwitch,
                                    onChanged: (bool value) {
                                      hc.switchTap();
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          //margin: const EdgeInsets.all(10.0),
                          width: Get.size.width * 0.70,
                          height: Get.size.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xffffcdd2),
                          ),
                          child: TextFormField(
                            controller: hc.controller,
                            cursorColor: const Color(0xffffcdd2),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(18.0),
                                hintText: "Search for news for news",
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          // margin: const EdgeInsets.all(10.0),
                          width: Get.size.width * 0.15,
                          height: Get.size.height * 0.07,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xffffcdd2),
                          ),
                          child: IconButton(
                              onPressed: () {
                                print(hc.controller.text);
                                hc.searchApi();
                                hc.controller.clear();
                              },
                              icon: const Icon(
                                Icons.search,
                                size: 30.0,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 260.0, bottom: 10.0),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                    Container(
                      //padding: const EdgeInsets.all(10.0),
                      width: Get.size.width,
                      height: Get.size.height * 0.08,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hc.categorylist.length,
                          itemBuilder: (context, index) {
                            print(hc.categorylist[index]);
                            return InkWell(
                              onTap: () {
                                hc.categorySelect(index);
                                hc.kelimeAta(index);
                                print("*********" + hc.kelime.toString());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 100.0,
                                  //  width: 150.0,
                                  // height: 50.0,
                                  child: Text(
                                    hc.categorylist[index].categories,
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  // height: 30.0,
                                  decoration: BoxDecoration(
                                    color: hc.categorylist[index].active == true
                                        ? const Color(0xffffcdd2)
                                        : Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5.0,
                                          color: Color(0xffede7f6))
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    hc.isloading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, bottom: 10.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 20.0,
                                    mainAxisSpacing: 20.0,
                                    crossAxisCount: 2),
                            scrollDirection: Axis.vertical,
                            primary: false,
                            shrinkWrap: true,
                            itemCount: hc.liste!.length,
                            itemBuilder: (context, index) {
                              var eleman = hc.liste![index];
                              return InkWell(
                                  onTap: () {
                                    Get.to(Detay(
                                      index: index,
                                      eleman: eleman,
                                    ));
                                  },
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    margin: const EdgeInsets.all(0.0),
                                    width: Get.size.width * 0.4,
                                    height: 480.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 5.0,
                                            color: Colors.grey,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: Column(
                                      children: [
                                        eleman.imageUrl == null
                                            ? Expanded(
                                                flex: 2,
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              "https://cdn.pixabay.com/photo/2021/06/18/06/51/seagull-6345331_960_720.jpg"))),
                                                ),
                                              )
                                            : Expanded(
                                                flex: 2,
                                                child: Image.network(
                                                  eleman.imageUrl.toString(),
                                                  fit: BoxFit.fitHeight,
                                                  // height: 80.0,
                                                ),
                                              ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: eleman.title == null
                                                ? Text("Null")
                                                : Text(
                                                    eleman.title.toString(),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black54),
                                                  ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            }),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: FloatingNavbar(
              backgroundColor: const Color(0xffffcdd2),
              onTap: (int val) {
                hc.bottomSelect(val);
                print(hc.bottomindex);
              },
              currentIndex: hc.bottomindex,
              items: [
                FloatingNavbarItem(icon: Icons.home, title: 'Home'),
                FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
              ],
            ),
          );
        });
  }
}
