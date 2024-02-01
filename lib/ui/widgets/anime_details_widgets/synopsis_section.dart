import 'package:flutter/material.dart';

class SynopsisSection extends StatelessWidget {
  final String? synopsisText;
  const SynopsisSection({super.key, required this.synopsisText});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
