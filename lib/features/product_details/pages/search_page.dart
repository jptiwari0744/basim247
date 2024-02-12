import 'package:flutter/material.dart';
import 'package:magento_ecom/app/provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../../home/widgets/card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = TextEditingController();
  void search(value) {
    print(value);
    if (value != null) {
      Provider.of<ProductProvider>(context, listen: false)
          .searchApi(context, value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          onChanged: search,
          controller: _controller,
          decoration: InputDecoration(
              hintText: 'Search here...', prefixIcon: Icon(Icons.search)),
        ),
      ),
      body: Consumer<ProductProvider>(builder: (context, key, child) {
        print(key.res2);
        return key.res2 == null
            ? Text('')
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.2,
                  // width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    shrinkWrap: true,
                    // controller: _scrollController,
                    itemCount: key.res2['products'].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        // childAspectRatio: 0.6,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.5),
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0),
                    itemBuilder: (BuildContext context, int index) {
                      return CardWidget(
                        name: key.res2['products'][index]['title'],
                        price: key.res2['products'][index]['price'],
                        img: key.res2['products'][index]['images'],
                        id: key.res2['products'][index]['id'],
                      );
                    },
                  ),
                ),
              );
      }),
    );
  }
}
