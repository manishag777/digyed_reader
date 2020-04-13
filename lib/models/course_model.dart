enum CompoundType { HEADING, TEXT }
enum CompoundLayout {CARD, MERGED, WITHOUT_CARD}

abstract class BaseCompoundModel {
  CompoundType get  compoundType;
  BaseCompoundModel copy();
  CompoundLayout _compoundLayout;

  BaseCompoundModel() : _compoundLayout = CompoundLayout.MERGED;

  void set compoundLayout(_compoundLayout) {
    this._compoundLayout = _compoundLayout;
  }

  CompoundLayout get compoundLayout => _compoundLayout;

}

class Matter {
  List<BaseCompoundModel> compoundList;
  Matter(this.compoundList);
}

class TextModel extends BaseCompoundModel{
  String text;
  String id;
  CompoundType compoundType;

  TextModel(this.text, this.id, this.compoundType):super();

  @override
  BaseCompoundModel copy() {
    // TODO: implement copy
    throw UnimplementedError();
  }

}


