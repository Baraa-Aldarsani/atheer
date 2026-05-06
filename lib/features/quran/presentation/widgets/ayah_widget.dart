import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/core/extensions/string_extensions.dart';

class AyahWidget extends StatelessWidget {
  final int ayahNumber;
  final int numberInSurah;
  final String text;
  final double fontSize;
  final bool isHighlighted;
  final bool isFavorite;
  final bool hasNote;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onFavoriteToggle;

  const AyahWidget({
    super.key,
    required this.ayahNumber,
    required this.numberInSurah,
    required this.text,
    this.fontSize = 26.0,
    this.isHighlighted = false,
    this.isFavorite = false,
    this.hasNote = false,
    this.onTap,
    this.onLongPress,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;
    final textColor = isDark ? AppColors.darkText : AppColors.lightText;
    final secondaryColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final highlightColor = isDark
        ? AppColors.accent.withValues(alpha: 0.08)
        : AppColors.accent.withValues(alpha: 0.06);
    final separatorColor = isDark
        ? const Color(0xFF2E3338)
        : AppColors.divider;

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
        decoration: BoxDecoration(
          color: isHighlighted ? highlightColor : null,
          border: Border(
            bottom: BorderSide(color: separatorColor, width: 0.5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ──── Quranic text: the star of the show ────
            Text(
              text,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.amiri(
                fontSize: fontSize,
                height: 2.2,
                color: textColor,
                fontWeight: FontWeight.normal,
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 14),
            // ──── Minimal action row ────
            Row(
              children: [
                // Actions (left side in RTL)
                if (onFavoriteToggle != null)
                  _ActionIcon(
                    icon: isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: isFavorite ? AppColors.accent : secondaryColor,
                    onTap: onFavoriteToggle,
                    size: 18,
                  ),
                if (hasNote)
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Icon(
                      Icons.edit_note_rounded,
                      color: goldColor,
                      size: 18,
                    ),
                  ),
                const Spacer(),
                // Verse number badge (right side in RTL)
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: goldColor.withValues(alpha: 0.4), width: 1.2),
                  ),
                  child: Center(
                    child: Text(
                      numberInSurah.toString().arabicNumber,
                      style: GoogleFonts.amiri(
                        color: goldColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  final double size;

  const _ActionIcon({
    required this.icon,
    required this.color,
    this.onTap,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(icon, color: color, size: size),
      ),
    );
  }
}
