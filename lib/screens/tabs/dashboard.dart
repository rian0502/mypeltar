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
                      children: [
                        const Menu(
                            image: 'assets/images/maintenance.png',
                            route: 'maintenance',
                            title: 'Maintenance'),
                        const Menu(
                            image: 'assets/images/maintenance.png',
                            route: 'finance',
                            title: 'Finance'),
                        _menuMore('assets/images/more.png', 'More')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _menuMore(String image, String title) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: const Color(0xFF134A6E),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF134A6E).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Menu',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF0093AD),
                        ),
                        textAlign: TextAlign.left,
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
                        ],
                      ),

                    ],
                  ),
                );
              });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              image,
              height: 50,
              width: 50,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, String>> _getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('nama');
    final String? email = prefs.getString('subsatker');
    return {'name': name!, 'email': email!};
  }
}
