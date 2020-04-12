import 'package:digyed_reader/views/courses/Writer/writer_with_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:digyed_reader/routing/route_names.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case CourseRoute:
      return _getPageRoute(WriterWithPreview(), settings.name);
//    case HomeRoute:
//      return _getPageRoute(HomeView(), settings.name);
//    case AboutRoute:
//      return _getPageRoute(AboutView(), settings.name);
//    case EpisodesRoute:
//      return _getPageRoute(EpisodesView(), settings.name);
//    case CourseRoute:
//      return _getPageRoute(CoursesView(), settings.name);

    default:
  }
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _FadeRoute(child: child, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            settings: RouteSettings(name: routeName),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
                ));
}

