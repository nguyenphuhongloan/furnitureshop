import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/src/constants/colors.dart';
import 'package:shop/src/controller/cart_controller.dart';
import 'package:shop/src/models/cart_model.dart';
import 'package:shop/src/screens/order/widgets/dialog_confirm.dart';
import 'package:shop/src/screens/order/widgets/information.dart';
import 'package:shop/src/screens/order/widgets/order_item.dart';
import 'package:shop/src/screens/order/widgets/text_sub_money.dart';
import 'package:shop/src/widgets/line_black1.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  CartController _cartController = Get.put(CartController());
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
          onPressed: () => Get.back(),
        ),
        title: Text(
          "ORDER",
          style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 22),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              height: size.height - 60 - 80,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Information(),
                    StreamBuilder(
                        stream: _cartController.getStreamCart,
                        initialData: _cartController.getListCart,
                        builder:
                            (context, AsyncSnapshot<List<CartModel>> snapshot) {
                          return Container(
                            width: size.width,
                            child: Column(
                                children: snapshot.data!
                                    .map((e) => OrderItem(cartModel: e))
                                    .toList()),
                          );
                        }),
                    TextSubMoney(
                      title: "Total product price",
                      money: _cartController.formattedProductTotalPrice,
                    ),
                    TextSubMoney(
                      title: "Voucher discount",
                      money: "0",
                    ),
                    Line1(
                      width: size.width - 20,
                      color: Colors.black.withOpacity(0.45),
                    ),
                    TextSubMoney(
                      title: "Total pay",
                      money: _cartController.formattedProductTotalPrice,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 60,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 2,
                  ),
                ],
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Container(
                      width: size.width - 150,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "TOTAL: ",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            _cartController.formattedProductTotalPrice,
                            style: TextStyle(
                                fontSize: 19,
                                color: primaryColor,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showDialogConfirmBill(context,
                            _cartController.formattedProductTotalPrice);
                      },
                      child: Container(
                        width: 120,
                        height: 60,
                        child: Center(
                            child: Text(
                          "BUY",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )),
                        decoration: BoxDecoration(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
