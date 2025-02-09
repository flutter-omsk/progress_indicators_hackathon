import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress_indicators_hackathon/app/feature/settings/presentation/settings_screen/settings_screen_controller.dart';
import 'package:progress_indicators_hackathon/core/localization/localizations_x.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsScreenControllerProvider);
    final controller = ref.read(settingsScreenControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: state.value,
          alignment: AlignmentDirectional.topStart,
          onChanged: controller.updateThemeMode,
          items: [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text(context.l10n.settingsSystemTheme),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text(context.l10n.settingsLightTheme),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text(context.l10n.settingsDarkTheme),
            ),
          ],
        ),
      ),
    );
  }
}
