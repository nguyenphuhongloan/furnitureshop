import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/screens/login_and_register/widgets/text_fommated.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    this.label = "",
    this.hinttext = "",
    this.obscureText = false,
    this.onChange,
  }) : super(key: key);
  final String hinttext;
  final bool obscureText;
  final String label;
  final Function? onChange;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabel(label),
        SizedBox(
          height: 12,
        ),
        TextFormField(
          obscureText: obscureText,
          cursorColor: primaryColor,
          decoration: InputDecoration(
            focusColor: primaryColor,
            hintText: hinttext,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: primaryColor.withOpacity(0.6),
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 2,
              ),
            ),
          ),
          onChanged: (val) {
            onChange!(val);
          },
        ),
      ],
    );
  }
}
