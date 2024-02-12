import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:magento_ecom/app/provider/products_by_id_provider.dart';
import 'package:provider/provider.dart';

class CategoryName extends StatefulWidget {
  CategoryName({required this.img, required this.name, required this.id});
  var img, name, id;
  @override
  State<CategoryName> createState() => _CategoryNameState();
}

class _CategoryNameState extends State<CategoryName> {
  @override
  Widget build(BuildContext context) {
    print(widget.id.runtimeType);

    return Column(
      children: [
        widget.img == null
            ? CircleAvatar(
                radius: 35,
                backgroundColor: Colors.purple.shade300, // Image radius
              )
            : InkWell(
                onTap: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context)
                        .pushNamed('/product', arguments: widget.id);
                  });
                },
                child: CircleAvatar(
                  radius: 35, // Image radius
                  backgroundImage: NetworkImage(widget.img.toString()),
                ),
              ),
        widget.name == null
            ? Text('not found')
            : Text(
                widget.name.toString(),
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              )
      ],
    );
  }
}
