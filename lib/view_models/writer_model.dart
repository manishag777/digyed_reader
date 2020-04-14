import 'package:digyed_reader/view_models/reader_model.dart';
import 'package:digyed_reader/models/course_model.dart';

import 'base_model.dart';

class WriterModel extends BaseModel {
  int index = 0;
  Matter matter;
  WriterModel(): matter=Matter([]);
  ReaderModel readerModel;

  
  void addCompound({BaseCompoundModel compound, CompoundType compoundType}){
    BaseCompoundModel newCompound = new TextModel(
        id: (index++).toString(),
        compoundType: compoundType ?? CompoundType.Heading,
        compoundLayout: CompoundLayout.Merge
    );

    int insertAt = compound==null ? 0: matter.compoundList.indexOf(compound) + 1;
    matter.compoundList.insert(insertAt, newCompound);
    notify();
  }

  void duplicate(BaseCompoundModel compound){
    BaseCompoundModel newCompound = compound.copy();
    int insertAt = compound==null ? 0: matter.compoundList.indexOf(compound) + 1;
    matter.compoundList.insert(insertAt, newCompound);
    notify();
  }

  void moveUp(BaseCompoundModel compound){
      int position = matter.compoundList.indexOf(compound);
      if(position > 0){
        BaseCompoundModel previousCompound = matter.compoundList[position-1];
        matter.compoundList[position-1] = compound;
        matter.compoundList[position] = previousCompound;
        notify();
      }
  }

  void moveDown(BaseCompoundModel compound){
    int position = matter.compoundList.indexOf(compound);
    if(position <  length - 1){
      BaseCompoundModel nextCompound = matter.compoundList[position+1];
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

  void delete(BaseCompoundModel compound){
    matter.compoundList.remove(compound);
    notify();
  }

//  void updateAtomAndNotify(Atom atom, String data){
//    atom.data = data;
//    notify();
//  }
//
//  void updateAtom(Atom atom, String data){
//    atom.data = data;
//  }

  void attachReader(ReaderModel readerModel){
    if(this.readerModel==null) {
      this.readerModel = readerModel;
      this.readerModel.updateMatter(matter);
    }
  }

  int get length => matter.compoundList.length;


}