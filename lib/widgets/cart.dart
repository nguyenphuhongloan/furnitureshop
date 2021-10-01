import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/constants/colors.dart';

class Cart extends StatelessWidget {
  const Cart({
    Key? key,
    required this.numberOfItemsInCart,
  }) : super(key: key);
  final int numberOfItemsInCart;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            width: 30,
            height: 30,
            child: SvgPicture.asset("assets/icons/cart.svg")),
        if (numberOfItemsInCart > 0)
          Positioned(
              top: -4,
              right: -4,
              child: Container(
                alignment: Alignment.center,
                width: 18,
                height: 18,
                decoration:
                    BoxDecoration(color: primaryColor, 
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.0),
                ),
                child: Text(
                  "$numberOfItemsInCart",
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ))
      ],
    );
  }
}
