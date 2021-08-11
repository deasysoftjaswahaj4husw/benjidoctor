import 'package:flutter/material.dart';

// Text Styles

abstract class TEXT_STYLES {
  static const screen_name = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
    color: Colors.black,
  );

  static const stats_heading = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    color: Color(0xFF61AEE8),
  );

  static const stats_subheadings = TextStyle(
    fontSize: 10.0,
    fontFamily: 'Montserrat',
  );

  static const dropdown_item = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
}

// Label Styles

abstract class LABEL_STYLES {}

// Link Styles

abstract class LINK_STYLES {}

// Background Colors

abstract class BG_COLOR {
  static const dropdown_default = Color(0xFF85CBFF);
  static const stats_card_default = Color(0xFFF1F1F1);

  static const stats_card_right_arrow = Color(0xFF61AEE8);
}

// Button Styles

abstract class BUTTON_STYLES {}
