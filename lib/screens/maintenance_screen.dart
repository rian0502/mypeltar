import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypeltar/models/categories.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/dropdown_service.dart';
import 'list_assets.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({Key? key}) : super(key: key);

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen>
    with TickerProviderStateMixin {
  String _token = '';
  TabController? _tabController;
  String? _categories;
  String? idCategories;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      setState(() {
        _token = value.getString('token')!;
      });
    });
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    context.go('/home');
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Expanded(
                child: Text(
                  'Maintenance',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xff1E3A8A),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 45,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(
              25.0,
            ),
          ),
          child: TabBar(
            controller: _tabController!,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25.0,
              ),
              color: const Color(0xff1E3A8A),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(
                text: 'Assets',
              ),
              Tab(
                text: 'Inspection',
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
            child: FutureBuilder<List<Categories>>(
          future: DropdownServices.getAll(_token),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: const Text('Select Category'),
                      value: _categories,
                      onChanged: (String? value) {
                        setState(() {
                          _categories = value!;
                        });
                      },
                      items: snapshot.data!
                          .map(
                              (Categories category) => DropdownMenuItem<String>(
                                    value: category.kategori!,
                                    child: Text(category.kategori!),
                                  ))
                          .toList(),
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )),
        const SizedBox(
          height: 10,
        ),
        Center(
            child: FutureBuilder<List<Categories>>(
          future: DropdownServices.getAll(_token),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: const Text('Select Category'),
                      value: _categories,
                      onChanged: (String? value) {
                        setState(() {
                          _categories = value!;
                        });
                      },
                      items: snapshot.data!
                          .map(
                              (Categories category) => DropdownMenuItem<String>(
                                    value: category.kategori!,
                                    child: Text(category.kategori!),
                                  ))
                          .toList(),
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController!,
            children: [
              ListAssets(token: _token),
              const Center(
                child: Text('Inspection'),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
