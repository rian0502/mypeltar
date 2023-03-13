import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypeltar/mypeltar_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Image.asset("assets/images/logo.png"),
            ),
            Text(
              'Mypeltar',
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: const Color(0xFF134A6E),
                  fontWeight: FontWeight.bold,
                  textStyle: MyPeltarTheme.lightTextTheme.headline3),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('We Care About Our Assets',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: const Color(0xFF06C8FD),
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
