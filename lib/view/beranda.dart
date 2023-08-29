import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:rumkit_covid/controller/rumkirmodel.dart';
import 'package:rumkit_covid/models/model.dart';

class Beranda extends GetView<rumkitcontroller> {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(rumkitcontroller());
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
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return CarouselSlider(

                        items: [
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(left: 0, right: 16, top: 20),
                              height: 149,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color.fromARGB(255, 187, 182, 182)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 26),
                              child: Text(
                                "Berita terbaru dari covid 19 \n jangan keluar keluar",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        ], options: CarouselOptions(
                          aspectRatio: 19/12,
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
                              left: 16,
                            ),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromARGB(255, 187, 182, 182)),
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
                  height: 20,
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
                                        color: Colors.amber),
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${API?[index].name}",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
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
                                        Text("${API?[index].region}",overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.grey[10]),)
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
