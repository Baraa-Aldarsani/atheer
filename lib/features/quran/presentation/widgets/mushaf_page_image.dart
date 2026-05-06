import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';

class MushafPageTheme {
  final String name;
  final Color background;

  const MushafPageTheme({required this.name, required this.background});

  static const List<MushafPageTheme> presets = [
    MushafPageTheme(name: 'كريمي', background: Color(0xFFF8F4ED)),
    MushafPageTheme(name: 'بيج', background: Color(0xFFF1E4C7)),
    MushafPageTheme(name: 'أخضر فاتح', background: Color(0xFFE7F0E3)),
    MushafPageTheme(name: 'أبيض', background: Color(0xFFFFFFFF)),
  ];
}

class MushafPageImage extends StatelessWidget {
  final int pageNumber;
  final String baseDir;
  final MushafPageTheme pageTheme;

  const MushafPageImage({
    super.key,
    required this.pageNumber,
    required this.baseDir,
    required this.pageTheme,
  });

  String get _path => '$baseDir/$pageNumber.jpg';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.mushafDarkBackground : pageTheme.background;
    final accent = isDark ? AppColors.accentLight : AppColors.accent;

    return Container(
      color: bg,
      alignment: Alignment.center,
      child: InteractiveViewer(
        minScale: 1.0,
        maxScale: 4.0,
        child: SizedBox.expand(
          child: Image.file(
            File(_path),
            fit: BoxFit.fill,
            alignment: Alignment.center,
            filterQuality: FilterQuality.high,
            gaplessPlayback: true,
            errorBuilder: (_, __, ___) => Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.broken_image_rounded, color: accent, size: 48),
                  const SizedBox(height: 12),
                  Text(
                    'تعذّر فتح صفحة $pageNumber',
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.tajawal(
                      fontSize: 14,
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
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
