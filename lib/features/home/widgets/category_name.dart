import 'package:flutter/material.dart';

class CategoryName extends StatefulWidget {
  CategoryName({required this.img, required this.name});
  var img, name;
  @override
  State<CategoryName> createState() => _CategoryNameState();
}

class _CategoryNameState extends State<CategoryName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.img == null
            ? CircleAvatar(
                radius: 35,
                backgroundColor: Colors.purple.shade50, // Image radius
              )
            : CircleAvatar(
                radius: 35, // Image radius
                backgroundImage: NetworkImage(widget.img.toString()),
              ),
        widget.name == null ? Text('not found') : Text(widget.name.toString())
      ],
    );
  }
}
