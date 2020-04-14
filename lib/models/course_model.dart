import 'package:flutter/material.dart';

enum CompoundType { Heading, Text, Mcq, Checkbox, Dropdown}
enum CompoundLayout {Card, Merge, WithoutCard}


bool isCompoundValid(BaseCompoundModel baseCompoundModel){
  return baseCompoundModel!=null && baseCompoundModel.isValid();
}

abstract class BaseCompoundModel {
  BaseCompoundModel copy();
  bool isValid();
  CompoundLayout compoundLayout;
  CompoundType compoundType;
  String id;
  BaseCompoundModel(this.id, this.compoundType, this.compoundLayout);
  String get copyId => id+"_copy";

}

class Matter {
  List<BaseCompoundModel> compoundList;
  Matter(this.compoundList);
}

class TextModel extends BaseCompoundModel{
  String text;

  TextModel({@required id, this.text, compoundType, compoundLayout}) : super(id, compoundType, compoundLayout);

  @override
  BaseCompoundModel copy() {
    return TextModel(id: id + "_copy", text: text, compoundType: this.compoundLayout, compoundLayout: this.compoundType);
  }

  bool isValid(){
    return text!=null && text.isNotEmpty;
  }

}

class McqModel extends BaseCompoundModel{

  TextModel headingModel;
  TextModel descriptionModel;
  List<TextModel> optionList;

  McqModel({@required id, @required compoundType, compoundLayout,
    @required this.headingModel, @required this.descriptionModel, @required this.optionList})
      : super(id, compoundType, compoundLayout);

  @override
  BaseCompoundModel copy() {
    List<TextModel> optionListCopy = optionList.map((e) => e.copy()).toList();
    return McqModel(id: copyId, compoundType: compoundType, compoundLayout: compoundLayout,
        headingModel: headingModel?.copy(), descriptionModel: descriptionModel?.copy(), optionList: optionListCopy);
  }

  void addOption(){
    if(optionList!=null){
      String option_id = id +"_"+ optionList.length.toString();
      optionList.add(TextModel(id: option_id, compoundType: CompoundType.Text));
    }
  }

  bool isValid(){
    return isCompoundValid(headingModel) || isCompoundValid(descriptionModel);
  }

}

