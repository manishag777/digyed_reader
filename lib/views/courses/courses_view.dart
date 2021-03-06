import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'course_content_desktop.dart';
import 'course_content_mobile.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: CourseContentMobile(),
      desktop: CourseContentDesktop(),
    );
  }
}
