import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/core/extensions/string_extensions.dart';
import 'package:atheer/features/quran/domain/entities/mushaf_metadata.dart';

class MushafIndexSheet extends StatelessWidget {
  final void Function(int page) onPageSelected;
  final int initialTabIndex;

  const MushafIndexSheet({
    super.key,
    required this.onPageSelected,
    this.initialTabIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final text = isDark ? AppColors.darkText : AppColors.lightText;
    final accent = isDark ? AppColors.accentLight : AppColors.accent;

    return DefaultTabController(
      length: 3,
      initialIndex: initialTabIndex,
      child: DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: text.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'فهرس المصحف',
                style: GoogleFonts.tajawal(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: text,
                ),
              ),
              const SizedBox(height: 10),
              TabBar(
                labelColor: accent,
                unselectedLabelColor: text.withValues(alpha: 0.6),
                indicatorColor: accent,
                labelStyle: GoogleFonts.tajawal(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: GoogleFonts.tajawal(fontSize: 14),
                tabs: const [
                  Tab(text: 'السور'),
                  Tab(text: 'الأجزاء'),
                  Tab(text: 'الأحزاب'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _SurahList(
                      scrollController: scrollController,
                      onTap: (page) {
                        Navigator.pop(context);
                        onPageSelected(page);
                      },
                      isDark: isDark,
                    ),
                    _NumberedList(
                      scrollController: scrollController,
                      count: MushafMetadata.juzStartPages.length,
                      labelBuilder: (i) => 'الجزء ${(i + 1).toString().arabicNumber}',
                      pageBuilder: (i) => MushafMetadata.juzStartPages[i],
                      onTap: (page) {
                        Navigator.pop(context);
                        onPageSelected(page);
                      },
                      isDark: isDark,
                    ),
                    _NumberedList(
                      scrollController: scrollController,
                      count: MushafMetadata.hizbStartPages.length,
                      labelBuilder: (i) => 'الحزب ${(i + 1).toString().arabicNumber}',
                      pageBuilder: (i) => MushafMetadata.hizbStartPages[i],
                      onTap: (page) {
                        Navigator.pop(context);
                        onPageSelected(page);
                      },
                      isDark: isDark,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SurahList extends StatelessWidget {
  final ScrollController scrollController;
  final void Function(int page) onTap;
  final bool isDark;

  const _SurahList({
    required this.scrollController,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final text = isDark ? AppColors.darkText : AppColors.lightText;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final accent = isDark ? AppColors.accentLight : AppColors.accent;

    return ListView.builder(
      controller: scrollController,
      itemCount: MushafMetadata.surahs.length,
      itemBuilder: (context, index) {
        final s = MushafMetadata.surahs[index];
        return ListTile(
          onTap: () => onTap(s.startPage),
          leading: Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Text(
              s.number.toString().arabicNumber,
              style: GoogleFonts.amiri(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: accent,
              ),
            ),
          ),
          title: Text(
            s.arabicName,
            textDirection: TextDirection.rtl,
            style: GoogleFonts.amiri(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: text,
            ),
          ),
          subtitle: Text(
            '${s.ayahCount.toString().arabicNumber} آية',
            textDirection: TextDirection.rtl,
            style: GoogleFonts.tajawal(fontSize: 12, color: secondary),
          ),
          trailing: Text(
            'ص ${s.startPage.toString().arabicNumber}',
            style: GoogleFonts.tajawal(
              fontSize: 12,
              color: secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }
}

class _NumberedList extends StatelessWidget {
  final ScrollController scrollController;
  final int count;
  final String Function(int index) labelBuilder;
  final int Function(int index) pageBuilder;
  final void Function(int page) onTap;
  final bool isDark;

  const _NumberedList({
    required this.scrollController,
    required this.count,
    required this.labelBuilder,
    required this.pageBuilder,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final text = isDark ? AppColors.darkText : AppColors.lightText;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final accent = isDark ? AppColors.accentLight : AppColors.accent;

    return ListView.builder(
      controller: scrollController,
      itemCount: count,
      itemBuilder: (context, index) {
        final page = pageBuilder(index);
        return ListTile(
          onTap: () => onTap(page),
          leading: Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Text(
              (index + 1).toString().arabicNumber,
              style: GoogleFonts.amiri(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: accent,
              ),
            ),
          ),
          title: Text(
            labelBuilder(index),
            textDirection: TextDirection.rtl,
            style: GoogleFonts.tajawal(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: text,
            ),
          ),
          trailing: Text(
            'ص ${page.toString().arabicNumber}',
            style: GoogleFonts.tajawal(
              fontSize: 12,
              color: secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }
}
