import 'package:digyed_reader/constants/colors.dart';
import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/widgets/compound_type_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:digyed_reader/view_models/reader_model.dart';
import 'package:digyed_reader/view_models/writer_model.dart';

class Writer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final readerModel = Provider.of<ReaderModel>(context, listen: false);
    final writerModel = Provider.of<WriterModel>(context, listen: false);

    readerModel.updateMatter(writerModel.matter);
    return Container(
      child: ListView(
        children: <Widget>[
          compoundAdder(),
          matterWidget(),
        ],
      ),
    );
  }

  Widget matterWidget() => Builder(
        builder: (context) {
          final writerModel = Provider.of<WriterModel>(context, listen: false);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children:
                writerModel.matter.compoundList.asMap().entries.map((entry) {
              int index = entry.key;
              Compound compound = entry.value;
              return compoundWidget(
                  compound, index == 0, index == writerModel.length - 1);
            }).toList(),
          );
        },
      );

  Widget compoundWidget(Compound compound, bool isFirst, bool isLast) =>
      Builder(
        builder: (context) {
          final writerModel = Provider.of<WriterModel>(context, listen: false);
          List<DyElement> elementList = compound.elementList;
          return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: cardColor,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: elementList
                                  .map((e) => elementWidget(e))
                                  .toList()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                  width: 200,
                                  child: CompoundDropDown(
                                    dropDownItemSelected: (d) {},
                                  )),
                              Expanded(
                                child: Container(),
                              ),
                              if (!isFirst)
                                _IconButton(
                                  icon: Icon(
                                    Icons.arrow_upward,
                                  ),
                                  onPressed: () {
                                    writerModel.moveUp(compound);
                                  },
                                ),
                              if (!isLast)
                                _IconButton(
                                  icon: Icon(Icons.arrow_downward),
                                  onPressed: () {
                                    writerModel.moveDown(compound);
                                  },
                                ),
                              _IconButton(
                                icon: Icon(Icons.content_copy),
                                onPressed: () {
                                  writerModel.duplicate(compound);
                                },
                              ),
                              _IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  writerModel.delete(compound);
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            compoundAdder(compound: compound)
          ]);
        },
      );

  Widget _IconButton({icon, onPressed}) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(child: icon, onTap: onPressed),
      );

  Widget elementWidget(DyElement element) => Builder(
        builder: (context) {
          List<Atom> atomList = element.atomList;
          return Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: atomList.map((e) => atomWidget(e)).toList(),
            ),
          );
        },
      );

  Widget atomWidget(Atom atom) => Builder(builder: (context) {
        if (atom.atomType == AtomType.HEADING)
          return headerEditWidget(atom);
        else
          return descriptionEditWidget(atom);
      });

  InputDecoration inpurDecoration(hintText, hintStyle) => InputDecoration(
    hintText: hintText,
    hintStyle: hintStyle,
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 0.0),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 0.0),
    ),
    border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white)),
  );

  Widget headerEditWidget(Atom atom) => Focus(
        child: Builder(
          builder: (context) {
            final FocusNode focusNode = Focus.of(context);
            final writerModel =
                Provider.of<WriterModel>(context, listen: false);
//            FocusNode textFieldFocusNode = FocusNode();
//            textFieldFocusNode.requestFocus();
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: focusNode.hasFocus
                  ? TextField(
                      autofocus: true,
                      style: headingStyle,
                      controller: TextEditingController(text: atom.data),
                      onSubmitted: (s) {
                        writerModel.updateAtomAndNotify(atom, s);
                      },
                      onChanged: (s) {
                        writerModel.updateAtom(atom, s);
                      },
                      decoration: inpurDecoration('Add Heading', headingHintStyle),
                      cursorColor: Colors.white,
                      maxLines: 1,
                    )
                  : GestureDetector(
                      onTap: () {
                        focusNode.requestFocus();
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            atom.data.isEmpty?'Add Heading':atom.data,
                            style: atom.data.isEmpty ? headingHintStyle: headingStyle,
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
            );
          },
        ),
      );

  Widget descriptionEditWidget(Atom atom) => Focus(
        child: Builder(
          builder: (context) {
            final FocusNode focusNode = Focus.of(context);
            final writerModel =
                Provider.of<WriterModel>(context, listen: false);
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: focusNode.hasFocus
                  ? TextField(
                      autofocus: true,
                      style: descriptionStyle,
                      controller: TextEditingController(text: atom.data),
                      onSubmitted: (s) {
                        writerModel.updateAtomAndNotify(atom, s);
                      },
                      onChanged: (s) {
                        writerModel.updateAtom(atom, s);
                      },
                      decoration: inpurDecoration('Add Description', descriptionHintStyle),
                      cursorColor: Colors.white,
                      maxLines: null,
                      minLines: 4,
                    )
                  : GestureDetector(
                      onTap: () {
                        focusNode.requestFocus();
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            atom.data.isEmpty?'Add Description':atom.data,
                            style: atom.data.isEmpty?descriptionHintStyle:descriptionStyle,
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
            );
          },
        ),
      );

  Widget compoundAdder({Compound compound}) => Builder(
        builder: (context) {
          final writerModel = Provider.of<WriterModel>(context, listen: false);
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 200,
                    child: CompoundDropDown(
                      dropDownItemSelected: (d) {},
                    )),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () {
                    writerModel.addCompound(compound: compound);
                  },
                )
              ],
            ),
          );
        },
      );
}
