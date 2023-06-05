import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInspection extends StatefulWidget {
  String? id;
  FormInspection({super.key, this.id});
  @override
  State<FormInspection> createState() => _FormInspectionState();
}

class _FormInspectionState extends State<FormInspection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const SizedBox(
        height: 50,
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            Expanded(
              child: Text(
                'Inspection Report',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: const Color(0xff1E3A8A),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),

          ],
        ),
      ),
    ]));
  }
}
