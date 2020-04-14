import 'package:flutter/material.dart';


class DropDownItemModel {
  IconData iconData;
  dynamic id;
  String value;
  bool isDivider;

  DropDownItemModel(
      {this.iconData, this.id, this.value, this.isDivider = false});
}

typedef DropDownItemSelected = void Function(DropDownItemModel value);

class DropDown extends StatefulWidget {
  final List<DropDownItemModel> items;
  final DropDownItemSelected dropDownSelected;
  final DropDownItemModel selection;
  final Color color;
  DropDown({this.items, this.dropDownSelected, this.selection, this.color});


  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  DropDownItemModel _selection;
  DropDownItemSelected _dropDownSelected;
  Color _color;

  @override
  void initState() {
    _dropDownSelected = widget.dropDownSelected;
    _selection = widget.selection;
    if(widget.color==null)
      _color = Colors.black;
    else
      _color = widget.color;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: PopupMenuButton<DropDownItemModel>(
        child: selectedItemHeader(_selection),
        onSelected: (DropDownItemModel result) {
          print(result.value);
          setState(() {
            _selection = result;
            if(_dropDownSelected!=null){
              _dropDownSelected(result);
            }

          });
        },
        itemBuilder: (BuildContext context) =>
            widget.items.map((DropDownItemModel model) {
              return popUpItem(model);
            }).toList(),
      ),
    );
  }

  PopupMenuEntry<DropDownItemModel> popUpItem(
      DropDownItemModel popUpItemModel) =>
      popUpItemModel.isDivider
          ? PopupMenuDivider()
          : PopupMenuItem<DropDownItemModel>(
        value: popUpItemModel,
        child: popUpItemChild(popUpItemModel),
      );

  Widget popUpItemChild(DropDownItemModel popUpItemModel) => Container(
    width: double.infinity,
    child: Row(
      children: <Widget>[
        Icon(popUpItemModel.iconData),
        Container(width:8.0),
        Expanded(child: Text(popUpItemModel.value)),
      ],
    ),
  );

  Widget selectedItemHeader(DropDownItemModel popUpItemModel) => Container(
    child: popUpItemModel == null
        ?
    Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Text('Select Type', style: TextStyle(color: _color),),
          Expanded(child: Container(),),
          Icon(Icons.arrow_drop_down, color: _color,)

        ],
      ),
    ) :
    Container(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Icon(popUpItemModel.iconData, color: _color,),
          Container(width:8.0),
          Expanded(child: Text(popUpItemModel.value, style: TextStyle(color: _color),)),
          Icon(Icons.arrow_drop_down, color: _color,)

        ],
      ),
    )
  );
}

