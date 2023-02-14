import 'package:flutter/material.dart';
import 'package:mypeltar/components/menu.dart';

import '../../components/search.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SearchBar(),
          SizedBox(height: 30,),
          Menu(image: 'assets/images/maintenance.png', route: '/route', title: 'Title')
        ],
      ),
    );
  }
}
