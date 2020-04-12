import 'package:digyed_reader/constants/colors.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:digyed_reader/view_models/reader_model.dart';
import 'package:digyed_reader/view_models/writer_model.dart';

class Writer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final readerModel = Provider.of<ReaderModel>(context, listen: false);
    final writerModel = Provider.of<WriterModel>(context, listen: false);

    print("Building Writer");
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
            children: writerModel.matter.compoundList
                .map((compound) => compoundWidget(compound))
                .toList(),
          );
        },
      );

  Widget compoundWidget(Compound compound) => Builder(
        builder: (context) {
          final writerModel = Provider.of<WriterModel>(context, listen: false);
          return Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                color: cardColor,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: Center(
                          child: Text(
                        compound.id,
                        style: descriptionStyle,
                      )),
                    ),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.content_copy), onPressed: (){
                            writerModel.duplicate(compound);
                          },),
                          IconButton(icon: Icon(Icons.delete), onPressed: (){
                            writerModel.delete(compound);
                          },)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            compoundAdder(compound: compound)
          ]);
        },
      );

  Widget compoundAdder({Compound compound}) => Builder(
        builder: (context) {
          final writerModel = Provider.of<WriterModel>(context, listen: false);
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Add New Card'),
                  IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: () {
                      writerModel.addCompound(compound:compound);
                    },
                  )
                ],
              ),
            ),
          );
        },
      );
}
