
enum CompoundType { HEADING, TEXT }


abstract class BaseCompoundModel {

  CompoundType get  compoundType;

  BaseCompoundModel copy();
}