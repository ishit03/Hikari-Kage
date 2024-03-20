import 'package:flutter/material.dart';

class CustomDotIndicator extends StatefulWidget {
  const CustomDotIndicator({required this.currentIndex, super.key});
  final int currentIndex;

  @override
  State<CustomDotIndicator> createState() => _CustomDotIndicatorState();
}

class _CustomDotIndicatorState extends State<CustomDotIndicator> {
  List<String> listTitle = ['Considering', 'Completed', 'On Hold', 'Dropped'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: listTitle
                .map((title) {
                  final index = listTitle.indexOf(title);
                  return Container(
                      constraints:
                          const BoxConstraints(minHeight: 10, minWidth: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .navigationBarTheme
                              .indicatorColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                      child: (widget.currentIndex == index)
                          ? Text(
                              title,
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          : null);
                })
                .toList()
                .cast<Widget>()),
      ),
    );
  }
}
