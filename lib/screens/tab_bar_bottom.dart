import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './shopping.dart';
import './cart.dart';

class TabBarBottom extends StatefulWidget {
  const TabBarBottom({super.key});

  @override
  State<TabBarBottom> createState() => _TabBarBottomState();
}

class _TabBarBottomState extends State<TabBarBottom> {
  int currentPageIndex = 0;
  final screens = [
    Shopping(),
    Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        Shopping(),
        Cart(),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color(0xFFE8DEF8),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.stars),
            icon: Icon(Icons.stars),
            label: 'Shopping',
          ),
          NavigationDestination(
            icon: Icon(Icons.stars_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}