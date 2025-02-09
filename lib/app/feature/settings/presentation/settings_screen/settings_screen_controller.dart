import 'package:flutter/material.dart';
import 'package:progress_indicators_hackathon/app/feature/settings/service/settings_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_screen_controller.g.dart';

@riverpod
class SettingsScreenController extends _$SettingsScreenController {
  @override
  FutureOr<ThemeMode> build() async => await loadSettings();

  Future<ThemeMode> loadSettings() async {
    final settingsService = ref.read(settingsServiceProvider);
    return settingsService.themeMode();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null || newThemeMode == state.value) return;

    state = AsyncData(newThemeMode);

    final settingsService = ref.read(settingsServiceProvider);

    await settingsService.updateThemeMode(newThemeMode);
  }
}
