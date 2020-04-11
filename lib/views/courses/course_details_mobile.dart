import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'models/course_model.dart';
import 'models/course_model.dart' as course_model;

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
        var textAlignment = TextAlign.center;
//            sizingInformation.deviceScreenType == DeviceScreenType.Desktop
//                ? TextAlign.left
//                : TextAlign.center;

        double titleSize =
            sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                ? 30
                : 50;

        double descriptionSize =
            sizingInformation.deviceScreenType == DeviceScreenType.Mobile
                ? 16
                : 21;
        return getMatterWidget(getMatter());

//        return Card(
//          child: Padding(
//            padding: EdgeInsets.all(8.0),
//            child: ListView(
//            children: <Widget>[
//              Text('Context', style: headingStyle,),
//              Text("Flutter architecture around state management has been a discarded topic. Having built a few mobile apps with various technologies, I've found that certain principles will and should be present no matter what architecture or state management solution you choose. In this guide I will show you a code structure, naming conventions, where to place files, how to keep things well organised and easy to maintain using the Provider package."
//                , style: descriptionStyle,),
//              Text('General Overview', style: headingStyle,),
//              Text("Provider is basically ScopedModel v2. I've implemented apps in Redux, BLoC and ScopedModel and I still consider ScopedModel the most practical and straight forward approach to build apps in Flutter. Even for large or massive apps (given you follow some coding guidelines). This guide will have a very similar setup to my ScopedModel Guide. Let's look at the app we're building so we can have some context."
//                , style: descriptionStyle,),
//              Image.network('https://www.filledstacks.com/assets/static/010-all-screens.2665e34.33b003e8aedccaf6c90f5b46dc5c0e52.jpg',),
//              Text("The app will have three screens. Login, Home and PostDetails. We'll communicate with the JSONPlaceholder API, get a User profile from the login using the ID entered. Fetch and show the Posts on the home view and show post details with an additional fetch to show the comments. Very basic but it covers everyting required to build out an architecture that shows you the way."
//              , style: descriptionStyle,),
//              Text("Note: I will not be adding a toolbar, so iOS developers you can swipe from left to right on the screen to go back. Or just add an AppBar if you want on. Add it into each Scaffold.",
//                style: descriptionStyle,),
//              Text('High Level Architecture Overview', style: headingStyle,),
//            ],
//        ),
//          ), color: cardColor,);
      },
    );
  }
}

Widget getMatterWidget(Matter matter) => ListView(
  children: matter.compoundList.map((e) => getCompoundWidget(e)).toList(),
);


Widget getCompoundWidget(Compound compound) => Card(
  color: cardColor,
  child:   Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: compound.elementList.map((e) => getElementWidget(e)).toList(),
    ),
  ),
);

Widget getElementWidget(DyElement element) => Column(
  mainAxisSize: MainAxisSize.min,
  children: element.atomList.map((e) => getAtomWidget(e)).toList(),
);

Widget getAtomWidget(Atom atom) => Text(atom.data,
  style: atom.atomType == AtomType.HEADING ? headingStyle: descriptionStyle,);



