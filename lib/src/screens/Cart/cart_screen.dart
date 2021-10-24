import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:shop/src/constants/colors.dart';
import 'package:shop/src/controller/cart_controller.dart';
import 'package:shop/src/models/product.dart';
import 'package:shop/src/routes/app_pages.dart';
import 'package:shop/src/screens/cart/widgets/cart_empty.dart';
import 'package:shop/src/screens/cart/widgets/cart_item.dart';
import 'package:shop/src/widgets/line_black1.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
    this.product,
  }) : super(key: key);
  final Product? product;
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController _cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    _cartController.initialController();
    /*  if (widget.product != null) CartModel().addItem(widget.product!); */
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: SvgPicture.asset("assets/icons/back.svg"),
            iconSize: 20,
            onPressed: () => Get.back()),
        title: Text(
          "CART",
          style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 22),
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (_) {
          return _.getListCart.length == 0
              ? CartEmpty()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _.getListCart.length,
                        itemBuilder: (context, index) {
                          return CartItem(
                            cartModel: _.getListCart[index],
                          );
                        },
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                  color: primaryColor.withOpacity(0.4),
                                  offset: Offset(0, 0),
                                  blurRadius: 2.5)
                            ]),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width - 130,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(fontSize: 22),
                                decoration: InputDecoration(
                                  hintText: "PROMOCODE",
                                  hintStyle: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey.shade400),
                                  isCollapsed: true,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      top: 18, left: 10, bottom: 16),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 80,
                              margin: EdgeInsets.only(right: 10),
                              child: Center(
                                child: Text(
                                  "APPLY",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 20),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            TextCard(
                                title: "SUBTOTAL",
                                price:
                                    _cartController.formattedProductTotalPrice),
                            Line1(
                              width: size.width,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              color: Colors.black.withOpacity(0.7),
                            ),
                            TextCard(title: "DISCOUNT", price: "0"),
                            Line1(
                              width: size.width,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              color: Colors.black.withOpacity(0.7),
                            ),
                            TextCard(
                                title: "TOTAL",
                                price:
                                    _cartController.formattedProductTotalPrice)
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.ORDER),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: MediaQuery.of(context).size.width - 40,
                          height: 50,
                          child: Center(
                            child: Text(
                              "BUY",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class TextCard extends StatelessWidget {
  const TextCard({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        Text(price, style: TextStyle(fontSize: 20))
      ],
    );
  }
}
