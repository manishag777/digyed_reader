import 'package:digyed_reader/constants/colors.dart';
import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/themes/ui_helpers.dart';
import 'package:digyed_reader/view_models/reader_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mcq_reader.dart';
import 'text_reader.dart';

typedef Widget MyFunc(BaseCompoundModel a);

Map<CompoundType,  MyFunc> funcMap = {
  CompoundType.Heading: headReader,
  CompoundType.Text: descriptionReader,
  CompoundType.Mcq: mcqReader,
  CompoundType.Checkbox: mcqReader,
};

class Reader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          matterWidget(),
        ],
      ),
    );
  }

  Widget matterWidget() => Builder(
    builder: (context) {
      final readerModel = Provider.of<ReaderModel>(context, listen: false);
      Matter matter = readerModel.matter;
      return matter!=null?Column(
        mainAxisSize: MainAxisSize.min,
        children: readerModel.mergeCompoundList.asMap().entries.map((entry) {
          List<BaseCompoundModel> baseCompoundModelList = entry.value;
          return compoundWidget(baseCompoundModelList);
        }).toList(),
      ): Container();
    },
  );
//
  Widget compoundWidget(List<BaseCompoundModel> compoundList) =>
      Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(UIHelper.paddingMini),
            child: Card(
              color: cardColor,
              child: Padding(
                padding: const EdgeInsets.all(UIHelper.paddingMini),
                child: Container(width: double.infinity, child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: compoundList.map((compound) => funcMap[compound.compoundType](compound)).toList()),
                ),
              )),
            );
        });
}
