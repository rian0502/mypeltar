import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypeltar/models/detail_asset.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/assets_services.dart';

class AboutScreen extends StatefulWidget {
  final String? id;
  const AboutScreen({Key? key, this.id}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String? token = '';
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      setState(() {
        token = value.getString('token')!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: AssetsServices.show(widget.id!, token!),
        builder: (BuildContext context, AsyncSnapshot<DetailAsset> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset('assets/images/dumylogo.jpg'),
                const SizedBox(
                  height: 200,
                ),
                Expanded(
                    child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Color(0xFF00337C),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(70))),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                          left: 10,
                          child: Text(
                            snapshot.data!.data!.namaAsset ?? '-',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 10,
                          child: Text(
                            snapshot.data!.data!.lokasi!.unit ?? '-',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 10,
                          child: Text(
                            snapshot.data!.data!.serialnumber ?? '-',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          left: MediaQuery.of(context).size.width / 2 - 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buttonRounded('Inspection', '/form-insepction',
                                  snapshot.data!.data!.id.toString(), context),
                              const SizedBox(
                                width: 20,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              _buttonRounded('Detail', '/detail',
                                  snapshot.data!.data!.id.toString(), context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  //widget button rounded
  Widget _buttonRounded(
      String title, String route, String id, BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(route, extra: id);
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
