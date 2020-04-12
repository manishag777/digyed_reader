import 'package:digyed_reader/routing/router.dart';
import 'package:digyed_reader/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:digyed_reader/locator.dart';
import 'package:digyed_reader/routing/route_names.dart';

const Color backgroundColor = Color.fromARGB(255, 18,23,26);

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Navigator(
                  key: locator<NavigationService>().navigatorKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: CourseRoute,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
