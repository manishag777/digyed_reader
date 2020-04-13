import 'package:digyed_reader/constants/colors.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/widgets/compound_type_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:digyed_reader/view_models/reader_model.dart';
import 'package:digyed_reader/view_models/writer_model.dart';

import 'text_writer.dart';


Map<CompoundType, Function> funcMap = {CompoundType.HEADING: headWriter,
  CompoundType.TEXT: descriptionWriter};

class Writer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              BaseCompoundModel compound = entry.value;
              return compoundWidget(
                  compound, index == 0, index == writerModel.length - 1);
            }).toList(),
          );
        },
      );

  Widget compoundWidget(BaseCompoundModel compound, bool isFirst, bool isLast) =>
      Builder(
        builder: (context) {
          final writerModel = Provider.of<WriterModel>(context, listen: false);
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    color: cardColor,
                    child: funcMap[compound.compoundType](compound)),
              ),
              compoundAdder(compound: compound)
            ],
          );

        },
      );

  Widget _IconButton({icon, onPressed}) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(child: icon, onTap: onPressed),
      );


  Widget compoundAdder({BaseCompoundModel compound}) => Builder(
        builder: (context) {
          final writerModel = Provider.of<WriterModel>(context, listen: false);
          final readerModel = Provider.of<ReaderModel>(context, listen: false);
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
                    writerModel.attachReader(readerModel);
                    writerModel.addCompound(compound: compound);
                  },
                )
              ],
            ),
          );
        },
      );
}
