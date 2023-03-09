import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
          child: Text(
            'Maintenance',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Color(0xff1E3A8A),
              fontWeight: FontWeight.w700,
            ),
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
            // give the indicator a decoration (color and border radius)
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25.0,
              ),
              color: Color(0xff1E3A8A),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: const [
              // first tab [you can add an icon using the icon property]
              Tab(
                text: 'Assets',
              ),

              // second tab [you can add an icon using the icon property]
              Tab(
                text: 'Inspection',
              ),
            ],
          ),
        ),
        // tab bar view here
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
