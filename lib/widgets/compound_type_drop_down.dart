import 'package:digyed_reader/models/course_model.dart';
import 'package:flutter/material.dart';

import 'drop_down.dart';

Widget baseDropDown({List<DropDownItemModel> items, DropDownItemSelected dropDownItemSelected, dynamic selected, Color color}) => Builder(builder: (context){
  print("color at basedropdown"+color.toString());
  DropDownItemModel selectedModel;
  for(DropDownItemModel downItemModel in items){
    if (downItemModel.id == selected) {
      selectedModel = downItemModel;
      break;
    }
  }
  return DropDown(items: items, dropDownSelected:dropDownItemSelected, selection: selectedModel, color: color,);
});

Widget compoundLayoutDropDown({DropDownItemSelected dropDownItemSelected, CompoundLayout selected, Color color}) => Builder(builder: (context){
  final items = [
    DropDownItemModel(iconData: Icons.album, id: CompoundLayout.Merge, value: "Merge"),
    DropDownItemModel(iconData: Icons.album, id: CompoundLayout.Card, value: "Card"),
  ];
  return baseDropDown(items: items, dropDownItemSelected : dropDownItemSelected, selected: selected, color: color);
});

Widget compoundTypeDropDown({DropDownItemSelected dropDownItemSelected, CompoundType selected, Color color}) => Builder(builder: (context){
  final items = [
    DropDownItemModel(iconData: Icons.short_text, id: CompoundType.Heading, value: "Heading"),
    DropDownItemModel(iconData: Icons.reorder, id: CompoundType.Text, value: "Text"),
    DropDownItemModel(isDivider: true),
    DropDownItemModel(iconData: Icons.check_circle_outline, id: CompoundType.Mcq, value: "Mcq"),
    DropDownItemModel(iconData: Icons.check_box_outline_blank, id: CompoundType.Checkbox, value: "Checkboxes"),
    DropDownItemModel(iconData: Icons.arrow_drop_down_circle, id: CompoundType.Dropdown, value: "DropDown"),
  ];
  return baseDropDown(items: items, dropDownItemSelected : dropDownItemSelected, selected: selected, color: color);
});
