import 'package:flutter/material.dart';


class AssetsScreen extends StatefulWidget {
  final int currentTab;
  const AssetsScreen({Key? key, required this.currentTab}) : super(key: key);

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color(0xFF00337C),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
          ),
          child: Column(

          ),
        )
      ],
    );
  }
}
