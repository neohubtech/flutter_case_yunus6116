import 'package:flutter/material.dart';

import 'colors.dart';

/// Helper Class for App Text Styles
class AppTextStyles {
  // button
  static TextStyle textButton3 = _getTextStyle(14, FontWeight.w600);

  static TextStyle textButton2 = _getTextStyle(14, FontWeight.w800);

  static TextStyle textButton1 = _getTextStyle(18, FontWeight.w700);

  static TextStyle subtitleTextStyle = _getTextStyle(
    15,
    FontWeight.w500,
    color: const Color(0XFF8F8F8F),
  );

  // body
  static TextStyle body1 = _getTextStyle(16, FontWeight.w500);

  // body2
  static TextStyle body2 = _getTextStyle(14, FontWeight.w500);

  // body3
  static TextStyle body3 = _getTextStyle(16, FontWeight.w700);

  // body3
  static TextStyle body4 = _getTextStyle(14, FontWeight.w400);

  // body5
  static TextStyle body5 = _getTextStyle(12, FontWeight.w700);

  // body6
  static TextStyle body6 = _getTextStyle(15, FontWeight.w600);

  // body7
  static TextStyle body7 = _getTextStyle(10, FontWeight.w500);

  // body8
  static TextStyle body8 = _getTextStyle(10, FontWeight.w700);

  // body9
  static TextStyle body9 = _getTextStyle(13, FontWeight.w400);

  // body10
  static TextStyle body10 = _getTextStyle(13, FontWeight.w600);

  // body11
  static TextStyle body11 = _getTextStyle(15, FontWeight.w500);

  // body12
  static TextStyle body12 = _getTextStyle(11, FontWeight.w600);

  // body13
  static TextStyle body13 = _getTextStyle(13, FontWeight.w500);

  // heading
  static TextStyle heading = _getTextStyle(32, FontWeight.w700);

  static TextStyle heading1 = _getTextStyle(22, FontWeight.w600);

  static TextStyle heading2 = _getTextStyle(20, FontWeight.w700);

  static TextStyle heading3 = _getTextStyle(18, FontWeight.w600);

  static TextStyle heading4 = _getTextStyle(16, FontWeight.w600);

  static TextStyle heading5 = _getTextStyle(14, FontWeight.w700);

  static TextStyle heading6 = _getTextStyle(17, FontWeight.w700);

  static TextStyle heading7 = _getTextStyle(24, FontWeight.w500);

  static TextStyle heading8 = _getTextStyle(17, FontWeight.w400);

  static TextStyle heading9 = _getTextStyle(24, FontWeight.w700);

  static TextStyle heading10 = _getTextStyle(25, FontWeight.bold);

  static TextStyle commonTextStyle = _getTextStyle(12, FontWeight.w500);

  static TextStyle forgotPassword = _getTextStyle(15, FontWeight.w500);

  // special
  static TextStyle special = _specialTextStyle(48, FontWeight.w400);

  static TextStyle _getTextStyle(double fontSize, FontWeight fontWeight,
          {double? height, Color color = MainColors.mainBlack}) =>
      TextStyle(fontSize: fontSize, fontWeight: fontWeight, height: height ?? 1.2, color: color);

  static TextStyle _specialTextStyle(
    double fontSize,
    FontWeight fontWeight,
  ) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Colors.white,
        fontFamily: 'Muli',
      );
}
