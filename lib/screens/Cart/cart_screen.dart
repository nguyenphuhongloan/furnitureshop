import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/constants/colors.dart';

import 'package:shop/data/fake.dart';
import 'package:shop/screens/Cart/widgets/cart_item.dart';
import 'package:shop/screens/category/widgets/furniture_gird_item.dart';
import 'package:shop/screens/home/widgets/category_card.dart';
import 'package:shop/widgets/bottom_navigation_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
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
          "CART",
          style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
                children: Fake.itemCarts
                    .map((e) => CartItem(
                          item: e,
                        ))
                    .toList()),
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
                          color: Colors.grey.shade400
                        ),
                        isCollapsed: true,
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(top: 18, left: 10, bottom: 16),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 80,
                    margin: EdgeInsets.only(right: 10),
                    child: Center(
                      child: Text("APPLY", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("SUBTOTAL: ", style: TextStyle(
                        fontSize: 20
                      ),),
                      Text("\$1500", style: TextStyle(
                        fontSize: 20
                      ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child:Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SHIP: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("\$15", style: TextStyle(fontSize: 20))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SUBTOTAL: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("\$1500", style: TextStyle(fontSize: 20))
                    ],
                  ),
                ],
              ),
            ),
            Container(
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
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BotNavBar(),
    );
  }
}
