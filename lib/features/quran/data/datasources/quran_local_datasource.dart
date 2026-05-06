import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/database/daos/quran_dao.dart';
import 'package:atheer/features/quran/data/models/surah_model.dart';
import 'package:atheer/features/quran/data/models/ayah_model.dart';

abstract class QuranLocalDataSource {
  Future<List<SurahModel>> getAllSurahs();
  Future<List<AyahModel>> getAyahsBySurah(int surahNumber);
  Future<List<AyahModel>> getAyahsByPage(int pageNumber);
  Future<List<AyahModel>> getAyahsByJuz(int juzNumber);
  Future<void> cacheSurahs(List<SurahModel> surahs);
  Future<void> cacheAyahs(List<AyahModel> ayahs);
  Future<bool> hasCachedData();
  Future<List<AyahModel>> searchAyahs(String query);
}

class QuranLocalDataSourceImpl implements QuranLocalDataSource {
  final QuranDao quranDao;

  QuranLocalDataSourceImpl(this.quranDao);

  @override
  Future<List<SurahModel>> getAllSurahs() async {
    try {
      final results = await quranDao.getAllSurahs();
      return results.map((s) => SurahModel.fromTableData(s)).toList();
    } catch (e) {
      throw CacheException('Failed to get cached surahs: $e');
    }
  }

  @override
  Future<List<AyahModel>> getAyahsBySurah(int surahNumber) async {
    try {
      final results = await quranDao.getAyahsBySurah(surahNumber);
      return results.map((a) => AyahModel.fromTableData(a)).toList();
    } catch (e) {
      throw CacheException('Failed to get cached ayahs: $e');
    }
  }

  @override
  Future<List<AyahModel>> getAyahsByPage(int pageNumber) async {
    try {
      final results = await quranDao.getAyahsByPage(pageNumber);
      return results.map((a) => AyahModel.fromTableData(a)).toList();
    } catch (e) {
      throw CacheException('Failed to get cached page ayahs: $e');
    }
  }

  @override
  Future<List<AyahModel>> getAyahsByJuz(int juzNumber) async {
    try {
      final results = await quranDao.getAyahsByJuz(juzNumber);
      return results.map((a) => AyahModel.fromTableData(a)).toList();
    } catch (e) {
      throw CacheException('Failed to get cached juz ayahs: $e');
    }
  }

  @override
  Future<void> cacheSurahs(List<SurahModel> surahs) async {
    try {
      await quranDao.insertSurahs(surahs.map((s) => s.toCompanion()).toList());
    } catch (e) {
      throw CacheException('Failed to cache surahs: $e');
    }
  }

  @override
  Future<void> cacheAyahs(List<AyahModel> ayahs) async {
    try {
      await quranDao.insertAyahs(ayahs.map((a) => a.toCompanion()).toList());
    } catch (e) {
      throw CacheException('Failed to cache ayahs: $e');
    }
  }

  @override
  Future<bool> hasCachedData() async {
    try {
      final count = await quranDao.getSurahCount();
      return count > 0;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<AyahModel>> searchAyahs(String query) async {
    try {
      final results = await quranDao.searchAyahs(query);
      return results.map((a) => AyahModel.fromTableData(a)).toList();
    } catch (e) {
      throw CacheException('Failed to search ayahs: $e');
    }
  }
}
