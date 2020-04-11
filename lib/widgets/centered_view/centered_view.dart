import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'centered_view_mobile.dart';
import 'centered_view_other.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  const CenteredView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenTypeLayout(
      mobile: CenteredViewMobile(child: child,),
      desktop: CenteredViewOther(child: child,),
    );

//    return Container(
//      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 60),
//      alignment: Alignment.topCenter,
//      child: ConstrainedBox(
//        constraints: BoxConstraints(maxWidth: 1200),
//        child: child,
//      ),
//    );
  }
}
