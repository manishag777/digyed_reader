enum CompoundType { HEADING, TEXT }
enum CompoundLayout {CARD, MERGED, WITHOUT_CARD}

abstract class BaseCompoundModel {
  BaseCompoundModel copy();
  CompoundLayout compoundLayout;
  CompoundType compoundType;

  BaseCompoundModel(this.compoundType, this.compoundLayout);

//  CompoundLayout get compoundLayout => _compoundLayout;
//
//  void set compoundLayout(_compoundLayout) {
//    this._compoundLayout = _compoundLayout;
//  }
//
//  CompoundType get  compoundType => _compoundType;
//
//  void set compoundType(_compoundType) {
//    this._compoundType = _compoundType;
//  }



}

class Matter {
  List<BaseCompoundModel> compoundList;
  Matter(this.compoundList);
}

class TextModel extends BaseCompoundModel{
  String text;
  String id;

  TextModel({this.id, this.text, compoundType, compoundLayout}) : super(compoundType, compoundLayout);

  @override
  BaseCompoundModel copy() {
    return TextModel(text: text, id: id, compoundType: this.compoundLayout, compoundLayout: this.compoundType);

  }

}


