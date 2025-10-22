import 'package:flutter/widgets.dart';
import 'package:awesome_extensions/awesome_extensions.dart';

class AppSizes {
  AppSizes._();

  static double screenWidth(BuildContext context) => context.mqWidth;

  static double screenHeight(BuildContext context) => context.mqHeight;

  static double horizontalPadding(BuildContext context) =>
      screenWidth(context) * 0.05;

  static double verticalPadding(BuildContext context) =>
      screenHeight(context) * 0.02;

  static double avtarRadius(BuildContext context) =>
      screenWidth(context) * 0.09;

  /// 🔤 Font Sizes (responsive text)
  static double headingText(BuildContext context) =>
      screenWidth(context) * 0.07;

  static double titleFont(BuildContext context) => screenWidth(context) * 0.045;

  static double subTitleFont(BuildContext context) =>
      screenWidth(context) * 0.035;

  static double buttonHeight(BuildContext context) =>
      screenHeight(context) * 0.04;

  static double buttonRadius(BuildContext context) =>
      screenWidth(context) * 0.03;

  static double buttonHorizontalPadding(BuildContext context) =>
      screenWidth(context) * 0.07;

  static double buttonVerticalPadding(BuildContext context) =>
      screenHeight(context) * 0.012;

  static double smallIcon(BuildContext context) => screenWidth(context) * 0.06;

  static double mediumIcon(BuildContext context) => screenWidth(context) * 0.07;

  static double largeIcon(BuildContext context) => screenWidth(context) * 0.1;
}
