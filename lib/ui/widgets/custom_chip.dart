import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final String? tooltipText;
  const CustomChip({super.key, required this.text, this.tooltipText});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipText ?? '',
      preferBelow: true,
      triggerMode: TooltipTriggerMode.tap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
            border: Border.all(color: Theme.of(context).colorScheme.primary)),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
