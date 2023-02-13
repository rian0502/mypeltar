import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypeltar/mypeltar_theme.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200, width: 300,
              child: Image.asset("assets/images/dumylogo.jpg"),),
             Text('AKHLAK', style: GoogleFonts.poppins(fontSize: 30, textStyle: MyPeltarTheme.lightTextTheme.headline3),)
          ],
        ),
      ),
    );
  }
}
