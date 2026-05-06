import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/core/extensions/string_extensions.dart';
import 'package:atheer/features/quran/domain/entities/ayah.dart';
import 'package:atheer/features/quran/presentation/widgets/surah_header_ornament.dart';

/// Surah metadata for displaying headers within a page.
class _SurahInfo {
  final int number;
  final String name;
  final int ayahCount;

  const _SurahInfo({
    required this.number,
    required this.name,
    required this.ayahCount,
  });
}

/// Maps surah numbers to their Arabic names and ayah counts.
/// Only includes surahs that commonly start on Mushaf pages.
const Map<int, _SurahInfo> _surahMetadata = {
  1: _SurahInfo(number: 1, name: 'الفَاتِحَة', ayahCount: 7),
  2: _SurahInfo(number: 2, name: 'البَقَرَة', ayahCount: 286),
  3: _SurahInfo(number: 3, name: 'آل عِمرَان', ayahCount: 200),
  4: _SurahInfo(number: 4, name: 'النِّسَاء', ayahCount: 176),
  5: _SurahInfo(number: 5, name: 'المَائِدَة', ayahCount: 120),
  6: _SurahInfo(number: 6, name: 'الأَنعَام', ayahCount: 165),
  7: _SurahInfo(number: 7, name: 'الأَعرَاف', ayahCount: 206),
  8: _SurahInfo(number: 8, name: 'الأَنفَال', ayahCount: 75),
  9: _SurahInfo(number: 9, name: 'التَّوبَة', ayahCount: 129),
  10: _SurahInfo(number: 10, name: 'يُونُس', ayahCount: 109),
  11: _SurahInfo(number: 11, name: 'هُود', ayahCount: 123),
  12: _SurahInfo(number: 12, name: 'يُوسُف', ayahCount: 111),
  13: _SurahInfo(number: 13, name: 'الرَّعد', ayahCount: 43),
  14: _SurahInfo(number: 14, name: 'إبرَاهِيم', ayahCount: 52),
  15: _SurahInfo(number: 15, name: 'الحِجر', ayahCount: 99),
  16: _SurahInfo(number: 16, name: 'النَّحل', ayahCount: 128),
  17: _SurahInfo(number: 17, name: 'الإسرَاء', ayahCount: 111),
  18: _SurahInfo(number: 18, name: 'الكَهف', ayahCount: 110),
  19: _SurahInfo(number: 19, name: 'مَريَم', ayahCount: 98),
  20: _SurahInfo(number: 20, name: 'طه', ayahCount: 135),
  21: _SurahInfo(number: 21, name: 'الأَنبيَاء', ayahCount: 112),
  22: _SurahInfo(number: 22, name: 'الحَجّ', ayahCount: 78),
  23: _SurahInfo(number: 23, name: 'المُؤمِنُون', ayahCount: 118),
  24: _SurahInfo(number: 24, name: 'النُّور', ayahCount: 64),
  25: _SurahInfo(number: 25, name: 'الفُرقَان', ayahCount: 77),
  26: _SurahInfo(number: 26, name: 'الشُّعَرَاء', ayahCount: 227),
  27: _SurahInfo(number: 27, name: 'النَّمل', ayahCount: 93),
  28: _SurahInfo(number: 28, name: 'القَصَص', ayahCount: 88),
  29: _SurahInfo(number: 29, name: 'العَنكَبُوت', ayahCount: 69),
  30: _SurahInfo(number: 30, name: 'الرُّوم', ayahCount: 60),
  31: _SurahInfo(number: 31, name: 'لُقمَان', ayahCount: 34),
  32: _SurahInfo(number: 32, name: 'السَّجدَة', ayahCount: 30),
  33: _SurahInfo(number: 33, name: 'الأَحزَاب', ayahCount: 73),
  34: _SurahInfo(number: 34, name: 'سَبَأ', ayahCount: 54),
  35: _SurahInfo(number: 35, name: 'فَاطِر', ayahCount: 45),
  36: _SurahInfo(number: 36, name: 'يس', ayahCount: 83),
  37: _SurahInfo(number: 37, name: 'الصَّافَّات', ayahCount: 182),
  38: _SurahInfo(number: 38, name: 'ص', ayahCount: 88),
  39: _SurahInfo(number: 39, name: 'الزُّمَر', ayahCount: 75),
  40: _SurahInfo(number: 40, name: 'غَافِر', ayahCount: 85),
  41: _SurahInfo(number: 41, name: 'فُصِّلَت', ayahCount: 54),
  42: _SurahInfo(number: 42, name: 'الشُّورَىٰ', ayahCount: 53),
  43: _SurahInfo(number: 43, name: 'الزُّخرُف', ayahCount: 89),
  44: _SurahInfo(number: 44, name: 'الدُّخَان', ayahCount: 59),
  45: _SurahInfo(number: 45, name: 'الجَاثِيَة', ayahCount: 37),
  46: _SurahInfo(number: 46, name: 'الأَحقَاف', ayahCount: 35),
  47: _SurahInfo(number: 47, name: 'مُحَمَّد', ayahCount: 38),
  48: _SurahInfo(number: 48, name: 'الفَتح', ayahCount: 29),
  49: _SurahInfo(number: 49, name: 'الحُجُرَات', ayahCount: 18),
  50: _SurahInfo(number: 50, name: 'ق', ayahCount: 45),
  51: _SurahInfo(number: 51, name: 'الذَّارِيَات', ayahCount: 60),
  52: _SurahInfo(number: 52, name: 'الطُّور', ayahCount: 49),
  53: _SurahInfo(number: 53, name: 'النَّجم', ayahCount: 62),
  54: _SurahInfo(number: 54, name: 'القَمَر', ayahCount: 55),
  55: _SurahInfo(number: 55, name: 'الرَّحمَٰن', ayahCount: 78),
  56: _SurahInfo(number: 56, name: 'الوَاقِعَة', ayahCount: 96),
  57: _SurahInfo(number: 57, name: 'الحَدِيد', ayahCount: 29),
  58: _SurahInfo(number: 58, name: 'المُجَادَلَة', ayahCount: 22),
  59: _SurahInfo(number: 59, name: 'الحَشر', ayahCount: 24),
  60: _SurahInfo(number: 60, name: 'المُمتَحَنَة', ayahCount: 13),
  61: _SurahInfo(number: 61, name: 'الصَّفّ', ayahCount: 14),
  62: _SurahInfo(number: 62, name: 'الجُمُعَة', ayahCount: 11),
  63: _SurahInfo(number: 63, name: 'المُنَافِقُون', ayahCount: 11),
  64: _SurahInfo(number: 64, name: 'التَّغَابُن', ayahCount: 18),
  65: _SurahInfo(number: 65, name: 'الطَّلَاق', ayahCount: 12),
  66: _SurahInfo(number: 66, name: 'التَّحرِيم', ayahCount: 12),
  67: _SurahInfo(number: 67, name: 'المُلك', ayahCount: 30),
  68: _SurahInfo(number: 68, name: 'القَلَم', ayahCount: 52),
  69: _SurahInfo(number: 69, name: 'الحَاقَّة', ayahCount: 52),
  70: _SurahInfo(number: 70, name: 'المَعَارِج', ayahCount: 44),
  71: _SurahInfo(number: 71, name: 'نُوح', ayahCount: 28),
  72: _SurahInfo(number: 72, name: 'الجِنّ', ayahCount: 28),
  73: _SurahInfo(number: 73, name: 'المُزَّمِّل', ayahCount: 20),
  74: _SurahInfo(number: 74, name: 'المُدَّثِّر', ayahCount: 56),
  75: _SurahInfo(number: 75, name: 'القِيَامَة', ayahCount: 40),
  76: _SurahInfo(number: 76, name: 'الإنسَان', ayahCount: 31),
  77: _SurahInfo(number: 77, name: 'المُرسَلَات', ayahCount: 50),
  78: _SurahInfo(number: 78, name: 'النَّبَأ', ayahCount: 40),
  79: _SurahInfo(number: 79, name: 'النَّازِعَات', ayahCount: 46),
  80: _SurahInfo(number: 80, name: 'عَبَسَ', ayahCount: 42),
  81: _SurahInfo(number: 81, name: 'التَّكوِير', ayahCount: 29),
  82: _SurahInfo(number: 82, name: 'الِانفِطَار', ayahCount: 19),
  83: _SurahInfo(number: 83, name: 'المُطَفِّفِين', ayahCount: 36),
  84: _SurahInfo(number: 84, name: 'الِانشِقَاق', ayahCount: 25),
  85: _SurahInfo(number: 85, name: 'البُرُوج', ayahCount: 22),
  86: _SurahInfo(number: 86, name: 'الطَّارِق', ayahCount: 17),
  87: _SurahInfo(number: 87, name: 'الأَعلَى', ayahCount: 19),
  88: _SurahInfo(number: 88, name: 'الغَاشِيَة', ayahCount: 26),
  89: _SurahInfo(number: 89, name: 'الفَجر', ayahCount: 30),
  90: _SurahInfo(number: 90, name: 'البَلَد', ayahCount: 20),
  91: _SurahInfo(number: 91, name: 'الشَّمس', ayahCount: 15),
  92: _SurahInfo(number: 92, name: 'اللَّيل', ayahCount: 21),
  93: _SurahInfo(number: 93, name: 'الضُّحَىٰ', ayahCount: 11),
  94: _SurahInfo(number: 94, name: 'الشَّرح', ayahCount: 8),
  95: _SurahInfo(number: 95, name: 'التِّين', ayahCount: 8),
  96: _SurahInfo(number: 96, name: 'العَلَق', ayahCount: 19),
  97: _SurahInfo(number: 97, name: 'القَدر', ayahCount: 5),
  98: _SurahInfo(number: 98, name: 'البَيِّنَة', ayahCount: 8),
  99: _SurahInfo(number: 99, name: 'الزَّلزَلَة', ayahCount: 8),
  100: _SurahInfo(number: 100, name: 'العَادِيَات', ayahCount: 11),
  101: _SurahInfo(number: 101, name: 'القَارِعَة', ayahCount: 11),
  102: _SurahInfo(number: 102, name: 'التَّكَاثُر', ayahCount: 8),
  103: _SurahInfo(number: 103, name: 'العَصر', ayahCount: 3),
  104: _SurahInfo(number: 104, name: 'الهُمَزَة', ayahCount: 9),
  105: _SurahInfo(number: 105, name: 'الفِيل', ayahCount: 5),
  106: _SurahInfo(number: 106, name: 'قُرَيش', ayahCount: 4),
  107: _SurahInfo(number: 107, name: 'المَاعُون', ayahCount: 7),
  108: _SurahInfo(number: 108, name: 'الكَوثَر', ayahCount: 3),
  109: _SurahInfo(number: 109, name: 'الكَافِرُون', ayahCount: 6),
  110: _SurahInfo(number: 110, name: 'النَّصر', ayahCount: 3),
  111: _SurahInfo(number: 111, name: 'المَسَد', ayahCount: 5),
  112: _SurahInfo(number: 112, name: 'الإخلَاص', ayahCount: 4),
  113: _SurahInfo(number: 113, name: 'الفَلَق', ayahCount: 5),
  114: _SurahInfo(number: 114, name: 'النَّاس', ayahCount: 6),
};

class MushafPageContent extends StatelessWidget {
  final List<Ayah> ayahs;
  final int pageNumber;
  final double fontSize;
  final void Function(int ayahNumber, {int surahNumber})? onAyahLongPress;

  const MushafPageContent({
    super.key,
    required this.ayahs,
    required this.pageNumber,
    this.fontSize = 22.0,
    this.onAyahLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? AppColors.darkText : AppColors.mushafText;
    final verseMarkerColor =
        isDark ? AppColors.primaryLight : AppColors.primary;

    if (ayahs.isEmpty) {
      return Center(
        child: Text('لا توجد آيات', style: GoogleFonts.tajawal(
          color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
        )),
      );
    }

    // Group ayahs by surah to detect surah transitions
    final widgets = <Widget>[];
    int? lastSurahNumber;

    for (int i = 0; i < ayahs.length; i++) {
      final ayah = ayahs[i];

      // Check if a new surah starts on this page
      if (ayah.surahNumber != lastSurahNumber) {
        // If this ayah is numberInSurah == 1, it's the start of a surah
        if (ayah.numberInSurah == 1) {
          final info = _surahMetadata[ayah.surahNumber];
          if (info != null) {
            widgets.add(SurahHeaderOrnament(
              surahName: info.name,
              surahNumber: info.number,
              ayahCount: info.ayahCount,
            ));
          }
        }
        lastSurahNumber = ayah.surahNumber;
      }
    }

    // Build the flowing text with all ayahs as continuous RichText
    final spans = <InlineSpan>[];

    lastSurahNumber = null;
    for (int i = 0; i < ayahs.length; i++) {
      final ayah = ayahs[i];

      // Insert surah header as widget span if new surah starts
      if (ayah.surahNumber != lastSurahNumber && ayah.numberInSurah == 1) {
        if (spans.isNotEmpty) {
          // Add line break before surah header
          spans.add(const TextSpan(text: '\n'));
        }
        final info = _surahMetadata[ayah.surahNumber];
        if (info != null) {
          spans.add(WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: SurahHeaderOrnament(
              surahName: info.name,
              surahNumber: info.number,
              ayahCount: info.ayahCount,
            ),
          ));
          spans.add(const TextSpan(text: '\n'));
        }
        lastSurahNumber = ayah.surahNumber;
      } else if (ayah.surahNumber != lastSurahNumber) {
        lastSurahNumber = ayah.surahNumber;
      }

      // Ayah text
      final ayahText = ayah.textUthmani ?? ayah.text;
      spans.add(TextSpan(
        text: ayahText,
        style: GoogleFonts.amiri(
          fontSize: fontSize,
          height: 1.95,
          color: textColor,
          letterSpacing: 0.2,
        ),
      ));

      // Verse end marker
      final verseNumber = ayah.numberInSurah.toString().arabicNumber;
      spans.add(TextSpan(
        text: ' \u06DD$verseNumber ',
        style: GoogleFonts.amiri(
          fontSize: fontSize * 0.7,
          color: verseMarkerColor,
          fontWeight: FontWeight.bold,
        ),
      ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onLongPressStart: onAyahLongPress != null
                  ? (_) {
                      if (ayahs.isNotEmpty) {
                        onAyahLongPress!(
                          ayahs.first.number,
                          surahNumber: ayahs.first.surahNumber,
                        );
                      }
                    }
                  : null,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Text.rich(
                    TextSpan(children: spans),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
