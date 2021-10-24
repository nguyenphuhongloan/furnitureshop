import 'package:flutter/material.dart';
import 'package:shop/src/screens/home/widgets/searchbar.dart';
import 'package:shop/src/widgets/cart.dart';

class Header extends StatefulWidget {
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Furniture shop", style: TextStyle(fontSize: 28, height: 1)),
           
            Cart(),
          ]),
          Text(
            'Get unique furniture for your home',
            style: TextStyle(fontSize: 15.0, height: 2, color: Colors.black38),
          ),
          SearchBar(),
        ],
      ),
    );
  }
}
