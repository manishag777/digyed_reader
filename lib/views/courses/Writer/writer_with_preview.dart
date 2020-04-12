import 'package:digyed_reader/view_models/reader_model.dart';
import 'package:digyed_reader/view_models/writer_model.dart';
import 'package:digyed_reader/views/courses/Reader/reader.dart';
import 'package:digyed_reader/views/courses/Writer/writer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriterWithPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Writer',),
                Tab(text: 'Reader',),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: MultiProvider(
            providers: [
            ChangeNotifierProvider<ReaderModel>(create: (context){return ReaderModel("Hello");},),
            ChangeNotifierProvider<WriterModel>(create: (context){return WriterModel();},),
            ],
            child: TabBarView(
              children: [
                Consumer<WriterModel>(builder: (BuildContext context, WriterModel model, Widget child) =>  Writer()),
                Consumer<ReaderModel>(builder: (BuildContext context, ReaderModel model, Widget child) =>  Reader(model.text)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}