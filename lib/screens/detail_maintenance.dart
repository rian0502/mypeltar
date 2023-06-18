import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypeltar/models/maintenance.dart';

class DetailMaintenance extends StatelessWidget {
  Maintenance maintenance;
  DetailMaintenance({super.key, required this.maintenance});

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
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        maintenance.asset!.namaAsset!,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        maintenance.asset!.codeAsset!,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: Text('Add Update')),
                    ],
                  ),
                ],
              )),
          Expanded(
              child: ListView.builder(
            itemCount: maintenance.history!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Card(
                  child: ListTile(
                    title: Text(maintenance.history![index].status!),
                    subtitle: Text(maintenance.history![index].deskripsi!),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
