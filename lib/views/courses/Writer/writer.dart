
import 'package:flutter/material.dart';
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
          matterWidget(),
          compoundAdder()
        ],
      ),
    );
  }

  Widget matterWidget() => Builder(
    builder: (context){
      final writerModel = Provider.of<WriterModel>(context, listen: false);
      return Column(children: writerModel.matter.compoundList.map((e) => compoundWidget()).toList(),);
    },
  );

  Widget compoundWidget() => compoundAdder();

  Widget compoundAdder() => Builder(
    builder: (context){
      final writerModel = Provider.of<WriterModel>(context, listen: false);
      return Card(
        child: Row(
          children: <Widget>[
            Text('Add New Card'),
            IconButton(icon: Icon(Icons.add_circle), onPressed: (){
              writerModel.addCompound();
            },)
          ],),
      );
    },
  );

}
