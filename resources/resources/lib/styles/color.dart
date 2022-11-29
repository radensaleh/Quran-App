import 'package:flutter/material.dart';

const Color kPurplePrimary = Color.fromRGBO(134, 62, 213, 1.0); //#863ED5
const Color kPurpleSecondary = Color.fromRGBO(103, 44, 188, 1.0); //#672CBC
const Color kDarkPurple = Color.fromRGBO(59, 30, 119, 1.0); //#3B1E77
const Color kBlackPurple = Color.fromRGBO(36, 15, 79, 1.0); //#240F4F
const Color kGrey = Color.fromRGBO(135, 137, 163, 1.0); //#8789A3
const Color kMikadoYellow = Color.fromRGBO(255, 208, 138, 1.0); //#FFD08A

const kColorScheme = ColorScheme(
  primary: kPurplePrimary,
  primaryContainer: kPurplePrimary,
  secondary: kPurpleSecondary,
  secondaryContainer: kPurpleSecondary,
  surface: kPurplePrimary,
  background: kPurplePrimary,
  error: Colors.red,
  onPrimary: kPurplePrimary,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.light,
);
