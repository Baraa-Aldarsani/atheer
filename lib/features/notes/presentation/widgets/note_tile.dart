import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/features/notes/domain/entities/note.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  final String searchQuery;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const NoteTile({
    super.key,
    required this.note,
    this.searchQuery = '',
    required this.onTap,
    required this.onDelete,
  });

  String _formatDate(DateTime date) {
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}'
        ' ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;
    final borderColor = isDark
        ? const Color(0xFF2E3338)
        : AppColors.divider.withValues(alpha: 0.5);

    return Dismissible(
      key: Key('note_${note.id}'),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
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
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor, width: 0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.edit_note_rounded, color: goldColor, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        'سورة ${note.surahNumber} - آية ${note.ayahNumber}',
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.tajawal(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: goldColor,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        _formatDate(note.updatedAt),
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.tajawal(
                          fontSize: 11,
                          color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  searchQuery.isNotEmpty
                      ? _buildHighlightedText(note.content, searchQuery, isDark)
                      : Text(
                          note.content,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.tajawal(
                            fontSize: 14,
                            color: isDark ? AppColors.darkText : AppColors.lightText,
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

  Widget _buildHighlightedText(String text, String query, bool isDark) {
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;
    if (query.isEmpty) {
      return Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.rtl,
      );
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
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.rtl,
      text: TextSpan(
        style: GoogleFonts.tajawal(
          color: isDark ? AppColors.darkText : AppColors.lightText,
          fontSize: 14,
        ),
        children: spans,
      ),
    );
  }
}
