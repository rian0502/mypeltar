import 'package:flutter/material.dart';
import 'package:mypeltar/models/maintenance.dart';
import 'package:mypeltar/services/maintenance_service.dart';
import 'package:provider/provider.dart';
import 'package:mypeltar/mypeltar_theme.dart';
import 'package:mypeltar/routes/app_route.dart';
import 'package:mypeltar/state_management/app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  MaintenanceService.getAll('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbXlwZWx0YXJfYmFja2VuZC50ZXN0L2FwaS92MS9hdXRoL2xvZ2luIiwiaWF0IjoxNjg3MDcxMjgwLCJleHAiOjE2ODczMzA0ODAsIm5iZiI6MTY4NzA3MTI4MCwianRpIjoicFQ5eHo3UzJqODRBMEtwNyIsInN1YiI6IjMiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.fbD4Rv4rUnS4nqFm67_nmR7g4ff6lnOEcvby4sK6I1o')
      .then((value) => print(value));
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final appStateManager = AppState(sharedPreferences);
  appStateManager.initializeApp();
  runApp(MyPeltar(
    appStateManager: appStateManager,
  ));
}

class MyPeltar extends StatefulWidget {
  final AppState appStateManager;
  const MyPeltar({Key? key, required this.appStateManager}) : super(key: key);

  @override
  State<MyPeltar> createState() => _MyPeltarState();
}

class _MyPeltarState extends State<MyPeltar> {
  late final AppRoute _appRoute = AppRoute(widget.appStateManager);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => widget.appStateManager),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: MyPeltarTheme.light(),
          title: 'My Peltar',
          routerDelegate: _appRoute.router.routerDelegate,
          routeInformationParser: _appRoute.router.routeInformationParser,
          routeInformationProvider: _appRoute.router.routeInformationProvider,
        )
    );
  }
}
