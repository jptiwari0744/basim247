import 'package:flutter/material.dart';
import 'package:magento_ecom/features/product_details/widgets/category_banner.dart';
import 'package:provider/provider.dart';

import '../../../app/provider/category_provider.dart';
import '../../home/widgets/category_name.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoryProvider>(context, listen: false)
          .CategoryApi(context);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'All Categories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/search');
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<CategoryProvider>(builder: (context, key, child) {
              return key.isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : key.res == null
                      ? Text('')
                      : Container(
                          child: GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            // controller: _controller,
                            itemCount: key.res['categories'].length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    // childAspectRatio: 0.6,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            1.8),
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 2.0,
                                    mainAxisSpacing: 2.0),
                            itemBuilder: (BuildContext context, int index) {
                              return CategoryName(
                                  id: key.res['categories'][index]['id'],
                                  img: key.res['categories'][index]['image'],
                                  name: key.res['categories'][index]['name']);
                            },
                          ),
                        );
            }),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.shade200,
            ),
            SizedBox(
              height: 20,
            ),
            Category_banner(
                img: 'assets/bimg1.jpg', title: 'Cargos', color: Colors.pink),
            Category_banner(
                img: 'assets/bimg4.jpg', title: 'Tops', color: Colors.pink),
            Category_banner(
                img: 'assets/bimg3.jpg', title: 'Shirts', color: Colors.pink),
            Category_banner(
                img: 'assets/bimg4.jpg', title: 'Jeans', color: Colors.pink),
            Category_banner(
                img: 'assets/sunglasses.jpg',
                title: 'Sunglasses',
                color: Colors.pink)
          ],
        ),
      ),
    );
  }
}
