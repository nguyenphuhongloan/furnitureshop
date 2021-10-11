import 'package:flutter/material.dart';
import 'package:shop/src/constants/colors.dart';
import 'package:shop/src/models/item.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 0),
                blurRadius: 5)
          ]),
      child: Row(
        children: [
          Container(
            child: Image.asset(
              widget.item.imagePath,
              fit: BoxFit.cover,
            ),
            height: 100,
            width: 100,
          ),
          Container(
            width: size.width - 210,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.item.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                Text("\$" + widget.item.price.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontWeight: FontWeight.w800))
              ],
            ),
          ),
          Container(
            width: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle,
                  color: primaryColor,
                  size: 30,
                ),
                Text(
                  "1",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Icon(
                  Icons.remove_circle,
                  color: primaryColor,
                  size: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
