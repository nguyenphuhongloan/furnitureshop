import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/src/constants/colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key,
      required this.title,
      required this.iconPath,
      this.active = false,
      required this.onTap})
      : super(key: key);
  final Function() onTap;
  final String title;
  final String iconPath;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10.0,
        children: [
          SvgPicture.asset(
            iconPath,
            color: active ? primaryColor : Colors.black87,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: active ? primaryColor : Colors.black87,
                    fontSize: 16.0),
              ),
              if (active)
                Positioned(
                    top: -3,
                    right: -12,
                    child: Container(
                      width: 14,
                      height: 14,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/tick.svg',
                        height: 5,
                        color: Colors.white,
                      ),
                    ))
            ],
          )
        ],
      ),
    );
  }
}
