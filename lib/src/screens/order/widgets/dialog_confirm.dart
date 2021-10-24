import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/src/constants/colors.dart';
import 'package:shop/src/controller/cart_controller.dart';
import 'package:shop/src/routes/app_pages.dart';

showDialogConfirmBill(BuildContext context, String total) {
  CartController _cartController = Get.put(CartController());
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          children: [
            Container(
              child: Image.asset("assets/images/ezgif.com-gif-maker.webp",
                  fit: BoxFit.cover),
            ),
            Container(
                child: Text(
              "Your bill is $total, press OK to confirm",
              style: TextStyle(),
            ))
          ],
        ),
      ),
      title: Center(
        child: Text("THANK YOU"),
      ),
      contentPadding: EdgeInsets.only(top: 0, right: 0, left: 0, bottom: 5),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 100,
                height: 40,
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 1.5)
                    ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                _cartController.deleteAllCart();
                Get.offAllNamed(Routes.ROOT);
              },
              child: Container(
                width: 100,
                height: 40,
                child: Center(
                    child: Text("OK",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ))),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: Colors.black.withOpacity(0.8),
                          blurRadius: 2)
                    ]),
              ),
            )
          ],
        )
      ],
    ),
  );
}
