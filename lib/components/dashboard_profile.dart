import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DashboardProfile extends StatelessWidget {
  final String? name;
  final String? email;
  const DashboardProfile({Key? key, this.name, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              name ?? '-',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),

            Text(
              email ?? '-',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
