import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  CategoryCard({
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
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      height: 160,
      // width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
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
                      child: Image.asset(
                        widget.img,
                        fit: BoxFit.fill,
                        height: 120,
                        width: MediaQuery.of(context).size.width * 0.29,
                      ))
                  // : Image.network(widget.img,
                  //     height: 170, width: 155, fit: BoxFit.fill)),
                  ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01),
            child: Text(
              widget.name,
              style: TextStyle(fontSize: 11),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01),
            child: Text(
              widget.price,
              style: TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
