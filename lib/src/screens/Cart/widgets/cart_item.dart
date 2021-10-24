import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shop/src/constants/colors.dart';
import 'package:shop/src/controller/cart_controller.dart';
import 'package:shop/src/models/cart_model.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.cartModel,
  }) : super(key: key);
  final CartModel cartModel;
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final CartController _cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.2,
        secondaryActions: [
          IconSlideAction(
            caption: 'Delete',
            icon: Icons.delete_outline,
            onTap: () {
              _cartController.deleteToCart(
                  productId: widget.cartModel.product.id);
            },
          ),
        ],
        child: 
             Container(
                width: size.width,
                height: 120,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 0),
                          blurRadius: 5)
                    ]),
                child: Row(
                  children: [
                    Container(
                      child: Image(
                        image: NetworkImage(widget.cartModel.product.image),
                        fit: BoxFit.cover,
                      ),
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: size.width - 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.cartModel.product.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                          Text(widget.cartModel.product.getPrice(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w800))
                        ],
                      ),
                    ),
                    Container(
                      width: 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => _cartController.updateQuantity(
                              productId: widget.cartModel.product.id,
                            ),
                            child: Icon(
                              Icons.add_circle,
                              color: primaryColor,
                              size: 30,
                            ),
                          ),
                          Text(
                            '${widget.cartModel.quantity}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          GestureDetector(
                            onTap: () => _cartController.updateQuantity(
                              productId: widget.cartModel.product.id,
                              quantity: -1,
                            ),
                            child: Icon(
                              Icons.remove_circle,
                              color: primaryColor,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ,
      ),
    );
  }
}
