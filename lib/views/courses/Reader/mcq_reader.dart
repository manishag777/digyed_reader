import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/themes/ui_helpers.dart';
import 'package:digyed_reader/views/courses/Reader/text_reader.dart';
import 'package:digyed_reader/widgets/compound_type_drop_down.dart';
import 'package:digyed_reader/widgets/drop_down.dart';
import 'package:flutter/material.dart';

Widget mcqReader(BaseCompoundModel mcqModel) => Builder(
      builder: (context) {
        return McqReader(mcqModel);
      },
    );

class McqReader extends StatelessWidget {
  final McqModel mcqModel;

  McqReader(this.mcqModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          headReader(mcqModel.headingModel),
          descriptionReader(mcqModel.descriptionModel),
          if (mcqModel.isValid())
            if(mcqModel.compoundType == CompoundType.Mcq)
              RadioButtonGroup(mcqModel.optionList),
            if(mcqModel.compoundType == CompoundType.Checkbox)
              CheckboxGroup(mcqModel.optionList),
            if(mcqModel.compoundType == CompoundType.Dropdown)
              dropDown(mcqModel.optionList),

        ],
      ),
    );
  }
}


Widget dropDown(List<TextModel> optionList) => Builder(builder: (context){
  final items = optionList.map((e) => DropDownItemModel(iconData: Icons.album, id: e.id, value: e.text)).toList();
//  final items = [
//    DropDownItemModel(iconData: Icons.album, id: CompoundLayout.Merge, value: "Merge"),
//    DropDownItemModel(iconData: Icons.album, id: CompoundLayout.Card, value: "Card"),
//  ];
  return baseDropDown(items: items, dropDownItemSelected : (model){}, selected: null, color: Colors.white);
});


class CheckboxGroup extends StatefulWidget {
  final List<TextModel> optionList;

  CheckboxGroup(this.optionList);

  @override
  _CheckBoxGroupState createState() => _CheckBoxGroupState();
}

class _CheckBoxGroupState extends State<CheckboxGroup> {
  List<dynamic> selectedList = [];

  Function onSelected(_selected){
    setState(() {
      if (selectedList.contains(_selected)) {
        selectedList.remove(_selected);
      }
      else{
        selectedList.add(_selected);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.optionList
          .map((textModel) => checkbox(textModel, selectedList, onSelected)).toList(),
    );
  }

  Widget checkbox(
      TextModel textModel, List<dynamic> selectedList, Function onTap) {
    return (textModel != null && textModel.isValid())
        ? GestureDetector(
      onTap: (){
        onTap(textModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            selectedList.contains(textModel)
                ? Icon(Icons.check_box, color: Colors.white,)
                : Icon(Icons.check_box_outline_blank, color: Colors.white,),
            UIHelper.horizontalSpaceSmall(),
            Text(
              textModel.text,
              style: descriptionStyle,
            )
          ],
        ),
      ),
    )
        : Container();
  }
}


class RadioButtonGroup extends StatefulWidget {
  List<TextModel> optionList;

  RadioButtonGroup(this.optionList);

  @override
  _RadioButtonGroupState createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  dynamic selected;

  Function onSelected(_selected){
    print("On Radio  selection called");
    if (selected != _selected) {
      setState(() {
        selected = _selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.optionList
          .map((textModel) => radioButton(textModel, selected, onSelected)).toList(),
    );
  }

  Widget radioButton(
      TextModel textModel, TextModel selectedTextModel, Function onTap) {
    return (textModel != null && textModel.isValid())
        ? GestureDetector(
            onTap: (){
              onTap(textModel);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  textModel == selectedTextModel
                      ? Icon(Icons.check_circle, color: Colors.white,)
                      : Icon(Icons.radio_button_unchecked, color: Colors.white,),
                  UIHelper.horizontalSpaceSmall(),
                  Text(
                    textModel.text,
                    style: descriptionStyle,
                  )
                ],
              ),
            ),
          )
        : Container();
  }
}
