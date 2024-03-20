import 'package:flutter/material.dart';

class SynopsisSection extends StatelessWidget {
  const SynopsisSection({required this.synopsisText, super.key});
  final String? synopsisText;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Synopsis',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                synopsisText ?? 'N/A',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
