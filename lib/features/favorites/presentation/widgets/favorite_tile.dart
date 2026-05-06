import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/features/favorites/domain/entities/favorite.dart';

class FavoriteTile extends StatelessWidget {
  final Favorite favorite;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const FavoriteTile({
    super.key,
    required this.favorite,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;
    final borderColor = isDark
        ? const Color(0xFF2E3338)
        : AppColors.divider.withValues(alpha: 0.5);

    return Dismissible(
      key: Key('fav_${favorite.id}'),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onRemove(),
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 24),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.delete_rounded, color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Material(
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor, width: 0.5),
              ),
              child: Row(
                children: [
                  Icon(Icons.favorite_rounded, color: goldColor, size: 20),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          favorite.surahName ?? 'سورة ${favorite.surahNumber}',
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: isDark ? AppColors.darkText : AppColors.lightText,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'آية ${favorite.numberInSurah ?? favorite.ayahNumber}',
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.tajawal(
                            fontSize: 12,
                            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (favorite.ayahText != null)
                    Expanded(
                      child: Text(
                        favorite.ayahText!.substring(0, favorite.ayahText!.length.clamp(0, 30)),
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: GoogleFonts.amiri(
                          fontSize: 14,
                          color: isDark ? AppColors.darkText : AppColors.lightText,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
