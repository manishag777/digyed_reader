import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:digyed_reader/models/course_model.dart';
import 'package:digyed_reader/models/course_model.dart' as course_model;

const Color cardColor = Color.fromARGB(255, 42, 46, 53);
const Color textColor = Color.fromARGB(255, 255, 255, 255);
const TextStyle headingStyle = TextStyle(color: textColor, fontSize: 30, fontWeight: FontWeight.bold);
const TextStyle descriptionStyle = TextStyle(color: textColor, fontSize: 15);

class CourseDetailsMobile extends StatelessWidget {
  const CourseDetailsMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Container(); // getMatterWidget(getMatter());
      },
    );
  }
}

//Widget getMatterWidget(Matter matter) => ListView(
//  children: matter.compoundList.map((e) => getCompoundWidget(e)).toList(),
//);


//Widget getCompoundWidget(Compound compound) => Card(
//  color: cardColor,
//  child:   Padding(
//    padding: EdgeInsets.all(8.0),
//    child: Column(
//      mainAxisSize: MainAxisSize.min,
//      children: compound.elementList.map((e) => getElementWidget(e)).toList(),
//    ),
//  ),
//);
//
//Widget getElementWidget(DyElement element) => Column(
//  mainAxisSize: MainAxisSize.min,
//  children: element.atomList.map((e) => getAtomWidget(e)).toList(),
//);
//
//Widget getAtomWidget(Atom atom) => Text(atom.data,
//  style: atom.atomType == AtomType.HEADING ? headingStyle: descriptionStyle,);



