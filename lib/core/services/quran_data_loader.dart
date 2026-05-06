import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:drift/drift.dart';
import 'package:atheer/database/app_database.dart';
import 'package:atheer/database/daos/quran_dao.dart';

class QuranDataLoader {
  final QuranDao _quranDao;

  QuranDataLoader(this._quranDao);

  Future<bool> isDatabasePopulated() async {
    final count = await _quranDao.getSurahCount();
    return count >= 114;
  }

  Future<void> loadFromAssets() async {
    if (await isDatabasePopulated()) return;

    // Load surahs
    final surahsJson = await rootBundle.loadString('assets/quran/surahs.json');
    final surahsData = json.decode(surahsJson) as Map<String, dynamic>;
    final surahsList = surahsData['data'] as List;

    final surahCompanions = surahsList.map((s) {
      final surah = s as Map<String, dynamic>;
      return SurahsTableCompanion(
        number: Value(surah['number'] as int),
        name: Value(surah['name'] as String),
        englishName: Value(surah['englishName'] as String),
        englishNameTranslation: Value(surah['englishNameTranslation'] as String),
        numberOfAyahs: Value(surah['numberOfAyahs'] as int),
        revelationType: Value(surah['revelationType'] as String),
      );
    }).toList();

    await _quranDao.insertSurahs(surahCompanions);

    // Load ayahs
    final quranJson = await rootBundle.loadString('assets/quran/quran_uthmani.json');
    final quranData = json.decode(quranJson) as Map<String, dynamic>;
    final surahs = quranData['data']['surahs'] as List;

    final allAyahCompanions = <AyahsTableCompanion>[];

    for (final surahData in surahs) {
      final surah = surahData as Map<String, dynamic>;
      final surahNumber = surah['number'] as int;
      final ayahs = surah['ayahs'] as List;

      for (final ayahData in ayahs) {
        final ayah = ayahData as Map<String, dynamic>;
        allAyahCompanions.add(AyahsTableCompanion(
          number: Value(ayah['number'] as int),
          ayahText: Value(ayah['text'] as String),
          ayahTextUthmani: Value(ayah['text'] as String),
          surahNumber: Value(surahNumber),
          numberInSurah: Value(ayah['numberInSurah'] as int),
          juz: Value(ayah['juz'] as int),
          manzil: Value(ayah['manzil'] as int),
          page: Value(ayah['page'] as int),
          ruku: Value(ayah['ruku'] as int),
          hizbQuarter: Value(ayah['hizbQuarter'] as int),
        ));
      }
    }

    // Insert in batches for better performance
    const batchSize = 500;
    for (var i = 0; i < allAyahCompanions.length; i += batchSize) {
      final end = (i + batchSize).clamp(0, allAyahCompanions.length);
      await _quranDao.insertAyahs(allAyahCompanions.sublist(i, end));
    }
  }
}
