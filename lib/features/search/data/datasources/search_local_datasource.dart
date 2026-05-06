import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/database/daos/quran_dao.dart';
import 'package:atheer/features/search/domain/entities/search_result.dart';
import 'package:atheer/database/app_database.dart';

abstract class SearchLocalDataSource {
  Future<List<SearchResult>> searchAyahs(String query, List<SurahsTableData> surahs);
}

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  final QuranDao quranDao;

  SearchLocalDataSourceImpl(this.quranDao);

  @override
  Future<List<SearchResult>> searchAyahs(String query, List<SurahsTableData> surahs) async {
    try {
      final results = await quranDao.searchAyahs(query);
      final surahMap = {for (final s in surahs) s.number: s.name};
      return results.map((a) => SearchResult(
        ayahNumber: a.number,
        ayahText: a.ayahText,
        surahNumber: a.surahNumber,
        surahName: surahMap[a.surahNumber] ?? '',
        numberInSurah: a.numberInSurah,
      )).toList();
    } catch (e) {
      throw CacheException('Search failed: $e');
    }
  }
}
