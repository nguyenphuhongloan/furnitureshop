import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;
  const ImageCard(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15
          )
        ],
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)
      ),
    );
  }
}
