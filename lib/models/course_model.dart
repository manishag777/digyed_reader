enum CompoundType { Heading, Text }
enum CompoundLayout {Card, Merge, WithoutCard}

abstract class BaseCompoundModel {
  BaseCompoundModel copy();
  CompoundLayout compoundLayout;
  CompoundType compoundType;

  BaseCompoundModel(this.compoundType, this.compoundLayout);

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


