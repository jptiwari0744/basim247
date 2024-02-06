import 'package:flutter/material.dart';

class MoreCategory extends StatefulWidget {
  const MoreCategory({super.key});

  @override
  State<MoreCategory> createState() => _MoreCategoryState();
}

class _MoreCategoryState extends State<MoreCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.grey.shade200,
          // Image radius
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
                color: Colors.grey.shade500,
              )),
        ),
        Text('More')
      ],
    );
  }
}
