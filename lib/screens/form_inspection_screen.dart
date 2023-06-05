import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../components/image_picker.dart';

class FormInspection extends StatefulWidget {
  String? id;
  FormInspection({super.key, this.id});
  @override
  State<FormInspection> createState() => _FormInspectionState();
}

class _FormInspectionState extends State<FormInspection> {
  XFile? image;
  final ImagePicker picker = ImagePicker();

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
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Description',
            labelStyle: GoogleFonts.poppins(
              fontSize: 15,
              color: const Color(0xff1E3A8A),
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Upload picture from galery',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: const Color(0xff1E3A8A),
                  fontWeight: FontWeight.w500,
                )),
            GestureDetector(
              onTap: () {
                _openGalerySelectImage(context);
              },
              child: FormImagePicker(),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Type of Report',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: const Color(0xff1E3A8A),
                  fontWeight: FontWeight.w500,
                )),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {},
                ),
                Text(
                  'Inspection',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xff1E3A8A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Radio(
                  value: 2,
                  groupValue: 1,
                  onChanged: (value) {},
                ),
                Text(
                  'Breakdown',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xff1E3A8A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Submit')),
          ],
        ),
      ),
    ]));
  }

  _openGalerySelectImage(BuildContext context) async {
    var img = await picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        image = img;
      });
    }
  }
}
