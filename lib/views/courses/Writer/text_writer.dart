import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/data/theme_data.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/view_models/writer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Widget headWriter(TextModel textModel) => Builder(
  builder: (context) {
    return TextWriter(textModel, Theme.of(context).textTheme.heading, Theme.of(context).textTheme.hint, 'Edit Heading');
  }
);

Widget descriptionWriter(TextModel textModel) => Builder(
  builder: (context) {
    return     TextWriter(textModel, Theme.of(context).textTheme.body, Theme.of(context).textTheme.hint, 'Edit Description');
  }
);


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

          return Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: focusNode.hasFocus
                  ? TextField(
                autofocus: true,
                style: textStyle,
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
                minLines: 1,
                maxLines: null,
              )
                  : GestureDetector(
                onTap: () {
                  focusNode.requestFocus();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        textModel.text ?? hintText,
                        style: textModel.text == null ? textHintStyle: textStyle,
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}


