import 'package:flutter/material.dart';
import 'package:benjidoctor/resources/signup_request/strings.dart'
    as local_strings;
import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;

// Text Styles

abstract class TEXT_STYLES {
  static const heading = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );
}

// Label Styles

abstract class LABEL_STYLES {
  static const phone_number = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );
}

// Error Styles

abstract class ERROR_STYLES {
  static const default_style = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Karla',
    color: global_constants.TEXT_COLOR.error_color,
  );
}

// Link Styles

abstract class LINK_STYLES {
  static const next = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      color: Color(0xFF61AEE8));
}

// TextFormField Styles

abstract class TEXTFORMFIELD_STYLES {
  static const phone_number = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.phone_number,
    hintStyle: LABEL_STYLES.phone_number,
  );
}
