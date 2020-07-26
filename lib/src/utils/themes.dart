import 'package:alumni_app/src/utils/colors.dart';
import 'package:flutter/material.dart';

final defaultTheme = ThemeData(
  fontFamily: "WorkSans",
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    button: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  buttonTheme: ButtonThemeData(
    height: 50,
    buttonColor: PRIMARY_DARK,
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    labelStyle: TextStyle(color: Colors.black),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
  ),
);
