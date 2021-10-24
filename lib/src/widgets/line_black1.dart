import 'package:flutter/material.dart';

class Line1 extends StatelessWidget {
  const Line1({
    Key? key,
    required this.width,
    this.color = Colors.black,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);
  final double? width;
  final Color? color;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Container(
        color: color,
        width: width,
        height: 1,
      ),
    );
  }
}
