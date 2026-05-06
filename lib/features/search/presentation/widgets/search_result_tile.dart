import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/features/search/domain/entities/search_result.dart';

class SearchResultTile extends StatelessWidget {
  final SearchResult result;
  final String query;
  final VoidCallback onTap;

  const SearchResultTile({
    super.key,
    required this.result,
    required this.query,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;
    final borderColor = isDark
        ? const Color(0xFF2E3338)
        : AppColors.divider.withValues(alpha: 0.5);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Material(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderColor, width: 0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${result.surahName} - آية ${result.numberInSurah}',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: goldColor,
                  ),
                ),
                const SizedBox(height: 10),
                _buildHighlightedText(result.ayahText, query, isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightedText(String text, String query, bool isDark) {
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;
    final baseStyle = GoogleFonts.amiri(
      fontSize: 18,
      height: 1.9,
      color: isDark ? AppColors.darkText : AppColors.lightText,
    );

    if (query.isEmpty) {
      return Text(text, textDirection: TextDirection.rtl, style: baseStyle);
    }

    final spans = <TextSpan>[];
    int start = 0;

    while (true) {
      final index = text.indexOf(query, start);
      if (index == -1) {
        spans.add(TextSpan(text: text.substring(start)));
        break;
      }
      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index)));
      }
      spans.add(TextSpan(
        text: text.substring(index, index + query.length),
        style: TextStyle(
          backgroundColor: goldColor.withValues(alpha: 0.15),
          fontWeight: FontWeight.bold,
          color: goldColor,
        ),
      ));
      start = index + query.length;
    }

    return RichText(
      textDirection: TextDirection.rtl,
      text: TextSpan(style: baseStyle, children: spans),
    );
  }
}
