import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:atheer/features/settings/domain/entities/app_settings.dart';

abstract class SettingsLocalDataSource {
  Future<AppSettings> getSettings();
  Future<void> saveSettings(AppSettings settings);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences prefs;

  SettingsLocalDataSourceImpl(this.prefs);

  static const _themeKey = 'theme_mode';
  static const _fontSizeKey = 'font_size';
  static const _lastSurahKey = 'last_read_surah';
  static const _lastAyahKey = 'last_read_ayah';
  static const _lastPageKey = 'last_read_page';
  static const _reciterKey = 'selected_reciter';

  @override
  Future<AppSettings> getSettings() async {
    final themeModeIndex = prefs.getInt(_themeKey) ?? ThemeMode.system.index;
    return AppSettings(
      themeMode: ThemeMode.values[themeModeIndex],
      fontSize: prefs.getDouble(_fontSizeKey) ?? 24.0,
      lastReadSurah: prefs.getInt(_lastSurahKey) ?? 0,
      lastReadAyah: prefs.getInt(_lastAyahKey) ?? 0,
      lastReadPage: prefs.getInt(_lastPageKey) ?? 0,
      selectedReciter: prefs.getString(_reciterKey) ?? 'ar.alafasy',
    );
  }

  @override
  Future<void> saveSettings(AppSettings settings) async {
    await prefs.setInt(_themeKey, settings.themeMode.index);
    await prefs.setDouble(_fontSizeKey, settings.fontSize);
    await prefs.setInt(_lastSurahKey, settings.lastReadSurah);
    await prefs.setInt(_lastAyahKey, settings.lastReadAyah);
    await prefs.setInt(_lastPageKey, settings.lastReadPage);
    await prefs.setString(_reciterKey, settings.selectedReciter);
  }
}
