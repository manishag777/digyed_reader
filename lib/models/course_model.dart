enum CompoundType { CARD }

class Matter {
  List<Compound> compoundList;
  Matter(this.compoundList);
}

class Compound {
  String id;
  List<DyElement> elementList;
  CompoundType compoundType;
  Compound(this.compoundType, this.elementList, this.id);

  Compound copy(){
    List<DyElement> newElementList = this.elementList.map((e) => e.copy(e)).toList();
    return Compound(this.compoundType, newElementList, this.id);
  }



}

class DyElement {
  List<Atom> atomList;
  DyElement(this.atomList);

  DyElement copy(DyElement dyElement){
    List<Atom> newAtomList = dyElement.atomList.map((e) => e.copy(e)).toList();
    return DyElement(newAtomList);
  }

}

enum AtomType { TITLE, HEADING, DESCRIPTION }

class Atom {
  AtomType atomType;
  String data;
  Atom(this.atomType, this.data);

  Atom copy(Atom atom){
    return Atom(this.atomType, this.data);
  }
}


Matter getMatter(){
  Atom atom1 = Atom(AtomType.HEADING, "Context");
  Atom atom2 = Atom(AtomType.DESCRIPTION, "Flutter architecture around state management has been a discarded topic. Having built a few mobile apps with various technologies, I've found that certain principles will and should be present no matter what architecture or state management solution you choose. In this guide I will show you a code structure, naming conventions, where to place files, how to keep things well organised and easy to maintain using the Provider package.");
  
  List<Atom> atomList = [atom1, atom2];
  
  DyElement element = DyElement(atomList);
  
  List<DyElement> elementList = [element, element];
  
  Compound compound = Compound(CompoundType.CARD, elementList, "1");
  
  List<Compound> compoundList = [compound, compound];
  
  return Matter(compoundList);
  
}