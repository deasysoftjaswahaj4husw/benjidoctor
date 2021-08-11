import 'package:flutter/material.dart';
import 'package:benjidoctor/resources/globals/constants.dart'
    as global_constants;

// Text Styles

abstract class TEXT_STYLES {
  static const about = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );

  static const instruction = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Karla',
  );

  static const log_in = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );

  static const phone_number = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
    color: global_constants.TEXT_COLOR.secondary,
  );

  static const dont_have_an_account = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Karla',
  );

  static const signup = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Karla',
    color: Color(0xFF0C7AE0),
    decoration: TextDecoration.underline,
  );
}

// Button Styles

abstract class BUTTON_STYLES {
  static var phone_number = ElevatedButton.styleFrom(
    shape: const StadiumBorder(),
    primary: const Color(0xFFF9F9F9),
  );
}
