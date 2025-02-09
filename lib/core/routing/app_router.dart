import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:progress_indicators_hackathon/app/feature/martynov/example.dart';
import 'package:progress_indicators_hackathon/app/feature/martynov/glitch.dart';
import 'package:progress_indicators_hackathon/app/feature/progress_indicators/progress_indicators_screen.dart';
import 'package:progress_indicators_hackathon/app/feature/settings/presentation/settings_screen/settings_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

// TODO: Добавь свой роут в этот список
enum AppRoute {
  home('/'),
  settings('settings'),
  glitch('glitch'),
  example('example'),
  ;

  const AppRoute(this.path);

  final String path;
}

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoute.home.path,
    routes: [
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (context, state) => const ProgressIndicatorsScreen(),
        routes: [
          settingsRoute,
          ...participantRoutes,
        ],
      ),
    ],
  );
}

final settingsRoute = GoRoute(
  path: AppRoute.settings.path,
  name: AppRoute.settings.name,
  builder: (_, __) => const SettingsScreen(),
);

// TODO: А потом в этот
final participantRoutes = [
  GoRoute(
    path: AppRoute.glitch.path,
    name: AppRoute.glitch.name,
    builder: (_, __) => const GlitchProgressIndicator(),
  ),
  GoRoute(
    path: AppRoute.example.path,
    name: AppRoute.example.name,
    builder: (_, __) => const Example(),
  ),
];
