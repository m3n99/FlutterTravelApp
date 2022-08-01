import 'package:flutter/material.dart';
import 'package:travelapp/widgets/navgationpages/bar_item.dart';
import 'package:travelapp/widgets/home_page.dart';
import 'package:travelapp/widgets/navgationpages/my_page.dart';
import 'package:travelapp/widgets/navgationpages/search_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ) ,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color.fromARGB(255, 9, 61, 87),
        unselectedItemColor: const Color.fromARGB(255, 115, 135, 167),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              label: "Home", 
              icon: Icon(Icons.apps),
              activeIcon: Icon(Icons.apps_outlined)),
          BottomNavigationBarItem(
              label: "Bar",
              icon: Icon(Icons.bar_chart),
              activeIcon: Icon(Icons.bar_chart_outlined)),
          BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search_outlined)),
          BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person)),
        ],

      ),
    );
  }
}
