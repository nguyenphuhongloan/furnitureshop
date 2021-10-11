import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/src/constants/colors.dart';

showDialogNotication(context,
    {required String title, required String content}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Container(
                height: 45,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 1.5,
                        spreadRadius: 0,
                        offset: Offset(0, 1), // shadow direction: bottom right
                      )
                    ],
                    color: primaryColor.withOpacity(0.95),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(
                    child: Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ))),
            content: Container(
              child: Text(content, style: TextStyle(fontSize: 20),),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          primaryColor.withOpacity(0.9)),
                      elevation: MaterialStateProperty.all(2.0)),
                ),
              ),
            ],
            titlePadding: EdgeInsets.all(0),
            contentPadding: EdgeInsets.only(top: 20, left: 30, right: 30),
          ));
}
