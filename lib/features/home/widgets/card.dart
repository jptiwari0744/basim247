import 'dart:convert';

import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget(
      {required this.name,
      required this.price,
      required this.img,
      required this.id
      // required this.value,
      // required this.color,
      // required this.id
      });
  var name, price, img, id;
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
      // height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            // fit: StackFit.loose,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/productDetail', arguments: widget.id);
                    print('idd${widget.id}');
                    // Navigator.pushNamed(context, '/productDetail');
                    // Navigator.pushNamed(context, '/product',
                    //     arguments: widget.id.toString());
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      child: widget.img[0] == null
                          ? Container(
                              color: Colors.purple.shade200,
                            )
                          : Image.network(
                              widget.img[0],
                              // 'assets/earing.png',
                              // jsonDecode(widget.img[0].toString()),
                              // height: MediaQuery.of(context).size.height * 0.24,
                              // width: MediaQuery.of(context).size.width * 0.4,
                            ))
                  // : Image.network(widget.img,
                  //     height: 170, width: 155, fit: BoxFit.fill)),
                  ),
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: Text(
              '\$${widget.price}.00',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
