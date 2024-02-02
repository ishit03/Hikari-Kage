import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/cubits/theme_mode_cubit.dart';
import 'package:hikari_kage/theme.dart';
import 'package:hikari_kage/ui/screens/home_screen.dart';
import 'package:hikari_kage/utility/hive_utility.dart';

class HikariKage extends StatefulWidget {
  const HikariKage({super.key});

  @override
  State<HikariKage> createState() => _HikariKageState();
}

class _HikariKageState extends State<HikariKage> {
  late final Modes prefMode;
  late final ThemeModeCubit _themeModeCubit;
  @override
  void initState() {
    super.initState();
    final String mode = HiveUtility.getPreferredThemeMode ?? 'light';
    prefMode = (mode == 'light') ? Modes.light : Modes.dark;
    _themeModeCubit = ThemeModeCubit(prefMode);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _themeModeCubit,
      child: BlocBuilder<ThemeModeCubit, Modes>(builder: (context, state) {
        return MaterialApp(
          home: const HomeScreen(),
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: (state == Modes.light) ? ThemeMode.light : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }

  @override
  void dispose() {
    HiveUtility.closeBoxes();
    super.dispose();
  }
}