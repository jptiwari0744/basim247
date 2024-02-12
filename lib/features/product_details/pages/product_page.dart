import 'package:flutter/material.dart';
import 'package:magento_ecom/features/home/widgets/card.dart';
import 'package:provider/provider.dart';

import '../../../app/provider/category_provider.dart';
import '../../../app/provider/products_by_id_provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // var limit = 10, offset = 0;
  // late ScrollController _scrollController;
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
      Provider.of<ProductByIdProvider>(context, listen: false)
          .ProductByIdApi(context, double.parse(id!));
      // Add Your Code here.
    });
  }

  // void loadData() {
  //   if (_scrollController.position.pixels ==
  //       _scrollController.position.maxScrollExtent) {
  //     setState(() {
  //       offset++;
  //       api(offset);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fashion'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Consumer<ProductByIdProvider>(builder: (context, key, child) {
        return key.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.2,
                  // width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    shrinkWrap: true,
                    // controller: _scrollController,
                    itemCount: key.product.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        // childAspectRatio: 0.6,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.5),
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0),
                    itemBuilder: (BuildContext context, int index) {
                      return CardWidget(
                        name: key.product[index].title,
                        price: key.product[index].price,
                        img: key.product[index].images,
                        id: key.product[index].id,
                      );
                    },
                  ),
                ),
              );
      }),
    );
  }
}
