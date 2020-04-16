import 'package:digyed_reader/view_models/reader_model.dart';
import 'package:digyed_reader/view_models/writer_model.dart';
import 'package:digyed_reader/views/courses/Reader/reader.dart';
import 'package:digyed_reader/views/courses/Writer/writer.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class WriterWithPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<ReaderModel>(create: (context){return ReaderModel();},),
          ChangeNotifierProvider<WriterModel>(create: (context){return WriterModel();},),
        ],
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            endDrawer: Drawer(child: Container(color: Colors.red,),),
            appBar: AppBar(
              actions: <Widget>[Builder(builder: (context) => IconButton(
                icon: Icon(MdiIcons.palette),
                onPressed: () => Scaffold.of(context).openEndDrawer()),)],
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Writer',),
                  Tab(text: 'Reader',),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Consumer<WriterModel>(builder: (BuildContext context, WriterModel model, Widget child) =>  Writer()),
                Consumer<ReaderModel>(builder: (BuildContext context, ReaderModel model, Widget child) =>  Reader()),
              ],
            ),
          ),
        ),
      ),
    );
  }

}