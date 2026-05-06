import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/core/extensions/string_extensions.dart';
import 'package:atheer/features/quran/domain/entities/ayah.dart';
import 'package:atheer/features/quran/presentation/bloc/mushaf/mushaf_cubit.dart';
import 'package:atheer/features/quran/presentation/bloc/mushaf/mushaf_state.dart';
import 'package:atheer/injection.dart';

/// Bottom sheet that lists all ayahs on the current Mushaf page.
/// Used to pick an ayah before opening tafsir or the note editor,
/// since the image-based mushaf view can't detect per-ayah taps.
class MushafAyahPickerSheet extends StatefulWidget {
  final int pageNumber;
  final String title;
  final void Function(Ayah ayah) onAyahSelected;

  const MushafAyahPickerSheet({
    super.key,
    required this.pageNumber,
    required this.title,
    required this.onAyahSelected,
  });

  @override
  State<MushafAyahPickerSheet> createState() => _MushafAyahPickerSheetState();
}

class _MushafAyahPickerSheetState extends State<MushafAyahPickerSheet> {
  late final MushafCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = sl<MushafCubit>();
    _cubit.loadPage(widget.pageNumber);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final text = isDark ? AppColors.darkText : AppColors.lightText;
    final accent = isDark ? AppColors.accentLight : AppColors.accent;
    final secondary =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return BlocProvider.value(
      value: _cubit,
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
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
                widget.title,
                style: GoogleFonts.tajawal(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: text,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'صفحة ${widget.pageNumber.toString().arabicNumber}',
                style: GoogleFonts.tajawal(fontSize: 12, color: secondary),
              ),
              const SizedBox(height: 10),
              Divider(
                height: 1,
                color: text.withValues(alpha: 0.08),
              ),
              Expanded(
                child: BlocBuilder<MushafCubit, MushafState>(
                  builder: (context, state) {
                    if (state is MushafLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: accent,
                          strokeWidth: 2,
                        ),
                      );
                    }
                    if (state is MushafError) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            state.message,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.tajawal(
                              fontSize: 13,
                              color: secondary,
                            ),
                          ),
                        ),
                      );
                    }
                    if (state is MushafLoaded) {
                      final ayahs = state.pageCache[widget.pageNumber] ?? [];
                      if (ayahs.isEmpty) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: accent,
                            strokeWidth: 2,
                          ),
                        );
                      }
                      return ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: ayahs.length,
                        separatorBuilder: (_, __) => Divider(
                          height: 1,
                          color: text.withValues(alpha: 0.05),
                        ),
                        itemBuilder: (context, index) {
                          final ayah = ayahs[index];
                          final preview = (ayah.textUthmani ?? ayah.text);
                          return ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              widget.onAyahSelected(ayah);
                            },
                            leading: Container(
                              width: 36,
                              height: 36,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: accent.withValues(alpha: 0.12),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                ayah.numberInSurah.toString().arabicNumber,
                                style: GoogleFonts.amiri(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: accent,
                                ),
                              ),
                            ),
                            title: Text(
                              preview,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.amiri(
                                fontSize: 16,
                                height: 1.8,
                                color: text,
                              ),
                            ),
                            subtitle: Text(
                              'آية ${ayah.numberInSurah.toString().arabicNumber} من سورة ${ayah.surahNumber.toString().arabicNumber}',
                              textDirection: TextDirection.rtl,
                              style: GoogleFonts.tajawal(
                                fontSize: 11,
                                color: secondary,
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
