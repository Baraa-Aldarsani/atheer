import 'package:atheer/core/network/api_client.dart';
import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/features/audio/data/models/audio_ayah_model.dart';
import 'package:atheer/features/audio/data/models/reciter_model.dart';

abstract class AudioRemoteDataSource {
  Future<List<AudioAyahModel>> getSurahAudio(int surahNumber, String reciterId);
  Future<List<ReciterModel>> getReciters();
}

class AudioRemoteDataSourceImpl implements AudioRemoteDataSource {
  final ApiClient apiClient;

  AudioRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<AudioAyahModel>> getSurahAudio(int surahNumber, String reciterId) async {
    try {
      final response = await apiClient.get('/surah/$surahNumber/$reciterId');
      final data = response['data'] as Map<String, dynamic>;
      final ayahs = data['ayahs'] as List;
      return ayahs
          .map((a) => AudioAyahModel.fromJson(a as Map<String, dynamic>, reciterId))
          .toList();
    } catch (e) {
      throw ServerException('Failed to fetch surah audio: $e');
    }
  }

  @override
  Future<List<ReciterModel>> getReciters() async {
    try {
      final response = await apiClient.get('/edition', queryParameters: {
        'format': 'audio',
        'language': 'ar',
        'type': 'versebyverse',
      });
      final data = response['data'] as List;
      return data
          .map((r) => ReciterModel.fromJson(r as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException('Failed to fetch reciters: $e');
    }
  }
}
