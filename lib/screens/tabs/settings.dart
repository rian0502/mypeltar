import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/dashboard_profile.dart';
import '../../state_management/app_state.dart';

class SettingScreens extends StatelessWidget {
  const SettingScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            'Settings',
            style: GoogleFonts.poppins(
                fontSize: 25,
                color: const Color(0xff1E3A8A),
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Account',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: const Color(0xff1E3A8A),
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder(
            builder: (context, AsyncSnapshot<Map<String, String>> snapshot) {
              if (snapshot.hasData) {
                return DashboardProfile(
                  name: snapshot.data!['nama'],
                  email: snapshot.data!['email'],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
            future: _getUserName()),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('About',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: const Color(0xff1E3A8A),
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder(
            builder: (context, AsyncSnapshot<Map<String, String>> snapshot) {
              if (snapshot.hasData) {
                return DashboardProfile(
                  name: snapshot.data!['nama'],
                  email: snapshot.data!['email'],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
            future: _getUserName()),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Credits',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: const Color(0xff1E3A8A),
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        FutureBuilder(
            builder: (context, AsyncSnapshot<Map<String, String>> snapshot) {
              if (snapshot.hasData) {
                return DashboardProfile(
                  name: snapshot.data!['nama'],
                  email: snapshot.data!['email'],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
            future: _getUserName()),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Provider.of<AppState>(context, listen: false).logout(context);
                },
                child: const Text('Logout'),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<Map<String, String>> _getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? nama = prefs.getString('nama');
    final String? email = prefs.getString('email');
    return {
      'nama': nama!,
      'email': email!,
    };
  }
}
