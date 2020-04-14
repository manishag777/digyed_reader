import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/view_models/writer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




Widget headWriter(TextModel textModel) => TextWriter(textModel, headingStyle, headingHintStyle, 'Edit Heading');

Widget descriptionWriter(TextModel textModel) => TextWriter(textModel, descriptionStyle, descriptionHintStyle, 'Edit Description');


class TextWriter extends StatelessWidget {

  final TextStyle textStyle;
  final TextStyle textHintStyle;
  final TextModel textModel;
  final String hintText;

  TextWriter(this.textModel, this.textStyle, this.textHintStyle, this.hintText);

  InputDecoration inputDecoration(hintText, hintStyle) => InputDecoration(
    hintText: hintText,
    hintStyle: hintStyle,
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 0.0),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 0.0),
    ),
    border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white)),
  );

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (context) {
          final FocusNode focusNode = Focus.of(context);
          final baseModel = Provider.of<WriterModel>(context, listen: false);

          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: focusNode.hasFocus
                ? TextField(
              autofocus: true,
              style: headingStyle,
              controller: TextEditingController(text: textModel.text),
              onSubmitted: (s) {
                textModel.text = s;
                baseModel.notify();
              },
              onChanged: (s) {
                textModel.text = s;
              },
              decoration: inputDecoration(hintText, textHintStyle),
              cursorColor: Colors.white,
              maxLines: 1,
            )
                : GestureDetector(
              onTap: () {
                focusNode.requestFocus();
              },
              child: Row(
                children: <Widget>[
                  Text(
                    textModel.text ?? hintText,
                    style: textModel.text == null ? textHintStyle: textStyle,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}


