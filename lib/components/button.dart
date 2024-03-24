import 'package:flutter/material.dart';
import 'package:kalil_clinec/constants/colors.dart';

class MyButton extends StatelessWidget {
  bool loading;
  String title;
  Color backColor;
  Color textColor;
  MyButton(
      {super.key,
      required this.title,
      required this.backColor,
      required this.textColor,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(8)),
      height: 50,
      child: Center(
        child: loading
            ? CircularProgressIndicator(
                color: MyColors.whiteColor,
              )
            : Text(
                title,
                style: TextStyle(color: textColor),
              ),
      ),
    );
  }
}
