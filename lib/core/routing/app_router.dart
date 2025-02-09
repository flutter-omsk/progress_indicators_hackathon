import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:progress_indicators_hackathon/app/feature/martynov/martynov.dart';
import 'package:progress_indicators_hackathon/app/feature/progress_indicators/progress_indicators_screen.dart';
import 'package:progress_indicators_hackathon/app/feature/settings/presentation/settings_screen/settings_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

// TODO: Добавь свой роут в этот список
enum AppRoute {
  home('/'),
  settings('settings'),
  martynov('martynov'),
  ;

  const AppRoute(this.path);

  final String path;
}

final settingsRoute = GoRoute(
  path: AppRoute.settings.path,
  name: AppRoute.settings.name,
  builder: (_, __) => const SettingsScreen(),
);

// TODO: А потом в этот
final participantRoutes = [
  GoRoute(
    path: AppRoute.martynov.path,
    name: AppRoute.martynov.name,
    builder: (_, __) => const Martynov(),
  ),
];

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
