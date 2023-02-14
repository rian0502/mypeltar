import 'package:flutter/material.dart';
import 'package:mypeltar/mypeltar_theme.dart';
import 'package:mypeltar/routes/app_route.dart';
import 'package:mypeltar/state_management/app_state.dart';
import 'package:mypeltar/state_management/login_state.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final appStateManager = AppState(sharedPreferences);
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
  final AppRoute _appRoute = AppRoute();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create:(context) => widget.appStateManager),
          ChangeNotifierProvider(create:(context) => LoginState())
        ],
        child: MaterialApp.router(
          theme: MyPeltarTheme.light(),
          title: 'My Peltar',
          routerDelegate: _appRoute.router.routerDelegate,
          routeInformationParser: _appRoute.router.routeInformationParser,
          routeInformationProvider: _appRoute.router.routeInformationProvider,
        ));
  }
}
