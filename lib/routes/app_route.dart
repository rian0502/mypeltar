import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mypeltar/models/maintenance.dart';
import 'package:mypeltar/screens/detail_maintenance.dart';
import 'package:mypeltar/screens/form_inspection_screen.dart';
import 'package:mypeltar/screens/inspection_report_screen.dart';
import 'package:mypeltar/screens/maintenance_screen.dart';
import 'package:mypeltar/screens/scanner_screens.dart';
import 'package:mypeltar/state_management/app_state.dart';
import '../screens/about_screen.dart';
import '../screens/assets_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/splash_screen.dart';

class AppRoute {
  final AppState? appState;
  AppRoute(this.appState);

  late final router = GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: appState,
      initialLocation: '/splash',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
            path: '/view',
            name: 'view',
            builder: (context, state) => const InspectionReport()),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/detail-asset',
          name: '/detail-asset',
          builder: (context, state) {
            String? id = state.extra as String;
            return AboutScreen(
              id: id,
            );
          },
        ),
        GoRoute(
            path: '/maintenance/detail',
            name: '/maintenance/detail',
            builder: (context, state) {
              Maintenance maintenance = state.extra as Maintenance;
              return DetailMaintenance(maintenance: maintenance,);
            }),
        GoRoute(
          name: '/form-insepction',
          path: '/form-insepction',
          builder: (context, state) {
            String? id = state.extra as String;
            return FormInspection(
              id: id,
            );
          },
        ),
        GoRoute(
          name: 'home',
          path: '/:tab',
          builder: (context, state) {
            final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
            return Home(key: state.pageKey, currentTab: tab);
          },
          routes: [
            GoRoute(
              name: 'notification',
              path: 'notification',
              builder: (context, state) {
                final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
                return NotificationScreen(
                  currentTab: tab,
                );
              },
            ),
            GoRoute(
                path: 'scan',
                name: 'scan',
                builder: (context, state) {
                  return const ScannerScreen();
                }),
            GoRoute(
                path: 'inspection',
                name: 'inspection',
                builder: (context, state) => const Placeholder()),
            GoRoute(
                path: 'maintenance',
                name: 'maintenance',
                builder: (context, state) => const MaintenanceScreen()),
            GoRoute(
                path: 'assets',
                name: 'assets',
                builder: (context, state) => const AssetsScreens()),
          ],
        ),
      ],
      redirect: (context, state) {
        if (state.subloc == '/login') {
          return appState!.isLogin ? '/home' : '/login';
        }
        return null;
      });
}
