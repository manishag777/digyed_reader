
import 'package:flutter/widgets.dart';
import 'package:digyed_reader/models/course_model.dart';

class WriterModel extends ChangeNotifier {
  int index = 0;
  Matter matter;
  WriterModel(): matter=Matter([]);
  
  List<DyElement> getDefaultElementList(){
    Atom headerAtom = Atom(AtomType.HEADING, "");
    Atom descriptionAtom = Atom(AtomType.DESCRIPTION, "");
    DyElement element = DyElement([headerAtom, descriptionAtom]);
    return [element];
  }
  
  void addCompound({Compound compound}){
    Compound newCompound = new Compound(CompoundType.CARD, getDefaultElementList(), (index++).toString());
    int insertAt = compound==null ? 0: matter.compoundList.indexOf(compound) + 1;
    matter.compoundList.insert(insertAt, newCompound);
    notifyListeners();
  }

  void duplicate(Compound compound){
    Compound new_compound = compound.copy();
    int insertAt = compound==null ? 0: matter.compoundList.indexOf(compound) + 1;
    matter.compoundList.insert(insertAt, new_compound);
    notifyListeners();
  }

  void moveUp(Compound compound){
      int position = matter.compoundList.indexOf(compound);
      if(position > 0){
        Compound previousCompound = matter.compoundList[position-1];
        matter.compoundList[position-1] = compound;
        matter.compoundList[position] = previousCompound;
        notifyListeners();
      }
  }

  void moveDown(Compound compound){
    int position = matter.compoundList.indexOf(compound);
    if(position <  length - 1){
      Compound nextCompound = matter.compoundList[position+1];
      matter.compoundList[position+1] = compound;
      matter.compoundList[position] = nextCompound;
      notifyListeners();
    }
  }


  void delete(Compound compound){
    matter.compoundList.remove(compound);
    notifyListeners();
  }

  void updateAtomAndNotify(Atom atom, String data){
    atom.data = data;
    notifyListeners();
  }

  void updateAtom(Atom atom, String data){
    atom.data = data;
  }
  

  int get length => matter.compoundList.length;


}