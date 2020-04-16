import 'package:digyed_reader/constants/colors.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/widgets/compound_type_drop_down.dart';
import 'package:digyed_reader/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:digyed_reader/view_models/reader_model.dart';
import 'package:digyed_reader/view_models/writer_model.dart';
import 'package:enum_to_string/enum_to_string.dart';

import 'mcq_writer.dart';
import 'text_writer.dart';

Map<CompoundType, Function> funcMap = {
  CompoundType.Heading: headWriter,
  CompoundType.Text: descriptionWriter,
  CompoundType.Mcq: mcqWriter,
  CompoundType.Checkbox: mcqWriter,
  CompoundType.Dropdown: mcqWriter,
};

class Writer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final writerModel = Provider.of<WriterModel>(context, listen: false);
    return Theme(
      data: writerModel.themeData,
      child: Builder(builder: (context) {
        return Container(
          color: Theme.of(context).colorScheme.background,
          child: ListView(
            children: <Widget>[
              darkModeController,
              CompoundAdder(),
              matterWidget(),
            ],
          ),
        );
      }),
    );
  }

  Widget get darkModeController => Builder(
        builder: (context) {
          final writerModel = Provider.of<WriterModel>(context, listen: false);
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Card(
                color: Theme.of(context).colorScheme.surface,
                child: IconButton(
                    color: Theme.of(context).colorScheme.onSurface,
                    icon: Icon(MdiIcons.brightness4),
                    onPressed: () {
                      if (writerModel.themeType == ThemeType.Light) {
                        writerModel.themeType = ThemeType.Dark;
                      } else {
                        writerModel.themeType = ThemeType.Light;
                      }
                    }),
              ),
            ],
          );
        },
      );

  Widget matterWidget() => Builder(
        builder: (context) {
          final writerModel = Provider.of<WriterModel>(context, listen: false);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children:
                writerModel.matter.compoundList.asMap().entries.map((entry) {
              int index = entry.key;
              BaseCompoundModel compound = entry.value;
              return compoundWidget(
                  compound, index == 0, index == writerModel.length - 1);
            }).toList(),
          );
        },
      );

  Widget compoundWidget(BaseCompoundModel compound, bool isFirst, bool isLast) =>
      Focus(
        child: Builder(
          builder: (context) {
            final FocusNode focusNode = Focus.of(context);
            bool hasFocus = focusNode.hasFocus;
            return GestureDetector(
              onTap: (){
                focusNode.requestFocus();
              },
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          color: Theme.of(context).colorScheme.surface,
                          child: Container(
                            decoration: BoxDecoration(border: hasFocus ? Border.all(width: 2.0, color: Theme.of(context).colorScheme.primary):
                            Border.all(width: 0)),
                            child: Column(
                              children: <Widget>[
                                if(hasFocus) topActionBar(compound),
                                funcMap[compound.compoundType](compound),
                                if(hasFocus) bottomActionBar(compound, isFirst, isLast)
                              ],
                            ),
                          )),
                    ),
                  ),
                  if(hasFocus) CompoundAdder(compound: compound)
                ],
              ),
            );
          },
        ),
      );

  Widget topActionBar(BaseCompoundModel compoundModel) => Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: double.infinity,
                child: Center(
                    child: Text(
                  EnumToString.parseCamelCase(compoundModel.compoundType),
                  style: Theme.of(context).textTheme.bodyText1,
                ))),
          );
        },
      );

  Widget bottomActionBar(BaseCompoundModel compound, isFirst, isLast) =>
      Builder(
        builder: (context) {
          final writerModel = Provider.of<WriterModel>(context, listen: false);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 150,
                    child: compoundLayoutDropDown(
                        dropDownItemSelected: (DropDownItemModel d) {
                          compound.compoundLayout = d.id;
                        },
                        selected: compound.compoundLayout),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  if (!isFirst)
                    _IconButton(
                      icon: Icons.arrow_upward,
                      onPressed: () {
                        writerModel.moveUp(compound);
                      },
                    ),
                  if (!isLast)
                    _IconButton(
                      icon: Icons.arrow_downward,
                      onPressed: () {
                        writerModel.moveDown(compound);
                      },
                    ),
                  _IconButton(
                    icon: Icons.content_copy,
                    onPressed: () {
                      writerModel.duplicate(compound);
                    },
                  ),
                  _IconButton(
                    icon: Icons.delete,
                    onPressed: () {
                      writerModel.delete(compound);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );

  Widget _IconButton({icon, onPressed}) => Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onTap: onPressed,
          ),
        );
      });

  Widget compoundAdder({BaseCompoundModel compound}) => Builder(
        builder: (context) {
          print("Building compound ");
          final writerModel = Provider.of<WriterModel>(context, listen: false);
          final readerModel = Provider.of<ReaderModel>(context, listen: false);
          CompoundType selectedCompoundType;
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 200,
                      child: compoundTypeDropDown(
                          dropDownItemSelected: (d) {
                            selectedCompoundType = d.id;
                          },
                          selected: CompoundType.Heading,
                          color: Theme.of(context).colorScheme.onBackground)),
                  IconButton(
                    icon: Icon(Icons.add_circle,
                        color: Theme.of(context).colorScheme.onBackground),
                    onPressed: () {
                      writerModel.attachReader(readerModel);
                      print("on pressing" + selectedCompoundType.toString());
                      writerModel.addCompound(
                          compound: compound,
                          compoundType: selectedCompoundType);
                    },
                  )
                ],
              ),
            ),
          );
        },
      );
}

class CompoundAdder extends StatefulWidget {
  BaseCompoundModel compound;

  CompoundAdder({this.compound});

  @override
  _CompoundAdderState createState() => _CompoundAdderState();
}

class _CompoundAdderState extends State<CompoundAdder> {
  CompoundType selectedCompoundType;

  @override
  void initState() {
    if (selectedCompoundType == null)
      selectedCompoundType = CompoundType.Heading;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final writerModel = Provider.of<WriterModel>(context, listen: false);
    final readerModel = Provider.of<ReaderModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 200,
              child: compoundTypeDropDown(
                  dropDownItemSelected: (d) {
                    selectedCompoundType = d.id;
                  },
                  selected: CompoundType.Heading,
                  color: Theme.of(context).colorScheme.onBackground)),
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            onPressed: () {
              writerModel.attachReader(readerModel);
              print("on pressing" + selectedCompoundType.toString());
              writerModel.addCompound(
                  compound: widget.compound,
                  compoundType: selectedCompoundType);
            },
          )
        ],
      ),
    );
  }
}
