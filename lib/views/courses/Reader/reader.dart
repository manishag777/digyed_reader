import 'package:digyed_reader/constants/colors.dart';
import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/view_models/reader_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'header_reader.dart';

typedef Widget MyFunc(BaseCompoundModel a);

Map<CompoundType,  MyFunc> funcMap = {CompoundType.HEADING: headReader,
  CompoundType.TEXT: descriptionReader};

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
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: cardColor,
              child: Container(width: double.infinity, child: Column(
                children: compoundList.map((compound) => funcMap[compound.compoundType](compound)).toList()),
              )),
            );
        });
//
//  Widget elementWidget(DyElement element) => Builder(
//    builder: (context) {
//      List<Atom> atomList = element.atomList;
//      return Padding(
//        padding: const EdgeInsets.all(4.0),
//        child: Container(
//          width: double.infinity,
//          child: Column(
//            mainAxisSize: MainAxisSize.min,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: atomList.map((e) => atomWidget(e)).toList(),
//          ),
//        ),
//      );
//    },
//  );
//
//  Widget atomWidget(Atom atom) => Builder(builder: (context) {
//    if (atom.atomType == AtomType.HEADING)
//      return headerEditWidget(atom);
//    else
//      return descriptionEditWidget(atom);
//  });
//
//  Widget headerEditWidget(Atom atom) => Builder(
//    builder: (context) {
//      return Padding(
//        padding: const EdgeInsets.all(4.0),
//        child: Text(atom.data, style: headingStyle));
//    }
//  );
//
//  Widget descriptionEditWidget(Atom atom) => Builder(
//    builder: (context) {
//      return Padding(
//        padding: const EdgeInsets.all(4.0),
//        child: Text(
//          atom.data,
//          style: descriptionStyle,
//        ),
//      );
//    },
//  );
}
