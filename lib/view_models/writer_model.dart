
import 'package:flutter/widgets.dart';
import 'package:digyed_reader/models/course_model.dart';

class WriterModel extends ChangeNotifier {

  Matter matter;
  WriterModel(): matter=Matter([]);

  void addCompound(){
    Compound compound = new Compound(CompoundType.CARD, []);
    matter.compoundList.add(compound);
    notifyListeners();
  }

}