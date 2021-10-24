import 'package:flutter/material.dart';
import 'package:shop/src/constants/colors.dart';

class Information extends StatelessWidget {
  const Information({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 2,
            color: Colors.black.withOpacity(0.5))
      ]),
      width: size.width,
      child: Row(
        children: [
          Container(
            width: size.width - 50,
            padding: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: primaryColor,
                    ),
                    Text(
                      "Your Information",
                      style: TextStyle(fontSize: 21),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: TextFormField(
                      style: TextStyle(fontSize: 20),
                      controller: TextEditingController(
                          text:
                              "Meo meo\n142 Lê Lợi, phường 13, Quận 9, Hồ Chí Minh\n0125125125"),
                      maxLines: 10,
                      minLines: 1,
                      enabled: false,
                      decoration:
                          InputDecoration(disabledBorder: InputBorder.none)),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 25,
          )
        ],
      ),
    );
  }
}
