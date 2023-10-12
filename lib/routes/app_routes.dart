import 'package:drawer_menu/pages/form_page.dart';
import 'package:drawer_menu/pages/home_page.dart';
import 'package:drawer_menu/pages/preview_page.dart';
import 'package:drawer_menu/pages/profile_page.dart';
import 'package:go_router/go_router.dart';

final appRouterConfig = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/form',
        builder: (context, state) => const FormPage(),
      ),
      GoRoute(
        path: '/preview',
        builder: (context, state) => const PreviewPage(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );