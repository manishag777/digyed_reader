
import 'package:digyed_reader/models/course_model.dart';
import 'package:flutter/widgets.dart';

import 'base_model.dart';

class ReaderModel extends BaseModel {

  Matter matter;

  ReaderModel({this.matter});

  void updateMatter(Matter matter){
    this.matter = matter;
  }

  void notify(){
    notifyListeners();
  }

  int get length => matter.compoundList.length;


}