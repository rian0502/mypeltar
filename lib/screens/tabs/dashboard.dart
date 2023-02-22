import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypeltar/components/dashboard_profile.dart';
import 'package:mypeltar/components/menu.dart';
import 'package:mypeltar/screens/tabs/profile.dart';

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
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 30,
                ),
                DashboardProfile(),
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
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Menu(
                            image: 'assets/images/cube.png',
                            route: 'assets',
                            title: 'Assets'),
                        Menu(
                            image: 'assets/images/maintenance.png',
                            route: 'assets',
                            title: 'Maintenance'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
