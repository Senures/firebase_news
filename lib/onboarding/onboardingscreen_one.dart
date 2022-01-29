import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/home/view/home_view.dart';
import 'package:news_app/onboarding/controller/onboard_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreenOne extends StatefulWidget {
  OnboardingScreenOne({Key? key}) : super(key: key);

  @override
  State<OnboardingScreenOne> createState() => _OnboardingScreenOneState();
}

class _OnboardingScreenOneState extends State<OnboardingScreenOne> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
        init: OnboardController(),
        builder: (obcont) {
          return Stack(
            children: [
              PageView.builder(
                  onPageChanged: (sayfa) {
                    obcont.sayfadegis(sayfa);
                    print("*******" + sayfa.toString());
                  },
                  controller: obcont.pagecontroller,
                  itemCount: obcont.pages.length,
                  itemBuilder: (context, index) {
                    var value = obcont.pages[index];

                    return Scaffold(
                      backgroundColor: const Color(0xff311b92),
                      body: Container(
                        width: Get.size.width,
                        height: Get.size.height,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 100.0,
                                left: 10.0,
                                child: Image.network(value.url,
                                    width: obcont.currentIndex == 0
                                        ? 160.0
                                        : 200)),
                            const Positioned(
                                top: 300.0,
                                left: 60.0,
                                child: Text(
                                  "for the latest news",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                )),
                          ],
                        ),
                      ),
                    );
                  }),
              Positioned(
                  bottom: 20.0,
                  right: 80.0,
                  child: SmoothPageIndicator(
                      controller: obcont.pagecontroller,
                      count: obcont.pages.length,
                      effect: const WormEffect(),
                      onDotClicked: (index) {
                        obcont.sayfadegis(index);
                        print("-------" + index.toString());
                      })),
              obcont.currentIndex == 1
                  ? Positioned(
                      right: 20.0,
                      top: 120.0,
                      child: TextButton(
                          onPressed: () {
                            obcont.veriKaydetme();
                            Get.to(HomeView());
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            color: Colors.purple.shade200,
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          )))
                  : Container(
                      width: 20.0,
                    )
            ],
          );
        });
  }
}
