
import 'package:digyed_reader/models/base_compound_model.dart';

class HeaderModel extends BaseCompoundModel{
  String text;
  String id;

  HeaderModel(this.text, this.id);

  @override
  HeaderModel copy() {
    // Todo think of id ideas
    return HeaderModel(this.text, this.id+"_copy");
  }

  @override
  CompoundType get compoundType => CompoundType.HEADING;
}