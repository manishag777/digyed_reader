
import 'package:digyed_reader/models/course_model.dart';
import 'package:flutter/widgets.dart';

class ReaderModel extends ChangeNotifier {

  Matter matter;

  ReaderModel({this.matter});

  void updateMatter(Matter matter){
    this.matter = matter;
    notifyListeners();
  }

  void notify(){
    notifyListeners();
  }

  int get length => matter.compoundList.length;


}