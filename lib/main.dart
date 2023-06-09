import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mypeltar/mypeltar_theme.dart';
import 'package:mypeltar/routes/app_route.dart';
import 'package:mypeltar/state_management/app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

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
