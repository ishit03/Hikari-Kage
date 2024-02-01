import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikari_kage/cubits/home_screen_cubit.dart';
import 'package:hikari_kage/theme.dart';
import 'package:hikari_kage/ui/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
    create: (_) => HomeScreenCubit(),
    child: MaterialApp(
      home: const HomeScreen(),
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
    ),
  ));
}
