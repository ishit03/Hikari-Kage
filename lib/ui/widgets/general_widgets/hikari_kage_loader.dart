import 'dart:math';

import 'package:flutter/material.dart';

class HikariKageLoader extends StatefulWidget {
  const HikariKageLoader({super.key});

  @override
  State<HikariKageLoader> createState() => _HikariKageLoaderState();
}

class _HikariKageLoaderState extends State<HikariKageLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _loadingController;

  @override
  void initState() {
    super.initState();

    _loadingController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {});
      })
      ..repeat();
  }

  @override
  void dispose() {
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.rotationY(_loadingController.value * pi * 2),
        alignment: Alignment.center,
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(
            'assets/images/hikari_loader.png',
            fit: BoxFit.cover,
          ),
        ));
  }
}
