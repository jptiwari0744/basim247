import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:magento_ecom/features/home/widgets/category_name.dart';
import 'package:magento_ecom/features/home/widgets/more_category.dart';
import 'package:magento_ecom/features/home/widgets/product_carousel.dart';
import 'package:provider/provider.dart';

import '../../../app/provider/category_provider.dart';
import '../../../app/provider/product_provider.dart';
import '../widgets/card.dart';
import '../widgets/carousel.dart';
import '../widgets/category_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoryProvider>(context, listen: false)
          .CategoryApi(context);
    });

    // TODO: implement initState
    super.initState();
  }

  CarouselController carouselController = CarouselController();
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          // SearchField(),
          CarouselWidget(),
          SizedBox(
            height: 10,
          ),
          Consumer<CategoryProvider>(builder: (context, key, child) {
            return key.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    // height: MediaQuery.of(context).size.height * 0.2,
                    // width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      shrinkWrap: true,
                      // controller: _controller,
                      itemCount: key.res['categories'].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // childAspectRatio: 0.6,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.8),
                          crossAxisCount: 4,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 2.0),
                      itemBuilder: (BuildContext context, int index) {
                        return CategoryName(
                            img: key.res['categories'][index]['image'],
                            name: key.res['categories'][index]['name']);
                      },
                    ),
                  );
          }),

          Image.asset('assets/bnr5.jpg'),

          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Most popular'),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.navigate_next_outlined),
                    label: Text('View all'))
              ],
            ),
          ),
          productCarousel(),
          SizedBox(
            height: 20,
          ),
          Divider(color: Colors.grey),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryCard(
                  img: 'assets/laptop.jpg',
                  name: 'Laptops',
                  price: 'upto 80% off'),
              CategoryCard(
                  img: 'assets/mobile.jpg',
                  name: 'Mobiles',
                  price: 'upto 80% off'),
              CategoryCard(
                  img: 'assets/mic.jpg',
                  name: 'Headphones',
                  price: 'upto 80% off')
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
