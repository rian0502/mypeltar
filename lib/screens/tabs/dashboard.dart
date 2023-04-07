import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypeltar/components/menu.dart';
import 'package:mypeltar/components/menuAsset.dart';
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
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 17, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/logo.png', height: 80, width: 80),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notification_important,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                FutureBuilder(
                    future: _getUserName(),
                    builder:
                        (context, AsyncSnapshot<Map<String, String>> snapshot) {
                      if (snapshot.hasData) {
                        return Text('Hello, ${snapshot.data!['name']!}!',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ));
                      } else {
                        return const CircularProgressIndicator();
                      }
                    })
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
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
                      children: [
                        const MenuAsset(
                            image: 'assets/images/assets.png',
                            route: 'assets',
                            title: 'Assets'),
                        Column(
                          children: const [
                            Menu(
                                image: 'assets/images/inspection.png',
                                route: 'inspection',
                                title: 'Inspection'),
                            SizedBox(
                              height: 20,
                            ),
                            Menu(
                                image: 'assets/images/maintenance.png',
                                route: 'maintenance',
                                title: 'Maintenance'),
                          ],
                        )
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
