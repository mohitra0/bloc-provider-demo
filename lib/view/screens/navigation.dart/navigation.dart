import 'package:flutter/material.dart';
import 'package:india_today/view/screens/panchang.dart';
import 'package:india_today/view/screens/astro_provider.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    PanChang(),
    TalkToAstro(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 11.0,
        unselectedFontSize: 11.0,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/talk.png',
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            label: 'Talk to Astrologer',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ask.png',
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            label: 'Ask Question',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/reports.png',
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            label: 'Reports',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
