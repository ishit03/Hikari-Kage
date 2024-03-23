import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hikari_kage/ui/screens/home_screen.dart';

class HikariKageBottomNav extends StatefulWidget {
  const HikariKageBottomNav({required this.onTap, super.key});
  final void Function(int index) onTap;

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
        vsync: this,
        duration: const Duration(
            milliseconds:
                500)) //, reverseDuration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });

    animation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, 20))
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.decelerate));

    HomeScreen.addListener((direction) {
      if (direction == ScrollDirection.forward) {
        showBottomNav();
      } else if (direction == ScrollDirection.reverse) {
        hideBottomNav();
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
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(50)),
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
