import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppSettings extends Equatable {
  final ThemeMode themeMode;
  final double fontSize;
  final int lastReadSurah;
  final int lastReadAyah;
  final int lastReadPage;
  final String selectedReciter;

  const AppSettings({
    this.themeMode = ThemeMode.system,
    this.fontSize = 24.0,
    this.lastReadSurah = 0,
    this.lastReadAyah = 0,
    this.lastReadPage = 0,
    this.selectedReciter = 'ar.alafasy',
  });

  AppSettings copyWith({
    ThemeMode? themeMode,
    double? fontSize,
    int? lastReadSurah,
    int? lastReadAyah,
    int? lastReadPage,
    String? selectedReciter,
  }) {
    return AppSettings(
      themeMode: themeMode ?? this.themeMode,
      fontSize: fontSize ?? this.fontSize,
      lastReadSurah: lastReadSurah ?? this.lastReadSurah,
      lastReadAyah: lastReadAyah ?? this.lastReadAyah,
      lastReadPage: lastReadPage ?? this.lastReadPage,
      selectedReciter: selectedReciter ?? this.selectedReciter,
    );
  }

  @override
  List<Object> get props => [themeMode, fontSize, lastReadSurah, lastReadAyah, lastReadPage, selectedReciter];
}
