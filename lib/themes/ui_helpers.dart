import 'package:flutter/material.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceSmall = 8.0;
  static const double _VerticalSpaceMini = 4.0;
  static const double _VerticalSpaceTiny = 2.0;
  static const double _VerticalSpaceMedium = 16.0;
  static const double _VerticalSpaceLarge = 32.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 8.0;
  static const double _HorizontalSpaceMini = 4.0;
  static const double _HorizontalSpaceTiny = 2.0;
  static const double _HorizontalSpaceMedium = 16.0;
  static const double HorizontalSpaceLarge = 32.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double paddingSmall = 8.0;
  static const double paddingMini = 4.0;
  static const double paddingTiny = 2.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 32.0;

  /// Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return verticalSpace(_VerticalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceTiny]
  static Widget verticalSpaceTiny() {
    return verticalSpace(_VerticalSpaceTiny);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMini]
  static Widget verticalSpaceMini() {
    return verticalSpace(_VerticalSpaceMini);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMedium]
  static Widget verticalSpaceMedium() {
    return verticalSpace(_VerticalSpaceMedium);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceLarge() {
    return verticalSpace(_VerticalSpaceLarge);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceTiny]
  static Widget horizontalSpaceTiny() {
    return horizontalSpace(_HorizontalSpaceTiny);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_HorizontalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceMini() {
    return horizontalSpace(_HorizontalSpaceMini);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_HorizontalSpaceMedium);
  }

  /// Returns a vertical space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(HorizontalSpaceLarge);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }
}