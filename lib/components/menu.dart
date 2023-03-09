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
          context.pushNamed(route, params: {'tab': '0'});
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
}
