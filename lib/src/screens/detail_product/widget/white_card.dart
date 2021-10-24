import 'package:flutter/material.dart';
import 'package:shop/src/screens/detail_product/detail_product_screen.dart';

class WhiteCard extends StatelessWidget {
  const WhiteCard(
      {Key? key, required this.size, required this.widget, required this.child})
      : super(key: key);

  final Size size;
  final DetailProductScreen widget;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: child,
    );
  }
}
