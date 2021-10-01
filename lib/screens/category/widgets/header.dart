import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/data/fake.dart';
import 'package:shop/screens/category/widgets/action_button.dart';
import 'package:shop/widgets/cart.dart';

import 'filter_modal_bottom_sheet.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0.0, 10.0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                      child: SvgPicture.asset('assets/icons/back.svg'),
                      onTap: () {
                        Get.back();
                      }),
                ),
                Text(
                  'Living Room',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  width: 60,
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10.0,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/search.svg',
                        height: 18,
                      ),
                      Cart(
                        numberOfItemsInCart: Fake.numberOfItemsInCart,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ActionButton(
                  title: 'Filter',
                  iconPath: 'assets/icons/controls.svg',
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  active: true,
                ),
                //VerticalSeparator(),
                ActionButton(
                  title: 'Sort',
                  iconPath: 'assets/icons/sort.svg',
                  onTap: () {},
                ),
                //VerticalSeparator(),
                ActionButton(
                  title: 'List',
                  iconPath: 'assets/icons/list.svg',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return FilterModalBottomSheet();
        });
  }
}
