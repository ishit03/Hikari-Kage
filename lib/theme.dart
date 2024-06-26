import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';

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
  appBarStyle: FlexAppBarStyle.background,
  bottomAppBarElevation: 1,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    blendTextTheme: true,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    thickBorderWidth: 2,
    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
    elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
    inputDecoratorSchemeColor: SchemeColor.primary,
    inputDecoratorBackgroundAlpha: 12,
    inputDecoratorRadius: 8,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
    appBarScrolledUnderElevation: 8,
    drawerElevation: 1,
    drawerWidth: 290,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
    bottomNavigationBarMutedUnselectedLabel: false,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
    bottomNavigationBarMutedUnselectedIcon: false,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSecondaryContainer,
    navigationBarSelectedIconSchemeColor: SchemeColor.onSecondaryContainer,
    navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationBarIndicatorOpacity: 1,
    navigationBarElevation: 1,
    navigationBarHeight: 72,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSecondaryContainer,
    navigationRailSelectedIconSchemeColor: SchemeColor.onSecondaryContainer,
    navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationRailIndicatorOpacity: 1,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: 'PTSans',
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
  ).toDark(40),
  usedColors: 7,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 10,
  appBarStyle: FlexAppBarStyle.background,
  bottomAppBarElevation: 2,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    blendTextTheme: true,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    thickBorderWidth: 2,
    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
    elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
    inputDecoratorSchemeColor: SchemeColor.primary,
    inputDecoratorBackgroundAlpha: 48,
    inputDecoratorRadius: 8,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
    drawerElevation: 1,
    drawerWidth: 290,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
    bottomNavigationBarMutedUnselectedLabel: false,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
    bottomNavigationBarMutedUnselectedIcon: false,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSecondaryContainer,
    navigationBarSelectedIconSchemeColor: SchemeColor.onSecondaryContainer,
    navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationBarIndicatorOpacity: 1,
    navigationBarElevation: 1,
    navigationBarHeight: 72,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSecondaryContainer,
    navigationRailSelectedIconSchemeColor: SchemeColor.onSecondaryContainer,
    navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationRailIndicatorOpacity: 1,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: 'PTSans',
);
