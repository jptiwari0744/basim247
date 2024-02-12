import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:magento_ecom/features/home/widgets/card.dart';
import 'package:magento_ecom/features/home/widgets/category_card.dart';
import 'package:provider/provider.dart';

import '../../../app/provider/product_provider.dart';

class productCarousel extends StatefulWidget {
  productCarousel();
  @override
  State<productCarousel> createState() => _productCarouselState();
}

class _productCarouselState extends State<productCarousel> {
  CarouselController? contrl;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductProvider>(context, listen: false).ProductApi(context);
      contrl = CarouselController();
      Future.delayed(Duration(milliseconds: 100), () {
        if (mounted && contrl != null) {
          // Check if the widget is still mounted and controller is not null
          contrl!.nextPage(duration: Duration(milliseconds: 2000));
        }
      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<ProductProvider>(
      builder: (context, key, child) {
        // print('iddd${key.res['products'][0]['id']}');
        return key.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : key.res == null
                ? Text('')
                : CarouselSlider.builder(
                    itemCount: key.res['products'].length,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: CardWidget(
                          name: key.res['products'][index]['title'].toString(),
                          price: key.res['products'][index]['price'].toString(),
                          img: key.res['products'][index]['images'],
                          id: key.res['products'][index]['id'],
                        ),
                      );
                    },
                    carouselController: contrl,
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          print(reason.toString());
                        });
                      },
                      // enlargeCenterPage: true,
                      viewportFraction: 0.45,
                      autoPlay: true,

                      aspectRatio: 16 / 9,
                    ),
                  );
      },
    );
  }
}
