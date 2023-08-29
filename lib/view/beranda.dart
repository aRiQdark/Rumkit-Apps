import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:rumkit_covid/controller/rumkirmodel.dart';
import 'package:rumkit_covid/models/berita.dart';
import 'package:rumkit_covid/models/model.dart';

class Beranda extends GetView<rumkitcontroller> {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(rumkitcontroller());
    List<berita> all = [
      berita(
          title: 'Berita terbaru dari covid 19',
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu586AO6MxdQ-mYf8mfkbAL0euQ4i9pojjVg&usqp=CAU"),
      berita(
          title: 'Layanan covid 19 terbaru',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM7LDLwJCIYuzPTs166uCehOZjVgvcybYdCQ&usqp=CAU'),
      berita(
          title: "List kota dengan kasus covid terbanya",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3C2p-I-256ivErfPZa9EU8eJoYdNhZfl5AA&usqp=CAU")
    ];
    return Scaffold(
      
        body: FutureBuilder<List<datarumkit>>(
      future: controller.getdata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          List<datarumkit>? API = snapshot.data;
          print(API?.length);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: all.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CarouselSlider(
                        disableGesture: false,
                        items: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
                                height: 149,
                                width: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color.fromARGB(255, 187, 182, 182)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network("${all[index].image}"),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 26),
                                child: Text(
                                  "${all[index].title}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                           autoPlayInterval: const Duration(seconds: 5),
                           enlargeCenterPage: true,
                          viewportFraction: 1.0,
                          autoPlayCurve: Curves.decelerate,
                          autoPlay: true,
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "Kategori",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                            ),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromARGB(255, 187, 182, 182)),
                            child: Center(
                              child: Icon(Icons.accessibility_rounded),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Text(
                  "Daftar Rumah Sakit",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: Get.height,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                        height: 149,
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 231, 220, 220)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                        child: Icon(Icons.local_hospital)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${API?[index].name}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        // RichText(
                                        //   text: TextSpan(

                                        //       text: '${API?[index].name}',
                                        //       style:
                                        //           TextStyle(color: Colors.black)),
                                        // ),
                                        // Text("${API?[index].address}"),
                                        // Text("${API?[index].province}"),
                                        // API?[index].phone != null
                                        //     ? Text("${API?[index].phone}")
                                        //     : Text("Tidak ada nomor hp"),
                                        Text(
                                          "${API?[index].region}",
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              TextStyle(color: Colors.grey[10]),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    ));
  }
}
