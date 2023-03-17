import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypeltar/components/dashboard_profile.dart';
import 'package:mypeltar/components/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/carousel_slidder.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xFF134A6E),
              Color(0xFF0093AD),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 30,
                ),
                FutureBuilder(
                    future: _getUserName(),
                    builder:
                        (context, AsyncSnapshot<Map<String, String>> snapshot) {
                      if (snapshot.hasData) {
                        return DashboardProfile(
                          name: snapshot.data!['name'],
                          email: snapshot.data!['email'],
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    })
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    MyCarouselSlidder(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'We Care about our assets. Mypeltar.',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF0093AD),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Menu(
                            image: 'assets/images/maintenance.png',
                            route: 'maintenance',
                            title: 'Maintenance'),
                        Menu(
                            image: 'assets/images/maintenance.png',
                            route: 'finance',
                            title: 'Finance'),
                        Menu(
                            image: 'assets/images/maintenance.png',
                            route: 'finance',
                            title: 'Public Service'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Future<Map<String, String>> _getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('nama');
    final String? email = prefs.getString('subsatker');
    return {'name': name!, 'email': email!};
  }
}
