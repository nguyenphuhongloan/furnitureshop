import 'package:flutter/material.dart';
import 'package:shop/src/constants/colors.dart';

class TextLabel extends StatelessWidget {
  const TextLabel(
    this.text, {
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle(
    this.text, {
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: primaryColor, fontSize: 32, fontWeight: FontWeight.w900),
    );
  }
}
