import 'package:go_router/go_router.dart';
import 'package:mypeltar/screens/scanner_screens.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/splash_screen.dart';

class AppRoute {
  late final router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/splash',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
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
          ],
        ),
      ],
      redirect: (context, state) {
        return null;
      });
}
