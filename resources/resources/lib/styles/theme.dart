import 'package:flutter/material.dart';
import 'package:resources/styles/color.dart';
import 'package:resources/styles/text_styles.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: kColorScheme,
  appBarTheme: const AppBarTheme(elevation: 0),
  scaffoldBackgroundColor: Colors.white,
  textTheme: kTextTheme.apply(
    bodyColor: kPurpleSecondary,
    decorationColor: kPurpleSecondary,
    displayColor: kPurpleSecondary,
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: kColorScheme.copyWith(
    primary: kDarkTheme,
    onPrimary: Colors.white,
  ),
  appBarTheme: const AppBarTheme(elevation: 0),
  scaffoldBackgroundColor: kDarkTheme,
  textTheme: kTextTheme.apply(
    bodyColor: Colors.white,
    decorationColor: Colors.white,
    displayColor: Colors.white,
  ),
);
