import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InspectionReport extends StatefulWidget {
  const InspectionReport({Key? key}) : super(key: key);

  @override
  State<InspectionReport> createState() => _InspectionReportState();
}

class _InspectionReportState extends State<InspectionReport> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Inspection Report',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  _getImageFromGalery();
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.camera_alt,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add Photo',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _getImageFromGalery() async {
    var pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 200,
        maxWidth: 200,
        imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        file = File(pickedFile.path);
      });
    }
  }
}
