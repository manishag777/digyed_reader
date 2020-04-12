import 'package:flutter/material.dart';

class Reader extends StatelessWidget {

  String text;

  Reader(this.text);

  @override
  Widget build(BuildContext context) {
    print("Building Reader with text "+text);
    return Center(child: Container(child: Text(text),));
  }
}
