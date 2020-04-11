import 'package:flutter/material.dart';
import 'package:the_basics/views/courses/course_details.dart';
import 'package:the_basics/widgets/call_to_action/call_to_action.dart';

import 'course_details_mobile.dart';

class CourseContentMobile extends StatelessWidget {
  const CourseContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CourseDetailsMobile();
  }
}
