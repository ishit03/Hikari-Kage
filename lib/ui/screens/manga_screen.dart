import 'package:flutter/material.dart';
import 'package:hikari_kage/ui/widgets/general_widgets/hikari_kage_loader.dart';

class MangaScreen extends StatelessWidget {
  const MangaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(
        child: HikariKageLoader(), //Text('Manga Section\nComing Soon...'),
      ),
    );
  }
}
