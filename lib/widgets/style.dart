import 'package:flutter/material.dart';

Widget styleText({
  required String data,
  required String fontFamily,
  required double size,
  required Color color,
}) {
  return Text(
    data,
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      color: color,
    ),
  );
}

TextStyle style({
  double spasing = 0,
  FontWeight weight = FontWeight.normal, 
  required String fontFamily,
  required double size,
  required Color color,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: size,
    color: color,
    fontWeight: weight,
    letterSpacing: spasing
  );
}
