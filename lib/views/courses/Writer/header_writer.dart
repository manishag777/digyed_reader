import 'package:digyed_reader/constants/text_style.dart';
import 'package:digyed_reader/models/header_model.dart';
import 'package:digyed_reader/view_models/base_model.dart';
import 'package:digyed_reader/view_models/writer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HeaderWriter extends StatelessWidget {

  final HeaderModel headerData;
  
  HeaderWriter(this.headerData);

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
              controller: TextEditingController(text: headerData.text),
              onSubmitted: (s) {
                headerData.text = s;
                baseModel.notify();
              },
              onChanged: (s) {
                headerData.text = s;
              },
              decoration: inputDecoration('Add Heading', headingHintStyle),
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
                    headerData.text.isEmpty?'Add Heading':headerData.text,
                    style: headerData.text.isEmpty ? headingHintStyle: headingStyle,
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
