import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/data/theme_data.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/view_models/writer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Widget headWriter(TextModel textModel) => Builder(
  builder: (context) {
    return TextWriter(textModel, Theme.of(context).textTheme.heading, Theme.of(context).textTheme.headingHint, 'Untitled Heading');
  }
);

Widget descriptionWriter(TextModel textModel) => Builder(
  builder: (context) {
    return     TextWriter(textModel, Theme.of(context).textTheme.body, Theme.of(context).textTheme.bodyHint, 'Missing Description');
  }
);


class TextWriter extends StatelessWidget {

  final TextStyle textStyle;
  final TextStyle textHintStyle;
  final TextModel textModel;
  final String hintText;

  TextWriter(this.textModel, this.textStyle, this.textHintStyle, this.hintText);

  InputDecoration inputDecoration(hintText, hintStyle, Color color) => InputDecoration(
    hintText: hintText,
    hintStyle: hintStyle,
    enabledBorder:  OutlineInputBorder(
      borderSide:  BorderSide(color: color, width: 0.0),
    ),
    focusedBorder:  OutlineInputBorder(
      borderSide:  BorderSide(color: color, width: 0.0),
    ),
    border:  OutlineInputBorder(
        borderSide: BorderSide(color: color)),
  );

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final FocusNode parentFocusNode = Focus.of(context);
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
                    decoration: inputDecoration(hintText, textHintStyle, Theme.of(context).colorScheme.onSurface),
                    cursorColor: Colors.white,
                    minLines: 1,
                    maxLines: null,
                  )
                      : GestureDetector(
                    onTap: parentFocusNode.hasFocus ? () {
                      focusNode.requestFocus();
                    }: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            textModel.text ?? hintText,
                            style: textModel.text == null ? textHintStyle: textStyle,
                          ),
                        ),
                        if(parentFocusNode.hasFocus)
                          Icon(
                            Icons.edit,
                            color: Theme.of(context).colorScheme.onSurface,
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
    );
  }

}


