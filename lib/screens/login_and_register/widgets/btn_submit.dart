import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';

class BtnSubmit extends StatelessWidget {
  const BtnSubmit(
    this.text, {
    Key? key,
    this.onTap,
  }) : super(key: key);
  final String text;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(20)),
        width: double.infinity,
        height: 55,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        )),
      ),
    );
  }
}
