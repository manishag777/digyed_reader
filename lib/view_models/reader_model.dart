
import 'package:flutter/widgets.dart';

class ReaderModel extends ChangeNotifier {

  String text;

  ReaderModel(this.text);

  void updateText(String text){
    this.text = text;
    notifyListeners();
  }



}