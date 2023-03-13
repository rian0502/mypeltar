import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state_management/app_state.dart';


class SettingScreens extends StatelessWidget {
  const SettingScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Provider.of<AppState>(context, listen: false).logout(context);
        },
        child: const Text('Logout'),
      ),
    );
  }
}
