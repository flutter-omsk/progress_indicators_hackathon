import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress_indicators_hackathon/app/feature/settings/presentation/settings_screen/settings_screen_controller.dart';
import 'package:progress_indicators_hackathon/core/localization/localizations_x.dart';
import 'package:progress_indicators_hackathon/core/routing/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final settingsController = ref.watch(settingsScreenControllerProvider);
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.greenAccent);
    final colorSchemeDark = ColorScheme.fromSeed(
      seedColor: Colors.greenAccent,
      brightness: Brightness.dark,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      routerConfig: goRouter,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', ''),
        Locale('en', ''),
      ],
      onGenerateTitle: (context) => context.l10n.appTitle,
      theme: ThemeData(
        colorScheme: colorScheme,
      ),
      darkTheme: ThemeData(
        colorScheme: colorSchemeDark,
      ),
      themeMode: settingsController.value,
    );
  }
}
