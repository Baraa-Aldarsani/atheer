import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';

class BismillahWidget extends StatelessWidget {
  const BismillahWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 40),
      child: Column(
        children: [
          // Top decorative line
          _GoldDivider(color: goldColor),
          const SizedBox(height: 20),
          // Basmala
          Text(
            'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: GoogleFonts.amiri(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: goldColor,
              height: 1.8,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 20),
          // Bottom decorative line
          _GoldDivider(color: goldColor),
        ],
      ),
    );
  }
}

class _GoldDivider extends StatelessWidget {
  final Color color;
  const _GoldDivider({required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withValues(alpha: 0.0),
                  color.withValues(alpha: 0.5),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(Icons.diamond_outlined, size: 8, color: color.withValues(alpha: 0.6)),
        ),
        Expanded(
          child: Container(
            height: 0.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withValues(alpha: 0.5),
                  color.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
