import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xff232323),
    primaryContainer: Color(0xfff4f4f4),
    secondary: Color(0xff757575),
    secondaryContainer: Color(0xffbdbdbd),
    tertiary: Color(0xff494949),
    tertiaryContainer: Color(0xffd3d3d3),
    appBarColor: Color(0xffbdbdbd),
    error: Color(0xFFBA1A1A),
  ),
  usedColors: 7,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 4,
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  fontFamily: GoogleFonts.caveat().fontFamily,
);

final darkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xff232323),
    primaryContainer: Color(0xfff4f4f4),
    secondary: Color(0xff757575),
    secondaryContainer: Color(0xffbdbdbd),
    tertiary: Color(0xff494949),
    tertiaryContainer: Color(0xffd3d3d3),
    appBarColor: Color(0xffbdbdbd),
    error: Color(0xffb00020),
  ).defaultError.toDark(40),
  usedColors: 7,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 10,
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  fontFamily: GoogleFonts.caveat().fontFamily,
);
