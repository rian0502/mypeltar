import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  final int currentTab;
  const AboutScreen({Key? key, required this.currentTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Image.asset('assets/images/dumylogo.jpg'),
          const SizedBox(
            height: 80,
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color(0xFF00337C),
                borderRadius: BorderRadius.only(topRight: Radius.circular(70))),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Text(
                      'HP PAVILION X360',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 10,
                    child: Text(
                      'IT work unit asset',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 10,
                    child: Text(
                      'M307-02',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 280,
                    left: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded('History', 'History', context),
                        const SizedBox(
                          width: 20,
                        ),
                        _buttonRounded('Maintenance', 'maintenance', context),
                        const SizedBox(
                          width: 20,
                        ),
                        _buttonRounded('Detail', 'Detail', context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  //widget button rounded
  Widget _buttonRounded(String title, String route, BuildContext context) {
    return InkWell(
      onTap: () {
        print(route);
      },
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF00337C),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
