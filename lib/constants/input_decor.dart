

import 'package:flutter/material.dart';
import 'package:ksb_app/constants/palette.dart';

InputDecoration inputDecor = InputDecoration(
  floatingLabelStyle: genTxt.copyWith(fontSize: 16),
  hintStyle: genTxt.copyWith(fontSize: 16),
  floatingLabelBehavior: FloatingLabelBehavior.always,
  counterStyle: genTxt.copyWith(fontSize: 8),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
      width: 1.0,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: colorBoxOutline,
      width: 2.0,
    ),
  ),
);

TextStyle genTxt = TextStyle(
  fontFamily: 'PTSans',
  color: primaryText,
  fontStyle: FontStyle.normal,
  letterSpacing: 1.0,
  fontWeight: FontWeight.normal,
  fontSize: 13,
);
TextStyle ksbSpanTxt = TextStyle(
    fontFamily: 'Roboto',
    color: ksbSpanText,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w900,
    fontSize: 25);
TextStyle supremeSpanTxt = TextStyle(
    fontFamily: 'Roboto',
    color: supremeSpanText,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w900,
    fontSize: 25);
