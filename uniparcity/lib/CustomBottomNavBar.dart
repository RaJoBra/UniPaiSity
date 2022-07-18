import 'package:flutter/material.dart';
import 'package:uniparcity/planninglist.dart';
import 'package:uniparcity/universities.dart';

import 'feed.dart';
import 'home.dart';
import 'onboarding.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Universities()),
        );
      }
      if(_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlanningList()),
        );
      }
      if(_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
      if(_selectedIndex == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Onboarding()),
        );
      }
      if(_selectedIndex == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Feed(title: 'Feed',)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.redAccent,
      unselectedItemColor: Colors.blueGrey,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Hochschul Suche',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Packliste',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'On-Boarding',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.rss_feed),
          label: 'RSS-Feed',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}