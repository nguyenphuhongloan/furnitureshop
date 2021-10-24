import 'package:flutter/material.dart';

class TextSubMoney extends StatelessWidget {
  const TextSubMoney({
    Key? key,
    required this.title,
    required this.money,
  }) : super(key: key);
  final String title;
  final String money;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        Text(
          money,
          style: TextStyle(fontSize: 20),
        )
      ]),
    );
  }
}
