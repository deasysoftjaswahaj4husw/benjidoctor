import 'package:flutter/material.dart';
import 'package:benjidoctor/resources/update_profile/strings.dart'
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
  static const default_style = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    color: Color(0xFF61AEE8),
  );
}

// Background Colors

abstract class BG_COLOR {
  static const timeline_bubble_active = Color(0xFF85CBFF);
  static const timeline_bubble_inactive = Color(0xFFE5E5E5);
}

// TextFormField Styles

abstract class TEXTFORMFIELD_STYLES {
  static const add_username = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.add_username,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const name = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.name,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const xxxx = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.xxxx,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const email = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.email,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const psychiatrist = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.psychiatrist,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const clinical_osychologist = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.clinical_psychologist,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const counselling_psychologist = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.counselling_psychologist,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const qualification = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.qualification,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const registration_number = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.registration_number,
    hintStyle: LABEL_STYLES.default_style,
  );

  static const location = InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: global_constants.BORDER_COLOR.primary)),
    hintText: local_strings.LABELS.location,
    hintStyle: LABEL_STYLES.default_style,
  );
}
