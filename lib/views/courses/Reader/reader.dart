import 'package:digyed_reader/constants/colors.dart';
import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/models/base_compound_model.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/view_models/reader_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'header_reader.dart';

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
        children: matter.compoundList.asMap().entries.map((entry) {
          int index = entry.key;
          BaseCompoundModel baseCompoundModel = entry.value;
          return compoundWidget(
              baseCompoundModel, index == 0, index == readerModel.length - 1);
        }).toList(),
      ): Container();
    },
  );
//
  Widget compoundWidget(BaseCompoundModel compound, bool isFirst, bool isLast) =>
      Builder(
        builder: (context) {
          return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                color: cardColor,
                child: HeaderReader(compound),
              ),
            ),
          ]);
        },
      );
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
