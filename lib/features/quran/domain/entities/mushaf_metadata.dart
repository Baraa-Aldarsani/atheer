/// Static Madani Mushaf layout data: surah → start page, juz and hizb
/// start pages, and Arabic surah names. Used for jump-to-page navigation.

class SurahMeta {
  final int number;
  final String arabicName;
  final int startPage;
  final int ayahCount;

  const SurahMeta({
    required this.number,
    required this.arabicName,
    required this.startPage,
    required this.ayahCount,
  });
}

class MushafMetadata {
  static const List<SurahMeta> surahs = [
    SurahMeta(number: 1, arabicName: 'الفاتحة', startPage: 1, ayahCount: 7),
    SurahMeta(number: 2, arabicName: 'البقرة', startPage: 2, ayahCount: 286),
    SurahMeta(number: 3, arabicName: 'آل عمران', startPage: 50, ayahCount: 200),
    SurahMeta(number: 4, arabicName: 'النساء', startPage: 77, ayahCount: 176),
    SurahMeta(number: 5, arabicName: 'المائدة', startPage: 106, ayahCount: 120),
    SurahMeta(number: 6, arabicName: 'الأنعام', startPage: 128, ayahCount: 165),
    SurahMeta(number: 7, arabicName: 'الأعراف', startPage: 151, ayahCount: 206),
    SurahMeta(number: 8, arabicName: 'الأنفال', startPage: 177, ayahCount: 75),
    SurahMeta(number: 9, arabicName: 'التوبة', startPage: 187, ayahCount: 129),
    SurahMeta(number: 10, arabicName: 'يونس', startPage: 208, ayahCount: 109),
    SurahMeta(number: 11, arabicName: 'هود', startPage: 221, ayahCount: 123),
    SurahMeta(number: 12, arabicName: 'يوسف', startPage: 235, ayahCount: 111),
    SurahMeta(number: 13, arabicName: 'الرعد', startPage: 249, ayahCount: 43),
    SurahMeta(number: 14, arabicName: 'إبراهيم', startPage: 255, ayahCount: 52),
    SurahMeta(number: 15, arabicName: 'الحجر', startPage: 262, ayahCount: 99),
    SurahMeta(number: 16, arabicName: 'النحل', startPage: 267, ayahCount: 128),
    SurahMeta(number: 17, arabicName: 'الإسراء', startPage: 282, ayahCount: 111),
    SurahMeta(number: 18, arabicName: 'الكهف', startPage: 293, ayahCount: 110),
    SurahMeta(number: 19, arabicName: 'مريم', startPage: 305, ayahCount: 98),
    SurahMeta(number: 20, arabicName: 'طه', startPage: 312, ayahCount: 135),
    SurahMeta(number: 21, arabicName: 'الأنبياء', startPage: 322, ayahCount: 112),
    SurahMeta(number: 22, arabicName: 'الحج', startPage: 332, ayahCount: 78),
    SurahMeta(number: 23, arabicName: 'المؤمنون', startPage: 342, ayahCount: 118),
    SurahMeta(number: 24, arabicName: 'النور', startPage: 350, ayahCount: 64),
    SurahMeta(number: 25, arabicName: 'الفرقان', startPage: 359, ayahCount: 77),
    SurahMeta(number: 26, arabicName: 'الشعراء', startPage: 367, ayahCount: 227),
    SurahMeta(number: 27, arabicName: 'النمل', startPage: 377, ayahCount: 93),
    SurahMeta(number: 28, arabicName: 'القصص', startPage: 385, ayahCount: 88),
    SurahMeta(number: 29, arabicName: 'العنكبوت', startPage: 396, ayahCount: 69),
    SurahMeta(number: 30, arabicName: 'الروم', startPage: 404, ayahCount: 60),
    SurahMeta(number: 31, arabicName: 'لقمان', startPage: 411, ayahCount: 34),
    SurahMeta(number: 32, arabicName: 'السجدة', startPage: 415, ayahCount: 30),
    SurahMeta(number: 33, arabicName: 'الأحزاب', startPage: 418, ayahCount: 73),
    SurahMeta(number: 34, arabicName: 'سبأ', startPage: 428, ayahCount: 54),
    SurahMeta(number: 35, arabicName: 'فاطر', startPage: 434, ayahCount: 45),
    SurahMeta(number: 36, arabicName: 'يس', startPage: 440, ayahCount: 83),
    SurahMeta(number: 37, arabicName: 'الصافات', startPage: 446, ayahCount: 182),
    SurahMeta(number: 38, arabicName: 'ص', startPage: 453, ayahCount: 88),
    SurahMeta(number: 39, arabicName: 'الزمر', startPage: 458, ayahCount: 75),
    SurahMeta(number: 40, arabicName: 'غافر', startPage: 467, ayahCount: 85),
    SurahMeta(number: 41, arabicName: 'فصلت', startPage: 477, ayahCount: 54),
    SurahMeta(number: 42, arabicName: 'الشورى', startPage: 483, ayahCount: 53),
    SurahMeta(number: 43, arabicName: 'الزخرف', startPage: 489, ayahCount: 89),
    SurahMeta(number: 44, arabicName: 'الدخان', startPage: 496, ayahCount: 59),
    SurahMeta(number: 45, arabicName: 'الجاثية', startPage: 499, ayahCount: 37),
    SurahMeta(number: 46, arabicName: 'الأحقاف', startPage: 502, ayahCount: 35),
    SurahMeta(number: 47, arabicName: 'محمد', startPage: 507, ayahCount: 38),
    SurahMeta(number: 48, arabicName: 'الفتح', startPage: 511, ayahCount: 29),
    SurahMeta(number: 49, arabicName: 'الحجرات', startPage: 515, ayahCount: 18),
    SurahMeta(number: 50, arabicName: 'ق', startPage: 518, ayahCount: 45),
    SurahMeta(number: 51, arabicName: 'الذاريات', startPage: 520, ayahCount: 60),
    SurahMeta(number: 52, arabicName: 'الطور', startPage: 523, ayahCount: 49),
    SurahMeta(number: 53, arabicName: 'النجم', startPage: 526, ayahCount: 62),
    SurahMeta(number: 54, arabicName: 'القمر', startPage: 528, ayahCount: 55),
    SurahMeta(number: 55, arabicName: 'الرحمن', startPage: 531, ayahCount: 78),
    SurahMeta(number: 56, arabicName: 'الواقعة', startPage: 534, ayahCount: 96),
    SurahMeta(number: 57, arabicName: 'الحديد', startPage: 537, ayahCount: 29),
    SurahMeta(number: 58, arabicName: 'المجادلة', startPage: 542, ayahCount: 22),
    SurahMeta(number: 59, arabicName: 'الحشر', startPage: 545, ayahCount: 24),
    SurahMeta(number: 60, arabicName: 'الممتحنة', startPage: 549, ayahCount: 13),
    SurahMeta(number: 61, arabicName: 'الصف', startPage: 551, ayahCount: 14),
    SurahMeta(number: 62, arabicName: 'الجمعة', startPage: 553, ayahCount: 11),
    SurahMeta(number: 63, arabicName: 'المنافقون', startPage: 554, ayahCount: 11),
    SurahMeta(number: 64, arabicName: 'التغابن', startPage: 556, ayahCount: 18),
    SurahMeta(number: 65, arabicName: 'الطلاق', startPage: 558, ayahCount: 12),
    SurahMeta(number: 66, arabicName: 'التحريم', startPage: 560, ayahCount: 12),
    SurahMeta(number: 67, arabicName: 'الملك', startPage: 562, ayahCount: 30),
    SurahMeta(number: 68, arabicName: 'القلم', startPage: 564, ayahCount: 52),
    SurahMeta(number: 69, arabicName: 'الحاقة', startPage: 566, ayahCount: 52),
    SurahMeta(number: 70, arabicName: 'المعارج', startPage: 568, ayahCount: 44),
    SurahMeta(number: 71, arabicName: 'نوح', startPage: 570, ayahCount: 28),
    SurahMeta(number: 72, arabicName: 'الجن', startPage: 572, ayahCount: 28),
    SurahMeta(number: 73, arabicName: 'المزمل', startPage: 574, ayahCount: 20),
    SurahMeta(number: 74, arabicName: 'المدثر', startPage: 575, ayahCount: 56),
    SurahMeta(number: 75, arabicName: 'القيامة', startPage: 577, ayahCount: 40),
    SurahMeta(number: 76, arabicName: 'الإنسان', startPage: 578, ayahCount: 31),
    SurahMeta(number: 77, arabicName: 'المرسلات', startPage: 580, ayahCount: 50),
    SurahMeta(number: 78, arabicName: 'النبأ', startPage: 582, ayahCount: 40),
    SurahMeta(number: 79, arabicName: 'النازعات', startPage: 583, ayahCount: 46),
    SurahMeta(number: 80, arabicName: 'عبس', startPage: 585, ayahCount: 42),
    SurahMeta(number: 81, arabicName: 'التكوير', startPage: 586, ayahCount: 29),
    SurahMeta(number: 82, arabicName: 'الانفطار', startPage: 587, ayahCount: 19),
    SurahMeta(number: 83, arabicName: 'المطففين', startPage: 587, ayahCount: 36),
    SurahMeta(number: 84, arabicName: 'الانشقاق', startPage: 589, ayahCount: 25),
    SurahMeta(number: 85, arabicName: 'البروج', startPage: 590, ayahCount: 22),
    SurahMeta(number: 86, arabicName: 'الطارق', startPage: 591, ayahCount: 17),
    SurahMeta(number: 87, arabicName: 'الأعلى', startPage: 591, ayahCount: 19),
    SurahMeta(number: 88, arabicName: 'الغاشية', startPage: 592, ayahCount: 26),
    SurahMeta(number: 89, arabicName: 'الفجر', startPage: 593, ayahCount: 30),
    SurahMeta(number: 90, arabicName: 'البلد', startPage: 594, ayahCount: 20),
    SurahMeta(number: 91, arabicName: 'الشمس', startPage: 595, ayahCount: 15),
    SurahMeta(number: 92, arabicName: 'الليل', startPage: 595, ayahCount: 21),
    SurahMeta(number: 93, arabicName: 'الضحى', startPage: 596, ayahCount: 11),
    SurahMeta(number: 94, arabicName: 'الشرح', startPage: 596, ayahCount: 8),
    SurahMeta(number: 95, arabicName: 'التين', startPage: 597, ayahCount: 8),
    SurahMeta(number: 96, arabicName: 'العلق', startPage: 597, ayahCount: 19),
    SurahMeta(number: 97, arabicName: 'القدر', startPage: 598, ayahCount: 5),
    SurahMeta(number: 98, arabicName: 'البينة', startPage: 598, ayahCount: 8),
    SurahMeta(number: 99, arabicName: 'الزلزلة', startPage: 599, ayahCount: 8),
    SurahMeta(number: 100, arabicName: 'العاديات', startPage: 599, ayahCount: 11),
    SurahMeta(number: 101, arabicName: 'القارعة', startPage: 600, ayahCount: 11),
    SurahMeta(number: 102, arabicName: 'التكاثر', startPage: 600, ayahCount: 8),
    SurahMeta(number: 103, arabicName: 'العصر', startPage: 601, ayahCount: 3),
    SurahMeta(number: 104, arabicName: 'الهمزة', startPage: 601, ayahCount: 9),
    SurahMeta(number: 105, arabicName: 'الفيل', startPage: 601, ayahCount: 5),
    SurahMeta(number: 106, arabicName: 'قريش', startPage: 602, ayahCount: 4),
    SurahMeta(number: 107, arabicName: 'الماعون', startPage: 602, ayahCount: 7),
    SurahMeta(number: 108, arabicName: 'الكوثر', startPage: 602, ayahCount: 3),
    SurahMeta(number: 109, arabicName: 'الكافرون', startPage: 603, ayahCount: 6),
    SurahMeta(number: 110, arabicName: 'النصر', startPage: 603, ayahCount: 3),
    SurahMeta(number: 111, arabicName: 'المسد', startPage: 603, ayahCount: 5),
    SurahMeta(number: 112, arabicName: 'الإخلاص', startPage: 604, ayahCount: 4),
    SurahMeta(number: 113, arabicName: 'الفلق', startPage: 604, ayahCount: 5),
    SurahMeta(number: 114, arabicName: 'الناس', startPage: 604, ayahCount: 6),
  ];

  /// First page of each juz (1..30).
  static const List<int> juzStartPages = [
    1, 22, 42, 62, 82, 102, 121, 142, 162, 182,
    201, 222, 242, 262, 282, 302, 322, 342, 362, 382,
    402, 422, 442, 462, 482, 502, 522, 542, 562, 582,
  ];

  /// First page of each hizb (1..60).
  static const List<int> hizbStartPages = [
    1, 11, 22, 32, 42, 52, 62, 72, 82, 92,
    102, 112, 121, 132, 142, 152, 162, 172, 182, 192,
    201, 212, 222, 232, 242, 252, 262, 272, 282, 292,
    302, 312, 322, 332, 342, 352, 362, 372, 382, 392,
    402, 412, 422, 432, 442, 452, 462, 472, 482, 492,
    502, 512, 522, 532, 542, 552, 562, 572, 582, 592,
  ];

  /// Returns the juz number (1..30) containing the given page.
  static int juzForPage(int page) {
    for (int i = juzStartPages.length - 1; i >= 0; i--) {
      if (page >= juzStartPages[i]) return i + 1;
    }
    return 1;
  }

  /// Returns the hizb number (1..60) containing the given page.
  static int hizbForPage(int page) {
    for (int i = hizbStartPages.length - 1; i >= 0; i--) {
      if (page >= hizbStartPages[i]) return i + 1;
    }
    return 1;
  }

  /// Returns metadata for the surah that starts on or before [page].
  static SurahMeta surahForPage(int page) {
    for (int i = surahs.length - 1; i >= 0; i--) {
      if (page >= surahs[i].startPage) return surahs[i];
    }
    return surahs.first;
  }
}
