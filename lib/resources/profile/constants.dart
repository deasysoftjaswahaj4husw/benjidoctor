import 'package:flutter/material.dart';

// Text Styles

abstract class TEXT_STYLES {
  static const heading_default = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );

  static const subheading_default = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );

  static const collapsible_container_heading = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );

  static const collapsible_container_subheading = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
  );

  static const collapsible_container_content = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );
}

// Label Styles

abstract class LABEL_STYLES {}

// Link Styles

abstract class LINK_STYLES {}

// Background Colors

abstract class BG_COLOR {}

// Button Styles

abstract class BUTTON_STYLES {}

// Icon Colors

abstract class ICON_COLOR {
  static const default_color = Color(0xFFA7A7A7);
  static const right_arrow = Color(0xFF61AEE8);
}
