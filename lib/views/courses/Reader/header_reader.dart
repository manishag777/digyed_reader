import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:flutter/material.dart';


Widget headReader(BaseCompoundModel textModel) => TextReader(textModel, headingStyle);

Widget descriptionReader(BaseCompoundModel textModel) => TextReader(textModel, descriptionStyle);


class TextReader extends StatelessWidget {

  final TextModel textModel;
  final TextStyle textStyle;
  
  TextReader(this.textModel, this.textStyle);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(textModel.text, style: textStyle)
    );
  }
}
