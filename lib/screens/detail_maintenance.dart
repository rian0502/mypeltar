import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailMaintenance extends StatefulWidget {
  const DetailMaintenance({super.key});

  @override
  State<DetailMaintenance> createState() => _DetailMaintenanceState();
}

class _DetailMaintenanceState extends State<DetailMaintenance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                    'Maintenance History',
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
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40, bottom: 20),
                  child: Row(
                    children: [
                      Text(
                        'Asset Name \nAsset ID',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Stepper(steps: [
                  Step(
                    title: const Text('Step 1'),
                    content: Container(),
                  ),
                  const Step(
                    title: Text('Step 2'),
                    content: Text('Content for Step 2'),
                  ),
                  const Step(
                    title: Text('Step 3'),
                    content: Text('Content for Step 3'),
                  ),
                  const Step(
                    title: Text('Step 4'),
                    content: Text('Content for Step 4'),
                  ),
                  const Step(
                    title: Text('Step 5'),
                    content: Text('Content for Step 5'),
                  ),
                  const Step(
                    title: Text('Step 6'),
                    content: Text('Content for Step 6'),
                  ),
                  const Step(
                    title: Text('Step 7'),
                    content: Text('Content for Step 7'),
                  ),
                  const Step(
                    title: Text('Step 8'),
                    content: Text('Content for Step 8'),
                  ),
                  const Step(
                    title: Text('Step 9'),
                    content: Text('Content for Step 9'),
                  ),
                  const Step(
                    title: Text('Step 10'),
                    content: Text('Content for Step 10'),
                  ),
                  const Step(
                    title: Text('Step 11'),
                    content: Text('Content for Step 11'),
                  ),
                  const Step(
                    title: Text('Step 12'),
                    content: Text('Content for Step 12'),
                  ),
                  const Step(
                    title: Text('Step 13'),
                    content: Text('Content for Step 13'),
                  ),
                  const Step(
                    title: Text('Step 14'),
                    content: Text('Content for Step 14'),
                  ),
                  const Step(
                    title: Text('Step 15'),
                    content: Text('Content for Step 15'),
                  ),
                  const Step(
                    title: Text('Step 16'),
                    content: Text('Content for Step 16'),
                  ),
                  const Step(
                    title: Text('Step 17'),
                    content: Text('Content for Step 17'),
                  ),
                  const Step(
                    title: Text('Step 18'),
                    content: Text('Content for Step 18'),
                  ),
                  const Step(
                    title: Text('Step 19'),
                    content: Text('Content for Step 19'),
                  ),
                  const Step(
                    title: Text('Step 20'),
                    content: Text('Content for Step 20'),
                  ),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
