import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework_test/app_config.dart';
import 'package:provider/provider.dart';

import '../models/product_cart.dart';
import '../screens/shopping.dart';
import '../screens/cart.dart';

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
    final cart = Provider.of<ProductCart>(context, listen: true);

    return Scaffold(
      body: <Widget>[
        Shopping(),
        Cart(),
      ][currentPageIndex],
      bottomNavigationBar: SizedBox(
        height: AppConfig.bottomBarHeight,
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Color(0xFFE8DEF8),
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            const NavigationDestination(
              selectedIcon: Icon(Icons.stars),
              icon: Icon(Icons.stars),
              label: 'Shopping',
            ),
            NavigationDestination(
              icon: const Icon(Icons.stars_outlined),
              label:
                  'Cart' + (cart.getAmount == 0 ? '' : ' (${cart.getAmount})'),
            ),
          ],
        ),
      ),
    );
  }
}
