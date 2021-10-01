import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';

class PromotionCard extends StatelessWidget {
  static final List<Color> bgColors = [primaryPromoColor, secondaryPromoColor];
  final String? backgroundImagePath;
  final String? imagePath;
  final String? title;
  final String? subtitle;
  final String? tag;
  final String? caption;
  final bool? reverseGradient;
  const PromotionCard({ 
    Key? key, 
    this.backgroundImagePath, 
    this.imagePath, this.title ,
    this.subtitle, this.tag,
    this.caption, 
    this.reverseGradient }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 250,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: reverseGradient!
              ? bgColors.reversed.toList()
              : bgColors,
        ),
        image: DecorationImage(
          image: AssetImage(backgroundImagePath!),
          fit: BoxFit.cover
        )
      ),
      child: Stack(
        children: [
          if(imagePath != null)
            Positioned(child: Image.asset(imagePath!),
            right: 0,
            top: 16,),
          Wrap(
            direction: Axis.vertical,
            children: [
              Text(title!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              Text(
                subtitle!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  height: 1.5,
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: tag != null ?
              Container(
                 padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: BoxDecoration(
                        color: tagBackgroundColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                  child: Text(
                      tag!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          height: 1.5,
                        ),
                  ),
              ) : caption != null ? 
              Text(caption!,
                style: TextStyle(
                   color: Colors.white,
                      fontSize: 14,
                      height: 1.5,
                ),
              ) : Container(), 
          ),
        ],
      ),
    );
  }
}