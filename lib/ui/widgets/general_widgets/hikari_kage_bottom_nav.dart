import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HikariKageBottomNav extends StatefulWidget {
  const HikariKageBottomNav(
      {required this.onTap, required this.scrollController, super.key});
  final void Function(int index) onTap;
  final ScrollController scrollController;

  @override
  State<HikariKageBottomNav> createState() => _HikariKageBottomNavState();
}

class _HikariKageBottomNavState extends State<HikariKageBottomNav>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Offset> animation;
  int currentIndex = 1;
  List<IconData> navIcons = [Icons.book, Icons.home, Icons.list];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addListener(() {
        setState(() {});
      });

    animation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, 10))
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut));

    widget.scrollController.addListener(() {
      final direction = widget.scrollController.position.userScrollDirection;
      if (direction != ScrollDirection.idle) {
        if (direction == ScrollDirection.forward) {
          showBottomNav();
        } else if (direction == ScrollDirection.reverse) {
          hideBottomNav();
        }
      }
    });
  }

  void hideBottomNav() => animationController.forward();

  void showBottomNav() => animationController.reverse();

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(50),
            //border: Border.all(color: Theme.of(context).shadowColor, width: .2),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, .3),
                  blurRadius: .5,
                  color: Theme.of(context).shadowColor)
            ]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: navIcons
                .map((icon) {
                  final index = navIcons.indexOf(icon);
                  return Flexible(
                    child: IconButton(
                      onPressed: () {
                        if (currentIndex != index) {
                          setState(() {
                            currentIndex = index;
                          });
                          widget.onTap(index);
                        }
                      },
                      icon: Icon(
                        icon,
                        size: 20,
                        color: (currentIndex == index)
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedItemColor
                            : Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor,
                      ),
                    ),
                  );
                })
                .toList()
                .cast<Widget>()),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
