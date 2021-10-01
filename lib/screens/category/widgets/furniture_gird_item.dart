import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/models/item.dart';

class FurnitureGridItem extends StatelessWidget {
  const FurnitureGridItem({ 
    Key? key,
    required this.item,
    this.margin
  }) : super(key: key);
  final Item item;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin == null? EdgeInsets.zero : margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset.zero,
            blurRadius: 15.0,
          )
        ],),
      child: Column(children: [
        Expanded(child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                  margin: EdgeInsets.only(top: 37),
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage(item.imagePath),
                    ),
                  ),
            ),
            if(item.discountPercent != null)
              Positioned(child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                 decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                child: Text('${item.discountPercent}%',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                ),
              ),
              top: 16,
              right: 16,)
        ],)),
        Padding(padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
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
                      '${Item.format(item.price)}',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        height: 1.5,
                      ),
                    ),
                    if (item.discountPercent != null)
                      Text(
                        '${Item.format(item.originalPrice)}',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.5,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black38,
                        ),
                      )
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
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                      SizedBox(width: 5),
                      Text(
                        '${item.rating}',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
            )
          ],
        ),)
      ],),
    );
  }
}