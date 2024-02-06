import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  CarouselController carouselController = CarouselController();
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
            carouselController: carouselController, // Give the controller

            items: [
              Image.asset('assets/banner.webp'),
              Image.asset('assets/banner.webp'),
              Image.asset('assets/banner.webp')

              // ...res['result']['productData']
              // ['ProductImages']
              //     .map(
              //       (e) => Container(
              //       width: MediaQuery.of(context)
              //           .size
              //           .width *
              //           0.7,
              //       decoration: BoxDecoration(
              //         color: Colors.white70,
              //         border: Border.all(
              //           color: Colors.grey,
              //           width: 1,
              //         ),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.only(
              //             top: 30.0, bottom: 30),
              //         child: Image.network(
              //             '${baseUrl + e['path']}'),
              //       )),
              // )
            ],
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    print(reason.toString());
                    currentIndex = index;
                  });
                },
                enlargeCenterPage: true,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                height: MediaQuery.of(context).size.height * 0.3,
                autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                aspectRatio: 16 / 9)),
        Positioned(
            bottom: 10,
            // left: 100,
            child: Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    height: 13,
                    width: 13,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: currentIndex == i
                            ? Colors.white
                            : Colors.grey.shade300,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(2, 2))
                        ]),
                  )
              ]),
            ))
      ],
    );
  }
}
