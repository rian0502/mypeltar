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
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(100),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 2,
            offset: const Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          context.pushNamed(route, params: {'tab': '0'});
        },
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.asset(
                    image,
                    height: 80,
                    width: 80,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
