import 'package:flutter/material.dart';
import 'package:benjidoctor/models/user.dart';

// Images

abstract class IMAGE {
  static const app_logo = 'lib/resources/globals/assets/images/app_logo.png';
  static const phone = 'lib/resources/globals/assets/images/phone.png';
  static const wave = 'lib/resources/globals/assets/images/wave.png';
  static const arrow_right =
      'lib/resources/globals/assets/images/arrow_right.png';
  static const add = 'lib/resources/globals/assets/images/add.png';
}

// Text Colors

abstract class TEXT_COLOR {
  static const primary = Color(0xFF000000);
  static const secondary = Color(0xFF4FAFF5);

  static const label_color = Color(0xFF888888);
  static const link_color = Color(0xFF61AEE8);

  static const error_color = Color(0xFFD92F2F);
}

// Border Colors

abstract class BORDER_COLOR {
  static const primary = Color(0xFFD9D9D9);

  static const appbar_bottom_border = Color(0xFF979797);
}

// Bottom Navigation Bar

abstract class BOTTOM_NAVBAR {
  static const active_icon_color = Color(0xFF85CBFF);
  static const inactive_icon_color = Color(0xFFCECECE);
}

// Background Color

abstract class BG_COLOR {
  static const default_color = Color(0xFFF1F1F1);
}

// Text Alignment

abstract class TEXT_ALIGN {
  static const center = TextAlign.center;
  static const left = TextAlign.left;
  static const right = TextAlign.right;
  static const justify = TextAlign.justify;
}

// Paddings

abstract class PADDING {
  // ALL
  static const p0 = EdgeInsets.all(0.0);
  static const p1 = EdgeInsets.all(5.0);
  static const p2 = EdgeInsets.all(10.0);
  static const p3 = EdgeInsets.all(15.0);
  static const p4 = EdgeInsets.all(20.0);

  // HORIZONTAL
  static const px1 = EdgeInsets.symmetric(vertical: 0, horizontal: 5.0);
  static const px2 = EdgeInsets.symmetric(vertical: 0, horizontal: 10.0);
  static const px3 = EdgeInsets.symmetric(vertical: 0, horizontal: 15.0);
  static const px4 = EdgeInsets.symmetric(vertical: 0, horizontal: 20.0);

  // VERTICAL
  static const py1 = EdgeInsets.symmetric(vertical: 5.0, horizontal: 0);
  static const py2 = EdgeInsets.symmetric(vertical: 10.0, horizontal: 0);
  static const py3 = EdgeInsets.symmetric(vertical: 15.0, horizontal: 0);
  static const py4 = EdgeInsets.symmetric(vertical: 20.0, horizontal: 0);
}

// State Management
String? token;
User? user;
