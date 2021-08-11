import 'package:flutter/material.dart';
import 'package:benjidoctor/resources/update_practice/strings.dart'
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

  static const timeline_bubble = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    color: Color(0xFFFFFFFF),
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
  static const next = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    color: global_constants.TEXT_COLOR.link_color,
  );

  static const add_workplace = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    color: global_constants.TEXT_COLOR.label_color,
  );
}

// Background Colors

abstract class BG_COLOR {
  static const timeline_bubble_active = Color(0xFF85CBFF);
  static const timeline_bubble_inactive = Color(0xFFE5E5E5);
}

// TextFormField Styles

abstract class TEXTFORMFIELD_STYLES {
  static const name_of_workplace = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.name_of_workspace,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const pan_number = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.pan_number,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const pan_holder_name = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.pan_holder_name,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const billing_label = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.billing_label,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const ifsc_number = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.ifsc_number,
    hintStyle: LABEL_STYLES.default_style,
  );
}
