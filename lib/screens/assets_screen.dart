import 'package:flutter/material.dart';


class AssetsScreens extends StatefulWidget {
  const AssetsScreens({Key? key}) : super(key: key);

  @override
  State<AssetsScreens> createState() => _AssetsScreensState();
}

class _AssetsScreensState extends State<AssetsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Assets Screen'),
      ),
    );
  }
}
