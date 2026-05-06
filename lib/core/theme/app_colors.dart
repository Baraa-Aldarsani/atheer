import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ──── Brand Colors (matched to logo) ────
  static const Color primary = Color(0xFF0D5E37);
  static const Color primaryLight = Color(0xFF14794A);
  static const Color primaryDark = Color(0xFF073D22);

  // ──── Accent: الخردلي الذهبي ────
  static const Color accent = Color(0xFFC08329);
  static const Color accentLight = Color(0xFFD4993D);
  static const Color accentDark = Color(0xFFA06F20);

  // ──── Light Theme: Warm Minimalist ────
  static const Color lightBackground = Color(0xFFF9F7F2);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFF0EDE6);
  static const Color lightText = Color(0xFF1C1C1E);
  static const Color lightTextSecondary = Color(0xFF8A8A8E);

  // ──── Dark Theme: Elegant Dark ────
  static const Color darkBackground = Color(0xFF111517);
  static const Color darkSurface = Color(0xFF1C1F23);
  static const Color darkSurfaceVariant = Color(0xFF252A2E);
  static const Color darkText = Color(0xFFECE8E1);
  static const Color darkTextSecondary = Color(0xFF7A7E85);

  // ──── Quran Specific ────
  static const Color ayahHighlight = Color(0x18C08329);
  static const Color ayahNumber = Color(0xFFC08329);
  static const Color surahHeader = Color(0xFF0D5E37);
  static const Color divider = Color(0xFFE5E0D8);

  // ──── Mushaf Specific ────
  static const Color mushafBackground = lightBackground;
  static const Color mushafPage = lightSurface;
  static const Color mushafText = lightText;
  static const Color mushafDarkBackground = darkBackground;
  static const Color mushafDarkPage = darkSurface;
}
