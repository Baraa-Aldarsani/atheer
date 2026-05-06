import 'package:atheer/core/network/api_client.dart';
import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/features/quran/data/models/surah_model.dart';
import 'package:atheer/features/quran/data/models/ayah_model.dart';

abstract class QuranRemoteDataSource {
  Future<List<SurahModel>> getAllSurahs();
  Future<List<AyahModel>> getSurahAyahs(int surahNumber);
  Future<List<AyahModel>> getPageAyahs(int pageNumber);
  Future<List<AyahModel>> getJuzAyahs(int juzNumber);
}

class QuranRemoteDataSourceImpl implements QuranRemoteDataSource {
  final ApiClient apiClient;

  QuranRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<SurahModel>> getAllSurahs() async {
    try {
      final response = await apiClient.get('/surah');
      final data = response['data'] as List;
      return data.map((s) => SurahModel.fromJson(s as Map<String, dynamic>)).toList();
    } catch (e) {
      throw ServerException('Failed to fetch surahs: $e');
    }
  }

  @override
  Future<List<AyahModel>> getSurahAyahs(int surahNumber) async {
    try {
      final response = await apiClient.get('/surah/$surahNumber/quran-uthmani');
      final surahData = response['data'] as Map<String, dynamic>;
      final ayahsList = surahData['ayahs'] as List;
      return ayahsList
          .map((a) => AyahModel.fromJson(a as Map<String, dynamic>, surahNumber))
          .toList();
    } catch (e) {
      throw ServerException('Failed to fetch ayahs: $e');
    }
  }

  @override
  Future<List<AyahModel>> getPageAyahs(int pageNumber) async {
    try {
      final response = await apiClient.get('/page/$pageNumber/quran-uthmani');
      final data = response['data'] as Map<String, dynamic>;
      final ayahsList = data['ayahs'] as List;
      return ayahsList
          .map((a) => AyahModel.fromJson(
                a as Map<String, dynamic>,
                (a['surah'] as Map<String, dynamic>)['number'] as int,
              ))
          .toList();
    } catch (e) {
      throw ServerException('Failed to fetch page ayahs: $e');
    }
  }

  @override
  Future<List<AyahModel>> getJuzAyahs(int juzNumber) async {
    try {
      final response = await apiClient.get('/juz/$juzNumber/quran-uthmani');
      final data = response['data'] as Map<String, dynamic>;
      final ayahsList = data['ayahs'] as List;
      return ayahsList
          .map((a) => AyahModel.fromJson(
                a as Map<String, dynamic>,
                (a['surah'] as Map<String, dynamic>)['number'] as int,
              ))
          .toList();
    } catch (e) {
      throw ServerException('Failed to fetch juz ayahs: $e');
    }
  }
}
