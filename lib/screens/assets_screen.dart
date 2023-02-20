import 'package:flutter/material.dart';

import '../components/asset_tile.dart';
import '../components/search.dart';

class AssetsScreen extends StatefulWidget {
  final int currentTab;
  const AssetsScreen({Key? key, required this.currentTab}) : super(key: key);

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(
          children: const [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Asset Inventory',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SearchBar(),
            SizedBox(
              height: 50,
            ),
           AssetTile(),
          ],
        ),
      ),
    );
  }
}
