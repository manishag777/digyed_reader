import 'package:digyed_reader/models/course_model.dart';
import 'package:flutter/material.dart';

import 'drop_down.dart';

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