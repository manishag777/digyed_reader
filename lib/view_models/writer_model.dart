
import 'package:flutter/widgets.dart';
import 'package:digyed_reader/models/course_model.dart';

class WriterModel extends ChangeNotifier {
  int index = 0;
  Matter matter;
  WriterModel(): matter=Matter([]);

  void addCompound({Compound compound}){
    Compound new_compound = new Compound(CompoundType.CARD, [], (index++).toString());
    int insertAt = compound==null ? 0: matter.compoundList.indexOf(compound) + 1;
    matter.compoundList.insert(insertAt, new_compound);
    notifyListeners();
  }

  void duplicate(Compound compound){
    Compound new_compound = compound.copy();
    int insertAt = compound==null ? 0: matter.compoundList.indexOf(compound) + 1;
    matter.compoundList.insert(insertAt, new_compound);
    notifyListeners();
  }

  void delete(Compound compound){
    matter.compoundList.remove(compound);
    notifyListeners();
  }

  int get length => matter.compoundList.length;


}