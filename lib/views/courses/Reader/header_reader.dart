import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/models/header_model.dart';
import 'package:digyed_reader/view_models/base_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HeaderReader extends StatelessWidget {

  final HeaderModel headerModel;
  
  HeaderReader(this.headerModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(headerModel.text, style: headingStyle)
    );
  }
}
