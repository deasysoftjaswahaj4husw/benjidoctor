import 'package:flutter/material.dart';

import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;
import 'package:benjidoctor/resources/clients/strings.dart' as local_strings;

// Text Styles

abstract class TEXT_STYLES {
  static const heading = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
  );

  static const screen_name = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    color: Colors.black,
  );

  static const add_clients = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
    color: global_constants.TEXT_COLOR.secondary,
  );

  static const add_clients_alert_box_subheading = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );
}

// Label Styles

abstract class LABEL_STYLES {
  static const default_style = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
    color: global_constants.TEXT_COLOR.label_color,
  );
}

// Link Styles

abstract class LINK_STYLES {
  static const default_style = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: global_constants.TEXT_COLOR.link_color,
  );
}

// Background Colors

abstract class BG_COLOR {}

// Button Styles

abstract class BUTTON_STYLES {
  static var default_style = ElevatedButton.styleFrom(
    shape: const StadiumBorder(),
    primary: const Color(0xFFF9F9F9),
  );
}

// TextFormField Styles

abstract class TEXTFORMFIELD_STYLES {
  static const name = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.name,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const phone = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.phone,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const email = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.email,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const diagnosis = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.diagnosis,
    hintStyle: LABEL_STYLES.default_style,
  );
}
