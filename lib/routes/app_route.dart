

import 'dart:async';

import 'package:go_router/go_router.dart';

import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';

class AppRoute{

  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) =>  SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
    redirect: (context, state){
      return null;
    }

  );
}