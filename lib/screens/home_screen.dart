import 'package:flutter/material.dart';
import 'package:mypeltar/screens/tabs/dashboard.dart';
import 'package:mypeltar/screens/tabs/menu1.dart';
import 'package:mypeltar/screens/tabs/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final int currentTab;
  const Home({Key? key, required this.currentTab}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const String prefSelectedIndexKey = 'selectedIndex';
  static List<Widget> pages = <Widget>[
    const DashboardPage(),
    const Menu1(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
            saveCurrentIndex();
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_important),
              label: 'Notfications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ));
  }

  void saveCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(prefSelectedIndexKey, _selectedIndex);
  }
}
