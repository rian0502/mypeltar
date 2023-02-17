import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypeltar/components/dashboard_profile.dart';
import 'package:mypeltar/components/menu.dart';

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
      child: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DashboardProfile(),
              IconButton(
                onPressed: () {
                  context.goNamed('notification', params: {'tab': '0'});
                },
                icon: const Icon(Icons.notifications),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Menu(
                  image: 'assets/images/maintenance.png',
                  route: 'assets',
                  title: 'Assets'),
              Menu(
                  image: 'assets/images/maintenance.png',
                  route: '/inspection',
                  title: 'Inscpection')
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'We care about our assets,\nMypeltar.',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
