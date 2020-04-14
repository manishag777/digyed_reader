import 'package:digyed_reader/models/course_model.dart';
import 'package:flutter/material.dart';

import 'drop_down.dart';

Widget baseDropDown({List<DropDownItemModel> items, DropDownItemSelected dropDownItemSelected, dynamic selected}) => Builder(builder: (context){

  DropDownItemModel selectedModel;
  for(DropDownItemModel downItemModel in items){
    if (downItemModel.id == selected) {
      selectedModel = downItemModel;
      break;
    }
  }
  return DropDown(items: items, dropDownSelected:dropDownItemSelected, selection: selectedModel,);
});

Widget compoundLayoutDropDown({DropDownItemSelected dropDownItemSelected, CompoundLayout selected}) => Builder(builder: (context){
  final items = [
    DropDownItemModel(iconData: Icons.album, id: CompoundLayout.MERGED, value: "Merged"),
    DropDownItemModel(iconData: Icons.album, id: CompoundLayout.CARD, value: "Card"),
    DropDownItemModel(iconData: Icons.album, id: CompoundLayout.WITHOUT_CARD, value: "Without Card"),
  ];
  return baseDropDown(items: items, dropDownItemSelected : dropDownItemSelected, selected: selected,);
});

Widget compoundTypeDropDown({DropDownItemSelected dropDownItemSelected, CompoundType selected}) => Builder(builder: (context){
  final items = [
    DropDownItemModel(iconData: Icons.album, id: CompoundType.HEADING, value: "Heading"),
    DropDownItemModel(isDivider: true),
    DropDownItemModel(iconData: Icons.album, id: CompoundType.TEXT, value: "Text"),
  ];
  return baseDropDown(items: items, dropDownItemSelected : dropDownItemSelected, selected: selected,);
});



class CompoundDropDown extends StatelessWidget {
  final items = [
    DropDownItemModel(iconData: Icons.album, id: CompoundType.HEADING.toString(), value: "Heading"),
    DropDownItemModel(isDivider: true),
    DropDownItemModel(iconData: Icons.album, id: CompoundType.TEXT.toString(), value: "Text"),
  ];
  final Key key;
  final DropDownItemSelected dropDownItemSelected;
  CompoundDropDown({this.key, this.dropDownItemSelected}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return DropDown(items: items, dropDownSelected:dropDownItemSelected);
  }
}