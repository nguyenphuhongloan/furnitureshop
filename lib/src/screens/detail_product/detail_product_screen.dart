import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop/src/constants/colors.dart';
import 'package:shop/src/controller/cart_controller.dart';
import 'package:shop/src/models/product.dart';
import 'package:shop/src/routes/app_pages.dart';
import 'package:shop/src/screens/detail_product/widget/white_card.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key, required this.product})
      : super(key: key);
  final Product product;
  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  final CartController _cartController = Get.put(CartController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height - 80,
              color: Colors.grey.shade100.withOpacity(0.8),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        FittedBox(
                          child: Image.network(widget.product.image),
                          fit: BoxFit.fill,
                        ),
                        WhiteCard(
                          size: size,
                          widget: widget,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.product.getPrice(),
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                    color: primaryColor),
                              ),
                            ],
                          ),
                        ),
                        WhiteCard(
                            size: size,
                            widget: widget,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Description:",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(widget.product.description,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300))
                              ],
                            ))
                      ],
                    ),
                  ),
                  Positioned(
                      top: 35,
                      left: 14,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                            color: Colors.grey.shade800.withOpacity(0.2),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: SvgPicture.asset("assets/icons/back.svg")),
                      )),
                ],
              ),
            ),
            Container(
              width: size.width,
              height: 80,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    color: Colors.black.withOpacity(0.45),
                    blurRadius: 2)
              ]),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      _cartController.addToCart(product: widget.product);
                      Get.toNamed(
                        Routes.CART,
                        arguments: widget.product,
                      );
                    },
                    child: Container(
                      width: size.width / 2,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/cart.svg",
                            width: 24,
                            height: 24,
                            color: primaryColor,
                          ),
                          Text(
                            "  Add to cart",
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _cartController.addToCart(product: widget.product);
                      Get.toNamed(Routes.ORDER);
                    },
                    child: Container(
                      height: 80,
                      width: size.width / 2,
                      color: primaryColor,
                      child: Center(
                        child: Text(
                          "BUY NOW",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
