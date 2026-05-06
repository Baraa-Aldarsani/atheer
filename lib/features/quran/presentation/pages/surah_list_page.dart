import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/routes/route_names.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/core/widgets/loading_widget.dart';
import 'package:atheer/core/widgets/error_widget.dart';
import 'package:atheer/core/extensions/string_extensions.dart';
import 'package:atheer/features/quran/presentation/bloc/surah_list/surah_list_cubit.dart';
import 'package:atheer/features/quran/presentation/bloc/surah_list/surah_list_state.dart';
import 'package:atheer/features/quran/presentation/widgets/surah_tile.dart';
import 'package:atheer/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:atheer/features/settings/presentation/bloc/settings_state.dart';

class SurahListPage extends StatefulWidget {
  const SurahListPage({super.key});

  @override
  State<SurahListPage> createState() => _SurahListPageState();
}

class _ResumeReadingCard extends StatelessWidget {
  final int lastPage;
  final bool isDark;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  const _ResumeReadingCard({
    required this.lastPage,
    required this.isDark,
    required this.onTap,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final accent = isDark ? AppColors.accentLight : AppColors.accent;
    final navy = isDark ? AppColors.darkText : AppColors.primary;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: accent.withValues(alpha: 0.4), width: 1),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  accent.withValues(alpha: isDark ? 0.12 : 0.08),
                  navy.withValues(alpha: isDark ? 0.08 : 0.04),
                ],
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.menu_book_rounded, color: accent, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'استئناف القراءة',
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: navy,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'الصفحة ${lastPage.toString().arabicNumber}',
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.tajawal(
                          fontSize: 13,
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    size: 18,
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                  onPressed: onDismiss,
                  tooltip: 'إزالة',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SurahListPageState extends State<SurahListPage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SurahListCubit>().loadSurahs();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // ── Resume last read card ──
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            if (state is! SettingsLoaded) return const SizedBox.shrink();
            final lastPage = state.settings.lastReadPage;
            if (lastPage <= 0) return const SizedBox.shrink();
            return _ResumeReadingCard(
              lastPage: lastPage,
              isDark: isDark,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.mushaf,
                  arguments: {'page': lastPage},
                );
              },
              onDismiss: () {
                context.read<SettingsCubit>().saveLastRead(0, 0, 0);
              },
            );
          },
        ),
        // ── Search bar ──
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
          child: TextField(
            controller: _searchController,
            textDirection: TextDirection.rtl,
            style: GoogleFonts.tajawal(fontSize: 14),
            decoration: InputDecoration(
              hintText: 'ابحث عن سورة...',
              hintTextDirection: TextDirection.rtl,
              prefixIcon: Icon(
                Icons.search_rounded,
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                size: 20,
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        size: 18,
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                      ),
                      onPressed: () {
                        _searchController.clear();
                        context.read<SurahListCubit>().filterSurahs('');
                      },
                    )
                  : null,
            ),
            onChanged: (value) {
              context.read<SurahListCubit>().filterSurahs(value);
              setState(() {});
            },
          ),
        ),
        // ── Surah list ──
        Expanded(
          child: BlocBuilder<SurahListCubit, SurahListState>(
            builder: (context, state) {
              if (state is SurahListLoading) {
                return const LoadingWidget(message: 'جاري تحميل السور...');
              }

              if (state is SurahListError) {
                return AppErrorWidget(
                  message: state.message,
                  onRetry: () => context.read<SurahListCubit>().loadSurahs(),
                );
              }

              if (state is SurahListLoaded) {
                final surahs = state.displaySurahs;
                if (surahs.isEmpty) {
                  return Center(
                    child: Text(
                      'لم يتم العثور على نتائج',
                      style: GoogleFonts.tajawal(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: surahs.length,
                  padding: const EdgeInsets.only(top: 8, bottom: 80),
                  itemBuilder: (context, index) {
                    final surah = surahs[index];
                    return SurahTile(
                      surah: surah,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.reader,
                          arguments: {
                            'surahNumber': surah.number,
                            'surah': surah,
                          },
                        );
                      },
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
