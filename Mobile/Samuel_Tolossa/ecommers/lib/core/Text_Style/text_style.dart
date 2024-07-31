

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextStyles extends StatelessWidget {
  final String text;
  final Color fontColor;
  final int fontSizes;
  FontWeight? fontWeight = FontWeight.normal;
  TextStyles({
    super.key,
    required this.text,
    required this.fontColor,
    required this.fontSizes,
    this.fontWeight
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSizes.toDouble(),
        fontWeight: fontWeight,
        fontFamily: 'Poppin'
      ),

    );
  }
}