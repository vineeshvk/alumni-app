import 'package:alumni_app/src/utils/colors.dart';
import 'package:flutter/material.dart';

final defaultTheme = ThemeData(
  fontFamily: "WorkSans",
  brightness: Brightness.dark,
  scaffoldBackgroundColor: PRIMARY_DARK,
  textTheme: TextTheme(
    button: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.white),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: SECONDARY_TEXT, width: 3),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 3),
    ),
  ),
  buttonTheme: ButtonThemeData(
    height: 50,
    buttonColor: SECONDARY_DARK,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
