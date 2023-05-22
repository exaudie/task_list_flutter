import 'dart:math';

import 'package:flutter/material.dart';

const double _tinySize = 5.0;
const double _smallSize = 10.0;
const double _mediumSize = 25.0;
const double _largeSize = 50.0;
const double _massiveSize = 120.0;

const Widget horizontalSpaceTiny = SizedBox(width: _tinySize);
const Widget horizontalSpaceSmall = SizedBox(width: _smallSize);
const Widget horizontalSpaceMedium = SizedBox(width: _mediumSize);
const Widget horizontalSpaceLarge = SizedBox(width: _largeSize);

const Widget verticalSpaceTiny = SizedBox(height: _tinySize);
const Widget verticalSpaceSmall = SizedBox(height: _smallSize);
const Widget verticalSpaceMedium = SizedBox(height: _mediumSize);
const Widget verticalSpaceLarge = SizedBox(height: _largeSize);
const Widget verticalSpaceMassive = SizedBox(height: _massiveSize);

class UiApp {
  static Widget spacedDivider = Column(
    children: const <Widget>[
      verticalSpaceMedium,
      Divider(color: Colors.blueGrey, height: 5.0),
      verticalSpaceMedium,
    ],
  );

  static Widget verticalSpace(double height) => SizedBox(height: height);

  static Widget horizontalSpace(double width) => SizedBox(width: width);

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static double screenHeightFraction(BuildContext context,
          {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
      min((screenHeight(context) - offsetBy) / dividedBy, max);

  static double screenWidthFraction(BuildContext context,
          {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
      min((screenWidth(context) - offsetBy) / dividedBy, max);

  static double halfScreenWidth(BuildContext context) => screenWidthFraction(context, dividedBy: 2);

  static double thirdScreenWidth(BuildContext context) => screenWidthFraction(context, dividedBy: 3);

  static double quarterScreenWidth(BuildContext context) => screenWidthFraction(context, dividedBy: 4);

  static double getResponsiveHorizontalSpaceMedium(BuildContext context) => screenWidthFraction(context, dividedBy: 10);

  static double getResponsiveSmallFontSize(BuildContext context) =>
      getResponsiveFontSize(context, fontSize: 14, max: 15);

  static double getResponsiveMediumFontSize(BuildContext context) =>
      getResponsiveFontSize(context, fontSize: 16, max: 17);

  static double getResponsiveLargeFontSize(BuildContext context) =>
      getResponsiveFontSize(context, fontSize: 21, max: 31);

  static double getResponsiveExtraLargeFontSize(BuildContext context) => getResponsiveFontSize(context, fontSize: 25);

  static double getResponsiveMassiveFontSize(BuildContext context) => getResponsiveFontSize(context, fontSize: 30);

  static double getResponsiveFontSize(BuildContext context, {double? fontSize, double? max}) {
    max ??= 100;

    var responsiveSize = min(screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100), max);

    return responsiveSize;
  }
}
