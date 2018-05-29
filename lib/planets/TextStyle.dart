import 'package:flutter/material.dart';

class Style {
  static final baseTextStyle = const TextStyle(
    fontFamily: 'Poppins',
  );

  static final headerTextStyle = const TextStyle(
    color:  Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600
  );

  static final regularTextStyle = baseTextStyle.copyWith(
    color: const Color(0xffb6b2df),
    fontSize: 8.0,
    fontWeight: FontWeight.w400
  );

  static final subHeaderTextStyle = regularTextStyle.copyWith(
    fontSize: 12.0
  );
}