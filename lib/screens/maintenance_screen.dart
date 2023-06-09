import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({Key? key}) : super(key: key);

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  String? idCategories;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      setState(() {});
    });
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
          width: 350,
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
                text: 'Report',
              ),
              Tab(
                text: 'Proces',
              ),
              Tab(
                text: 'Maintained',
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController!,
            children: const [
              Center(
                child: Text('Report'),
              ),
              Center(
                child: Text('Process'),
              ),
              Center(
                child: Text('Maintained'),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
