import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
showDialogLoading(BuildContext context){
  showDialog(
    context: context, 
    builder: (context) => Center(
      child: CupertinoActivityIndicator(
        animating: true,
        radius: 25,
      ),

    ),
    barrierDismissible: false,
    barrierColor: Color(0x80000000)
    );
}