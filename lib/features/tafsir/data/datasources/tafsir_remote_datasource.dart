import 'package:atheer/core/network/api_client.dart';
import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/features/tafsir/data/models/tafsir_model.dart';

abstract class TafsirRemoteDataSource {
  Future<TafsirModel> getAyahTafsir(int ayahNumber, String edition);
}

class TafsirRemoteDataSourceImpl implements TafsirRemoteDataSource {
  final ApiClient apiClient;

  TafsirRemoteDataSourceImpl(this.apiClient);

  @override
  Future<TafsirModel> getAyahTafsir(int ayahNumber, String edition) async {
    try {
      final response = await apiClient.get('/ayah/$ayahNumber/$edition');
      final data = response['data'] as Map<String, dynamic>;
      return TafsirModel.fromJson(data);
    } catch (e) {
      throw ServerException('Failed to fetch tafsir: $e');
    }
  }
}
