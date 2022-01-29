import 'package:glass/glass.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/entity/anamodel.dart';

class Detay extends StatefulWidget {
  int index;
  Result? eleman;
  Detay({Key? key, required this.index, required this.eleman})
      : super(key: key);

  @override
  State<Detay> createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  @override
  Widget build(BuildContext context) {
    List<String>? keywords = widget.eleman!.keywords;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: Get.size.width,
                height: Get.size.height * 0.6,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Stack(
                  children: [
                    widget.eleman!.imageUrl == null
                        ? Positioned.fill(
                            child: Image.network(
                            "https://cdn.pixabay.com/photo/2021/06/18/06/51/seagull-6345331_960_720.jpg",
                            fit: BoxFit.cover,
                          ))
                        : Positioned.fill(
                            child: Image.network(
                            widget.eleman!.imageUrl!,
                            fit: BoxFit.cover,
                          )),
                    Positioned(
                        left: 10.0,
                        bottom: 50.0,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          padding: const EdgeInsets.all(8.0),
                          width: 350.0,
                          //height: 110.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Text(
                            widget.eleman!.title!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ).asGlass()),
                    Positioned(
                        left: 20.0,
                        bottom: 10.0,
                        child: Container(
                            alignment: Alignment.center,
                            width: 200.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                                // color: Colors.black38,
                                borderRadius: BorderRadius.circular(5.0)

                                /* boxShadow: [
                                  BoxShadow(blurRadius: 3.0, color: Colors.grey)
                                ]*/
                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(
                                  Icons.access_time_filled_outlined,
                                  size: 18.0,
                                  color: Colors.white,
                                ),
                                Text(
                                  widget.eleman!.pubDate.toString(),
                                  style: const TextStyle(
                                      fontSize: 15.0, color: Colors.white),
                                ),
                              ],
                            )).asGlass()),
                    Positioned(
                        top: 60.0,
                        left: 10.0,
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 30.0,
                                color: Colors.white,
                              )),
                        ).asGlass())
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              width: Get.size.height,
              height: 50.0,
              color: Colors.white,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: keywords == null ? 3 : keywords.length,
                  itemBuilder: (context, indeks) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        backgroundColor: const Color((0xffffcdd2)),
                        avatar: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text("#",
                                style: TextStyle(color: Colors.black54))),
                        label: keywords == null
                            ? const Text("hashtag")
                            : Text(
                                keywords[indeks],
                                style: const TextStyle(color: Colors.black54),
                              ),
                      ),
                    );
                  }),
            ),
            const Divider(
              color: Colors.black,
              indent: 15.0,
              endIndent: 15.0,
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(10.0),
              width: Get.size.width,
              //height: Get.size.height,
              color: Colors.white,
              child: widget.eleman!.content == null
                  ? const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: TextStyle(color: Colors.black54, fontSize: 16.0),
                    )
                  : Text(
                      widget.eleman!.content.toString(),
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 16.0),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
