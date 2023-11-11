import 'package:flutter/material.dart';
import 'package:flutter_rick_andmorty/screens/favorite_screen.dart';
import 'package:flutter_rick_andmorty/screens/find_screen.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int selectedNavbarItem = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [const FindScreen(), const FavoriteScreen()];

    return Scaffold(
        // body: IndexedStack(
        //   index: selectedNavbarItem,
        //   children: screens,
        // ),
        body: screens[selectedNavbarItem],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedNavbarItem,
          onTap: (value) {
            setState(() {
              selectedNavbarItem = value;
            });
          },
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Find',
              backgroundColor: Colors.lightGreen,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite),
              label: 'Favorites',
              backgroundColor: Colors.redAccent,
            ),
          ],
        ));
  }
}
