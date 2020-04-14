import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/view_models/writer_model.dart';
import 'package:digyed_reader/views/courses/Writer/text_writer.dart';
import 'package:digyed_reader/themes/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget mcqWriter(McqModel mcqModel) => Builder(
      builder: (context) {
        return McqWriter(mcqModel);
      },
    );

class McqWriter extends StatelessWidget {
  final McqModel mcqModel;

  McqWriter(this.mcqModel);

  @override
  Widget build(BuildContext context) {
    final writerModel = Provider.of<WriterModel>(context, listen: false);
    return Container(
      child: Column(
        children: <Widget>[
          headWriter(mcqModel.headingModel),
          descriptionWriter(mcqModel.descriptionModel),
          optionListWidget(mcqModel.optionList, mcqModel.compoundType),
          FlatButton.icon(
              onPressed: () {
                mcqModel.addOption();
                writerModel.notify();
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                'Add option',
                style: descriptionStyle,
              ))
        ],
      ),
    );
  }

  Widget optionListWidget(
          List<TextModel> textModelList, CompoundType compoundType) =>
      Column(
        children: textModelList
            .map((e) => _mcqOptionWriter(e, "option 1", compoundType))
            .toList(),
      );
}

Widget _mcqOptionWriter(
        TextModel textModel, String hintText, CompoundType compoundType) =>
    _OptionWriter(textModel, descriptionStyle, descriptionHintStyle, hintText,
        compoundType);

class _OptionWriter extends StatelessWidget {
  final TextStyle textStyle;
  final TextStyle textHintStyle;
  final TextModel textModel;
  final String hintText;
  final CompoundType compoundType;

  _OptionWriter(this.textModel, this.textStyle, this.textHintStyle,
      this.hintText, this.compoundType);

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
              padding: const EdgeInsets.all(UIHelper.paddingSmall),
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
                        children: <Widget>[
                          compoundType == CompoundType.Mcq
                              ? Icon(
                                  Icons.radio_button_unchecked,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.check_box,
                                  color: Colors.white,
                                ),
                          UIHelper.horizontalSpaceSmall(),
                          Expanded(
                            child: Text(
                              textModel.text ?? hintText,
                              style: textModel.text == null
                                  ? textHintStyle
                                  : textStyle,
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
