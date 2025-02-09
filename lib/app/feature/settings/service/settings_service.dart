import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_service.g.dart';

class SettingsService {
  static const String _themeModeKey = 'theme_mode';

  Future<ThemeMode> themeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeMode = prefs.getString(_themeModeKey);

    if (themeMode != null) {
      return ThemeMode.values.firstWhere((e) => e.name == themeMode);
    }

    return ThemeMode.system;
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, theme.name);
  }
}

@Riverpod(keepAlive: true)
SettingsService settingsService(SettingsServiceRef ref) {
  return SettingsService();
}
