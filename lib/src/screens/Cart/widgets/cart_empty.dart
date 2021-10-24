import 'package:flutter/material.dart';

class CartEmpty extends StatefulWidget {
  const CartEmpty({ Key? key }) : super(key: key);

  @override
  _CartEmptyState createState() => _CartEmptyState();
}

class _CartEmptyState extends State<CartEmpty> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
     
      child: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/bag-sad-emoticon-mobile-app.jpg'),),
          SizedBox(height: 10,),
          Text("There is nothing in your cart!", style: TextStyle(fontSize: 18),),
         
        ],
      )),
    );
  }
}