// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marshather_app/presentation/screens/screens.dart';
import 'package:marshather_app/utils/services/services.dart';

enum Routes {
  rootAuth('/'),
  homePage('/home_page'),
  moreDaysPage('more_days_page'),
  searchPage('search_page');

  const Routes(this.path);
  final String path;
}

CustomTransitionPage createCustomTransitionPage({
  required Widget child,
  required RouteTransitionsBuilder transitionsBuilder,
  LocalKey? key,
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionsBuilder: transitionsBuilder,
  );
}

RouteTransitionsBuilder iosLikeTransitionBuilder() {
  return (context, animation, secondaryAnimation, child) {
    const begin = 0.0;
    const end = 1.0;
    const curve = Curves.easeInOut;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var opacityAnimation = animation.drive(tween);

    return FadeTransition(opacity: opacityAnimation, child: child);
  };
}

class AppRoute {
  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static late BuildContext context;

  static final GoRouter router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: Routes.homePage.path,
    routes: [
      GoRoute(
        path: Routes.homePage.path,
        name: Routes.homePage.name,
        pageBuilder: (context, state) => createCustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: iosLikeTransitionBuilder(),
        ),
        routes: <GoRoute>[
          GoRoute(
            path: Routes.moreDaysPage.path,
            name: Routes.moreDaysPage.name,
            pageBuilder: (context, state) => createCustomTransitionPage(
              key: state.pageKey,
              child: const MoreDaysScreen(),
              transitionsBuilder: iosLikeTransitionBuilder(),
            ),
          ),
          GoRoute(
            path: Routes.searchPage.path,
            name: Routes.searchPage.name,
            pageBuilder: (context, state) => createCustomTransitionPage(
              key: state.pageKey,
              child: const SearchScreen(),
              transitionsBuilder: iosLikeTransitionBuilder(),
            ),
          ),
        ],
      ),
    ],
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    // refreshListenable: GoRouterRefreshStream(sl<AuthenticationBloc>().stream),
  );
}
