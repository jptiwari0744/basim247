import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:magento_ecom/app/provider/product_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String? id;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as String;
    print(id);
    // _scrollController = ScrollController()..addListener(loadData);
    api(id);

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void api(id) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductDetailsProvider>(context, listen: false)
          .ProductDetailsApi(context, id);
      // Add Your Code here.
    });
  }

  @override
  Widget build(BuildContext context) {
    var pageController = PageController(); // Create a PageController
    var carouselController =
        CarouselController(); // Create a CarouselController

    pageController.addListener(() {
      // Update the CarouselController's current page when PageController's page changes
      carouselController.jumpToPage(pageController.page!.round());
    });

    return SafeArea(
      top: true,
      child: Scaffold(
        body: Consumer<ProductDetailsProvider>(builder: (context, key, child) {
          return key.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CarouselSlider.builder(
                          itemCount: key.products?.images?.length,
                          itemBuilder: (context, index, realIndex) {
                            return Image.network(
                              key.products!.images![index],
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                            );
                          },
                          carouselController: carouselController,
                          // Use the CarouselController
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                // No need to update currentIndex here
                              });
                            },
                            // enlargeCenterPage: true,
                            viewportFraction: 1,
                            autoPlay: true,
                            aspectRatio: 16 / 12,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back_ios_new_rounded),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        key.products!.title.toString(),
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        key.products!.description.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$${key.products?.price}.00',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                  // color: Colors.deepOrange.shade100,
                                  color: Colors.purple.shade200,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                                child: TextButton.icon(
                                  icon: Icon(
                                    Icons.shopping_basket_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                  label:
                                      // isLoader
                                      //     ? const Center(
                                      //     child: CircularProgressIndicator(
                                      //         color: Colors.white))
                                      //     :
                                      const Text(
                                    'Add to cart',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
        }),
      ),
    );
  }
}
