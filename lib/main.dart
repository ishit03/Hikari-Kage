import 'package:flutter/material.dart';
import 'package:hikari_kage/utility/hive_utility.dart';

import 'hikari_kage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveUtility.initializeHive();
  runApp(const HikariKage());
}
