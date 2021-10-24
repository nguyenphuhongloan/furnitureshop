import 'package:flutter/material.dart';

import 'package:shop/src/constants/colors.dart';
import 'package:shop/src/models/cart_model.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.cartModel}) : super(key: key);
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.grey.shade100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                Container(
                  width: 90,
                  height: 90,
                  child: Image.network(
                    cartModel.product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cartModel.product.name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        Text(cartModel.product.getPrice(),
                            style: TextStyle(
                                fontSize: 20,
                                color: primaryColor,
                                fontWeight: FontWeight.w800))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), 
          Container(
            height: 90,
            padding: EdgeInsets.only(top: 70),
            child: Text(
              "x${cartModel.quantity}",
              style: TextStyle(fontSize: 18),
            ),
          ) 
        ],
      ),
    );
  }
}
