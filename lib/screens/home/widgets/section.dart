import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants/colors.dart';

class Section extends StatelessWidget {
  final List<Widget> children;
  final String title;
  const Section(
    this.title,
    this.children,
    {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20, 
                  height: 1),
              ),
              InkWell(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                  Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 18.0,
                        height: 1,
                        color: primaryColor,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: primaryColor,
                  ),
                ),
                ], 
                ),
                onTap: (){},
              )
          ],),
        ),
        Container(
          child: SingleChildScrollView(child: Wrap(children: [
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:  EdgeInsets.all(28),
                  child: Wrap(
                    children: children,
                    spacing: 28,
                  ),
                ),),
            )
          ],),),
        )

      ],

    );
  }
}
