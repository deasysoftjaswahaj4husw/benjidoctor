import 'package:flutter/material.dart';
import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;

// Text Styles

abstract class TEXT_STYLES {
  static const heading = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );

  static const phone_number = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
}

// Label Styles

abstract class LABEL_STYLES {}

// Error Styles

abstract class ERROR_STYLES {
  static const default_style = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Karla',
    color: global_constants.TEXT_COLOR.error_color,
  );
}

// Link Styles

abstract class LINK_STYLES {
  static const resend_otp = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    color: Color(0xFF61AEE8),
    decoration: TextDecoration.underline,
  );

  static const next = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      color: Color(0xFF61AEE8));
}

// TextFormField Styles

abstract class TEXTFORMFIELD_STYLES {}
