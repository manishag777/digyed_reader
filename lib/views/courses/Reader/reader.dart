import 'package:digyed_reader/constants/colors.dart';
import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/view_models/reader_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Reader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final readerModel = Provider.of<ReaderModel>(context, listen: false);
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
      return Column(
        mainAxisSize: MainAxisSize.min,
        children:
        readerModel.matter.compoundList.asMap().entries.map((entry) {
          int index = entry.key;
          Compound compound = entry.value;
          return compoundWidget(
              compound, index == 0, index == readerModel.length - 1);
        }).toList(),
      );
    },
  );

  Widget compoundWidget(Compound compound, bool isFirst, bool isLast) =>
      Builder(
        builder: (context) {
          List<DyElement> elementList = compound.elementList;
          return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                color: cardColor,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: elementList
                              .map((e) => elementWidget(e))
                              .toList()),
                    ),
                  ],
                ),
              ),
            ),
          ]);
        },
      );

  Widget elementWidget(DyElement element) => Builder(
    builder: (context) {
      List<Atom> atomList = element.atomList;
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: atomList.map((e) => atomWidget(e)).toList(),
          ),
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

  Widget headerEditWidget(Atom atom) => Builder(
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(atom.data, style: headingStyle));
    }
  );

  Widget descriptionEditWidget(Atom atom) => Builder(
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          atom.data,
          style: descriptionStyle,
        ),
      );
    },
  );
}
