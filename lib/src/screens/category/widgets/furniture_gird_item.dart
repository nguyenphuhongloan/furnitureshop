import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shop/src/constants/colors.dart';
import 'package:shop/src/models/product.dart';
import 'package:shop/src/screens/detail_product/detail_product_screen.dart';

class FurnitureGridItem extends StatefulWidget {
  const FurnitureGridItem({Key? key, required this.product, this.margin})
      : super(key: key);
  final Product product;
  final EdgeInsets? margin;

  @override
  State<FurnitureGridItem> createState() => _FurnitureGridItemState();
}

class _FurnitureGridItemState extends State<FurnitureGridItem> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Get.to(DetailProductScreen(product: widget.product));
      },
      child: Container(
        margin: this.widget.margin == null ? EdgeInsets.zero : widget.margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset.zero,
              blurRadius: 15.0,
            )
          ],
        ),
        child: Column(
          children: [
            Expanded(
                child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 37),
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: NetworkImage(widget.product.image),
                    ),
                  ),
                ),
                /* if (product.discountPercent != null)
                  Positioned(
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${item.discountPercent}%',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    top: 16,
                    right: 16,
                  ) */
              ],
            )),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                  Wrap(
                    spacing: 3,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        widget.product.getPrice(),
                        style: TextStyle(
                          fontSize: 18,
                          color: primaryColor,
                          height: 1.5,
                        ),
                      ),
                      /*  if (product.discountPercent != null)
                        Text(
                          '${Item.format(item.originalPrice)}',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.5,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.black38,
                          ),
                        ) */
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 28,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
