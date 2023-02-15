import 'package:flutter/material.dart';
import 'package:mypeltar/components/notifcation_thumbnail.dart';

class NotificationScreen extends StatelessWidget {
  final int currentTab;
  const NotificationScreen({Key? key, required this.currentTab})
      : super(key: key);

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
                'Notification',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            NotificationThumbnail(),
          ],
        ),
      ),
    );
  }
}
