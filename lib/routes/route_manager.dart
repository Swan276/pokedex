import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/presentation/pages/home/home_page.dart';
import 'package:pokedex/presentation/pages/not_found/not_found_page.dart';
import 'package:pokedex/presentation/pages/pokemon_details/pokemon_details_page.dart';
import 'package:pokedex/presentation/pages/splash/splash_screen.dart';
import 'package:pokedex/routes/routes.dart';

class RouteManager {
  RouteManager._();

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter get router {
    return GoRouter(
      navigatorKey: parentNavigatorKey,
      debugLogDiagnostics: true,
      // initialLocation: Routes.splash.path,
      // initialLocation: "${Routes.splash.path}?id=1",
      initialLocation: Routes.pokemonDetails.path.replaceAll(":id", "1"),
      // initialLocation: "/wrong-route/3",
      errorPageBuilder: (context, state) {
        return getPage(state: state, child: const NotFoundPage());
      },
      routes: routes,
    );
  }

  static final routes = <GoRoute>[
    GoRoute(
      path: "/pokemon-scanned/:id",
      redirect: (context, state) {
        final String? id = state.uri.queryParameters["id"];
        return "${Routes.splash.path}?id=$id";
      },
    ),
    GoRoute(
      path: Routes.splash.path,
      pageBuilder: (context, state) {
        // FlutterNativeSplash.remove();
        final String? id = state.uri.queryParameters["id"];
        return getPage(
          child: SplashScreen(
            id: id,
            routeTo: (id) {
              if (id != null) {
                context.go(Routes.pokemonDetails.path.replaceAll(":id", id));
              } else {
                context.go(Routes.home.path);
              }
            },
          ),
          state: state,
        );
      },
    ),
    GoRoute(
      path: Routes.home.path,
      pageBuilder: (context, state) {
        // FlutterNativeSplash.remove();
        return getFadeTransitionPage(
          child: const HomePage(),
          state: state,
        );
      },
    ),
    GoRoute(
      path: Routes.pokemonDetails.path,
      pageBuilder: (context, state) {
        final String id = state.pathParameters["id"]!;
        return getFadeTransitionPage(
          child: PokemonDetailsPage(id: id),
          state: state,
        );
      },
    ),
    GoRoute(
      path: Routes.unknown.path,
      pageBuilder: (context, state) {
        return getPage(
          child: const NotFoundPage(),
          state: state,
        );
      },
    ),
  ];

  static Page getPage({
    required GoRouterState state,
    required Widget child,
    bool fullscreenDialog = false,
  }) {
    return MaterialPage(
      key: state.pageKey,
      fullscreenDialog: fullscreenDialog,
      child: child,
    );
  }

  static Page getFadeTransitionPage({
    required GoRouterState state,
    required Widget child,
    bool fullscreenDialog = false,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
