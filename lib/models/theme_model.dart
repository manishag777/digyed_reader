
import 'dart:ui';
import 'package:flutter/material.dart';

class ThemeModel{
  final Color backgroundColor;
  final Color surfaceColor;
  final Color primary;
  final Color secondary;
  final Color onBackgroundColor;
  final Color onSurfaceColor;
  final Color onPrimaryColor;
  final Color onSecondaryColor;

  final TextStyle onSurfaceHeadingText;
  final TextStyle onSurfaceNormalText;
  final TextStyle onSurfaceHeadingHintText;
  final TextStyle onSurfaceNormalHintText;

  ThemeModel({this.backgroundColor, this.surfaceColor, this.primary,
      this.secondary, this.onBackgroundColor, this.onSurfaceColor,
      this.onPrimaryColor, this.onSecondaryColor, this.onSurfaceHeadingText,
      this.onSurfaceNormalText, this.onSurfaceHeadingHintText, this.onSurfaceNormalHintText});


}

ThemeModel get darkTheme {

  const backgroundColor =  Color.fromARGB(255, 42, 46, 53);
  const surfaceColor =  Color.fromARGB(255, 42, 46, 53);
  const primary =  Color.fromARGB(255, 42, 46, 53);
  const secondary =  Color.fromARGB(255, 42, 46, 53);
  const onBackgroundColor =  Color.fromARGB(255, 42, 46, 53);
  const onSurfaceColor =  Color.fromARGB(255, 42, 46, 53);
  const onPrimaryColor =  Color.fromARGB(255, 42, 46, 53);
  const onSecondaryColor =  Color.fromARGB(255, 42, 46, 53);

  TextStyle onSurfaceHeadingText = TextStyle(color: onSurfaceColor, fontSize: 30, fontWeight: FontWeight.bold);
  TextStyle onSurfaceNormalText = TextStyle(color: onSurfaceColor, fontSize: 15,);

  TextStyle onSurfaceHeadingHintText = TextStyle(color: Colors.grey[400], fontSize: 30, fontWeight: FontWeight.bold);
  TextStyle onSurfaceNormalHintText = TextStyle(color: Colors.grey[400], fontSize: 15);

  return ThemeModel(backgroundColor: backgroundColor, surfaceColor: surfaceColor,
      primary: primary, secondary: secondary, onBackgroundColor: onBackgroundColor,
      onSurfaceColor: onSurfaceColor, onPrimaryColor: onPrimaryColor, onSecondaryColor: onSecondaryColor,
      onSurfaceHeadingText: onSurfaceHeadingText, onSurfaceNormalText: onSurfaceNormalText,
      onSurfaceHeadingHintText: onSurfaceHeadingHintText, onSurfaceNormalHintText: onSurfaceNormalHintText);

}

