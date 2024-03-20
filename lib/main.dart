import 'package:flutter/material.dart';
import 'package:hikari_kage/hikari_kage.dart';
import 'package:hikari_kage/utility/hive_utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveUtility.initializeHive();
  runApp(const HikariKage());
}
