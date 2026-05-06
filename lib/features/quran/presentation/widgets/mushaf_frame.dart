import 'package:flutter/material.dart';
import 'package:atheer/core/theme/app_colors.dart';

class MushafFrame extends StatelessWidget {
  final Widget child;

  const MushafFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderBase = isDark ? AppColors.primaryLight : AppColors.primary;
    final innerBorder = borderBase.withValues(alpha: isDark ? 0.35 : 0.40);
    final outerBorder = borderBase.withValues(alpha: isDark ? 0.18 : 0.22);
    final bgColor = isDark ? AppColors.mushafDarkPage : AppColors.mushafPage;
    final outerBg = isDark ? AppColors.mushafDarkBackground : AppColors.mushafBackground;

    return Container(
      color: outerBg,
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: outerBorder, width: 1.5),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: innerBorder, width: 0.8),
            borderRadius: BorderRadius.circular(2),
          ),
          child: child,
        ),
      ),
    );
  }
}
