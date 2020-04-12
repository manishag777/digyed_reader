
import 'package:digyed_reader/view_models/reader_model.dart';
import 'package:flutter/widgets.dart';
import 'package:digyed_reader/models/course_model.dart';

class WriterModel extends ChangeNotifier {
  int index = 0;
  Matter matter;
  WriterModel(): matter=Matter([]);
  ReaderModel readerModel;
  
  List<DyElement> getDefaultElementList(){
    Atom headerAtom = Atom(AtomType.HEADING, "");
    Atom descriptionAtom = Atom(AtomType.DESCRIPTION, "");
    DyElement element = DyElement([headerAtom, descriptionAtom]);
    return [element];
  }
  
  void addCompound({Compound compound}){
    Compound newCompound = new Compound(CompoundType.COMPREHENSION, getDefaultElementList(), (index++).toString());
    int insertAt = compound==null ? 0: matter.compoundList.indexOf(compound) + 1;
    matter.compoundList.insert(insertAt, newCompound);
    notify();
  }

  void duplicate(Compound compound){
    Compound new_compound = compound.copy();
    int insertAt = compound==null ? 0: matter.compoundList.indexOf(compound) + 1;
    matter.compoundList.insert(insertAt, new_compound);
    notify();
  }

  void moveUp(Compound compound){
      int position = matter.compoundList.indexOf(compound);
      if(position > 0){
        Compound previousCompound = matter.compoundList[position-1];
        matter.compoundList[position-1] = compound;
        matter.compoundList[position] = previousCompound;
        notify();
      }
  }

  void moveDown(Compound compound){
    int position = matter.compoundList.indexOf(compound);
    if(position <  length - 1){
      Compound nextCompound = matter.compoundList[position+1];
      matter.compoundList[position+1] = compound;
      matter.compoundList[position] = nextCompound;
      notify();
    }
  }

  void notify(){
    notifyListeners();
    if(readerModel!=null){
      readerModel.notify();
    }
  }

  void delete(Compound compound){
    matter.compoundList.remove(compound);
    notify();
  }

  void updateAtomAndNotify(Atom atom, String data){
    atom.data = data;
    notify();
  }

  void updateAtom(Atom atom, String data){
    atom.data = data;
  }

  void attachReader(ReaderModel readerModel){
    this.readerModel = readerModel;
    this.readerModel.updateMatter(matter);
  }

  int get length => matter.compoundList.length;


}