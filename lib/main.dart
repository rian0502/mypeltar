import 'package:flutter/material.dart';
import 'package:mypeltar/mypeltar_theme.dart';
import 'package:mypeltar/routes/app_route.dart';


void main() {
  runApp(const MyPeltar());
}

class MyPeltar extends StatefulWidget {
  const MyPeltar({Key? key}) : super(key: key);

  @override
  State<MyPeltar> createState() => _MyPeltarState();
}

class _MyPeltarState extends State<MyPeltar> {
  final AppRoute _appRoute = AppRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: MyPeltarTheme.light(),
      title: 'My Peltar',
      routerDelegate: _appRoute.router.routerDelegate,
      routeInformationParser: _appRoute.router.routeInformationParser,
      routeInformationProvider: _appRoute.router.routeInformationProvider,
    );
  }
}
