import 'dart:convert';

import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget({
    required this.name,
    required this.price,
    required this.img,
    // required this.value,
    // required this.color,
    // required this.id
  });
  var name, price, img;
  // var name, price, img, value, color, id;
  // var img;
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    // var image = json.decode(widget.img[0]);
    // var image = jsonDecode(widget.img[0] + widget.img[1].toString());
    // var n = widget.name;
    // print(image);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      // height: 300,
      // width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            // fit: StackFit.loose,
            children: [
              InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, '/productDetail');
                    // Navigator.pushNamed(context, '/product',
                    //     arguments: widget.id.toString());
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      child: Image.network(
                        widget.img[0],
                        // 'assets/earing.png',
                        // jsonDecode(widget.img[0].toString()),
                        height: 160,
                        // width: 200,
                      ))
                  // : Image.network(widget.img,
                  //     height: 170, width: 155, fit: BoxFit.fill)),
                  ),
            ],
          ),
          Text(
            widget.name,
            style: TextStyle(fontSize: 11),
          ),
          Text(
            widget.price,
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
