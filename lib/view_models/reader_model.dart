
import 'package:digyed_reader/models/course_model.dart';

import 'base_model.dart';

class ReaderModel extends BaseModel {

  Matter matter;

  ReaderModel({this.matter});

  void updateMatter(Matter matter){
    this.matter = matter;
    notifyListeners();
  }

  List<List<BaseCompoundModel>> get mergeCompoundList {
    List<List<BaseCompoundModel>> listOfList = [];
    List<BaseCompoundModel> currentList = [];
    for(BaseCompoundModel compound in matter.compoundList){
      if(compound.compoundLayout == CompoundLayout.MERGED){
        currentList.add(compound);
      }
      else{
        if(currentList.length > 0) listOfList.add(currentList);
       currentList = [compound]; 
      }
    }
    if(currentList.length > 0) listOfList.add(currentList);
    return listOfList;
  }

  int get length => matter.compoundList.length;

  @override
  void notify() {
    notifyListeners();
  }


}