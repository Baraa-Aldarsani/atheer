import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/core/extensions/string_extensions.dart';

class SurahHeaderOrnament extends StatelessWidget {
  final String surahName;
  final int surahNumber;
  final int ayahCount;
  final bool showBismillah;

  const SurahHeaderOrnament({
    super.key,
    required this.surahName,
    required this.surahNumber,
    required this.ayahCount,
    this.showBismillah = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final ornamentColor = isDark ? AppColors.primaryLight : AppColors.primary;
    final bgColor = isDark
        ? AppColors.primaryLight.withValues(alpha: 0.06)
        : AppColors.primary.withValues(alpha: 0.03);
    final borderColor = ornamentColor.withValues(alpha: 0.35);
    final textColor = isDark ? AppColors.darkText : AppColors.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      child: Column(
        children: [
          // ──── Ornamental Surah Header ────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor, width: 1),
            ),
            child: Column(
              children: [
                // Top gold accent line
                Container(
                  width: 40,
                  height: 2,
                  decoration: BoxDecoration(
                    color: ornamentColor.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                const SizedBox(height: 12),
                // Surah name
                Text(
                  'سُورَةُ $surahName',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.amiri(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                // Ayah count
                Text(
                  '${ayahCount.toString().arabicNumber} آيات',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.tajawal(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ornamentColor,
                  ),
                ),
                const SizedBox(height: 10),
                // Bottom gold accent line
                Container(
                  width: 40,
                  height: 2,
                  decoration: BoxDecoration(
                    color: ornamentColor.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ],
            ),
          ),
          // ──── Bismillah ────
          if (showBismillah && surahNumber != 1 && surahNumber != 9)
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 4),
              child: Text(
                'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: GoogleFonts.amiri(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: ornamentColor,
                  height: 1.6,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
