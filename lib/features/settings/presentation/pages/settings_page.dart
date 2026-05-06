import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/core/constants/app_constants.dart';
import 'package:atheer/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:atheer/features/settings/presentation/bloc/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final goldColor = isDark ? AppColors.accentLight : AppColors.accent;
    final borderColor = isDark
        ? const Color(0xFF2E3338)
        : AppColors.divider.withValues(alpha: 0.5);

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoaded) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // ── Theme ──
              Container(
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor, width: 0.5),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  leading: Icon(
                    isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                    color: goldColor,
                  ),
                  title: Text('المظهر',
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.tajawal(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    isDark ? 'الوضع الداكن' : 'الوضع الفاتح',
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.tajawal(
                      fontSize: 13,
                      color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                    ),
                  ),
                  trailing: Switch(
                    value: state.settings.themeMode == ThemeMode.dark,
                    onChanged: (_) => context.read<SettingsCubit>().toggleTheme(),
                    activeTrackColor: AppColors.accent,
                    activeThumbColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // ── Font size ──
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor, width: 0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.text_fields_rounded, color: goldColor),
                        const SizedBox(width: 12),
                        Text('حجم الخط',
                          style: GoogleFonts.tajawal(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Text(
                          '${state.settings.fontSize.toInt()}',
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w700,
                            color: goldColor,
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: goldColor,
                        inactiveTrackColor: isDark
                            ? const Color(0xFF2E3338)
                            : AppColors.divider,
                        thumbColor: goldColor,
                        trackHeight: 3,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
                      ),
                      child: Slider(
                        value: state.settings.fontSize,
                        min: AppConstants.minFontSize,
                        max: AppConstants.maxFontSize,
                        divisions: 12,
                        onChanged: (value) {
                          context.read<SettingsCubit>().setFontSize(value);
                        },
                      ),
                    ),
                    // Preview
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkSurfaceVariant
                            : AppColors.lightSurfaceVariant,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.amiri(
                          fontSize: state.settings.fontSize,
                          color: isDark ? AppColors.darkText : AppColors.lightText,
                          height: 1.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // ── About ──
              Container(
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor, width: 0.5),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  leading: Icon(Icons.info_outline_rounded, color: goldColor),
                  title: Text('عن التطبيق',
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.tajawal(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'أثير - تطبيق القرآن الكريم v1.0.0',
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.tajawal(
                      fontSize: 13,
                      color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
