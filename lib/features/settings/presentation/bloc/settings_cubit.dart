import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/features/settings/domain/usecases/get_settings.dart';
import 'package:atheer/features/settings/domain/usecases/update_settings.dart';
import 'package:atheer/features/settings/presentation/bloc/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetSettings getSettings;
  final UpdateSettings updateSettings;

  SettingsCubit({
    required this.getSettings,
    required this.updateSettings,
  }) : super(SettingsInitial());

  Future<void> loadSettings() async {
    final settings = await getSettings();
    emit(SettingsLoaded(settings));
  }

  Future<void> toggleTheme() async {
    final currentState = state;
    if (currentState is SettingsLoaded) {
      final newMode = currentState.settings.themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
      final newSettings = currentState.settings.copyWith(themeMode: newMode);
      await updateSettings(newSettings);
      emit(SettingsLoaded(newSettings));
    }
  }

  Future<void> setFontSize(double size) async {
    final currentState = state;
    if (currentState is SettingsLoaded) {
      final newSettings = currentState.settings.copyWith(fontSize: size);
      await updateSettings(newSettings);
      emit(SettingsLoaded(newSettings));
    }
  }

  Future<void> saveLastRead(int surahNumber, int ayahNumber, int page) async {
    final currentState = state;
    if (currentState is SettingsLoaded) {
      final newSettings = currentState.settings.copyWith(
        lastReadSurah: surahNumber,
        lastReadAyah: ayahNumber,
        lastReadPage: page,
      );
      await updateSettings(newSettings);
      emit(SettingsLoaded(newSettings));
    }
  }

  Future<void> setReciter(String reciterId) async {
    final currentState = state;
    if (currentState is SettingsLoaded) {
      final newSettings = currentState.settings.copyWith(selectedReciter: reciterId);
      await updateSettings(newSettings);
      emit(SettingsLoaded(newSettings));
    }
  }
}
