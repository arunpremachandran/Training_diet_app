import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.09,
      child: BottomNavigationBar(
        iconSize: 18,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(
          color: const Color(0xFF200087),
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person'
          ),
        ],
      ),
    );
  }
}
