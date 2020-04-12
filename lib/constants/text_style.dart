import 'dart:ui';
import 'package:flutter/material.dart';

const Color textColor = Color.fromARGB(255, 255, 255, 255);
const TextStyle headingStyle = TextStyle(color: textColor, fontSize: 30, fontWeight: FontWeight.bold);
const TextStyle descriptionStyle = TextStyle(color: textColor, fontSize: 15,);

TextStyle get headingHintStyle => TextStyle(color: Colors.grey[400], fontSize: 30, fontWeight: FontWeight.bold);
TextStyle get descriptionHintStyle => TextStyle(color: Colors.grey[400], fontSize: 15);

const Color editTextColor = Color.fromARGB(255, 0, 0, 0);
const TextStyle headingEditStyle = TextStyle(color: editTextColor, fontSize: 30, fontWeight: FontWeight.bold);
const TextStyle descriptionEditStyle = TextStyle(color: editTextColor, fontSize: 15);