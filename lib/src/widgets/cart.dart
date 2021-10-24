import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/src/constants/colors.dart';
import 'package:shop/src/controller/cart_controller.dart';
import 'package:shop/src/models/cart_model.dart';
import 'package:shop/src/routes/app_pages.dart';

class Cart extends StatefulWidget {
  const Cart({
    Key? key,
  }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController _cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.CART);
          },
          child: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset("assets/icons/cart.svg")),
        ),
        StreamBuilder(
            stream: _cartController.getStreamCart,
            initialData: _cartController.getListCart,
            builder: (context, AsyncSnapshot<List<CartModel>> snapshot) =>
                (snapshot.hasData && snapshot.data!.length != 0)
                    ? Positioned(
                        top: -4,
                        right: -4,
                        child: Container(
                          alignment: Alignment.center,
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.0),
                          ),
                          child: Text(
                            "${snapshot.data!.length}",
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : SizedBox())
      ],
    );
  }
}
