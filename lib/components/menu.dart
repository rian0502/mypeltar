import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatelessWidget {
  final String image;
  final String route;
  final String title;
  const Menu(
      {Key? key, required this.image, required this.route, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: Color(0xFF134A6E),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF134A6E).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          context.pushNamed(route, params: {'tab': '0'});
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              image,
              height: 80,
              width: 80,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
