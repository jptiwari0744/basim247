import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category_banner extends StatefulWidget {
  Category_banner(
      {required this.img, required this.title, required this.color});
  var img, title, color;
  @override
  State<Category_banner> createState() => _Category_bannerState();
}

class _Category_bannerState extends State<Category_banner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(widget.img),
        Positioned(
          right: 30,
          top: 20,
          child: Column(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Collection',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.color,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/product', arguments: '1');
                  },
                  child: Text(
                    'SHOP NOW',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
