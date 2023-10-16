
import 'package:flutter/material.dart';
import 'package:traker_app/config/traker_colors.dart';

Widget circularProgressColors({
  double widthContainer1 = 30,
  double widthContainer2 = 20,
  Color colorCircular = TrakerColors.primary,
}){
  return SizedBox(
    width: widthContainer1,
    child: Center(
      child: SizedBox(
        height: widthContainer2, width: widthContainer2,
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(colorCircular)),
      ),
    ),
  );
}