import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  /// Premium Quranic text — generous line height, refined letter spacing.
  static TextStyle quranText({double fontSize = 26.0, Color? color}) {
    return GoogleFonts.amiri(
      fontSize: fontSize,
      height: 2.2,
      color: color ?? AppColors.lightText,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.3,
    );
  }

  /// Surah name in headers and tiles.
  static TextStyle surahName({double fontSize = 22.0, Color? color}) {
    return GoogleFonts.amiri(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color ?? AppColors.lightText,
      height: 1.4,
    );
  }

  /// Basmala — elegant, centered.
  static TextStyle bismillah({Color? color}) {
    return GoogleFonts.amiri(
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.accent,
      height: 1.8,
      letterSpacing: 0.5,
    );
  }

  /// UI body text — modern Arabic sans-serif.
  static TextStyle bodyText({Color? color}) {
    return GoogleFonts.tajawal(
      fontSize: 16.0,
      color: color ?? AppColors.lightText,
      fontWeight: FontWeight.w400,
      height: 1.6,
    );
  }

  /// Small caption text.
  static TextStyle caption({Color? color}) {
    return GoogleFonts.tajawal(
      fontSize: 12.0,
      color: color ?? AppColors.lightTextSecondary,
      fontWeight: FontWeight.w400,
    );
  }

  /// Section headings.
  static TextStyle heading({Color? color}) {
    return GoogleFonts.tajawal(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.lightText,
      height: 1.3,
    );
  }
}
