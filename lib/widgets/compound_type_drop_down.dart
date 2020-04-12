import 'package:digyed_reader/models/course_model.dart';
import 'package:flutter/material.dart';

import 'drop_down.dart';

class CompoundDropDown extends StatelessWidget {
  final items = [
    DropDownItemModel(iconData: Icons.album, id: CompoundType.COMPREHENSION.toString(), value: "Comprehension"),
    DropDownItemModel(isDivider: true),
    DropDownItemModel(iconData: Icons.album, id: CompoundType.QUIZ.toString(), value: "Quiz"),
  ];
  final Key key;
  final DropDownItemSelected dropDownItemSelected;
  CompoundDropDown({this.key, this.dropDownItemSelected}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return DropDown(items: items, dropDownSelected:dropDownItemSelected);
  }
}